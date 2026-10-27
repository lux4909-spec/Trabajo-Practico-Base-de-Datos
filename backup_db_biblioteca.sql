--
-- PostgreSQL database dump
--

\restrict Ux7vNXem5k6SXEnPIICC7tDpjj8Zi4AhwiWgr6btEAm82He0uggk4qCWcmwwV7u

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

-- Started on 2026-10-26 20:54:38 -03

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
-- TOC entry 220 (class 1259 OID 16414)
-- Name: bibliotecario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bibliotecario (
    id_bibliotecario integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    telefono integer,
    mail character varying(100)
);


ALTER TABLE public.bibliotecario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: computadora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computadora (
    id_computadora integer NOT NULL,
    modelo character varying(100),
    disponibilidad boolean,
    numero integer
);


ALTER TABLE public.computadora OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: editoriales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoriales (
    id_editoriales integer NOT NULL,
    nombre character varying(100) NOT NULL,
    disponible boolean NOT NULL
);


ALTER TABLE public.editoriales OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro (
    id_libro integer NOT NULL,
    titulo character varying(100) NOT NULL,
    autor character varying(100) NOT NULL,
    "fecha de publicacion" date NOT NULL,
    disponible boolean,
    ejemplares integer,
    id_genero integer NOT NULL,
    id_editoriales integer NOT NULL
);


ALTER TABLE public.libro OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamo (
    id_prestamo integer NOT NULL,
    id_socio integer NOT NULL,
    "fecha y hora prestamo" timestamp with time zone NOT NULL,
    "fecha y hora devolucion" timestamp with time zone,
    id_libro integer,
    id_computadora integer,
    activo boolean NOT NULL
);


ALTER TABLE public.prestamo OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socio (
    id_socio integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    dni character varying(50) NOT NULL
);


ALTER TABLE public.socio OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: bibliotecario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bibliotecario (id_bibliotecario, nombre, apellido, telefono, mail) FROM stdin;
\.


--
-- TOC entry 3508 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: computadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.computadora (id_computadora, modelo, disponibilidad, numero) FROM stdin;
\.


--
-- TOC entry 3509 (class 0 OID 16409)
-- Dependencies: 219
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriales (id_editoriales, nombre, disponible) FROM stdin;
\.


--
-- TOC entry 3511 (class 0 OID 16419)
-- Dependencies: 221
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genero (id_genero, nombre) FROM stdin;
\.


--
-- TOC entry 3507 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro (id_libro, titulo, autor, "fecha de publicacion", disponible, ejemplares, id_genero, id_editoriales) FROM stdin;
\.


--
-- TOC entry 3506 (class 0 OID 16394)
-- Dependencies: 216
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamo (id_prestamo, id_socio, "fecha y hora prestamo", "fecha y hora devolucion", id_libro, id_computadora, activo) FROM stdin;
\.


--
-- TOC entry 3505 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socio (id_socio, nombre, apellido, dni) FROM stdin;
\.


--
-- TOC entry 3359 (class 2606 OID 16418)
-- Name: bibliotecario bibliotecario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotecario
    ADD CONSTRAINT bibliotecario_pkey PRIMARY KEY (id_bibliotecario);


--
-- TOC entry 3355 (class 2606 OID 16408)
-- Name: computadora computadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computadora
    ADD CONSTRAINT computadora_pkey PRIMARY KEY (id_computadora);


--
-- TOC entry 3357 (class 2606 OID 16413)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id_editoriales);


--
-- TOC entry 3361 (class 2606 OID 16423)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3353 (class 2606 OID 16403)
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id_libro);


--
-- TOC entry 3351 (class 2606 OID 16398)
-- Name: prestamo prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 3349 (class 2606 OID 16393)
-- Name: socio socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_pkey PRIMARY KEY (id_socio);


-- Completed on 2026-10-26 20:54:39 -03

--
-- PostgreSQL database dump complete
--

\unrestrict Ux7vNXem5k6SXEnPIICC7tDpjj8Zi4AhwiWgr6btEAm82He0uggk4qCWcmwwV7u

