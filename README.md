# Arthbase

A PostgreSQL-based banking ledger system demonstrating ACID transactions, concurrency control, and trigger-based audit logging.

## Tech Stack
- PostgreSQL (hosted on Neon)
- DBML (dbdiagram.io) for schema design and planning

## Schema

**accounts** — stores account holders and their current balance.

**transactions** — records every transfer attempt between two accounts, with foreign keys linking back to `accounts`.

**audit_log** — tracks the before/after balance for every transaction, in its own table separate from `transactions`, since audit trails shouldn't live inside the record they're auditing — a transaction row represents an event, while an audit entry represents proof of what changed because of it.

## Progress
- Schema designed and diagrammed (see `schema.dbml`)
- All three tables built in PostgreSQL with primary keys and foreign key constraints (see `schema.sql`)
- Foreign key constraints tested — confirmed Postgres rejects transactions referencing non-existent accounts

## Coming Next
- Core transfer logic (atomic transactions)
- Trigger-based audit logging
- Concurrency testing
