const bip39 = require('bip39');
const bip32 = require('bip32');
const { BIP32Factory } = require('bip32');
const ecc = require('tiny-secp256k1');

const nodeBip32 = BIP32Factory(ecc);

async function generate() {
    console.log("🔐 Generating Safe Keys locally...");
    
    // 1. Generate Mnemonic
    const mnemonic = bip39.generateMnemonic();
    const seed = await bip39.mnemonicToSeed(mnemonic);
    const root = nodeBip32.fromSeed(seed);

    console.log("\n⚠️  IMPORTANT: SAVE THIS SEED PHRASE SAFE & OFFLINE! ⚠️");
    console.log("-------------------------------------------------------");
    console.log(mnemonic);
    console.log("-------------------------------------------------------\n");

    // 2. Derive BTC (Native Segwit - BIP84) -> zpub
    // Path: m / 84' / 0' / 0' (Account 0)
    // We use standard xpub encoding but derived at BIP84 path.
    // Ideally prompts usually expect 'zpub' for Segwit, but many libs handle xpub at correct path.
    // My backend code assumes it gets an Extended Key.
    // Let's derive account level.
    const btcAccount = root.derivePath("m/84'/0'/0'");
    const btcXpub = btcAccount.neutered().toBase58();

    // 3. Derive ETH (BIP44)
    // Path: m / 44' / 60' / 0' / 0 (Account 0, Change 0?)
    // Actually standard for ETH is usually just m/44'/60'/0'/0 or just m/44'/60'/0' (Account)
    // Ethers.js usually expects the Account XPub to derive addresses from indices.
    // My backend does: deriveChild(0).deriveChild(index).
    // If I give it m/44'/60'/0', it does m/44'/60'/0'/0/index.
    // This matches standard "External Chain" behavior.
    const ethAccount = root.derivePath("m/44'/60'/0'");
    const ethXpub = ethAccount.neutered().toBase58();

    console.log("✅ HERE ARE YOUR KEYS FOR SUPABASE (Step 5):");
    console.log("-------------------------------------------------------");
    console.log(`XPUB_BTC="${btcXpub}"`);
    console.log(`XPUB_EVM="${ethXpub}"`);
    console.log("-------------------------------------------------------");
    console.log("\nDone! Copy the lines above and run the 'supabase secrets set' command.");
}

generate();
