module.exports = {
  apps: [
    {
      name: 'watchparty-ws',
      script: 'dist/index.js',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'production',
        PORT: 47253
      }
    },
    {
      name: 'events-worker',
      script: 'dist/events-worker.js',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '500M',
      env: {
        NODE_ENV: 'production',
        SUPABASE_URL: 'https://nhvsojszwfvcinkyvzmf.supabase.co',
        SUPABASE_SERVICE_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5odnNvanN6d2Z2Y2lua3l2em1mIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MjU2MTkxNiwiZXhwIjoyMDc4MTM3OTE2fQ.g4DfQTfTpIMS07iG3s0RA6JpIm0tICfy-3zqCj3BCmk'
      }
    }
  ]
};
