-- Table: public.languages

-- DROP TABLE IF EXISTS public.languages;

CREATE TABLE IF NOT EXISTS public.languages
(
    id integer NOT NULL DEFAULT nextval('languages_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    name2 character(2) COLLATE pg_catalog."default" NOT NULL,
    name3 character(3) COLLATE pg_catalog."default" NOT NULL,
    direction text_direction_enum NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT languages_pkey PRIMARY KEY (id),
    CONSTRAINT languages_name_code2_unique UNIQUE (name2),
    CONSTRAINT languages_name_code3_unique UNIQUE (name3),
    CONSTRAINT name_unique UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.languages
    OWNER to postgres;

COMMENT ON TABLE public.languages
    IS 'Tabla que almacena los idiomas soportados por la aplicación, incluyendo códigos ISO y dirección de escritura.';

COMMENT ON COLUMN public.languages.id
    IS 'Identificador £nico del idioma (clave primaria).';

COMMENT ON COLUMN public.languages.name
    IS 'Nombre del idioma (Ej: Español, English, Français).';

COMMENT ON COLUMN public.languages.name2
    IS 'Código ISO de 2 letras del idioma (Ej: "es", "en", "fr").';

COMMENT ON COLUMN public.languages.name3
    IS 'Código ISO de 3 letras del idioma (Ej: "spa", "eng", "fra").';

COMMENT ON COLUMN public.languages.direction
    IS 'Dirección del texto: "LTR" (Left to Right) o "RTL" (Right to Left).';

COMMENT ON COLUMN public.languages.is_active
    IS 'Indica si el idioma est  activo (true) o inactivo (false).';

COMMENT ON COLUMN public.languages.created_at
    IS 'Fecha y hora de creaci¢n del registro.';

COMMENT ON COLUMN public.languages.updated_at
    IS 'Fecha y hora de la £ltima modificaci¢n del registro.';
COMMENT ON CONSTRAINT languages_pkey ON public.languages
    IS 'Clave primaria basada en la columna id.';

-- Trigger: trigger_languages_refresh_column_updated_at

-- DROP TRIGGER IF EXISTS trigger_languages_refresh_column_updated_at ON public.languages;

CREATE OR REPLACE TRIGGER trigger_languages_refresh_column_updated_at
    BEFORE UPDATE 
    ON public.languages
    FOR EACH ROW
    EXECUTE FUNCTION public.refresh_column_updated_at();

COMMENT ON TRIGGER trigger_languages_refresh_column_updated_at ON public.languages
    IS 'Trigger que actualiza automáticamente la columna updated_at antes de cualquier UPDATE.';