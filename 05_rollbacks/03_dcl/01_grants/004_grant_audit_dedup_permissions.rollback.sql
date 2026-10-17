REVOKE INSERT ON TABLE audit.audit_event_seen FROM audit_writer;
REVOKE ALL PRIVILEGES ON TABLE audit.audit_event_seen FROM audit_admin;
