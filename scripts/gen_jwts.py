import jwt # Need to check if I have this, or use something else.
import time

secret = "2f838bcacafbdd44a8c777572a5d908ece3a42998d4199abc44d2dd9400b8783"

def gen_jwt(role, exp):
    payload = {
        "role": role,
        "iss": "supabase",
        "iat": int(time.time()),
        "exp": exp
    }
    # If I don't have PyJWT, I might have to use another method.
    try:
        import jwt
        return jwt.encode(payload, secret, algorithm="HS256")
    except ImportError:
        return "JWT_LIB_MISSING"

exp = int(time.time() + (365 * 24 * 60 * 60 * 10)) # 10 years

print(f"ANON_KEY={gen_jwt('anon', exp)}")
print(f"SERVICE_ROLE_KEY={gen_jwt('service_role', exp)}")
