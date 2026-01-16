
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

    return new Response("Function not found: " + path, { status: 404 });
});
