/*
===============================================================================
 Archivo      : 002_create_audit_writer_role.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_writer
 Descripción  : Crea el rol utilizado por el audit-worker para registrar
                eventos de auditoría.

 Justificación
 ------------------------------------------------------------------------------
 La documentación establece que el audit-worker es el único componente encargado
 de persistir eventos en la tabla audit_record.

 Este rol será utilizado posteriormente para conceder únicamente los permisos
 necesarios para realizar operaciones de inserción.

 Nota
 ------------------------------------------------------------------------------
 El rol se crea como NOLOGIN para desacoplar la autenticación de la asignación
 de permisos.

===============================================================================
*/

CREATE ROLE audit_writer
NOLOGIN;