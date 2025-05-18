-- Table: public.word_cards

-- DROP TABLE IF EXISTS public.word_cards;

CREATE TABLE IF NOT EXISTS public.word_cards
(
    id integer NOT NULL DEFAULT nextval('word_cards_id_seq'::regclass),
    word_translation_id integer NOT NULL,
    word_picture_id integer NOT NULL,
    category_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT word_cards_pkey PRIMARY KEY (id),
    CONSTRAINT card_unique_combination UNIQUE (word_translation_id, word_picture_id, category_id),
    CONSTRAINT word_cards_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE SET NULL,
    CONSTRAINT word_cards_word_picture_id_fkey FOREIGN KEY (word_picture_id)
        REFERENCES public.word_pictures (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT word_cards_word_translation_id_fkey FOREIGN KEY (word_translation_id)
        REFERENCES public.word_translations (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.word_cards
    OWNER to postgres;