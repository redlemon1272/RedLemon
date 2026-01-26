-- Try 3: Create User Library Table (Ref public.users)
CREATE TABLE IF NOT EXISTS public.user_library (
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    item_id TEXT NOT NULL,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    poster_url TEXT,
    year TEXT,
    media_meta JSONB DEFAULT '{}'::jsonb,
    added_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_id, item_id)
);

ALTER TABLE public.user_library ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view their own library" ON public.user_library;
DROP POLICY IF EXISTS "Users can insert their own library items" ON public.user_library;
DROP POLICY IF EXISTS "Users can update their own library items" ON public.user_library;
DROP POLICY IF EXISTS "Users can delete their own library items" ON public.user_library;

CREATE POLICY "Users can view their own library"
    ON public.user_library FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own library items"
    ON public.user_library FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own library items"
    ON public.user_library FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own library items"
    ON public.user_library FOR DELETE
    USING (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_library_user_added ON public.user_library(user_id, added_at DESC);
