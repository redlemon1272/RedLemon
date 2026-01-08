// Utility script to derive XPRV_EVM from seed phrase
// Run with: node derive-xprv.js
// WARNING: Only run this locally, never on server!

const { HDNodeWallet, Mnemonic } = require('ethers');

const SEED_PHRASE = "moment absent unfair song unusual neck panther asset clock conduct doll voice";

// Derive master node using BIP44 Ethereum path
const mnemonic = Mnemonic.fromPhrase(SEED_PHRASE);
const masterNode = HDNodeWallet.fromMnemonic(mnemonic, "m/44'/60'/0'/0");

console.log("=== XPRV Derivation ===");
console.log("");
console.log("XPRV_EVM (set as Supabase secret):");
console.log(masterNode.extendedKey);
console.log("");
console.log("Master Wallet (index 0) Address:");
const masterWallet = masterNode.derivePath("0");
console.log(masterWallet.address);
console.log("");
console.log("Verification - Index 10 Address (should match Ursinho's payment address):");
const index10 = masterNode.derivePath("10");
console.log(index10.address);
