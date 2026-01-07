-- Create blocked_streams table
CREATE TABLE IF NOT EXISTS public.blocked_streams (
    stream_hash TEXT PRIMARY KEY,
    filename TEXT,
    provider TEXT,
    reason TEXT,
    blocked_by UUID,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS
ALTER TABLE public.blocked_streams ENABLE ROW LEVEL SECURITY;

-- Policies

-- Drop existing policies if they exist (for updates)
DROP POLICY IF EXISTS "Public Read Blocked Streams" ON public.blocked_streams;
DROP POLICY IF EXISTS "Authenticated Insert Blocked Streams" ON public.blocked_streams;
DROP POLICY IF EXISTS "Authenticated Delete Blocked Streams" ON public.blocked_streams;
DROP POLICY IF EXISTS "Public Insert Blocked Streams" ON public.blocked_streams;
DROP POLICY IF EXISTS "Public Delete Blocked Streams" ON public.blocked_streams;


-- Public Read (Anyone can check)
CREATE POLICY "Public Read Blocked Streams"
ON public.blocked_streams
FOR SELECT
USING (true);

-- Public Insert (Allow anon admins to block - Self-hosted mode)
-- Since auth.users is empty, users are 'anon'. We rely on client-side admin checks or upstream protection.
CREATE POLICY "Public Insert Blocked Streams"
ON public.blocked_streams
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

-- Public Delete (Unblock)
CREATE POLICY "Public Delete Blocked Streams"
ON public.blocked_streams
FOR DELETE
TO anon, authenticated
USING (true);

-- Realtime
ALTER PUBLICATION supabase_realtime ADD TABLE public.blocked_streams;
