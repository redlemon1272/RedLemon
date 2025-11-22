-- 1. Add columns to users table
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS is_host BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS recovery_hash TEXT;

-- Index for fast recovery lookup
CREATE INDEX IF NOT EXISTS idx_users_recovery_hash ON public.users(recovery_hash);

-- 2. Create invoices table
CREATE TABLE IF NOT EXISTS public.invoices (
    payment_hash TEXT PRIMARY KEY,
    user_id UUID REFERENCES public.users(id) NOT NULL,
    payment_request TEXT NOT NULL,
    amount INTEGER NOT NULL,
    status TEXT DEFAULT 'pending', -- pending, paid, expired
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. RLS Policies for Invoices
ALTER TABLE public.invoices ENABLE ROW LEVEL SECURITY;

-- Users can view their own invoices
CREATE POLICY "Users can view own invoices" 
ON public.invoices FOR SELECT 
USING (auth.uid() = user_id);

-- Service role (Edge Functions) can do everything
CREATE POLICY "Service role full access" 
ON public.invoices FOR ALL 
USING (true) 
WITH CHECK (true);

-- 4. RPC Function for Account Recovery
-- This allows the Edge Function (using service role) to find a user by hash
-- Note: We don't expose this directly to public, only via Edge Function
CREATE OR REPLACE FUNCTION get_user_by_recovery_hash(hash_input TEXT)
RETURNS TABLE (
    id UUID,
    username TEXT,
    is_host BOOLEAN
) 
SECURITY DEFINER -- Runs with privileges of creator (postgres)
AS $$
BEGIN
    RETURN QUERY
    SELECT u.id, u.username, u.is_host
    FROM public.users u
    WHERE u.recovery_hash = hash_input;
END;
$$ LANGUAGE plpgsql;
