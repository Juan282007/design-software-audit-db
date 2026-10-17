-- HU-AUD-001: projection used exclusively for authorization scope and queries.
-- It is nullable: global events and events without an established center remain NULL.
ALTER TABLE audit.audit_record
    ADD COLUMN training_center_id UUID NULL;

CREATE INDEX ix_audit_record_training_center_received_at
    ON audit.audit_record (training_center_id, received_at);
