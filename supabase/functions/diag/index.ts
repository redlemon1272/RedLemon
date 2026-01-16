
import { HDNodeWallet } from "https://esm.sh/ethers@6.7.0"

export default async function handler(req: Request) {
    const XPRV_EVM = Deno.env.get('XPRV_EVM')
    const root = HDNodeWallet.fromExtendedKey(XPRV_EVM!)
    const targetIdx = 20

    // Test derivePath vs deriveChild
    const d1 = root.deriveChild(0).deriveChild(targetIdx).address // m/0/20
    const d2 = root.derivePath(`0/${targetIdx}`).address // m/0/20
    const d3 = root.deriveChild(targetIdx).address // m/20

    // Check root fingerprint and level
    // (These help identify the depth)

    const response = {
        rootAddress: root.address,
        deriveChild_0_20: d1,
        derivePath_0_20: d2,
        deriveChild_20: d3,
        xprv_preview: XPRV_EVM?.substring(0, 15) + "..."
    }

    return new Response(JSON.stringify(response), { headers: { "Content-Type": "application/json" } })
}
