from bip_utils import Bip39SeedGenerator, Bip44, Bip44Coins
import json

mnemonic = "either access boy color rice recipe express photo round enforce debris pill"
seed_bytes = Bip39SeedGenerator(mnemonic).Generate()
bip44_ctx = Bip44.FromSeed(seed_bytes, Bip44Coins.ETHEREUM)
# Account level (m/44'/60'/0')
account_ctx = bip44_ctx.Purpose().Coin().Account(0)
# m/0/1 (External chain, index 1)
child_ctx = account_ctx.Change(Bip44Coins.ETHEREUM.Change().EXTERNAL).AddressIndex(1)

print(f"Address: {child_ctx.PublicKey().ToAddress()}")
