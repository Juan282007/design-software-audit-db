/*
===============================================================================
 Archivo      : 001_create_audit_schema.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Esquema      : audit
 Descripción  : Crea el esquema propio del audit-service, contenedor de todos
                los objetos persistentes del módulo de auditoría.

 Justificación
 ------------------------------------------------------------------------------
 El Sistema de Gestión de Horarios SENA utiliza una única base de datos PostgreSQL
 compartida por todos los microservicios. Para garantizar el aislamiento lógico
 entre módulos, cada microservicio debe crear y utilizar su propio esquema.

 El audit-service es el propietario del esquema 'audit'. Ningún objeto del módulo
 debe residir en el esquema 'public', ya que ello rompería el aislamiento entre
 microservicios y expondría los objetos de auditoría al resto del sistema.

 Este script debe ejecutarse antes de la creación de cualquier tabla, índice o
 política del módulo, según el orden definido en 01_ddl/changelog.yaml.

 Nota
 ------------------------------------------------------------------------------
 Se utiliza IF NOT EXISTS para garantizar la idempotencia del changeset en
 ambientes donde el esquema pudiera haber sido creado previamente.

 Fuentes de verdad:
 - README.md
 - data-model.md
===============================================================================
*/

CREATE SCHEMA IF NOT EXISTS audit;
