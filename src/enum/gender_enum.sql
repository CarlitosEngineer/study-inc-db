-- Type: gender_enum

-- DROP TYPE IF EXISTS public.gender_enum;

CREATE TYPE public.gender_enum AS ENUM
    ('0', '1');

ALTER TYPE public.gender_enum
    OWNER TO postgres;
