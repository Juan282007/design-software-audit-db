REVOKE SELECT
ON TABLE audit.audit_record
FROM audit_reader;

REVOKE USAGE
ON SCHEMA audit
FROM audit_reader;