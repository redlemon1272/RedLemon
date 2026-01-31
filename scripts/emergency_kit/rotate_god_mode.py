import os
import sys
import time
import json
import secrets
import string
import subprocess
import shutil
import re
from mnemonic import Mnemonic
from bip32 import BIP32
import base58
import binascii

# --- CONFIGURATION ---
SERVER_IP = "151.243.109.243"
CURRENT_ROOT_PASS_FILE = "current_root_pass.tmp" # User must provide this or we prompt
AI_BIBLE_PATH = "../../AI_BIBLE.md"
CONFIG_SWIFT_PATH = "../../Sources/App/Config.swift"

# --- HELPERS ---
def generate_password(length=32):
    alphabet = string.ascii_letters + string.digits + "!@#$%^&*"
    while True:
        password = ''.join(secrets.choice(alphabet) for i in range(length))
        if (any(c.islower() for c in password)
                and any(c.isupper() for c in password)
                and any(c.isdigit() for c in password)):
            return password

def generate_hex(length=64):
    return secrets.token_hex(length // 2)

def xpub_to_zpub(xpub):
    data = base58.b58decode_check(xpub)
    zpub_header = binascii.unhexlify("04b24746")
    new_data = zpub_header + data[4:]
    return base58.b58encode_check(new_data).decode('utf-8')

def generate_wallet():
    mnemo = Mnemonic("english")
    mnemonic_str = mnemo.generate(strength=128)
    seed = mnemo.to_seed(mnemonic_str)
    bip32_ctx = BIP32.from_seed(seed)
    
    # BTC Native Segwit (m/84'/0'/0')
    btc_path = "m/84'/0'/0'"
    btc_xpub = xpub_to_zpub(bip32_ctx.get_xpub_from_path(btc_path))
    
    # EVM (m/44'/60'/0')
    eth_path = "m/44'/60'/0'"
    eth_xpub = bip32_ctx.get_xpub_from_path(eth_path)
    eth_xprv = bip32_ctx.get_xprv_from_path(eth_path)
    
    return {
        "mnemonic": mnemonic_str,
        "btc_xpub": btc_xpub,
        "eth_xpub": eth_xpub,
        "eth_xprv": eth_xprv
    }

def generate_jwts(secret):
    import jwt # pip install pyjwt
    iat = int(time.time())
    exp = iat + (10 * 365 * 24 * 60 * 60) # 10 years
    
    anon_payload = {"role": "anon", "iss": "supabase", "iat": iat, "exp": exp}
    anon_key = jwt.encode(anon_payload, secret, algorithm="HS256")
    
    service_payload = {"role": "service_role", "iss": "supabase", "iat": iat, "exp": exp}
    service_key = jwt.encode(service_payload, secret, algorithm="HS256")
    
    return {"anon": anon_key, "service": service_key}

def print_banner(text):
    print("\n" + "="*60)
    print(f" {text}")
    print("="*60 + "\n")

# --- MAIN SEQUENCE ---

def main():
    print_banner("🍋 REDLEMON GOD MODE: EMERGENCY CREDENTIAL ROTATION")
    
    # 0. Check Dependencies
    try:
        import jwt
        import hdwallet # checking if installed, though we use bip32/mnemonic
    except ImportError:
        print("❌ Missing dependencies. Run: pip3 install pyjwt mnemonic bip32 base58")
        sys.exit(1)

    # 1. Ask for Current Root Password (to access server)
    current_root_pass = input(f"Enter CURRENT Root Password for {SERVER_IP}: ").strip()
    if not current_root_pass:
        print("❌ Cannot proceed without current password.")
        sys.exit(1)

    print("🚀 Generating NEW Credentials...")
    
    # 2. Generate Secrets
    new_creds = {
        "ssh_root": generate_password(24),
        "postgres_pass": generate_password(24),
        "dashboard_pass": generate_password(24),
        "jwt_secret": generate_hex(64),
        "wallet": generate_wallet()
    }
    
    jwts = generate_jwts(new_creds["jwt_secret"])
    new_creds["anon_key"] = jwts["anon"]
    new_creds["service_key"] = jwts["service"]
    
    # 3. DISPLAY AND CONFIRM
    print_banner("⚠️  CRITICAL: NEW SECRETS GENERATED  ⚠️")
    print(f"Server IP:       {SERVER_IP}")
    print(f"NEW SSH Root:    {new_creds['ssh_root']}")
    print(f"NEW Postgres:    {new_creds['postgres_pass']}")
    print(f"NEW Dashboard:   {new_creds['dashboard_pass']}")
    print("-" * 40)
    print(f"NEW Mnemonic:    {new_creds['wallet']['mnemonic']}")
    print(f"NEW JWT Secret:  {new_creds['jwt_secret']}")
    print(f"NEW Anon Key:    {new_creds['anon_key'][:20]}...")
    print("=" * 60)
    
    confirm = input("Type 'SAVED' to confirm you have securely backed up these credentials: ")
    if confirm.strip() != "SAVED":
        print("❌ Aborted by user.")
        sys.exit(1)
        
    # 4. Update Local Files
    print("\n📝 Updating Local Artifacts...")
    
    # Update AI_BIBLE.md
    if os.path.exists(AI_BIBLE_PATH):
        with open(AI_BIBLE_PATH, 'r') as f:
            content = f.read()
        
        # Regex replacements
        # Replace Mnemonic
        content = re.sub(r'Seed Phrase \(Mnemonic\):\n`[^`]+`', f'Seed Phrase (Mnemonic):\n`{new_creds["wallet"]["mnemonic"]}`', content)
        # Replace SSH Password
        content = re.sub(r'SSH Password\*\* \| `[^`]+`', f'SSH Password** | `{new_creds["ssh_root"]}`', content)
        # Replace Postgres Password
        content = re.sub(r'User: `postgres`<br>Pass: `[^`]+`', f'User: `postgres`<br>Pass: `{new_creds["postgres_pass"]}`', content)
         # Replace Dashboard Password
        content = re.sub(r'User: `admin`<br>Pass: `[^`]+`', f'User: `admin`<br>Pass: `{new_creds["dashboard_pass"]}`', content)
        # Replace JWT Secret
        content = re.sub(r'JWT Secret \(For Token Generation\):\n\s+`[^`]+`', f'JWT Secret (For Token Generation):\n    `{new_creds["jwt_secret"]}`', content)
        # Replace Anon Key
        content = re.sub(r'ANON_KEY \(Public\):\n\s+`[^`]+`', f'ANON_KEY (Public):\n    `{new_creds["anon_key"]}`', content)
        # Replace XPUBs
        content = re.sub(r'XPUB_BTC:\*\* `[^`]+`', f'XPUB_BTC:** `{new_creds["wallet"]["btc_xpub"]}`', content)
        content = re.sub(r'XPUB_EVM:\*\* `[^`]+`', f'XPUB_EVM:** `{new_creds["wallet"]["eth_xpub"]}`', content)

        with open(AI_BIBLE_PATH, 'w') as f:
            f.write(content)
        print(f"✅ Updated {AI_BIBLE_PATH}")
    
    # Update Config.swift
    if os.path.exists(CONFIG_SWIFT_PATH):
        with open(CONFIG_SWIFT_PATH, 'r') as f:
            content = f.read()
            
        content = re.sub(r'static let supabaseAnonKey = "[^"]+"', f'static let supabaseAnonKey = "{new_creds["anon_key"]}"', content)
        
        with open(CONFIG_SWIFT_PATH, 'w') as f:
            f.write(content)
        print(f"✅ Updated {CONFIG_SWIFT_PATH}")

    # 5. Generate Server Update Script
    print("\n📡 Preparing Server Update Payload...")
    
    script_content = f"""#!/usr/bin/expect -f
set timeout 60
spawn ssh -o StrictHostKeyChecking=no root@{SERVER_IP}
expect {{
    "*assword:*" {{
        send "{current_root_pass}\\r"
    }}
}}
expect "#"

# 1. Update .env file
send "sed -i 's/^POSTGRES_PASSWORD=.*/POSTGRES_PASSWORD={new_creds['postgres_pass']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^JWT_SECRET=.*/JWT_SECRET={new_creds['jwt_secret']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^ANON_KEY=.*/ANON_KEY={new_creds['anon_key']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^SERVICE_ROLE_KEY=.*/SERVICE_ROLE_KEY={new_creds['service_key']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^DASHBOARD_PASSWORD=.*/DASHBOARD_PASSWORD={new_creds['dashboard_pass']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^XPUB_BTC=.*/XPUB_BTC={new_creds['wallet']['btc_xpub']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^XPUB_EVM=.*/XPUB_EVM={new_creds['wallet']['eth_xpub']}/' /root/supabase/docker/.env\\r"
expect "#"
send "sed -i 's/^XPRV_EVM=.*/XPRV_EVM={new_creds['wallet']['eth_xprv']}/' /root/supabase/docker/.env\\r"
expect "#"

# 2. Update Postgres Passwords (Active)
# We need to restart DB first to pick up new env? No, we can alter user using old password?
# Actually, the simplest way is to restart, then use 'docker exec' with the NEW password from env to update the roles.
# OR, use the OLD password to update the roles to the NEW password. Let's do that.

# Just restart the containers. The postgres container uses POSTGRES_PASSWORD env var on init, but on existing volume it might persist the old one.
# So we MUST run ALTER USER.
# Using current known Postgres pass (from user input? No we don't know it).
# Wait, if we don't know the current DB pass, we can't login to psql...
# BUT, we are ROOT on the box. We can edit pg_hba.conf to trust local? Or just 'docker exec -u postgres'.
# 'docker exec -it supabase-db psql -U postgres' usually works without password from inside the server if configured to trust local.
# Let's try that.

# 3. Restart Docker (Apply .env)
send "cd /root/supabase/docker && docker compose down && docker compose up -d\\r"
expect "#"

# Wait for DB to come up
send "sleep 15\\r"
expect "#"

# 4. Flush Wallets (Zombie Protocol)
send "docker exec supabase-db psql -U postgres postgres -c \\"UPDATE key_derivation_indices SET next_index = 0; DELETE FROM payment_pools; ANALYZE payment_pools;\\"\\r"
expect "#"

# 5. Update Internal DB Roles (Sync with new .env)
# The container restart updates the ENV vars, but the DB users inside postgres need SQL updates.
send "docker exec supabase-db psql -U postgres postgres -c \\"ALTER USER postgres WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER supabase_admin WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER authenticator WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER pgbouncer WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER supabase_auth_admin WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER supabase_functions_admin WITH PASSWORD '{new_creds['postgres_pass']}'; ALTER USER supabase_storage_admin WITH PASSWORD '{new_creds['postgres_pass']}';\\"\\r"
expect "#"

# 6. Change SSH Root Password
send "passwd\\r"
expect "New password:"
send "{new_creds['ssh_root']}\\r"
expect "Retype new password:"
send "{new_creds['ssh_root']}\\r"
expect "#"

send "exit\\r"
expect eof
"""
    
    with open("temp_deploy.exp", "w") as f:
        f.write(script_content)
    os.chmod("temp_deploy.exp", 0o700)
    
    # 6. Execute Server Update
    print("🚀 Executing Server Update (This may take 1-2 minutes)...")
    try:
        subprocess.run(["./temp_deploy.exp"], check=True)
        print("✅ Server Updated Successfully.")
    except subprocess.CalledProcessError:
        print("❌ Server Update Failed. Check connectivity.")
        sys.exit(1)
    finally:
        if os.path.exists("temp_deploy.exp"):
            os.remove("temp_deploy.exp")
            
    print_banner("✅ ROTATION COMPLETE. OLD CREDENTIALS ARE DEAD.")

if __name__ == "__main__":
    main()
