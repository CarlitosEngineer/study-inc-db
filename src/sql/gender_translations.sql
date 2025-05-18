-- Table: public.gender_translations

-- DROP TABLE IF EXISTS public.gender_translations;

CREATE TABLE IF NOT EXISTS public.gender_translations
(
    id integer NOT NULL DEFAULT nextval('gender_translations_id_seq'::regclass),
    gender_id boolean NOT NULL,
    language_id integer NOT NULL,
    translated_name text COLLATE pg_catalog."default" NOT NULL,
    translated_name1 character(1) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT gender_translations_pkey PRIMARY KEY (id),
    CONSTRAINT gender_language_unique UNIQUE (gender_id, language_id),
    CONSTRAINT fk_gender FOREIGN KEY (gender_id)
        REFERENCES public.genders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_language FOREIGN KEY (language_id)
        REFERENCES public.languages (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gender_translations
    OWNER to postgres;

COMMENT ON TABLE public.gender_translations
    IS 'Tabla que almacena las traducciones de los géneros según el idioma, enlazando con genders e idiomas.';

COMMENT ON COLUMN public.gender_translations.id
    IS 'Identificador único de la traducción.';

COMMENT ON COLUMN public.gender_translations.gender_id
    IS 'Referencia al género original en la tabla genders.';

COMMENT ON COLUMN public.gender_translations.language_id
    IS 'Referencia al idioma de la traducción en la tabla languages.';

COMMENT ON COLUMN public.gender_translations.translated_name
    IS 'Nombre del género traducido (ej: "masculino", "femenino").';

COMMENT ON COLUMN public.gender_translations.translated_name1
    IS 'Carácter representativo traducido (ej: "H", "M").';