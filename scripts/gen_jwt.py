import jwt
import secrets
import time

# 1. Generate a fresh, random 64-char JWT Secret
new_secret = secrets.token_hex(32)

def generate_key(role, secret):
    iat = int(time.time())
    exp = iat + (10 * 365 * 24 * 60 * 60) # 10 years
    payload = {
        "role": role,
        "iss": "supabase",
        "iat": iat,
        "exp": exp
    }
    return jwt.encode(payload, secret, algorithm="HS256")

new_anon = generate_key("anon", new_secret)
new_service = generate_key("service_role", new_secret)

print(f"JWT_SECRET={new_secret}")
print(f"ANON_KEY={new_anon}")
print(f"SERVICE_ROLE_KEY={new_service}")
