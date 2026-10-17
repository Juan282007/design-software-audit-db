/*
===============================================================================
 Archivo      : 001_create_audit_record_indexes.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tabla        : audit.audit_record
 Descripción  : Crea los índices definidos para optimizar las consultas sobre
                la tabla audit.audit_record.

 Justificación
 ------------------------------------------------------------------------------
 Los índices implementados corresponden únicamente a los definidos en el modelo
 de datos del audit-service.

 Nota
 ------------------------------------------------------------------------------
 El índice sobre event_id NO se crea en este script, ya que la restricción
 UNIQUE (uq_audit_record_event_id) definida en la tabla genera automáticamente
 un índice único en PostgreSQL.

 El nombre del índice no se califica con el esquema porque PostgreSQL no lo
 permite en CREATE INDEX: el índice se crea siempre en el mismo esquema de la
 tabla indexada, en este caso 'audit'.

 Fuentes de verdad:
 - data-model.md
===============================================================================
*/

------------------------------------------------------------------------------
-- Índice por tipo de evento
------------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_audit_record_event_type
    ON audit.audit_record (event_type);

------------------------------------------------------------------------------
-- Índice por servicio origen
------------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_audit_record_source_service
    ON audit.audit_record (source_service);

------------------------------------------------------------------------------
-- Índice compuesto para consultas por actor y fecha de recepción
------------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_audit_record_actor_received_at
    ON audit.audit_record (actor_id, received_at);

------------------------------------------------------------------------------
-- Índice por entidad afectada
------------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_audit_record_entity_id
    ON audit.audit_record (entity_id);

------------------------------------------------------------------------------
-- Índice por fecha de ocurrencia del evento
------------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_audit_record_event_occurred_at
    ON audit.audit_record (event_occurred_at);