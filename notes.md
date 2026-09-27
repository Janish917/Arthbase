Q: Why do we need a separate table for account IDs (why unique ID matters)?
A: Every account needs its own number so nothing else gets confused. If two people have the same name, the computer can't tell them apart by name — but the ID number is always different, so it always knows exactly which account you mean.

Q: Why can't audit_log just be extra columns added to transactions?
A: Because they track two different things. transactions = "a transfer happened." audit_log = "here's proof of what the balance was before and after." Mixing them in one table makes it messy and harder to trust as a clean record.

Q: What is a foreign key (the Ref line)?
A: It's a rule that says "this number in one table must match a real number in another table." Example: from_account in transactions must match a real account_id in accounts. Without this rule, you could accidentally put in a fake account number and the database wouldn't stop you.

Q: Why did we add [not null] to from_account and to_account?
A: Because a transfer without knowing where the money came from or went to makes no sense. This rule blocks anyone from saving a transaction with a missing account.

Q: What does the "action" column in audit_log mean?
A: It just says what type of thing happened — like "transfer," "deposit," or "withdrawal." Without it, you'd see a balance changed but not know why.

Q: Why is audit_log "many" and transactions "one" in their relationship?
A: Because one transaction could get more than one audit entry over time (like the original transfer, and later a correction). But each audit entry only ever points back to one single transaction.
