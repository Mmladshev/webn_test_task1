--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Debian 12.13-1.pgdg110+1)
-- Dumped by pg_dump version 12.13 (Debian 12.13-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.food OWNER TO postgres;

--
-- Name: food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_id_seq OWNER TO postgres;

--
-- Name: food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_id_seq OWNED BY public.food.id;


--
-- Name: liquid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.liquid (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.liquid OWNER TO postgres;

--
-- Name: liquid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.liquid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liquid_id_seq OWNER TO postgres;

--
-- Name: liquid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.liquid_id_seq OWNED BY public.liquid.id;


--
-- Name: food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food ALTER COLUMN id SET DEFAULT nextval('public.food_id_seq'::regclass);


--
-- Name: liquid id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.liquid ALTER COLUMN id SET DEFAULT nextval('public.liquid_id_seq'::regclass);


--
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food (id, name) FROM stdin;
1	burger
2	pizza
3	sushi
4	hotdog
5	taco
\.


--
-- Data for Name: liquid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.liquid (id, name) FROM stdin;
1	juice
2	coffee
3	water
4	tea
5	cola
\.


--
-- Name: food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_id_seq', 1, false);


--
-- Name: liquid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.liquid_id_seq', 1, false);


--
-- Name: food food_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_name_key UNIQUE (name);


--
-- Name: liquid liquid_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.liquid
    ADD CONSTRAINT liquid_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

