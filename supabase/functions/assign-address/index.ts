import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { ethers } from "https://esm.sh/ethers@6.7.0"
import { bech32 } from "https://esm.sh/bech32@2.0.0"
import { sha256 } from "https://esm.sh/@noble/hashes@1.3.1/sha256"
import { ripemd160 } from "https://esm.sh/@noble/hashes@1.3.1/ripemd160"
import { HDKey } from "https://esm.sh/@scure/bip32@1.3.0"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // 1. Setup Clients
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // Service Role for DB writes
    const supabaseAdmin = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // 3. Parse Request
    const { chain, user_id } = await req.json()

    // Auth Check (Client-provided ID for this app architecture)
    if (!user_id) throw new Error('Unauthorized: Missing user_id')
    const user = { id: user_id }

    // Sol is deprecated per user conversation, but leaving guard for safety
    if (!['btc', 'evm'].includes(chain)) {
        throw new Error('Invalid chain. Only BTC and EVM supported.')
    }

    // 4. Check for existing active assignment
    const { data: existing } = await supabaseAdmin
        .from('payment_pools')
        .select('*')
        .eq('assigned_to_user_id', user.id)
        .eq('chain', chain)
        .eq('status', 'assigned')
        .single()

    if (existing) {
        return new Response(JSON.stringify({
            success: true,
            address: existing.address,
            message: 'Existing assignment found'
        }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
    }

    // 5. Derive Address & Increment Index
    const { data: current } = await supabaseAdmin
        .from('key_derivation_indices')
        .select('next_index')
        .eq('chain', chain)
        .single()

    const nextIndex = (current?.next_index ?? 0) + 1

    await supabaseAdmin
        .from('key_derivation_indices')
        .update({ next_index: nextIndex })
        .eq('chain', chain)

    let derivedAddress = ''

    if (chain === 'evm') {
        const xpub = Deno.env.get('XPUB_EVM')
        if (!xpub) throw new Error('Missing XPUB_EVM')

        try {
            // Ethers.js handles HD Wallet derivation and Checksum Address generation automatically
            const root = ethers.HDNodeWallet.fromExtendedKey(xpub)
            const child = root.deriveChild(0).deriveChild(nextIndex) // m/0/index (External chain)
            derivedAddress = child.address
        } catch (e) {
             console.error("EVM Derivation failed", e)
             throw new Error('Failed to derive EVM address. Check XPub format.')
        }
    }
    else if (chain === 'btc') {
         const xpub = Deno.env.get('XPUB_BTC')
         if (!xpub) throw new Error('Missing XPUB_BTC')

         try {
             // 1. Derive PubKey with scure-bip32
             const node = HDKey.fromExtendedKey(xpub)
             const child = node.deriveChild(0).deriveChild(nextIndex) // m/0/index
             if (!child.publicKey) throw new Error('No public key derived')

             // 2. Hash: RIPEM160(SHA256(PubKey))
             const pubKey = child.publicKey
             const hash = ripemd160(sha256(pubKey))

             // 3. Convert to Bech32 (Segwit Native P2WPKH: bc1q...)
             // Witness version 0, data is the 20-byte hash
             const words = bech32.toWords(hash)
             words.unshift(0) // Version 0
             derivedAddress = bech32.encode('bc', words)

         } catch (e) {
             console.error("BTC Derivation failed", e)
             throw new Error('Failed to derive BTC address. Check XPub format (must be zpub/xpub specific?).')
         }
    }

    // 6. Insert into Pool
    const { error: insertError } = await supabaseAdmin
        .from('payment_pools')
        .insert({
            chain: chain,
            address: derivedAddress,
            status: 'assigned',
            assigned_to_user_id: user.id,
            assigned_at: new Date(),
            derivation_path_index: nextIndex
        })

    if (insertError) throw insertError

    return new Response(JSON.stringify({
        success: true,
        address: derivedAddress,
        expires_at: new Date(Date.now() + 24 * 60 * 60 * 1000)
    }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    })
  }
})
