/*
===============================================================================
 Archivo      : 003_create_audit_admin_role.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_admin
 Descripción  : Crea el rol administrativo del audit-service.

 Justificación
 ------------------------------------------------------------------------------
 Este rol está destinado a tareas de administración de la base de datos,
 migraciones y mantenimiento de los objetos pertenecientes al audit-service.

 No representa un componente funcional del sistema, sino un rol técnico para la
 administración del esquema.

 Nota
 ------------------------------------------------------------------------------
 El rol se crea como NOLOGIN para favorecer un modelo de seguridad basado en
 herencia de roles y principio de mínimo privilegio.

===============================================================================
*/

CREATE ROLE audit_admin
NOLOGIN;