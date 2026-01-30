from bip_utils import Bip39SeedGenerator, Bip44, Bip44Coins, Bip44Changes
import json

mnemonic = "either access boy color rice recipe express photo round enforce debris pill"
seed_bytes = Bip39SeedGenerator(mnemonic).Generate()
bip44_ctx = Bip44.FromSeed(seed_bytes, Bip44Coins.ETHEREUM)

# m/44'/60'/0'/0/1
child_ctx = bip44_ctx.Purpose().Coin().Account(0).Change(Bip44Changes.CHAIN_EXT).AddressIndex(1)

print(f"Index 1 (0/1): {child_ctx.PublicKey().ToAddress()}")

# m/44'/60'/0'/1 (What sweep-payments might be doing if it doesn't use Change(0))
wrong_ctx = bip44_ctx.Purpose().Coin().Account(0).AddressIndex(1)
print(f"Index 1 (Direct): {wrong_ctx.PublicKey().ToAddress()}")
