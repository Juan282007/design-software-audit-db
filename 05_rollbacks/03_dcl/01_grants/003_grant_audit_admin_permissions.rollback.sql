REVOKE ALL PRIVILEGES
ON TABLE audit.audit_record
FROM audit_admin;

REVOKE USAGE
ON SCHEMA audit
FROM audit_admin;