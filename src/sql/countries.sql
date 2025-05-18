-- Table: public.countries

-- DROP TABLE IF EXISTS public.countries;

CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL DEFAULT nextval('countries_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    name2 character(2) COLLATE pg_catalog."default" NOT NULL,
    name3 character(3) COLLATE pg_catalog."default" NOT NULL,
    num_code character(3) COLLATE pg_catalog."default",
    phone_code character varying(4) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT countries_pkey PRIMARY KEY (id),
    CONSTRAINT countries_name_code2_key UNIQUE (name2),
    CONSTRAINT countries_name_code3_key UNIQUE (name3),
    CONSTRAINT countries_name_key UNIQUE (name),
    CONSTRAINT countries_num_code_key UNIQUE (num_code),
    CONSTRAINT countries_name_code2_check CHECK (char_length(name2) = 2),
    CONSTRAINT countries_name_code3_check CHECK (char_length(name3) = 3),
    CONSTRAINT countries_num_code_check CHECK (char_length(num_code) = 3)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.countries
    OWNER to postgres;

COMMENT ON TABLE public.countries
    IS 'Tabla que almacena la información de países disponibles en la aplicación.';

COMMENT ON COLUMN public.countries.id
    IS 'Identificador único del país (clave primaria).';

COMMENT ON COLUMN public.countries.name
    IS 'Nombre completo del país (único).';

COMMENT ON COLUMN public.countries.name2
    IS 'Código ISO de 2 letras (ej. "US", "MX").';

COMMENT ON COLUMN public.countries.name3
    IS 'Código ISO de 3 letras (ej. "USA", "MEX").';

COMMENT ON COLUMN public.countries.num_code
    IS 'Código numérico de 3 dígitos del país (único).';

COMMENT ON COLUMN public.countries.phone_code
    IS 'Código telefónico del país (ej. "1" para EE.UU., "52" para México).';

COMMENT ON COLUMN public.countries.is_active
    IS 'Indica si el país está activo (true) o inactivo (false).';

COMMENT ON COLUMN public.countries.created_at
    IS 'Fecha y hora de creación del registro.';

COMMENT ON COLUMN public.countries.updated_at
    IS 'Fecha y hora de la última actualización del registro.';
COMMENT ON CONSTRAINT countries_pkey ON public.countries
    IS 'Clave primaria basada en la columna id.';

COMMENT ON CONSTRAINT countries_name_code2_key ON public.countries
    IS 'Restricción de unicidad sobre el código ISO de 2 letras.';
COMMENT ON CONSTRAINT countries_name_code3_key ON public.countries
    IS 'Restricción de unicidad sobre el código ISO de 3 letras.';
COMMENT ON CONSTRAINT countries_name_key ON public.countries
    IS 'Restricción de unicidad sobre el nombre del país.';
COMMENT ON CONSTRAINT countries_num_code_key ON public.countries
    IS 'Restricción de unicidad sobre el código numérico de 3 dígitos.';

COMMENT ON CONSTRAINT countries_name_code2_check ON public.countries
    IS 'Verifica que name_code2 tenga exactamente 2 caracteres.';
COMMENT ON CONSTRAINT countries_name_code3_check ON public.countries
    IS 'Verifica que name_code3 tenga exactamente 3 caracteres.';
COMMENT ON CONSTRAINT countries_num_code_check ON public.countries
    IS 'Verifica que num_code tenga exactamente 3 caracteres.';

-- Trigger: trigger_countries_refresh_column_updated_at

-- DROP TRIGGER IF EXISTS trigger_countries_refresh_column_updated_at ON public.countries;

CREATE OR REPLACE TRIGGER trigger_countries_refresh_column_updated_at
    BEFORE UPDATE 
    ON public.countries
    FOR EACH ROW
    EXECUTE FUNCTION public.refresh_column_updated_at();

COMMENT ON TRIGGER trigger_countries_refresh_column_updated_at ON public.countries
    IS 'Trigger que actualiza automáticamente la columna updated_at antes de cualquier UPDATE.';