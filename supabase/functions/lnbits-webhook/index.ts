import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
const WEBHOOK_SECRET = Deno.env.get("WEBHOOK_SECRET")! // Optional: Verify source

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

serve(async (req) => {
  try {
    // 1. Parse Webhook Data
    const payload = await req.json()
    // LNBits webhook payload usually looks like:
    // { payment_hash: "...", amount: 1000, ... }
    
    const paymentHash = payload.payment_hash
    
    if (!paymentHash) {
      return new Response("Missing payment_hash", { status: 400 })
    }

    console.log(`🔔 Webhook received for hash: ${paymentHash}`)

    // 2. Find Invoice in DB
    const { data: invoice, error: findError } = await supabase
      .from('invoices')
      .select('*')
      .eq('payment_hash', paymentHash)
      .single()

    if (findError || !invoice) {
      console.error("Invoice not found")
      return new Response("Invoice not found", { status: 404 })
    }

    if (invoice.status === 'paid') {
      return new Response("Already paid", { status: 200 })
    }

    // 3. Mark Invoice as Paid
    await supabase
      .from('invoices')
      .update({ status: 'paid', updated_at: new Date().toISOString() })
      .eq('payment_hash', paymentHash)

    // 4. Unlock Host License for User
    const { error: profileError } = await supabase
      .from('users')
      .update({ is_host: true })
      .eq('id', invoice.user_id)

    if (profileError) {
      console.error("Failed to update user", profileError)
      throw new Error("Failed to unlock license")
    }

    console.log(`✅ License unlocked for user ${invoice.user_id}`)

    return new Response(JSON.stringify({ success: true }), {
      headers: { "Content-Type": "application/json" },
    })

  } catch (error) {
    console.error(error)
    return new Response(JSON.stringify({ error: error.message }), { status: 500 })
  }
})
