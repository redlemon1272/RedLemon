
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"
import { handler as assignAddress } from "../assign-address/index.ts"
import { handler as checkPayment } from "../check-payment/index.ts"
import { handler as cleanupRooms } from "../cleanup-rooms/index.ts"
import { handler as createInvoice } from "../create-invoice/index.ts"
import { handler as lnbitsWebhook } from "../lnbits-webhook/index.ts"
import { handler as recoverAccount } from "../recover-account/index.ts"
import { handler as hello } from "../hello/index.ts"
import { handler as sweepPayments } from "../sweep-payments/index.ts"
import { handler as updatePrices } from "../update-prices/index.ts"

serve(async (req: Request) => {
    const url = new URL(req.url);
    const path = url.pathname;

    if (path.includes("diag")) {
        // Dynamic import to avoid issues if file doesn't exist yet
        const { default: diag } = await import("../diag/index.ts");
        return diag(req);
    }

    if (path.includes("assign-address")) return assignAddress(req);
    if (path.includes("check-payment")) return checkPayment(req);
    if (path.includes("cleanup-rooms")) return cleanupRooms(req);
    if (path.includes("create-invoice")) return createInvoice(req);
    if (path.includes("lnbits-webhook")) return lnbitsWebhook(req);
    if (path.includes("recover-account")) return recoverAccount(req);
    if (path.includes("sweep-payments")) return sweepPayments(req);
    if (path.includes("update-prices")) return updatePrices(req);

    // System Status (Added for Admin Dashboard)
    if (path.includes('/system/status')) {
        return new Response(JSON.stringify({
            status: 'online',
            timestamp: new Date().toISOString(),
            service: 'RedLemon Edge Router',
            region: 'self-hosted'
        }), { headers: { 'Content-Type': 'application/json' } })
    }

    // Disk Usage (Added for Admin Dashboard)
    if (path.includes('/system/disk')) {
        try {
            // Priority 1: Read from pre-calculated disk_stats.json (written by host script)
            try {
                const statsJson = await Deno.readTextFile("/home/deno/functions/disk_stats.json");
                const stats = JSON.parse(statsJson);

                if (stats.total_bytes && stats.free_bytes !== undefined) {
                    const totalBytes = stats.total_bytes;
                    const usedBytes = stats.used_bytes ?? (totalBytes - stats.free_bytes);
                    const freeBytes = stats.free_bytes;
                    const usagePercent = totalBytes > 0 ? (usedBytes / totalBytes) * 100 : 0;

                    return new Response(JSON.stringify({
                        total_bytes: totalBytes,
                        used_bytes: usedBytes,
                        free_bytes: freeBytes,
                        usage_percent: Math.round(usagePercent * 10) / 10,
                        source: "cache"
                    }), { headers: { 'Content-Type': 'application/json' } });
                }
            } catch (e) {
                console.error("Disk usage stats file error:", e.message);
            }

            // Fallback for environment where disk_stats.json is missing or invalid
            return new Response(JSON.stringify({
                total_bytes: 100000000000,
                used_bytes: 0,
                free_bytes: 100000000000,
                usage_percent: 0,
                error: "Failed to read disk_stats.json",
                source: "fallback"
            }), { headers: { 'Content-Type': 'application/json' } });
        } catch (error) {
            console.error("System disk error:", error);
            return new Response(JSON.stringify({
                total_bytes: 100000000000,
                used_bytes: 0,
                free_bytes: 100000000000,
                usage_percent: 0,
                error: "Internal server error",
                source: "critical_fallback"
            }), { headers: { 'Content-Type': 'application/json' } });
        }
    }

    // Realtime Stats (Added for Admin Dashboard - Live Event & Room Monitoring)
    if (path.includes('/system/realtime-stats')) {
        try {
            // Create Supabase admin client
            const supabaseAdmin = createClient(
                Deno.env.get('SUPABASE_URL') ?? '',
                Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
            );

            // Query active event rooms (system-hosted)
            // Events are identified by room_id starting with 'event_'
            const { data: events, error: eventsError } = await supabaseAdmin
                .from('rooms')
                .select('id, name, participants_count, is_playing, max_participants, created_at')
                .ilike('id', 'event_%')
                .order('participants_count', { ascending: false, nullsFirst: false })
                .limit(10);

            if (eventsError) {
                throw new Error(`Database query failed for events: ${eventsError.message}`);
            }

            // Query active user-hosted watch party rooms (NOT starting with 'event_')
            const { data: rooms, error: roomsError } = await supabaseAdmin
                .from('rooms')
                .select('id, name, participants_count, is_playing, max_participants, created_at')
                .not('id', 'ilike', 'event_%')
                .order('participants_count', { ascending: false, nullsFirst: false })
                .limit(10);

            if (roomsError) {
                throw new Error(`Database query failed for rooms: ${roomsError.message}`);
            }

            // Calculate event stats
            let totalEventParticipants = 0;
            let largestEvent = null;
            let activeEvents = 0;

            if (events && Array.isArray(events)) {
                for (const event of events) {
                    const count = event.participants_count || 0;
                    totalEventParticipants += count;
                    if (count > 0) {
                        activeEvents++;
                    }
                    if (!largestEvent || count > (largestEvent.participants_count || 0)) {
                        largestEvent = event;
                    }
                }
            }

            // Calculate room stats
            let totalRoomParticipants = 0;
            let largestRoom = null;
            let activeRooms = 0;

            if (rooms && Array.isArray(rooms)) {
                for (const room of rooms) {
                    const count = room.participants_count || 0;
                    totalRoomParticipants += count;
                    if (count > 0) {
                        activeRooms++;
                    }
                    if (!largestRoom || count > (largestRoom.participants_count || 0)) {
                        largestRoom = room;
                    }
                }
            }

            // Realtime capacity limits (from docker-compose RLIMIT_NOFILE=10000)
            // Each WebSocket uses ~2 file descriptors, so effective limit is ~5000 connections
            const MAX_WEBSOCKET_CONNECTIONS = 5000;
            const totalParticipants = totalEventParticipants + totalRoomParticipants;
            const usagePercent = totalParticipants > 0
                ? (totalParticipants / MAX_WEBSOCKET_CONNECTIONS) * 100
                : 0;

            return new Response(JSON.stringify({
                // Events section
                total_participants: totalParticipants,
                active_events: activeEvents,
                largest_event: largestEvent ? {
                    room_id: largestEvent.id,
                    room_name: largestEvent.name,
                    participants_count: largestEvent.participants_count
                } : null,
                // Rooms section (NEW)
                active_rooms: activeRooms,
                total_room_participants: totalRoomParticipants,
                largest_room: largestRoom ? {
                    room_id: largestRoom.id,
                    room_name: largestRoom.name,
                    participants_count: largestRoom.participants_count
                } : null,
                // Capacity section
                max_connections: MAX_WEBSOCKET_CONNECTIONS,
                usage_percent: Math.round(usagePercent * 10) / 10,
                capacity_status: usagePercent >= 80 ? 'critical' : usagePercent >= 50 ? 'warning' : 'healthy',
                // Full lists
                events: events || [],
                rooms: rooms || []
            }), { headers: { 'Content-Type': 'application/json' } });
        } catch (error) {
            console.error("Realtime stats error:", error);
            return new Response(JSON.stringify({
                total_participants: 0,
                active_events: 0,
                largest_event: null,
                active_rooms: 0,
                total_room_participants: 0,
                largest_room: null,
                max_connections: 5000,
                usage_percent: 0,
                capacity_status: 'unknown',
                error: error instanceof Error ? error.message : String(error)
            }), { status: 500, headers: { 'Content-Type': 'application/json' } });
        }
    }

    return new Response("Function not found: " + path, { status: 404 });
});
