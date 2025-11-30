-- Create events_config table for centralized movie/TV event configuration
-- This ensures all RedLemon instances show identical event schedules

CREATE TABLE IF NOT EXISTS events_config (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  config_type TEXT NOT NULL CHECK (config_type IN ('movie_events', 'tv_events')),
  version INTEGER NOT NULL,
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  is_active BOOLEAN DEFAULT true,
  UNIQUE(config_type, version)
);

-- Index for fast active config lookups
CREATE INDEX IF NOT EXISTS idx_events_config_active 
ON events_config(config_type, is_active, version DESC) 
WHERE is_active = true;

-- Auto-update timestamp trigger
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_events_config_updated_at 
BEFORE UPDATE ON events_config 
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert initial movie events config (empty, will be populated by script)
INSERT INTO events_config (config_type, version, data, is_active)
VALUES (
  'movie_events', 
  1, 
  jsonb_build_object(
    'movies', '[]'::jsonb,
    'cycle_duration_hours', 200,
    'buffer_between_movies_seconds', 600,
    'epoch_timestamp', 1704067200,
    'generated_at', NOW()
  ),
  true
)
ON CONFLICT (config_type, version) DO NOTHING;

-- Enable Row Level Security (RLS)
ALTER TABLE events_config ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can read active configs (public data)
CREATE POLICY "Public read access to active configs"
ON events_config
FOR SELECT
USING (is_active = true);

-- Policy: Only authenticated users can insert/update (for admin script)
-- Note: You may want to restrict this further to specific admin users
CREATE POLICY "Authenticated users can manage configs"
ON events_config
FOR ALL
USING (auth.role() = 'authenticated');
