-- Create reported_streams table
create table if not exists public.reported_streams (
    id uuid default gen_random_uuid() primary key,
    imdb_id text not null,
    quality text not null,
    stream_hash text not null,
    reason text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable RLS
alter table public.reported_streams enable row level security;

-- Allow public to insert (report streams)
create policy "Allow public insert to reported_streams"
    on public.reported_streams for insert
    with check (true);

-- Allow authenticated users (admins/service role) to view and delete
create policy "Allow internal read access"
    on public.reported_streams for select
    using (true);

create policy "Allow internal delete access"
    on public.reported_streams for delete
    using (true);

-- Add index for faster sorting by date
create index if not exists reported_streams_created_at_idx on public.reported_streams (created_at desc);

-- Grant permissions
grant all on public.reported_streams to postgres;
grant all on public.reported_streams to service_role;
grant insert, select on public.reported_streams to anon;
grant insert, select on public.reported_streams to authenticated;
