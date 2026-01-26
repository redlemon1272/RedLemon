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

-- Grant access to anon (since we verify signature inside)
GRANT EXECUTE ON FUNCTION public.upsert_watch_history_item(jsonb) TO anon;
GRANT EXECUTE ON FUNCTION public.upsert_watch_history_item(jsonb) TO authenticated;
GRANT EXECUTE ON FUNCTION public.upsert_watch_history_item(jsonb) TO service_role;
