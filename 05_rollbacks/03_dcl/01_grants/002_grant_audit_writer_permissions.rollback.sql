REVOKE INSERT
ON TABLE audit.audit_record
FROM audit_writer;

REVOKE USAGE
ON SCHEMA audit
FROM audit_writer;