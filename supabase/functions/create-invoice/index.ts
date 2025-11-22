import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const LNBITS_URL = Deno.env.get("LNBITS_URL")!
const LNBITS_API_KEY = Deno.env.get("LNBITS_API_KEY")!
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

serve(async (req) => {
  try {
    // Parse request body to get user_id
    // Since RedLemon uses username-based auth without Supabase Auth,
    // we accept user_id directly in the request body
    const { user_id, amount = 1000, memo } = await req.json()
    
    if (!user_id) {
      return new Response(JSON.stringify({ error: 'Missing user_id' }), { status: 400 })
    }

    // Verify user exists
    const { data: user, error: userError } = await supabase
      .from('users')
      .select('id, username')
      .eq('id', user_id)
      .single()
    
    if (userError || !user) {
      return new Response(JSON.stringify({ error: 'User not found' }), { status: 404 })
    }

    // Call LNBits to create invoice
    const finalMemo = memo || `RedLemon Host License for ${user.username}`
    
    const lnbitsResponse = await fetch(`${LNBITS_URL}/api/v1/payments`, {
      method: 'POST',
      headers: {
        'X-Api-Key': LNBITS_API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ out: false, amount, memo: finalMemo })
    })

    if (!lnbitsResponse.ok) {
      const errorText = await lnbitsResponse.text()
      console.error('LNBits error:', errorText)
      throw new Error('Failed to create invoice with LNBits')
    }

    const invoiceData = await lnbitsResponse.json()
    // invoiceData = { payment_hash, payment_request, checking_id, ... }

    // Store in Database
    const { error: dbError } = await supabase
      .from('invoices')
      .insert({
        payment_hash: invoiceData.payment_hash,
        user_id: user_id,
        payment_request: invoiceData.payment_request,
        amount: amount,
        status: 'pending'
      })

    if (dbError) {
      console.error('DB Error:', dbError)
      throw new Error('Failed to save invoice')
    }

    // Return to Client
    return new Response(
      JSON.stringify(invoiceData),
      { headers: { "Content-Type": "application/json" } },
    )

  } catch (error) {
    console.error('Error:', error)
    return new Response(JSON.stringify({ error: error.message }), { status: 500 })
  }
})
