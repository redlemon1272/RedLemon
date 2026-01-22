
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
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

    return new Response("Function not found: " + path, { status: 404 });
});
