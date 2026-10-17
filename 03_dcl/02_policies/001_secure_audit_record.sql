/*
===============================================================================
 Archivo      : 001_secure_audit_record.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Tipo         : DCL
 Objeto       : audit.audit_record
 Descripción  : Refuerza la seguridad de la tabla audit.audit_record eliminando
                operaciones que comprometan la inmutabilidad del registro de
                auditoría.

 Justificación
 ------------------------------------------------------------------------------
 Las fuentes de verdad establecen que la tabla audit.audit_record debe operar bajo
 el principio Append-Only, permitiendo únicamente la inserción de nuevos eventos.

 Para garantizar este comportamiento a nivel de base de datos, se revocan los
 privilegios de UPDATE, DELETE y TRUNCATE del rol PUBLIC.

 Esta configuración complementa el modelo de seguridad basado en roles y evita
 modificaciones accidentales sobre la información de auditoría.

 Fuentes de verdad:
 - README.md
 - data-model.md
===============================================================================
*/

REVOKE UPDATE
ON TABLE audit.audit_record
FROM PUBLIC;

REVOKE DELETE
ON TABLE audit.audit_record
FROM PUBLIC;

REVOKE TRUNCATE
ON TABLE audit.audit_record
FROM PUBLIC;