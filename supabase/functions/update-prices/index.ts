// update-prices Edge Function
// Fetches live crypto prices from CoinGecko and updates the database
// Can be triggered by cron or manually from admin dashboard

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.0'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// CoinGecko free API (no key required, 10-30 calls/min limit)
const COINGECKO_API = 'https://api.coingecko.com/api/v3/simple/price'

export async function handler(req: Request): Promise<Response> {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const SUPABASE_URL = Deno.env.get('SUPABASE_URL')
        const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')

        const supabase = createClient(SUPABASE_URL!, SUPABASE_SERVICE_ROLE_KEY!)

        // Fetch prices from CoinGecko
        const response = await fetch(
            `${COINGECKO_API}?ids=ethereum,bitcoin&vs_currencies=usd`,
            {
                headers: {
                    'Accept': 'application/json',
                    'User-Agent': 'RedLemon/1.0'
                }
            }
        )

        if (!response.ok) {
            throw new Error(`CoinGecko API error: ${response.status}`)
        }

        const prices = await response.json()
        console.log('[UpdatePrices] Fetched prices:', prices)

        const ethPrice = prices.ethereum?.usd
        const btcPrice = prices.bitcoin?.usd

        const updates = []

        if (ethPrice) {
            const { error } = await supabase.rpc('update_crypto_price', {
                p_symbol: 'ETH',
                p_price_usd: ethPrice
            })
            if (error) {
                console.error('[UpdatePrices] ETH update failed:', error.message)
            } else {
                updates.push({ symbol: 'ETH', price: ethPrice })
            }
        }

        if (btcPrice) {
            const { error } = await supabase.rpc('update_crypto_price', {
                p_symbol: 'BTC',
                p_price_usd: btcPrice
            })
            if (error) {
                console.error('[UpdatePrices] BTC update failed:', error.message)
            } else {
                updates.push({ symbol: 'BTC', price: btcPrice })
            }
        }

        return new Response(
            JSON.stringify({
                success: true,
                updated: updates,
                timestamp: new Date().toISOString()
            }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error: any) {
        console.error(`[UpdatePrices] Error: ${error.message}`)
        return new Response(
            JSON.stringify({ success: false, error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
    }
}
