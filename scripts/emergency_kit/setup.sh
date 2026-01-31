#!/bin/bash
# install_emergency_deps.sh
echo "Installing dependencies for Emergency Kit..."
pip3 install pyjwt mnemonic bip32 base58 --user --break-system-packages
echo "✅ Dependencies ready."
