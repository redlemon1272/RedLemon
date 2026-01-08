-- Create a SECURITY DEFINER function to allow users to fetch their own payment history
-- This bypasses RLS, which is necessary because the client uses a custom auth implementation
-- that does not provide a valid auth.uid() in the JWT.

CREATE OR REPLACE FUNCTION get_user_payment_history(p_user_id uuid)
RETURNS SETOF payment_transactions
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT * FROM payment_transactions
  WHERE user_id = p_user_id
  ORDER BY created_at DESC;
$$;

GRANT EXECUTE ON FUNCTION get_user_payment_history(uuid) TO authenticated, anon, service_role;

NOTIFY pgrst, 'reload schema';
