


ALTER TABLE public.languages
ADD CONSTRAINT languages_name_code2_unique UNIQUE (name_code2);

ALTER TABLE public.languages
ADD CONSTRAINT languages_name_code3_unique UNIQUE (name_code3);

ALTER TABLE public.languages
ADD CONSTRAINT name_unique UNIQUE (name);






    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    name_code2 character(2) COLLATE pg_catalog."default" NOT NULL,
    name_code3 character(3) COLLATE pg_catalog."default" NOT NULL,