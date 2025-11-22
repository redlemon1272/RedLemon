import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)

serve(async (req) => {
  try {
    const { recovery_hash } = await req.json()

    if (!recovery_hash) {
      return new Response("Missing recovery_hash", { status: 400 })
    }

    // 1. Find User by Hash using RPC (Security Definer)
    const { data: users, error } = await supabase
      .rpc('get_user_by_recovery_hash', { hash_input: recovery_hash })

    if (error) {
      throw error
    }

    if (!users || users.length === 0) {
      return new Response(JSON.stringify({ error: "Invalid recovery phrase" }), { status: 404 })
    }

    const user = users[0]

    // 2. Generate a Session (Simulated Login)
    // Since we don't have email/pass, we can't generate a real Auth session easily without Admin API.
    // For this "No Login" app, we just return the User ID and let the client adopt it.
    // SECURITY NOTE: In a strict app, we'd sign a custom JWT here. 
    // For RedLemon MVP, returning the ID allows the client to set 'currentUserId' locally.
    
    return new Response(
      JSON.stringify({
        user_id: user.id,
        username: user.username,
        is_host: user.is_host
      }),
      { headers: { "Content-Type": "application/json" } },
    )

  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 })
  }
})
