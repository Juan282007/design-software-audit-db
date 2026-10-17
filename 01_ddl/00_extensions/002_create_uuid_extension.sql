/*
===============================================================================
 Archivo      : 002_create_uuid_extension.sql
 Módulo       : audit-service
 Componente   : Base de Datos
 Descripción  : Habilita la extensión uuid-ossp.

 Justificación
 ------------------------------------------------------------------------------
 Proporciona las funciones uuid_generate_v1(), uuid_generate_v3(),
 uuid_generate_v4() y uuid_generate_v5() para la generación de
 identificadores UUID.

 Nota
 ------------------------------------------------------------------------------
 La documentación fuente del proyecto no requiere actualmente esta extensión.
 Su instalación corresponde a una decisión arquitectónica para disponer de
 mecanismos adicionales de generación de UUID en futuras evoluciones del
 servicio.
===============================================================================
*/

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";