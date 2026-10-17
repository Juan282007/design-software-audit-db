-- Rollback de remediation-audit-960 (particionada -> tabla simple, PK(id), UNIQUE(event_id) global, idx_)
DROP TABLE audit.audit_record CASCADE;
CREATE TABLE audit.audit_record (
    id                UUID NOT NULL DEFAULT gen_random_uuid(),
    event_id          UUID NOT NULL,
    event_type        VARCHAR(100) NOT NULL,
    source_service    VARCHAR(50) NOT NULL,
    actor_id          UUID,
    entity_type       VARCHAR(50),
    entity_id         UUID,
    payload           JSONB NOT NULL,
    event_occurred_at TIMESTAMPTZ,
    received_at       TIMESTAMPTZ NOT NULL,
    CONSTRAINT pk_audit_record PRIMARY KEY (id),
    CONSTRAINT uq_audit_record_event_id UNIQUE (event_id)
);
CREATE INDEX idx_audit_record_event_type ON audit.audit_record (event_type);
CREATE INDEX idx_audit_record_source_service ON audit.audit_record (source_service);
CREATE INDEX idx_audit_record_actor_received_at ON audit.audit_record (actor_id, received_at);
CREATE INDEX idx_audit_record_entity_id ON audit.audit_record (entity_id);
CREATE INDEX idx_audit_record_event_occurred_at ON audit.audit_record (event_occurred_at);
