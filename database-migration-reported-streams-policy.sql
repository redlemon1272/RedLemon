-- Migration: Allow UPDATE on reported_streams
-- Date: 2025-12-16
-- Description: The original migration missed the UPDATE policy, causing admin title auto-resolution to fail silently (RLS block).

create policy "Allow internal update access"
    on public.reported_streams for update
    using (true)
    with check (true);

-- Grant update permission just in case
grant update on public.reported_streams to anon;
grant update on public.reported_streams to authenticated;
