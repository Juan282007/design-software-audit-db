/*
===============================================================================
 Archivo      : 002_grant_audit_writer_permissions.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_writer
 Descripción  : Concede los permisos requeridos por el audit-worker para
                registrar eventos de auditoría.

 Justificación
 ------------------------------------------------------------------------------
 Las fuentes de verdad establecen que el audit-worker es el único componente
 encargado de persistir registros de auditoría.

 Por esta razón, únicamente se concede el privilegio INSERT sobre la tabla
 audit_record.

===============================================================================
*/

GRANT USAGE
ON SCHEMA audit
TO audit_writer;

GRANT INSERT
ON TABLE audit.audit_record
TO audit_writer;