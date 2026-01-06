-- Function to get database size and connection count
create or replace function get_system_metrics()
returns json
language plpgsql
security definer
as $$
declare
  db_size bigint;
  active_connections int;
begin
  -- Get size of the current database
  select pg_database_size(current_database()) into db_size;
  
  -- Get count of active connections
  select count(*) into active_connections 
  from pg_stat_activity 
  where state = 'active';
  
  return json_build_object(
    'db_size_bytes', db_size,
    'active_connections', active_connections,
    'server_time', now()
  );
end;
$$;
