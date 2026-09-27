CREATE TABLE accounts (
  account_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  owner_name VARCHAR(100),
  balance DECIMAL(12,2),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE transactions (
  txn_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  from_account INT NOT NULL REFERENCES accounts(account_id),
  to_account INT NOT NULL REFERENCES accounts(account_id),
  amount DECIMAL(12,2),
  status VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE audit_log (
  log_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  txn_id INT NOT NULL REFERENCES transactions(txn_id),
  action VARCHAR(20),
  old_balance DECIMAL(12,2),
  new_balance DECIMAL(12,2),
  logged_at TIMESTAMP DEFAULT NOW()
);