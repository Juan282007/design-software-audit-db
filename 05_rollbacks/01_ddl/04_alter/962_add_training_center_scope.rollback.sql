DROP INDEX IF EXISTS audit.ix_audit_record_training_center_received_at;

ALTER TABLE audit.audit_record
    DROP COLUMN IF EXISTS training_center_id;
