-- Quality fixes (v2.0.0): id DEFAULT gen_random_uuid() e indices de FK faltantes
ALTER TABLE audit.audit_record ALTER COLUMN id SET DEFAULT gen_random_uuid();
