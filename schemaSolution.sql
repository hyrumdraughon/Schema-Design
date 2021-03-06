toc.dat                                                                                             0000600 0004000 0002000 00000023570 14021732064 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           -    
    	        y            Schema Design Assignment    13.2    13.2 %    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ?           1262    16457    Schema Design Assignment    DATABASE     ~   CREATE DATABASE "Schema Design Assignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 *   DROP DATABASE "Schema Design Assignment";
                postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false         ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3         ?            1259    16482    interest    TABLE     `   CREATE TABLE public.interest (
    id integer NOT NULL,
    title character varying NOT NULL
);
    DROP TABLE public.interest;
       public         heap    postgres    false    3         ?            1259    16480    interest_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.interest_id_seq;
       public          postgres    false    205    3         ?           0    0    interest_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.interest_id_seq OWNED BY public.interest.id;
          public          postgres    false    204         ?            1259    16471    location_table    TABLE     ?   CREATE TABLE public.location_table (
    id integer NOT NULL,
    city character varying NOT NULL,
    state_column character varying NOT NULL,
    country character varying NOT NULL
);
 "   DROP TABLE public.location_table;
       public         heap    postgres    false    3         ?            1259    16469    location_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.location_id_seq;
       public          postgres    false    3    203         ?           0    0    location_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.location_id_seq OWNED BY public.location_table.id;
          public          postgres    false    202         ?            1259    16460    person    TABLE     ?   CREATE TABLE public.person (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    age integer NOT NULL,
    location_id integer NOT NULL
);
    DROP TABLE public.person;
       public         heap    postgres    false    3         ?            1259    16458    person_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    201    3         ?           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    200         ?            1259    16516    person_interest    TABLE     ?   CREATE TABLE public.person_interest (
    id integer NOT NULL,
    person_id integer NOT NULL,
    interest_id integer NOT NULL
);
 #   DROP TABLE public.person_interest;
       public         heap    postgres    false    3         ?            1259    16514    person_interest_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.person_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.person_interest_id_seq;
       public          postgres    false    207    3         ?           0    0    person_interest_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.person_interest_id_seq OWNED BY public.person_interest.id;
          public          postgres    false    206         9           2604    16485    interest id    DEFAULT     j   ALTER TABLE ONLY public.interest ALTER COLUMN id SET DEFAULT nextval('public.interest_id_seq'::regclass);
 :   ALTER TABLE public.interest ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205         8           2604    16474    location_table id    DEFAULT     p   ALTER TABLE ONLY public.location_table ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);
 @   ALTER TABLE public.location_table ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203         7           2604    16463 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201         :           2604    16519    person_interest id    DEFAULT     x   ALTER TABLE ONLY public.person_interest ALTER COLUMN id SET DEFAULT nextval('public.person_interest_id_seq'::regclass);
 A   ALTER TABLE public.person_interest ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207         ?          0    16482    interest 
   TABLE DATA           -   COPY public.interest (id, title) FROM stdin;
    public          postgres    false    205       3021.dat ?          0    16471    location_table 
   TABLE DATA           I   COPY public.location_table (id, city, state_column, country) FROM stdin;
    public          postgres    false    203       3019.dat ?          0    16460    person 
   TABLE DATA           M   COPY public.person (id, first_name, last_name, age, location_id) FROM stdin;
    public          postgres    false    201       3017.dat ?          0    16516    person_interest 
   TABLE DATA           E   COPY public.person_interest (id, person_id, interest_id) FROM stdin;
    public          postgres    false    207       3023.dat ?           0    0    interest_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.interest_id_seq', 5, true);
          public          postgres    false    204         ?           0    0    location_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.location_id_seq', 3, true);
          public          postgres    false    202         ?           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 6, true);
          public          postgres    false    200         ?           0    0    person_interest_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.person_interest_id_seq', 12, true);
          public          postgres    false    206         @           2606    16490    interest interest_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.interest
    ADD CONSTRAINT interest_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.interest DROP CONSTRAINT interest_pkey;
       public            postgres    false    205         >           2606    16479    location_table location_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.location_table
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.location_table DROP CONSTRAINT location_pkey;
       public            postgres    false    203         B           2606    16521 $   person_interest person_interest_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT person_interest_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.person_interest DROP CONSTRAINT person_interest_pkey;
       public            postgres    false    207         <           2606    16468    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    201         E           2606    16527 $   person_interest interest_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT interest_foreign_key FOREIGN KEY (interest_id) REFERENCES public.interest(id);
 N   ALTER TABLE ONLY public.person_interest DROP CONSTRAINT interest_foreign_key;
       public          postgres    false    2880    207    205         C           2606    16491    person location_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public.person
    ADD CONSTRAINT location_foreign_key FOREIGN KEY (location_id) REFERENCES public.location_table(id) NOT VALID;
 E   ALTER TABLE ONLY public.person DROP CONSTRAINT location_foreign_key;
       public          postgres    false    2878    201    203         D           2606    16522 "   person_interest person_foreign_key    FK CONSTRAINT     ?   ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT person_foreign_key FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.person_interest DROP CONSTRAINT person_foreign_key;
       public          postgres    false    2876    201    207                                                                                                                                                3021.dat                                                                                            0000600 0004000 0002000 00000000064 14021732064 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	basketball
2	music
3	art
4	books
5	traveling
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                            3019.dat                                                                                            0000600 0004000 0002000 00000000070 14021732064 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	chapel hill	nc	usa
2	slc	ut	usa
3	phoenix	az	usa
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                        3017.dat                                                                                            0000600 0004000 0002000 00000000134 14021732064 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	hyrum	d	22	3
2	mary	d	21	3
3	john	doe	45	1
4	h2	d	22	3
5	mary	d	21	3
6	john	doe	45	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                    3023.dat                                                                                            0000600 0004000 0002000 00000000120 14021732064 0014231 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	1	2
3	4	1
4	4	3
5	2	2
6	2	3
7	5	5
8	5	3
9	3	1
10	3	4
11	6	2
12	6	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000020256 14021732064 0015370 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

DROP DATABASE "Schema Design Assignment";
--
-- Name: Schema Design Assignment; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Schema Design Assignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE "Schema Design Assignment" OWNER TO postgres;

\connect -reuse-previous=on "dbname='Schema Design Assignment'"

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: interest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interest (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.interest OWNER TO postgres;

--
-- Name: interest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interest_id_seq OWNER TO postgres;

--
-- Name: interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interest_id_seq OWNED BY public.interest.id;


--
-- Name: location_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_table (
    id integer NOT NULL,
    city character varying NOT NULL,
    state_column character varying NOT NULL,
    country character varying NOT NULL
);


ALTER TABLE public.location_table OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location_table.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    age integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_interest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_interest (
    id integer NOT NULL,
    person_id integer NOT NULL,
    interest_id integer NOT NULL
);


ALTER TABLE public.person_interest OWNER TO postgres;

--
-- Name: person_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_interest_id_seq OWNER TO postgres;

--
-- Name: person_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_interest_id_seq OWNED BY public.person_interest.id;


--
-- Name: interest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interest ALTER COLUMN id SET DEFAULT nextval('public.interest_id_seq'::regclass);


--
-- Name: location_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_table ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: person_interest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_interest ALTER COLUMN id SET DEFAULT nextval('public.person_interest_id_seq'::regclass);


--
-- Data for Name: interest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interest (id, title) FROM stdin;
\.
COPY public.interest (id, title) FROM '$$PATH$$/3021.dat';

--
-- Data for Name: location_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_table (id, city, state_column, country) FROM stdin;
\.
COPY public.location_table (id, city, state_column, country) FROM '$$PATH$$/3019.dat';

--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, first_name, last_name, age, location_id) FROM stdin;
\.
COPY public.person (id, first_name, last_name, age, location_id) FROM '$$PATH$$/3017.dat';

--
-- Data for Name: person_interest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_interest (id, person_id, interest_id) FROM stdin;
\.
COPY public.person_interest (id, person_id, interest_id) FROM '$$PATH$$/3023.dat';

--
-- Name: interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interest_id_seq', 5, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 3, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 6, true);


--
-- Name: person_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_interest_id_seq', 12, true);


--
-- Name: interest interest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interest
    ADD CONSTRAINT interest_pkey PRIMARY KEY (id);


--
-- Name: location_table location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_table
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: person_interest person_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT person_interest_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_interest interest_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT interest_foreign_key FOREIGN KEY (interest_id) REFERENCES public.interest(id);


--
-- Name: person location_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT location_foreign_key FOREIGN KEY (location_id) REFERENCES public.location_table(id) NOT VALID;


--
-- Name: person_interest person_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_interest
    ADD CONSTRAINT person_foreign_key FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  