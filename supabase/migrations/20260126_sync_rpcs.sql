-- Secure RPC for History Sync
CREATE OR REPLACE FUNCTION public.upsert_watch_history_item(payload jsonb)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_user_id uuid;
BEGIN
    v_user_id := (payload->>'user_id')::uuid;

    -- Verify Signature (Path must match client call: /rpc/upsert_watch_history_item)
    PERFORM verify_user_signature(v_user_id, '/rpc/upsert_watch_history_item');

    -- Perform Upsert
    INSERT INTO public.user_watch_history (
        user_id, media_id, title, media_type, poster_url, 
        timestamp, duration, progress, last_watched, 
        season, episode, media_meta
    ) VALUES (
        v_user_id,
        payload->>'media_id',
        payload->>'title',
        payload->>'media_type',
        payload->>'poster_url',
        (payload->>'timestamp')::float8,
        (payload->>'duration')::float8,
        (payload->>'progress')::float8,
        (payload->>'last_watched')::timestamptz,
        (payload->>'season')::int,
        (payload->>'episode')::int,
        (payload->'media_meta')
    )
    ON CONFLICT (user_id, media_id, season, episode)
    DO UPDATE SET
        timestamp = EXCLUDED.timestamp,
        duration = EXCLUDED.duration,
        progress = EXCLUDED.progress,
        last_watched = EXCLUDED.last_watched,
        media_meta = EXCLUDED.media_meta;
END;
$$;

-- Secure RPC for Library Sync
CREATE OR REPLACE FUNCTION public.upsert_library_item(payload jsonb)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_user_id uuid;
BEGIN
    v_user_id := (payload->>'user_id')::uuid;

    -- Verify Signature (Path must match client call: /rpc/upsert_library_item)
    PERFORM verify_user_signature(v_user_id, '/rpc/upsert_library_item');

    -- Perform Upsert
    INSERT INTO public.user_library (
        user_id, item_id, name, type, poster_url, year, added_at, media_meta
    ) VALUES (
        v_user_id,
        payload->>'item_id',
        payload->>'name',
        payload->>'type',
        payload->>'poster_url',
        payload->>'year',
        (payload->>'added_at')::timestamptz,
        (payload->'media_meta')
    )
    ON CONFLICT (user_id, item_id)
    DO UPDATE SET
        name = EXCLUDED.name,
        type = EXCLUDED.type,
        poster_url = EXCLUDED.poster_url,
        year = EXCLUDED.year,
        added_at = EXCLUDED.added_at,
        media_meta = EXCLUDED.media_meta;
END;
$$;

-- Secure RPC for Fetching Library
CREATE OR REPLACE FUNCTION public.fetch_user_library(p_user_id uuid)
RETURNS SETOF public.user_library
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- Verify Signature
    PERFORM verify_user_signature(p_user_id, '/rpc/fetch_user_library');

    RETURN QUERY
    SELECT * FROM public.user_library
    WHERE user_id = p_user_id
    ORDER BY added_at DESC;
END;
$$;

-- Secure RPC for Fetching Watch History
CREATE OR REPLACE FUNCTION public.fetch_user_watch_history(p_user_id uuid)
RETURNS SETOF public.user_watch_history
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- Verify Signature
    PERFORM verify_user_signature(p_user_id, '/rpc/fetch_user_watch_history');

    RETURN QUERY
    SELECT * FROM public.user_watch_history
    WHERE user_id = p_user_id
    ORDER BY last_watched DESC;
END;
$$;

-- Secure RPC for Deleting Library Item
CREATE OR REPLACE FUNCTION public.delete_user_library_item(p_user_id uuid, p_item_id text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- Verify Signature
    PERFORM verify_user_signature(p_user_id, '/rpc/delete_user_library_item');

    DELETE FROM public.user_library
    WHERE user_id = p_user_id AND item_id = p_item_id;
END;
$$;

-- Grant access to anon
GRANT EXECUTE ON FUNCTION public.upsert_watch_history_item(jsonb) TO anon;
GRANT EXECUTE ON FUNCTION public.upsert_watch_history_item(jsonb) TO authenticated;
GRANT EXECUTE ON FUNCTION public.upsert_library_item(jsonb) TO anon;
GRANT EXECUTE ON FUNCTION public.upsert_library_item(jsonb) TO authenticated;
GRANT EXECUTE ON FUNCTION public.fetch_user_library(uuid) TO anon;
GRANT EXECUTE ON FUNCTION public.fetch_user_library(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.fetch_user_watch_history(uuid) TO anon;
GRANT EXECUTE ON FUNCTION public.fetch_user_watch_history(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.delete_user_library_item(uuid, text) TO anon;
GRANT EXECUTE ON FUNCTION public.delete_user_library_item(uuid, text) TO authenticated;
