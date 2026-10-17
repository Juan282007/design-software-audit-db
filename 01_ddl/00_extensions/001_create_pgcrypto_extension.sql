/*
===============================================================================
 Archivo      : 001_create_pgcrypto_extension.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Descripción  : Habilita la extensión pgcrypto.

 Justificación
 ------------------------------------------------------------------------------
 Proporciona la función gen_random_uuid(), utilizada para la generación de
 identificadores UUID.

 Fuentes de verdad:
 - runbook.md
===============================================================================
*/

CREATE EXTENSION IF NOT EXISTS pgcrypto;