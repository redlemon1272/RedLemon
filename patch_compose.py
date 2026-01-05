import yaml

file_path = '/root/supabase/docker/docker-compose.yml'

with open(file_path, 'r') as f:
    data = yaml.safe_load(f)

# Locate functions service
services = data.get('services', {})
functions = services.get('functions', {})

# Set command
functions['command'] = ["start", "--main-service", "/home/deno/functions/main"]

# Save back
with open(file_path, 'w') as f:
    yaml.dump(data, f, default_flow_style=False)

print("Updated docker-compose.yml")
