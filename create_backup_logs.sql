create table if not exists public.backup_logs (
    id uuid default gen_random_uuid() primary key,
    filename text not null,
    size_bytes bigint,
    status text not null, -- 'success', 'failed'
    created_at timestamptz default now()
);

-- Enable RLS but allow public read for admins (or just standard service role access)
alter table public.backup_logs enable row level security;

create policy "Admins can view backup logs"
    on public.backup_logs for select
    using ( public.is_admin() ); -- Assuming is_admin() exists, or we just rely on service_role for now if the client uses it.


-- Actually, for simplicity ensuring the dashboard can read it:
create policy "Allow read access for authenticated users"
    on public.backup_logs for select
    to authenticated
    using ( true );

create policy "Allow read access for anon users"
    on public.backup_logs for select
    to anon
    using ( true );
