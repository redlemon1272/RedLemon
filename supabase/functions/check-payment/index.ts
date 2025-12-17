
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// APIs
const MEMPOOL_API = 'https://mempool.space/api/address'
const ETH_RPC = 'https://rpc.ankr.com/eth'
const SOL_RPC = 'https://api.mainnet-beta.solana.com'

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // 1. Auth & Setup
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    const { data: { user } } = await supabaseClient.auth.getUser()
    if (!user) throw new Error('Unauthorized')

    // 2. Find Assigned Address
    // We use Service Role to read the pool table freely
    const supabaseAdmin = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    const { data: poolData, error: poolError } = await supabaseAdmin
        .from('payment_pools')
        .select('*')
        .eq('assigned_to_user_id', user.id)
        .eq('status', 'assigned')
        .single() // Expect only one active assignment at a time

    if (poolError || !poolData) {
        return new Response(JSON.stringify({ success: false, message: 'No active payment found' }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200,
        })
    }

    const { chain, address, id: poolId } = poolData
    let balance = 0
    let confirmed = false
    let txHash = 'detected_on_chain'

    // 3. Check Balances (Multi-Asset / Multi-Chain)
    // We will build a list of "Current Balances" to compare against DB
    interface AssetBalance {
        chain: string
        currency: string // 'BTC', 'ETH', 'USDC', 'USDT'
        amount: number // Base units (Satoshis, Wei) OR Token Units (if easier, but let's stick to float for tokens to avoid BigInt issues in JS JSON)
        // actually let's use Float for everything since we convert to USD anyway
        amountFloat: number 
    }
    const currentAssets: AssetBalance[] = []

    // Helper for EVM JSON-RPC
    const rpcCall = async (url: string, method: string, params: any[]) => {
        try {
            const res = await fetch(url, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({ jsonrpc: '2.0', method, params, id: 1 })
            })
            const json = await res.json()
            return json.result
        } catch (e) {
            console.error(`RPC Fail ${url}`, e)
            return null
        }
    }

    if (chain === 'btc') {
        const res = await fetch(`${MEMPOOL_API}/${address}`)
        const data = await res.json()
        const funded = (data.chain_stats?.funded_txo_sum || 0) + (data.mempool_stats?.funded_txo_sum || 0)
        if (funded > 0) {
            currentAssets.push({ chain: 'btc', currency: 'BTC', amount: funded, amountFloat: funded / 1e8 })
        }
        
    } else if (chain === 'evm') {
        const CHAINS = [
            { name: 'eth', rpc: 'https://rpc.ankr.com/eth', usdc: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48', usdt: '0xdac17f958d2ee523a2206206994597c13d831ec7' },
            { name: 'base', rpc: 'https://mainnet.base.org', usdc: '0x833589fcd6edb6e08f4c7c32d4f71b54bda02913', usdt: null },
            { name: 'arb', rpc: 'https://arb1.arbitrum.io/rpc', usdc: '0xaf88d065e77c8cC2239327C5EDb3A432268e5831', usdt: '0xfd086bc7cd5c481dcc9c85ebe478a1c0b69fcbb9' }
        ]

        const paddedAddr = address.replace('0x', '').padStart(64, '0')
        const balanceOfPayload = `0x70a08231${paddedAddr}`

        const results = await Promise.all(CHAINS.map(async (c) => {
             // Native
             const nativeHex = await rpcCall(c.rpc, 'eth_getBalance', [address, 'latest'])
             if (nativeHex && nativeHex !== '0x' && nativeHex !== '0x0') {
                 const wei = parseInt(nativeHex, 16)
                 currentAssets.push({ chain: c.name, currency: 'ETH', amount: wei, amountFloat: wei / 1e18 })
             }

             // USDC
             if (c.usdc) {
                 const hex = await rpcCall(c.rpc, 'eth_call', [{ to: c.usdc, data: balanceOfPayload }, 'latest'])
                 if (hex && hex !== '0x' && hex.length > 2) {
                     const val = parseInt(hex, 16)
                     if (val > 0) currentAssets.push({ chain: c.name, currency: 'USDC', amount: val, amountFloat: val / 1e6 })
                 }
             }

             // USDT
             if (c.usdt) {
                 const hex = await rpcCall(c.rpc, 'eth_call', [{ to: c.usdt, data: balanceOfPayload }, 'latest'])
                 if (hex && hex !== '0x' && hex.length > 2) {
                     const val = parseInt(hex, 16)
                     if (val > 0) currentAssets.push({ chain: c.name, currency: 'USDT', amount: val, amountFloat: val / 1e6 })
                 }
             }
        }))
    }

    // 4. Fetch Prices
    // We assume Stablecoins are $1. We only need ETH and BTC price.
    let btcPrice = 0
    let ethPrice = 0
    
    // Quick Fetch in parallel
    const [pEth, pBtc] = await Promise.all([
        fetch('https://api.coinbase.com/v2/prices/ETH-USD/spot').then(r => r.json()).catch(() => ({ data: { amount: 0 }})),
        fetch('https://mempool.space/api/v1/prices').then(r => r.json()).catch(() => ({ USD: 0 }))
    ])
    
    ethPrice = parseFloat(pEth.data?.amount || '0')
    btcPrice = parseFloat(pBtc.USD || '0')


    // 5. Compare with DB History
    const { data: txs } = await supabaseAdmin
        .from('payment_transactions')
        .select('*')
        .eq('user_id', user.id)
    
    let totalNewUsdValue = 0
    const newTransactionsToLog: any[] = []

    // For each current asset, subtract what we've already seen
    for (const asset of currentAssets) {
        // Find sum of previous logs for this specific Chain+Currency
        const prevSum = txs
            ?.filter(t => t.chain === asset.chain && t.currency === asset.currency)
            .reduce((sum, t) => sum + Number(t.amount), 0) || 0
            
        const newAmount = asset.amountFloat - prevSum // Compare Floats logic. 
        // Note: storing Floats in 'amount' column (Numeric) is fine.
        
        if (newAmount > 0.000001) { // Epsilon check
             let usdVal = 0
             if (asset.currency === 'BTC') usdVal = newAmount * btcPrice
             else if (asset.currency === 'ETH') usdVal = newAmount * ethPrice
             else usdVal = newAmount * 1.0 // Stablecoins
             
             totalNewUsdValue += usdVal
             
             newTransactionsToLog.push({
                 user_id: user.id,
                 chain: asset.chain,
                 currency: asset.currency,
                 amount: newAmount, // Log the DELTA
                 tx_hash: `detected_${Date.now()}_${asset.chain}_${asset.currency}`
             })
        }
    }

    // 6. Apply logic
    if (totalNewUsdValue > 0) {
        // Log them
        if (newTransactionsToLog.length > 0) {
            await supabaseAdmin.from('payment_transactions').insert(newTransactionsToLog)
        }
        
        // Calculate Tiers
        let daysToAdd = 0
        if (totalNewUsdValue >= 10) daysToAdd = 90
        else if (totalNewUsdValue >= 7) daysToAdd = 60
        else if (totalNewUsdValue >= 4) daysToAdd = 30
        
        if (daysToAdd > 0) {
             const { data: userData } = await supabaseAdmin
                .from('users')
                .select('subscription_expires_at')
                .eq('id', user.id)
                .single()
             
             let currentExpiry = userData?.subscription_expires_at ? new Date(userData.subscription_expires_at) : new Date()
             if (currentExpiry < new Date()) currentExpiry = new Date()
             
             const newExpiry = new Date(currentExpiry.getTime() + (daysToAdd * 24 * 60 * 60 * 1000))
             
             await supabaseAdmin
                .from('users')
                .update({ subscription_expires_at: newExpiry.toISOString() })
                .eq('id', user.id)

             return new Response(JSON.stringify({ 
                 success: true, 
                 premium: true, 
                 added_days: daysToAdd,
                 new_expiry: newExpiry 
             }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
        } else {
             return new Response(JSON.stringify({ 
                 success: false, 
                 message: `Payment detected ($${totalNewUsdValue.toFixed(2)}) but below minimum $4 threshold.` 
             }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
        }
    }

    return new Response(JSON.stringify({ success: false, message: 'No new payments detected' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
    })

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    })
  }
})
