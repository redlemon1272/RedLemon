import yaml
import os

file_path = '/root/supabase/docker/docker-compose.yml'

if not os.path.exists(file_path):
    print(f"Error: {file_path} not found")
    exit(1)

with open(file_path, 'r') as f:
    data = yaml.safe_load(f)

# Define Caddy Service
caddy_service = {
    'container_name': 'caddy-proxy',
    'image': 'caddy:2-alpine',
    'restart': 'unless-stopped',
    'ports': ['80:80', '443:443'],
    'volumes': [
        './Caddyfile:/etc/caddy/Caddyfile',
        'caddy_data:/data',
        'caddy_config:/config'
    ],
    'depends_on': ['kong'],
    'networks': ['default'] # Will map to whatever default is used (likely supabase_default implicitly)
}

# Add Service
if 'services' not in data:
    data['services'] = {}

data['services']['caddy'] = caddy_service

# Add Volumes
if 'volumes' not in data:
    data['volumes'] = {}

data['volumes']['caddy_data'] = None
data['volumes']['caddy_config'] = None

# Save
with open(file_path, 'w') as f:
    yaml.dump(data, f, default_flow_style=False)

print("Added Caddy service to docker-compose.yml")
