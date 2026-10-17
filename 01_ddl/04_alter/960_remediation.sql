-- R3 (2026-08-06): audit_record -> tabla PARTICIONADA por RANGE mensual de received_at,
-- y renombrado de índices idx_ -> ix_ (T-H). Changeset NUEVO (remediation-audit-960).
-- Tabla vacía; nada la referencia por FK; sin vistas dependientes.
-- La PK y el UNIQUE deben incluir la clave de partición (received_at). Ver nota de diseño en data-model.
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
    CONSTRAINT pk_audit_record PRIMARY KEY (id, received_at),
    CONSTRAINT uq_audit_record_event_id UNIQUE (event_id, received_at)
) PARTITION BY RANGE (received_at);
CREATE TABLE audit.audit_record_default PARTITION OF audit.audit_record DEFAULT;
CREATE TABLE audit.audit_record_2026_08 PARTITION OF audit.audit_record FOR VALUES FROM ('2026-08-01') TO ('2026-09-01');
CREATE INDEX ix_audit_record_event_type ON audit.audit_record (event_type);
CREATE INDEX ix_audit_record_source_service ON audit.audit_record (source_service);
CREATE INDEX ix_audit_record_actor_received_at ON audit.audit_record (actor_id, received_at);
CREATE INDEX ix_audit_record_entity_id ON audit.audit_record (entity_id);
CREATE INDEX ix_audit_record_event_occurred_at ON audit.audit_record (event_occurred_at);
