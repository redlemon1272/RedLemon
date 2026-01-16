
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
    if (path === '/system/status') {
        return new Response(JSON.stringify({
            status: 'online',
            timestamp: new Date().toISOString(),
            service: 'RedLemon Edge Router',
            region: 'self-hosted'
        }), { headers: { 'Content-Type': 'application/json' } })
    }

    // Disk Usage (Added for Admin Dashboard)
    if (path === '/system/disk') {
        try {
            // Execute df command to get disk usage for root filesystem
            const cmd = new Deno.Command("df", {
                args: ["-B1", "/"],  // -B1 for bytes, / for root filesystem
                stdout: "piped",
                stderr: "piped",
            });
            const { stdout } = await cmd.output();
            const output = new TextDecoder().decode(stdout);

            // Parse df output: Filesystem 1B-blocks Used Available Use% Mounted
            const lines = output.trim().split('\n');
            if (lines.length >= 2) {
                const parts = lines[1].split(/\s+/);
                // parts: [filesystem, total, used, available, use%, mount]
                const totalBytes = parseInt(parts[1]) || 0;
                const usedBytes = parseInt(parts[2]) || 0;
                const freeBytes = parseInt(parts[3]) || 0;
                const usagePercent = totalBytes > 0 ? (usedBytes / totalBytes) * 100 : 0;

                return new Response(JSON.stringify({
                    total_bytes: totalBytes,
                    used_bytes: usedBytes,
                    free_bytes: freeBytes,
                    usage_percent: Math.round(usagePercent * 10) / 10
                }), { headers: { 'Content-Type': 'application/json' } });
            }
            throw new Error("Failed to parse df output");
        } catch (error) {
            console.error("Disk usage error:", error);
            // Fallback for environment where df is not available or perm denied
            return new Response(JSON.stringify({
                total_bytes: 100000000000,
                used_bytes: 0,
                free_bytes: 100000000000,
                usage_percent: 0,
                error: "Failed to get real disk usage"
            }), { headers: { 'Content-Type': 'application/json' } });
        }
    }

    return new Response("Function not found: " + path, { status: 404 });
});
