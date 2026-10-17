/*
===============================================================================
 Archivo      : 003_grant_audit_admin_permissions.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_admin
 Descripción  : Concede privilegios administrativos sobre los objetos del
                audit-service.

 Justificación
 ------------------------------------------------------------------------------
 El rol audit_admin está destinado a tareas técnicas de administración,
 mantenimiento y ejecución de migraciones sobre la base de datos.

 Este rol no representa un componente funcional del sistema.

===============================================================================
*/

GRANT ALL PRIVILEGES
ON TABLE audit.audit_record
TO audit_admin;

GRANT USAGE
ON SCHEMA audit
TO audit_admin;