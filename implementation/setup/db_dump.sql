--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: staff; Type: SCHEMA; Schema: -; Owner: ste
--

CREATE SCHEMA staff;


ALTER SCHEMA staff OWNER TO ste;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE author (
    id integer NOT NULL,
    authorname character varying(100) NOT NULL
);


ALTER TABLE author OWNER TO ste;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_id_seq OWNER TO ste;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- Name: monography; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE monography (
    id integer NOT NULL,
    title character varying(100) NOT NULL
);


ALTER TABLE monography OWNER TO ste;

--
-- Name: monography_author; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE monography_author (
    id integer NOT NULL,
    monography_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE monography_author OWNER TO ste;

--
-- Name: monography_author_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE monography_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monography_author_id_seq OWNER TO ste;

--
-- Name: monography_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE monography_author_id_seq OWNED BY monography_author.id;


--
-- Name: monography_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE monography_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monography_id_seq OWNER TO ste;

--
-- Name: monography_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE monography_id_seq OWNED BY monography.id;


--
-- Name: monography_subject; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE monography_subject (
    id integer NOT NULL,
    monography_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE monography_subject OWNER TO ste;

--
-- Name: monography_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE monography_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE monography_subject_id_seq OWNER TO ste;

--
-- Name: monography_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE monography_subject_id_seq OWNED BY monography_subject.id;


--
-- Name: physicalcopy; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE physicalcopy (
    id integer NOT NULL,
    monography_id integer NOT NULL
);


ALTER TABLE physicalcopy OWNER TO ste;

--
-- Name: physicalcopy_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE physicalcopy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE physicalcopy_id_seq OWNER TO ste;

--
-- Name: physicalcopy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE physicalcopy_id_seq OWNED BY physicalcopy.id;


--
-- Name: subject; Type: TABLE; Schema: public; Owner: ste; Tablespace: 
--

CREATE TABLE subject (
    id integer NOT NULL,
    caption character varying(1000) NOT NULL
);


ALTER TABLE subject OWNER TO ste;

--
-- Name: TABLE subject; Type: COMMENT; Schema: public; Owner: ste
--

COMMENT ON TABLE subject IS 'This is a Universal Decimal Classification (UDC) main class.';


--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: ste
--

CREATE SEQUENCE subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subject_id_seq OWNER TO ste;

--
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ste
--

ALTER SEQUENCE subject_id_seq OWNED BY subject.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography ALTER COLUMN id SET DEFAULT nextval('monography_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_author ALTER COLUMN id SET DEFAULT nextval('monography_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_subject ALTER COLUMN id SET DEFAULT nextval('monography_subject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY physicalcopy ALTER COLUMN id SET DEFAULT nextval('physicalcopy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ste
--

ALTER TABLE ONLY subject ALTER COLUMN id SET DEFAULT nextval('subject_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY author (id, authorname) FROM stdin;
23	Henry G. Booker
24	Lorenzo Carlesso
26	Rudolf Wollmann
27	Bernard Pellequer
28	Walter Ferreri
32	Gianni Miná
33	Gianni Miná
34	Eduardo Galeano
35	Ugo Chávez
36	François Houtart
37	Gianni Miná
38	Eduardo Galeano
39	Ugo Chávez
40	François Houtart
41	Barbara Gottstein-Schramm
42	Susanne Kalender
43	Franz Specht
44	Barbara Duckstein
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('author_id_seq', 44, true);


--
-- Data for Name: monography; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY monography (id, title) FROM stdin;
33	An approach to Electrical Science
34	FLTK manual
36	Il grande libro del saper costruire
37	Piccola guida del cielo
40	Il continente desaparecido è ricomparso
41	Il continente desaparecido è ricomparso
42	Schritte Übungsgrammatik
\.


--
-- Data for Name: monography_author; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY monography_author (id, monography_id, author_id) FROM stdin;
11	33	23
12	34	24
14	36	26
15	37	27
16	37	28
24	40	32
25	40	34
26	40	35
27	40	36
28	42	41
29	42	42
30	42	43
31	42	44
\.


--
-- Name: monography_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('monography_author_id_seq', 31, true);


--
-- Name: monography_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('monography_id_seq', 42, true);


--
-- Data for Name: monography_subject; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY monography_subject (id, monography_id, subject_id) FROM stdin;
3	33	5
4	33	6
5	34	6
6	36	6
7	37	5
8	37	5
10	40	3
11	40	3
12	42	8
\.


--
-- Name: monography_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('monography_subject_id_seq', 12, true);


--
-- Data for Name: physicalcopy; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY physicalcopy (id, monography_id) FROM stdin;
11	33
12	34
13	34
14	34
15	34
16	34
17	34
18	36
19	37
20	37
23	40
24	42
\.


--
-- Name: physicalcopy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('physicalcopy_id_seq', 24, true);


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: ste
--

COPY subject (id, caption) FROM stdin;
0	SCIENCE AND KNOWLEDGE. ORGANIZATION. COMPUTER SCIENCE. INFORMATION. DOCUMENTATION. LIBRARIANSHIP. INSTITUTIONS. PUBLICATIONS
1	PHILOSOPHY. PSYCHOLOGY
2	RELIGION. THEOLOGY
3	SOCIAL SCIENCES
5	MATHEMATICS. NATURAL SCIENCES
6	APPLIED SCIENCES. MEDICINE. TECHNOLOGY
7	THE ARTS. RECREATION. ENTERTAINMENT. SPORT
8	LANGUAGE. LINGUISTICS. LITERATURE
9	GEOGRAPHY. BIOGRAPHY. HISTORY
\.


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ste
--

SELECT pg_catalog.setval('subject_id_seq', 1, false);


--
-- Name: author_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- Name: copy_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY physicalcopy
    ADD CONSTRAINT copy_pk PRIMARY KEY (id);


--
-- Name: monography_author_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY monography_author
    ADD CONSTRAINT monography_author_pk PRIMARY KEY (id);


--
-- Name: monography_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY monography
    ADD CONSTRAINT monography_pk PRIMARY KEY (id);


--
-- Name: monography_subject_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY monography_subject
    ADD CONSTRAINT monography_subject_pk PRIMARY KEY (id);


--
-- Name: subject_pk; Type: CONSTRAINT; Schema: public; Owner: ste; Tablespace: 
--

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_pk PRIMARY KEY (id);


--
-- Name: copy_fk; Type: FK CONSTRAINT; Schema: public; Owner: ste
--

ALTER TABLE ONLY physicalcopy
    ADD CONSTRAINT copy_fk FOREIGN KEY (monography_id) REFERENCES monography(id) ON DELETE RESTRICT;


--
-- Name: monography_author_fk1; Type: FK CONSTRAINT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_author
    ADD CONSTRAINT monography_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- Name: monography_author_fk2; Type: FK CONSTRAINT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_author
    ADD CONSTRAINT monography_author_fk2 FOREIGN KEY (monography_id) REFERENCES monography(id) ON DELETE RESTRICT;


--
-- Name: monography_subject_fk1; Type: FK CONSTRAINT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_subject
    ADD CONSTRAINT monography_subject_fk1 FOREIGN KEY (monography_id) REFERENCES monography(id);


--
-- Name: monography_subject_fk2; Type: FK CONSTRAINT; Schema: public; Owner: ste
--

ALTER TABLE ONLY monography_subject
    ADD CONSTRAINT monography_subject_fk2 FOREIGN KEY (subject_id) REFERENCES subject(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

