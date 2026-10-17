-- PostgreSQL requires SELECT when INSERT uses ON CONFLICT for idempotency.
GRANT SELECT ON TABLE audit.audit_event_seen TO audit_writer;
