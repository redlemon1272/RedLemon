import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req: Request) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        // Service Role for DB writes (Bypassing RLS)
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        console.log(`🧹 CleanupRooms: Starting cleanup sequence...`)

        // Call the V2 cleanup RPC
        // This function handles:
        // 1. Removing stale participants (> 2 mins)
        // 2. Deleting empty/orphaned rooms (EXCEPT events)
        const { data, error } = await supabaseAdmin.rpc('cleanup_inactive_rooms_v2')

        if (error) {
            console.error("❌ RPC Error:", error)
            throw error;
        }

        const deletedCount = data ? data.length : 0;

        if (deletedCount > 0) {
            console.log(`✅ Successfully cleaned up ${deletedCount} zombie rooms:`, data.map((r: any) => r.deleted_name))
        } else {
            console.log("✅ No zombie rooms found.")
        }

        return new Response(JSON.stringify({
            success: true,
            deleted_count: deletedCount,
            deleted_rooms: data,
            message: `Successfully deleted ${deletedCount} stale rooms.`
        }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })

    } catch (error) {
        console.error("❌ CleanupRooms Error:", error)
        return new Response(JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400,
        })
    }
})
