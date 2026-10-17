-- HU-AUD-001: audit_event_seen is required for global event_id idempotency.
GRANT USAGE ON SCHEMA audit TO audit_writer;
GRANT INSERT ON TABLE audit.audit_event_seen, audit.audit_record TO audit_writer;

-- The administrative role must operate both audit relations.
GRANT USAGE ON SCHEMA audit TO audit_admin;
GRANT ALL PRIVILEGES ON TABLE audit.audit_event_seen, audit.audit_record TO audit_admin;

-- Preserve append-only semantics even if default grants are changed elsewhere.
REVOKE UPDATE, DELETE, TRUNCATE ON TABLE audit.audit_record, audit.audit_event_seen FROM PUBLIC;
