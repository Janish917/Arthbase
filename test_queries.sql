-- Test: transfer 278 from account 3 to account 1
SELECT transfer_funds(1, 3, 278);

-- Verify balances updated correctly
SELECT * FROM accounts;

-- Verify most recent transaction was logged
SELECT * FROM transactions ORDER BY txn_id DESC LIMIT 1;

-- Verify last 5 transactions (used to trace repeated test calls)
SELECT * FROM transactions ORDER BY txn_id DESC LIMIT 5;