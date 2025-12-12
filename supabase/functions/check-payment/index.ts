
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

    // 3. Check Balance via APIs
    if (chain === 'btc') {
        const res = await fetch(`${MEMPOOL_API}/${address}`)
        const data = await res.json()
        const funded = (data.chain_stats?.funded_txo_sum || 0) + (data.mempool_stats?.funded_txo_sum || 0)
        balance = funded // Satoshis
        if (balance > 0) confirmed = true
        
    } else if (chain === 'evm') {
        // JSON-RPC call for ETH Balance
        const res = await fetch(ETH_RPC, {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                jsonrpc: '2.0',
                method: 'eth_getBalance',
                params: [address, 'latest'],
                id: 1
            })
        })
        const data = await res.json()
        const hexBal = data.result
        if (hexBal && hexBal !== '0x0') {
            balance = parseInt(hexBal, 16) // Wei
            confirmed = true
        }

    } else if (chain === 'sol') {
        const res = await fetch(SOL_RPC, {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                jsonrpc: '2.0',
                method: 'getBalance',
                params: [address],
                id: 1
            })
        })
        const data = await res.json()
        balance = data.result?.value || 0 // Lamports
        if (balance > 0) confirmed = true
    }

    // 4. Update if Confirmed
    if (confirmed) {
        // A. Mark User as Premium
        await supabaseAdmin
            .from('users')
            .update({ is_premium: true })
            .eq('id', user.id)

        // B. Mark Pool Address as Used (Dirty)
        await supabaseAdmin
            .from('payment_pools')
            .update({ status: 'used' })
            .eq('id', poolId)

        // C. Log Transaction
        await supabaseAdmin
            .from('payment_transactions')
            .insert({
                user_id: user.id,
                chain: chain,
                currency: chain.toUpperCase(), // Simplification
                amount: balance,
                tx_hash: txHash,
            })
            
        return new Response(JSON.stringify({ success: true, premium: true }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200,
        })
    } else {
        return new Response(JSON.stringify({ success: false, message: 'Payment not detected yet' }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200,
        })
    }

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    })
  }
})
