
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight request
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // 1. Create Supabase Client
    // We use the Service Role Key to bypass RLS when calling the RPC if needed, 
    // BUT since our RPC is SECURITY DEFINER, we can just use the Auth context.
    // However, getting the user from the JWT manually is safer for Edge Functions.
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
    )

    // 2. Auth Check
    const {
      data: { user },
    } = await supabaseClient.auth.getUser()

    if (!user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 401,
      })
    }

    // 3. Parse Body
    const { chain } = await req.json()
    if (!['btc', 'evm', 'sol'].includes(chain)) {
        return new Response(JSON.stringify({ error: 'Invalid chain. Must be btc, evm, or sol' }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400,
        })
    }

    // 4. Call RPC
    // We re-create a service-role client just for the RPC to ensure it has permissions 
    // if the user doesn't have direct access to the table (though the RPC is security definer).
    // Actually, passing the user_id to the RPC is enough.
    
    // We use the Service Role key for the RPC call to ensure we can lock rows 
    // even if RLS is strict.
    const supabaseAdmin = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    const { data, error } = await supabaseAdmin
      .rpc('assign_payment_address', {
        p_chain: chain,
        p_user_id: user.id
      })

    if (error) throw error

    // 5. Return Result
    return new Response(JSON.stringify(data), {
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
