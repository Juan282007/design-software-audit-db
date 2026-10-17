/*
===============================================================================
 Archivo      : 001_create_audit_record_table.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tabla        : audit.audit_record
 Descripción  : Crea la tabla principal para el almacenamiento inmutable de
                eventos de auditoría.

 Justificación
 ------------------------------------------------------------------------------
 La tabla audit.audit_record constituye el único modelo persistente definido para
 el audit-service. Su propósito es almacenar de forma íntegra e inmutable cada
 evento consumido por el audit-worker.

 La estructura de la tabla se encuentra definida en las fuentes de verdad del
 proyecto.

 La tabla reside en el esquema propio 'audit' para preservar el aislamiento
 entre microservicios dentro de la base de datos compartida.

 Fuentes de verdad:
 - data-model.md
 - events.md
===============================================================================
*/

CREATE TABLE IF NOT EXISTS audit.audit_record
(
    id                  UUID            NOT NULL,
    event_id            UUID            NOT NULL,
    event_type          VARCHAR(100)    NOT NULL,
    source_service      VARCHAR(50)     NOT NULL,
    actor_id            UUID            NULL,
    entity_type         VARCHAR(50)     NULL,
    entity_id           UUID            NULL,
    payload             JSONB           NOT NULL,
    event_occurred_at   TIMESTAMPTZ     NULL,
    received_at         TIMESTAMPTZ     NOT NULL,

    CONSTRAINT pk_audit_record
        PRIMARY KEY (id),

    CONSTRAINT uq_audit_record_event_id
        UNIQUE (event_id)
);