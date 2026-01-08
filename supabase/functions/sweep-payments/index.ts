// sweep-payments Edge Function
// Sweeps funds from per-user derived addresses to master wallet (Account 0)
// Triggered by cron or manual invocation

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.0'
import { HDNodeWallet, JsonRpcProvider, formatEther, Wallet } from "https://esm.sh/ethers@6.9.0"

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Master wallet is always index 0
const MASTER_WALLET_INDEX = 0

// Minimum balance to sweep (in ETH) - avoids wasting gas on dust
const MIN_SWEEP_BALANCE_ETH = 0.0005 // ~$1.50 at current prices

// RPC endpoints for supported chains
const RPC_ENDPOINTS: Record<string, string> = {
    ethereum: "https://eth.llamarpc.com",
    base: "https://mainnet.base.org",
    arbitrum: "https://arb1.arbitrum.io/rpc",
    optimism: "https://mainnet.optimism.io",
    polygon: "https://polygon-rpc.com"
}

export async function handler(req: Request): Promise<Response> {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        // Get secrets
        const XPRV_EVM = Deno.env.get('XPRV_EVM')
        const SUPABASE_URL = Deno.env.get('SUPABASE_URL')
        const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')

        if (!XPRV_EVM) {
            throw new Error('XPRV_EVM secret not configured')
        }

        // Initialize Supabase client
        const supabase = createClient(SUPABASE_URL!, SUPABASE_SERVICE_ROLE_KEY!)

        // Derive master wallet (index 0)
        const masterNode = HDNodeWallet.fromExtendedKey(XPRV_EVM)
        const masterWallet = masterNode.derivePath("0")
        const masterAddress = masterWallet.address
        console.log(`[Sweep] Master wallet address: ${masterAddress}`)

        // Get all payment pool addresses (both 'assigned' and 'used' - payments mark pools as 'used')
        const { data: pools, error: poolsError } = await supabase
            .from('payment_pools')
            .select('id, address, chain, assigned_to_user_id, derivation_path_index')
            .eq('chain', 'evm')
            .in('status', ['assigned', 'used'])

        if (poolsError) {
            throw new Error(`Failed to fetch payment pools: ${poolsError.message}`)
        }

        console.log(`[Sweep] Found ${pools?.length ?? 0} EVM addresses to check`)

        const sweepResults: any[] = []

        // Process each pool address
        for (const pool of pools ?? []) {
            try {
                // Derive the wallet for this index
                const userWallet = masterNode.derivePath(`${pool.derivation_path_index}`)

                // Check balance on each chain
                for (const [chainName, rpcUrl] of Object.entries(RPC_ENDPOINTS)) {
                    try {
                        const provider = new JsonRpcProvider(rpcUrl)
                        const balance = await provider.getBalance(pool.address)
                        const balanceEth = parseFloat(formatEther(balance))

                        if (balanceEth >= MIN_SWEEP_BALANCE_ETH) {
                            console.log(`[Sweep] ${chainName}: ${pool.address} has ${balanceEth} ETH - sweeping...`)

                            // Connect wallet to provider
                            const connectedWallet = new Wallet(userWallet.privateKey, provider)

                            // Estimate gas
                            const gasPrice = await provider.getFeeData()
                            const gasLimit = 21000n // Standard ETH transfer
                            const gasCost = gasLimit * (gasPrice.gasPrice ?? 0n)

                            // Calculate amount to send (balance - gas)
                            const amountToSend = balance - gasCost

                            if (amountToSend > 0n) {
                                // Send transaction
                                const tx = await connectedWallet.sendTransaction({
                                    to: masterAddress,
                                    value: amountToSend,
                                    gasLimit: gasLimit,
                                    gasPrice: gasPrice.gasPrice
                                })

                                console.log(`[Sweep] TX sent: ${tx.hash}`)

                                // Wait for confirmation
                                const receipt = await tx.wait()

                                sweepResults.push({
                                    chain: chainName,
                                    from: pool.address,
                                    to: masterAddress,
                                    amount: formatEther(amountToSend),
                                    txHash: tx.hash,
                                    status: receipt?.status === 1 ? 'success' : 'failed',
                                    user_id: pool.assigned_to_user_id
                                })

                                // Log to database
                                await supabase.from('payment_sweeps').insert({
                                    from_address: pool.address,
                                    to_address: masterAddress,
                                    chain: chainName,
                                    amount: formatEther(amountToSend),
                                    tx_hash: tx.hash,
                                    user_id: pool.assigned_to_user_id,
                                    status: receipt?.status === 1 ? 'success' : 'failed'
                                })
                            }
                        }
                    } catch (chainError: any) {
                        console.error(`[Sweep] Error on ${chainName} for ${pool.address}: ${chainError.message}`)
                    }
                }
            } catch (poolError: any) {
                console.error(`[Sweep] Error processing pool ${pool.id}: ${poolError.message}`)
            }
        }

        return new Response(
            JSON.stringify({
                success: true,
                masterAddress: masterAddress,
                swept: sweepResults.length,
                results: sweepResults
            }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error: any) {
        console.error(`[Sweep] Fatal error: ${error.message}`)
        return new Response(
            JSON.stringify({ success: false, error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
    }
}
