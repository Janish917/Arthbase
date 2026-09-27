SESSION 1:

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

SESSION 2:

Q: What does REFERENCES actually do, and what did the test prove?
A: REFERENCES ties a column to another table's primary key, so the database enforces that the value must actually exist there. When I tried inserting a transaction with a fake account number (999), Postgres rejected it — proof the constraint was real, not just written on paper.

Q: What's the difference between the SQL Editor text box and the actual database?
A: The text box is just a place to type — nothing happens until I click Run. Once I click Run, that action is done and saved in the database immediately. Deleting the text afterward doesn't undo it, since the database and the editor box are two separate things.

SESSION 3:

Q: What does JOIN actually do?
A: It connects two separate tables together in one query, using a shared column between them — in this case, from_account in transactions matching account_id in accounts.

Q: Why couldn't a plain SELECT on transactions alone show what I needed?
A: Because transactions only stores account numbers (1, 2, 3...), not names. Without JOIN, I'd only see raw numbers — JOIN pulls in owner_name from accounts so I can see who the transaction actually belongs to.
