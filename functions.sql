CREATE OR REPLACE FUNCTION transfer_funds(p_to_account INTEGER, p_from_account INTEGER, p_amount NUMERIC)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account;
  UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account;
  INSERT INTO transactions(from_account, to_account, amount, status)
    VALUES(p_from_account, p_to_account, p_amount, 'Completed');
END;
$$;