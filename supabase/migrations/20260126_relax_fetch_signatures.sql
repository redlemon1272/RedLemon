-- Relax security on FETCH functions to allow viewing friends' profiles
-- We remove verify_user_signature since these are read-only and we essentially allow public profiles for now.

CREATE OR REPLACE FUNCTION public.fetch_user_library(p_user_id uuid)
RETURNS SETOF public.user_library
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- No signature check needed for reading (allows traversing friend graphs)
    RETURN QUERY
    SELECT * FROM public.user_library
    WHERE user_id = p_user_id
    ORDER BY added_at DESC;
END;
$$;

CREATE OR REPLACE FUNCTION public.fetch_user_watch_history(p_user_id uuid)
RETURNS SETOF public.user_watch_history
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- No signature check needed for reading
    RETURN QUERY
    SELECT * FROM public.user_watch_history
    WHERE user_id = p_user_id
    ORDER BY last_watched DESC;
END;
$$;
