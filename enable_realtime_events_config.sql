-- Enable Realtime replication for the events_config table
begin;
  -- Add the table to the publication used by Supabase Realtime
  alter publication supabase_realtime add table events_config;
commit;
