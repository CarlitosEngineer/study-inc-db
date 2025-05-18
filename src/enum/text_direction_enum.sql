-- Type: text_direction_enum

-- DROP TYPE IF EXISTS public.text_direction_enum;

CREATE TYPE public.text_direction_enum AS ENUM
    ('LTR', 'RTL');

ALTER TYPE public.text_direction_enum
    OWNER TO postgres;

COMMENT ON TYPE public.text_direction_enum
    IS 'Dirección del texto: Left-To-Right (LTR) o Right-To-Left (RTL).';
