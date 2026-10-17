/*
===============================================================================
 Archivo      : 001_create_audit_reader_role.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Rol          : audit_reader
 Descripción  : Crea el rol de solo lectura para la consulta de registros de
                auditoría.

 Justificación
 ------------------------------------------------------------------------------
 El modelo de seguridad del audit-service requiere un rol destinado
 exclusivamente a la consulta de información de auditoría, sin capacidad para
 modificar los datos almacenados.

 Este rol será utilizado posteriormente para asignar permisos de lectura sobre
 la tabla audit_record.

 Nota
 ------------------------------------------------------------------------------
 El rol se crea como NOLOGIN, ya que representa un conjunto de permisos y no un
 usuario de conexión. Los usuarios de base de datos heredarán este rol mediante
 la instrucción GRANT.

===============================================================================
*/

CREATE ROLE audit_reader
NOLOGIN;