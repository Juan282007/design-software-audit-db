/*
===============================================================================
 Archivo      : 001_grant_audit_reader_permissions.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_reader
 Descripción  : Concede permisos de solo lectura sobre la información de
                auditoría.

 Justificación
 ------------------------------------------------------------------------------
 El rol audit_reader está destinado exclusivamente a la consulta de registros
 de auditoría. No debe poseer privilegios de modificación sobre los datos.

 Este diseño implementa el principio de mínimo privilegio y preserva el carácter
 inmutable de la tabla audit_record.

===============================================================================
*/

GRANT USAGE
ON SCHEMA audit
TO audit_reader;

GRANT SELECT
ON TABLE audit.audit_record
TO audit_reader;