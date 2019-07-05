--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9
-- Dumped by pg_dump version 10.9

-- Started on 2019-07-05 15:26:09

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 141944)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    is_active boolean NOT NULL,
    name character varying(80) NOT NULL,
    description character varying(100),
    cost real,
    date timestamp(4) without time zone,
    id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 150134)
-- Name: Event_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Event_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Event_Id_seq" OWNER TO postgres;

--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 197
-- Name: Event_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Event_Id_seq" OWNED BY public.event.id;


--
-- TOC entry 199 (class 1259 OID 166520)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id integer NOT NULL,
    address character varying(300) NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 166518)
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
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 198
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- TOC entry 2676 (class 2604 OID 150136)
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public."Event_Id_seq"'::regclass);


--
-- TOC entry 2677 (class 2604 OID 166523)
-- Name: location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 2807 (class 0 OID 141944)
-- Dependencies: 196
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'ServiceTest', 'From Idea', 400, '2019-06-27 00:00:00', 3, 1);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'TestPropFile', 'Trying to test', 150, '2019-06-27 00:00:00', 4, 2);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'Second Event created from UI', 'Second Event created from UI

sdf
sdfsdfdsf', 400, '0035-09-09 00:00:00', 6, 3);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'Test', 'yo-ho-ho', 150, '1994-11-27 00:00:00', 2, 4);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (false, 'Event created from UI', 'New new description esfsfsdfsdf d,fm gd,mf d,mf 
sdfsdf
sdfsdf', 300, '2019-07-12 12:00:00', 7, 5);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (false, 'Event created from UI', 'Updated description', 300, '2021-08-25 18:00:00', 5, 6);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (false, 'sdfsdf', 'ghjghjghj', 500, '2019-09-20 09:00:00', 9, 16);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (false, 'dfgdfg', 'jkljkljk', 100, '2019-07-23 18:00:00', 8, 7);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'Event with autocomplete', 'autocomplete', 800, '2019-07-24 13:00:00', 10, 6);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'fXkLGXwkpa mpxRXWPFq', 'xBmkRLAEap JHIqVPYTM IExsLgniXG', 174, '2020-06-25 16:00:00', 11, 33);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'iwrppHrMrd jvYEIHxlR', 'EnfPgwiVqq AeIFEpPvd QszDeCBtSi', 592, '2020-06-25 16:00:00', 12, 22);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'KfrwYhzcdQ jFzalJloQ', 'sGrUcgAAUK smZGAfNXS BZeMcQuCsj', 16, '2020-06-25 16:00:00', 13, 19);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'OPtZtfDcnF CFwIfhBQc', 'thwvlRoeqJ IHDugagKz aURgbcrsxN', 210, '2020-06-25 16:00:00', 14, 28);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'thoxaHkWOe cEWXMTSiH', 'IUJBCRGLth CoqVUHVgf FawwAjiVdE', 370, '2020-06-25 16:00:00', 15, 22);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'MlZMuvhcZu fqomaOpdJ', 'qgbXLIvipp dCnZUArBY YYERtcTyrU', 82, '2020-06-25 16:00:00', 16, 23);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'OdLFuBBuON TKCmmFQyJ', 'osDaRSgCFj qkbeTPIlg RWUsvxWotu', 427, '2020-06-25 16:00:00', 17, 28);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'cQnpDmsqYo SLUONtVNq', 'ZzxqqppCYZ ePRRLtKRT xESIMYYCUW', 331, '2020-06-25 16:00:00', 18, 26);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'MoPOnBSJAS kEgUmtICZ', 'PcLofROiTM ZrhwZHAIL fqfAAWEYbP', 404, '2020-06-25 16:00:00', 19, 33);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'JuxiiDTbPK wyNuujXCY', 'mVNJreAHct fQIEVVZVR whEJWuLAMu', 463, '2020-06-25 16:00:00', 20, 23);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'xkfAVLXvXe BKNyMdiZL', 'oXvSdkGWth lznuRaudh fFMTufVazw', 122, '2020-06-25 16:00:00', 21, 26);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'mdpYiDMSxQ oKBlZWNsb', 'wGaSHzKZVX DdWvDlosI gzGpKtYLQG', 358, '2020-06-25 16:00:00', 22, 27);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'MJgNfLGQHY CfQkjkWxv', 'TIqDdCPQnz fNmmsdkNW zjSGtSlBFL', 42, '2020-06-25 16:00:00', 23, 23);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'UEBFlexHxY yhJYgdebX', 'sLQJlVMwGy iMxhWFrGv sBiAEZaLbf', 140, '2020-06-25 16:00:00', 24, 21);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'jniszsWXWS UCUfVByJa', 'cSJGrGglTQ cLQhLhIlS epfPivHano', 443, '2020-06-25 16:00:00', 25, 21);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'yevKYebRcw TGYQcjGXi', 'bHUncKciOa QiKjDLOJS TQwSeDOOjw', 810, '2020-06-25 16:00:00', 26, 20);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'dTYVRhBiId lZjJXTJeA', 'ygTmAantoT DTtqbIPHD HuvSJgSqPg', 514, '2020-06-25 16:00:00', 27, 28);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'iwbDgFKzwx grZJMeWBm', 'QFtoMjGPBK FHBsxuUlw RjNvrPveTz', 305, '2020-06-25 16:00:00', 28, 29);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'tKKPEZYrmC pSnFdFCrK', 'bONPSxmVtF vlzVywlKd dJMlJJyrZL', 485, '2020-06-25 16:00:00', 29, 19);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (true, 'EtfYQaiGfa aVVSZCfpd', 'NjDGmZvgAe cOtqNCoAZ aBySXNSnOU', 27, '2020-06-25 16:00:00', 30, 31);
INSERT INTO public.event (is_active, name, description, cost, date, id, address_id) VALUES (false, 'tomcat run edit', 'first run from tomcat', 150, '2020-01-10 17:00:00', 31, 6);


--
-- TOC entry 2810 (class 0 OID 166520)
-- Dependencies: 199
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.location (id, address) VALUES (1, 'prs.Nezalejnosti 45');
INSERT INTO public.location (id, address) VALUES (2, 'jhdf dsf');
INSERT INTO public.location (id, address) VALUES (3, 'sdf., sdfsdfsd, 568');
INSERT INTO public.location (id, address) VALUES (4, 'Holovna str.276');
INSERT INTO public.location (id, address) VALUES (5, ' fgh');
INSERT INTO public.location (id, address) VALUES (6, 'Chernivtsi, Chervonoarmiyska str. 56');
INSERT INTO public.location (id, address) VALUES (7, 'sdfsdfsdf');
INSERT INTO public.location (id, address) VALUES (10, 'Test uniq');
INSERT INTO public.location (id, address) VALUES (15, 'ifjd,sfsdf 78');
INSERT INTO public.location (id, address) VALUES (16, 'blabla, blu blu, 7');
INSERT INTO public.location (id, address) VALUES (17, 'autocomplete, sdf 7');
INSERT INTO public.location (id, address) VALUES (19, '50 Cooper St.Biloxi, MS 39532');
INSERT INTO public.location (id, address) VALUES (20, '7127 Van Dyke Dr.Ankeny, IA 50023');
INSERT INTO public.location (id, address) VALUES (21, '54 N. Galvin St.Taylors, SC 29687');
INSERT INTO public.location (id, address) VALUES (22, '53 NE. Cambridge St.Lake Mary, FL 32746');
INSERT INTO public.location (id, address) VALUES (23, '8986 George Street Williamstown, NJ 08094');
INSERT INTO public.location (id, address) VALUES (24, '70 Summer Ave.Albany, NY 12203');
INSERT INTO public.location (id, address) VALUES (25, '8280 Catherine Street Dearborn, MI 48124');
INSERT INTO public.location (id, address) VALUES (26, '8362 Brook Drive Huntley, IL 60142');
INSERT INTO public.location (id, address) VALUES (27, '8770 S. Nichols Ave.Maineville, OH 45039');
INSERT INTO public.location (id, address) VALUES (28, '190 Ridgeview Road Acworth, GA 30101');
INSERT INTO public.location (id, address) VALUES (29, '638 Lexington St.Middleburg, FL 32068');
INSERT INTO public.location (id, address) VALUES (30, '135 North Eagle Dr.Passaic, NJ 07055');
INSERT INTO public.location (id, address) VALUES (31, '616 North Street Fitchburg, MA 01420');
INSERT INTO public.location (id, address) VALUES (32, '756 Somerset Road Westfield, MA 01085');
INSERT INTO public.location (id, address) VALUES (33, '513 Rockcrest Rd.Richardson, TX 75080');
INSERT INTO public.location (id, address) VALUES (34, '1 Glenwood Street Nicholasville, KY 40356');
INSERT INTO public.location (id, address) VALUES (35, '385 Brookside Lane Lorain, OH 44052');
INSERT INTO public.location (id, address) VALUES (36, '9262 Glenridge St.Buffalo, NY 14215');
INSERT INTO public.location (id, address) VALUES (37, '9138 East Lexington St. Defiance, OH 43512');
INSERT INTO public.location (id, address) VALUES (38, '9349 Wayne Dr. Marquette, MI 49855');


--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 197
-- Name: Event_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Event_Id_seq"', 31, true);


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 198
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 40, true);


--
-- TOC entry 2679 (class 2606 OID 150141)
-- Name: event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 166525)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 166532)
-- Name: location unique_address_column; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT unique_address_column UNIQUE (address);


--
-- TOC entry 2680 (class 1259 OID 166558)
-- Name: cost_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cost_index ON public.event USING btree (cost);


--
-- TOC entry 2685 (class 2606 OID 166526)
-- Name: event event_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_location_fkey FOREIGN KEY (address_id) REFERENCES public.location(id);


-- Completed on 2019-07-05 15:26:09

--
-- PostgreSQL database dump complete
--

