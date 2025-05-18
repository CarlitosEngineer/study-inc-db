-- Table: public.word_translations

-- DROP TABLE IF EXISTS public.word_translations;

CREATE TABLE IF NOT EXISTS public.word_translations
(
    id integer NOT NULL DEFAULT nextval('word_translations_id_seq'::regclass),
    language_id integer NOT NULL,
    word_write text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT word_translations_pkey PRIMARY KEY (id),
    CONSTRAINT word_unique_per_language UNIQUE (language_id, word_write),
    CONSTRAINT word_translations_language_id_fkey FOREIGN KEY (language_id)
        REFERENCES public.languages (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.word_translations
    OWNER to postgres;