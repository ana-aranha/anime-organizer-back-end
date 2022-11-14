--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: animes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.animes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "animeId" integer NOT NULL,
    "statusId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone
);


--
-- Name: animes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.animes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: animes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.animes_id_seq OWNED BY public.animes.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone
);


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    avatar text NOT NULL,
    email character varying(320) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: animes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animes ALTER COLUMN id SET DEFAULT nextval('public.animes_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: animes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.animes VALUES (1, 1, 21507, 1, '2022-11-11 17:33:26.826863', NULL);
INSERT INTO public.animes VALUES (2, 1, 11061, 2, '2022-11-11 17:33:59.19065', NULL);
INSERT INTO public.animes VALUES (3, 1, 101759, 3, '2022-11-11 17:34:20.668648', NULL);
INSERT INTO public.animes VALUES (5, 1, 20954, 2, '2022-11-11 17:36:32.923469', NULL);
INSERT INTO public.animes VALUES (4, 1, 20464, 4, '2022-11-11 17:34:34.950503', NULL);
INSERT INTO public.animes VALUES (7, 1, 16498, 2, '2022-11-14 10:57:51.302924', NULL);
INSERT INTO public.animes VALUES (8, 1, 16498, 1, '2022-11-14 10:57:56.01465', '2022-11-14 11:00:58.119937');


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.status VALUES (3, 'Dropped', '2022-11-09 19:43:44.57399', NULL);
INSERT INTO public.status VALUES (4, 'Plan to watch', '2022-11-09 19:43:56.303752', NULL);
INSERT INTO public.status VALUES (1, 'Watching', '2022-11-09 19:42:44.427875', NULL);
INSERT INTO public.status VALUES (2, 'Completed', '2022-11-09 19:43:14.594149', NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'KonoDioDa', 'https://pbs.twimg.com/profile_images/1349785257281777667/kuhCnRay_400x400.jpg', 'dio@email.com', 'mudamuda', '2022-11-09 19:40:45.272875', NULL);


--
-- Name: animes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.animes_id_seq', 8, true);


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: animes animes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animes
    ADD CONSTRAINT animes_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: animes animes_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animes
    ADD CONSTRAINT "animes_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.status(id);


--
-- Name: animes animes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.animes
    ADD CONSTRAINT "animes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

