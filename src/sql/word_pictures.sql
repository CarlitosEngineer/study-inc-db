-- Table: public.word_pictures

-- DROP TABLE IF EXISTS public.word_pictures;

CREATE TABLE IF NOT EXISTS public.word_pictures
(
    id integer NOT NULL DEFAULT nextval('word_pictures_id_seq'::regclass),
    image_url_real text COLLATE pg_catalog."default",
    image_url_anim text COLLATE pg_catalog."default",
    image_url_ia text COLLATE pg_catalog."default",
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT word_pictures_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.word_pictures
    OWNER to postgres;