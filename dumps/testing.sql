--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: clienttype; Type: TYPE; Schema: public; Owner: hello
--

CREATE TYPE public.clienttype AS ENUM (
    'individ',
    'legal_entitie'
);


ALTER TYPE public.clienttype OWNER TO hello;

--
-- Name: role; Type: TYPE; Schema: public; Owner: hello
--

CREATE TYPE public.role AS ENUM (
    'manager',
    'main_manager',
    'admin'
);


ALTER TYPE public.role OWNER TO hello;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO hello;

--
-- Name: anime; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.anime (
    id character varying NOT NULL,
    name character varying(50) NOT NULL,
    description character varying NOT NULL,
    poster_path character varying NOT NULL
);


ALTER TABLE public.anime OWNER TO hello;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    client_type public.clienttype NOT NULL,
    phone character varying(11) NOT NULL,
    password character varying(60) NOT NULL,
    manager_id integer NOT NULL,
    first_name character varying(50),
    second_name character varying(50),
    email character varying(255),
    city character varying(50),
    address character varying(255),
    organization_name character varying(255),
    inn character varying(10),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public.clients OWNER TO hello;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO hello;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: emailTemplates; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public."emailTemplates" (
    id smallint NOT NULL,
    type smallint NOT NULL,
    title character varying(255) NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public."emailTemplates" OWNER TO hello;

--
-- Name: emailTemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public."emailTemplates_id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."emailTemplates_id_seq" OWNER TO hello;

--
-- Name: emailTemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public."emailTemplates_id_seq" OWNED BY public."emailTemplates".id;


--
-- Name: episodes; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.episodes (
    id integer NOT NULL,
    season_id integer NOT NULL,
    number integer NOT NULL,
    name character varying NOT NULL,
    path character varying NOT NULL
);


ALTER TABLE public.episodes OWNER TO hello;

--
-- Name: episodes_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public.episodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.episodes_id_seq OWNER TO hello;

--
-- Name: episodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public.episodes_id_seq OWNED BY public.episodes.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.managers (
    role public.role NOT NULL,
    first_name character varying(50) NOT NULL,
    second_name character varying(50) NOT NULL,
    phone character varying(11) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.managers OWNER TO hello;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public.managers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.managers_id_seq OWNER TO hello;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public.managers_id_seq OWNED BY public.managers.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    text character varying NOT NULL,
    publish_date timestamp with time zone NOT NULL,
    images character varying[]
);


ALTER TABLE public.news OWNER TO hello;

--
-- Name: newsContents; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public."newsContents" (
    news_id bigint NOT NULL,
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    uri character varying NOT NULL,
    comment character varying(255),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public."newsContents" OWNER TO hello;

--
-- Name: newsContents_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public."newsContents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."newsContents_id_seq" OWNER TO hello;

--
-- Name: newsContents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public."newsContents_id_seq" OWNED BY public."newsContents".id;


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO hello;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: hello
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    anime_id character varying NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.seasons OWNER TO hello;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: hello
--

CREATE SEQUENCE public.seasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seasons_id_seq OWNER TO hello;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hello
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: emailTemplates id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."emailTemplates" ALTER COLUMN id SET DEFAULT nextval('public."emailTemplates_id_seq"'::regclass);


--
-- Name: episodes id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.episodes ALTER COLUMN id SET DEFAULT nextval('public.episodes_id_seq'::regclass);


--
-- Name: managers id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.managers ALTER COLUMN id SET DEFAULT nextval('public.managers_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: newsContents id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."newsContents" ALTER COLUMN id SET DEFAULT nextval('public."newsContents_id_seq"'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public.alembic_version (version_num) VALUES ('fee61c3b066c');


--
-- Data for Name: anime; Type: TABLE DATA; Schema: public; Owner: hello
--



--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public.clients (id, client_type, phone, password, manager_id, first_name, second_name, email, city, address, organization_name, inn, create_date, modify_date) VALUES (4, 'individ', '1', '$2b$12$RvdIgjtAphGXMjGcXY6RG.kC.Th83/bZ3AzjVm.SDUFDPxHgJYeJ.', 1, '1', '1', '1@gmail.com', 'Vladivostok', 'good', NULL, NULL, '2025-04-18 13:51:11.916+00', '2025-05-18 13:51:39.092+00');
INSERT INTO public.clients (id, client_type, phone, password, manager_id, first_name, second_name, email, city, address, organization_name, inn, create_date, modify_date) VALUES (5, 'individ', '79871234567', '$2b$12$nyhbFfOvV9o.oVdqBsTyQePH4n0znUiG94r/bI276/lTCG05lkMBK', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 14:02:43.677661+00', '2025-04-18 14:02:43.677661+00');


--
-- Data for Name: emailTemplates; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public."emailTemplates" (id, type, title, text) VALUES (1, 0, 'простое письмо', 'простое письмо');


--
-- Data for Name: episodes; Type: TABLE DATA; Schema: public; Owner: hello
--



--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public.managers (role, first_name, second_name, phone, email, password, id) VALUES ('admin', '1', '1', '1', '1@gmail.com', '$2b$12$RvdIgjtAphGXMjGcXY6RG.kC.Th83/bZ3AzjVm.SDUFDPxHgJYeJ.', 1);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public.news (id, title, text, publish_date, images) VALUES (1, 'простая новость', '<p>текст новости примерно такой</p>', '2025-04-18 14:05:07.536595+00', NULL);


--
-- Data for Name: newsContents; Type: TABLE DATA; Schema: public; Owner: hello
--

INSERT INTO public."newsContents" (news_id, id, name, uri, comment, create_date, modify_date) VALUES (1, 1, 'a', '06bf03ffcdcc4a3e87014bc5362bee69.jpg', NULL, '2025-04-18 14:05:08.772959+00', '2025-04-18 14:05:08.772959+00');
INSERT INTO public."newsContents" (news_id, id, name, uri, comment, create_date, modify_date) VALUES (1, 2, 'a', '5c7d0122f8db4fb084d200743ac46da4.png', NULL, '2025-04-18 14:05:09.303016+00', '2025-04-18 14:05:09.303016+00');


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: hello
--



--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public.clients_id_seq', 5, true);


--
-- Name: emailTemplates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public."emailTemplates_id_seq"', 1, true);


--
-- Name: episodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public.episodes_id_seq', 1, false);


--
-- Name: managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public.managers_id_seq', 1, true);


--
-- Name: newsContents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public."newsContents_id_seq"', 2, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public.news_id_seq', 1, true);


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hello
--

SELECT pg_catalog.setval('public.seasons_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: anime anime_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.anime
    ADD CONSTRAINT anime_pkey PRIMARY KEY (id);


--
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- Name: clients clients_phone_key; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_phone_key UNIQUE (phone);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: emailTemplates emailTemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."emailTemplates"
    ADD CONSTRAINT "emailTemplates_pkey" PRIMARY KEY (id);


--
-- Name: emailTemplates emailTemplates_type_key; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."emailTemplates"
    ADD CONSTRAINT "emailTemplates_type_key" UNIQUE (type);


--
-- Name: episodes episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (id);


--
-- Name: managers managers_phone_key; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_phone_key UNIQUE (phone);


--
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: newsContents newsContents_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."newsContents"
    ADD CONSTRAINT "newsContents_pkey" PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: clients clients_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: episodes episodes_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id);


--
-- Name: newsContents newsContents_news_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public."newsContents"
    ADD CONSTRAINT "newsContents_news_id_fkey" FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- Name: seasons seasons_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hello
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES public.anime(id);


--
-- PostgreSQL database dump complete
--

