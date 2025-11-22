import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const LNBITS_URL = Deno.env.get("LNBITS_URL")!
const LNBITS_API_KEY = Deno.env.get("LNBITS_API_KEY")!
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

serve(async (req) => {
  try {
    // 1. Get User ID from Auth Header
    const authHeader = req.headers.get('Authorization')!
    const token = authHeader.replace('Bearer ', '')
    const { data: { user }, error: authError } = await supabase.auth.getUser(token)
    
    if (authError || !user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401 })
    }

    // 2. Call LNBits to create invoice
    const amount = 1000 // Fixed price for Host License (1000 sats)
    const memo = `RedLemon Host License for ${user.id}`
    
    const lnbitsResponse = await fetch(`${LNBITS_URL}/api/v1/payments`, {
      method: 'POST',
      headers: {
        'X-Api-Key': LNBITS_API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ out: false, amount, memo })
    })

    if (!lnbitsResponse.ok) {
      throw new Error('Failed to create invoice with LNBits')
    }

    const invoiceData = await lnbitsResponse.json()
    // invoiceData = { payment_hash, payment_request, checking_id, ... }

    // 3. Store in Database
    const { error: dbError } = await supabase
      .from('invoices')
      .insert({
        payment_hash: invoiceData.payment_hash,
        user_id: user.id,
        payment_request: invoiceData.payment_request,
        amount: amount,
        status: 'pending'
      })

    if (dbError) {
      console.error('DB Error:', dbError)
      throw new Error('Failed to save invoice')
    }

    // 4. Return to Client
    return new Response(
      JSON.stringify(invoiceData),
      { headers: { "Content-Type": "application/json" } },
    )

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 })
  }
})
