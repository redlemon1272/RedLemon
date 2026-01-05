import requests
import json
import csv

SUPABASE_URL = "https://nhvsojszwfvcinkyvzmf.supabase.co"
SERVICE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5odnNvanN6d2Z2Y2lua3l2em1mIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MjU2MTkxNiwiZXhwIjoyMDc4MTM3OTE2fQ.g4DfQTfTpIMS07iG3s0RA6JpIm0tICfy-3zqCj3BCmk"

headers = {
    "apikey": SERVICE_KEY,
    "Authorization": f"Bearer {SERVICE_KEY}",
    "Content-Type": "application/json"
}

def fetch_users():
    users = []
    page = 1
    per_page = 50
    
    # Auth Admin API usually paginates or returns list.
    # Endpoint: GET /auth/v1/admin/users
    
    url = f"{SUPABASE_URL}/auth/v1/admin/users"
    
    print(f"Fetching users from {url}...")
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        print(f"Error: {response.status_code} - {response.text}")
        return
    
    data = response.json()
    # Depending on API version, it might be { users: [...] } or just [...]
    if isinstance(data, dict) and 'users' in data:
        user_list = data['users']
    elif isinstance(data, list):
        user_list = data
    else:
        print("Unknown format")
        print(data)
        return

    print(f"Found {len(user_list)} users.")
    for u in user_list:
        print(f"- {u.get('email', 'no-email')} ({u.get('id')})")

fetch_users()
