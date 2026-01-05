import hmac
import hashlib
import json
import base64
import time
import secrets
import os

# JWT Generation Functions
def b64url(data):
    return base64.urlsafe_b64encode(data).rstrip(b'=')

def sign(payload, secret):
    header = {"alg": "HS256", "typ": "JWT"}
    msg = b64url(json.dumps(header).encode('utf-8')) + b'.' + b64url(json.dumps(payload).encode('utf-8'))
    sig = hmac.new(secret.encode('utf-8'), msg, hashlib.sha256).digest()
    return (msg + b'.' + b64url(sig)).decode('utf-8')

# 1. Generate Secrets
jwt_secret = secrets.token_hex(32)
db_password = secrets.token_hex(16)
dashboard_password = secrets.token_hex(16)

anon_key = sign({"role": "anon", "iss": "supabase", "iat": int(time.time()), "exp": int(time.time()) + 315360000}, jwt_secret)
service_key = sign({"role": "service_role", "iss": "supabase", "iat": int(time.time()), "exp": int(time.time()) + 315360000}, jwt_secret)

# 2. Read .env.example
with open('/root/supabase/docker/.env.example', 'r') as f:
    lines = f.readlines()

# 3. Mappings
replacements = {
    "POSTGRES_PASSWORD=": f"POSTGRES_PASSWORD={db_password}\n",
    "JWT_SECRET=": f"JWT_SECRET={jwt_secret}\n",
    "ANON_KEY=": f"ANON_KEY={anon_key}\n",
    "SERVICE_ROLE_KEY=": f"SERVICE_ROLE_KEY={service_key}\n",
    "DASHBOARD_PASSWORD=": f"DASHBOARD_PASSWORD={dashboard_password}\n",
    "API_EXTERNAL_URL=": "API_EXTERNAL_URL=http://151.243.109.243:8000\n",
    "SUPABASE_PUBLIC_URL=": "SUPABASE_PUBLIC_URL=http://151.243.109.243:8000\n",
    "SITE_URL=": "SITE_URL=http://151.243.109.243:3000\n",
    "STUDIO_DEFAULT_ORGANIZATION=": "STUDIO_DEFAULT_ORGANIZATION=RedLemon\n",
    "STUDIO_DEFAULT_PROJECT=": "STUDIO_DEFAULT_PROJECT=RedLemon\n",
    "DASHBOARD_USERNAME=": "DASHBOARD_USERNAME=admin\n"
}

# 4. Process
new_lines = []
for line in lines:
    updated = False
    for key, value in replacements.items():
        if line.startswith(key):
            new_lines.append(value)
            updated = True
            break
    if not updated:
        new_lines.append(line)

# 5. Write .env
with open('/root/supabase/docker/.env', 'w') as f:
    f.writelines(new_lines)

print("Generated .env successfully")
# Output keys for local capture
print("---KEYS_START---")
print(f"ANON_KEY={anon_key}")
print(f"SERVICE_ROLE_KEY={service_key}")
print(f"SUPABASE_URL=http://151.243.109.243:8000")
print("---KEYS_END---")
