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

        // 1. Calculate threshold time (e.g., 1 hour ago)
        const STALE_THRESHOLD_MS = 60 * 60 * 1000; // 1 hour
        const thresholdDate = new Date(Date.now() - STALE_THRESHOLD_MS);

        console.log(`🧹 CleanupRooms: Identifying rooms inactive since ${thresholdDate.toISOString()}...`)

        // 2. Fetch Stale Rooms
        // We target rooms that:
        // - Are NOT Event rooms (id does not start with 'event_')
        // - Have 0 participants
        // - Haven't had activity for 1 hour
        const { data: staleRooms, error: fetchError } = await supabaseAdmin
            .from('rooms')
            .select('id, name, host_username, last_activity')
            .eq('participants_count', 0)
            .lt('last_activity', thresholdDate.toISOString())
            .not('id', 'ilike', 'event_%') // Safety check for event rooms

        if (fetchError) throw fetchError;

        if (!staleRooms || staleRooms.length === 0) {
            console.log("✅ No stale rooms found.")
            return new Response(JSON.stringify({
                success: true,
                deleted_count: 0,
                message: 'No stale rooms found'
            }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })
        }

        console.log(`⚠️ Found ${staleRooms.length} stale rooms to delete:`, staleRooms.map(r => r.name))

        // 3. Delete Stale Rooms
        // We delete them one by one or in batch. Batch is better.
        const roomIdsToDelete = staleRooms.map(r => r.id)

        const { error: deleteError } = await supabaseAdmin
            .from('rooms')
            .delete()
            .in('id', roomIdsToDelete)

        if (deleteError) throw deleteError;

        console.log(`✅ Successfully deleted ${roomIdsToDelete.length} stale rooms.`)

        return new Response(JSON.stringify({
            success: true,
            deleted_count: roomIdsToDelete.length,
            deleted_rooms: staleRooms,
            message: `Successfully deleted ${roomIdsToDelete.length} stale rooms.`
        }), { headers: { ...corsHeaders, 'Content-Type': 'application/json' } })

    } catch (error) {
        console.error("❌ CleanupRooms Error:", error)
        return new Response(JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400,
        })
    }
})
