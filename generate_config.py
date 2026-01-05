import hmac
import hashlib
import json
import base64
import time
import secrets

def b64url(data):
    return base64.urlsafe_b64encode(data).rstrip(b'=')

def sign(payload, secret):
    header = {"alg": "HS256", "typ": "JWT"}
    h_str = b64url(json.dumps(header).encode('utf-8'))
    p_str = b64url(json.dumps(payload).encode('utf-8'))
    msg = h_str + b'.' + p_str
    sig = hmac.new(secret.encode('utf-8'), msg, hashlib.sha256).digest()
    return (msg + b'.' + b64url(sig)).decode('utf-8')

jwt_secret = secrets.token_hex(32)
db_password = secrets.token_hex(16)
dashboard_password = secrets.token_hex(16)

anon_payload = {
    "role": "anon",
    "iss": "supabase",
    "iat": int(time.time()),
    "exp": int(time.time()) + 315360000 # 10 years
}

service_payload = {
    "role": "service_role",
    "iss": "supabase",
    "iat": int(time.time()),
    "exp": int(time.time()) + 315360000
}

anon_key = sign(anon_payload, jwt_secret)
service_key = sign(service_payload, jwt_secret)

# Base configuration template
env_content = f"""
POSTGRES_PASSWORD={db_password}
JWT_SECRET={jwt_secret}
ANON_KEY={anon_key}
SERVICE_ROLE_KEY={service_key}
DASHBOARD_USERNAME=admin
DASHBOARD_PASSWORD={dashboard_password}

# General
# NOTE: We use port 8000 for Kong (API Gateway)
SITE_URL=http://151.243.109.243:3000
API_EXTERNAL_URL=http://151.243.109.243:8000
SUPABASE_PUBLIC_URL=http://151.243.109.243:8000
STUDIO_DEFAULT_ORGANIZATION=RedLemon
STUDIO_DEFAULT_PROJECT=RedLemon

# Database
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_HOST=db

# Email (Fake for now - required to start)
SMTP_ADMIN_EMAIL=admin@example.com
SMTP_HOST=smtp.example.com
SMTP_PORT=587
SMTP_USER=fake_user
SMTP_PASS=fake_pass
SMTP_SENDER_NAME=fake_sender
"""

print(env_content)
