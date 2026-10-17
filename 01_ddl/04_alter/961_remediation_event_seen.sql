-- R3 (2026-08-06): preserva la unicidad GLOBAL de event_id (idempotencia at-least-once).
-- Como audit_record quedó particionada (UNIQUE per-partición), se agrega esta tabla NO
-- particionada con PK(event_id): el audit-worker inserta aquí primero (ON CONFLICT DO NOTHING)
-- para deduplicar globalmente. Changeset NUEVO (remediation-audit-961).
CREATE TABLE audit.audit_event_seen (
    event_id    UUID PRIMARY KEY,
    received_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
