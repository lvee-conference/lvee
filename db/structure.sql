--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: abstract_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abstract_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abstract_comments_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abstract_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abstract_comments (
    id integer DEFAULT nextval('abstract_comments_id_seq'::regclass) NOT NULL,
    abstract_id integer,
    user_id integer,
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE abstract_comments OWNER TO postgres;

--
-- Name: abstract_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abstract_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abstract_files_id_seq OWNER TO postgres;

--
-- Name: abstract_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abstract_files (
    id integer DEFAULT nextval('abstract_files_id_seq'::regclass) NOT NULL,
    file character varying(255),
    abstract_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE abstract_files OWNER TO postgres;

--
-- Name: abstract_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abstract_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abstract_versions_id_seq OWNER TO postgres;

--
-- Name: abstract_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abstract_versions (
    id integer DEFAULT nextval('abstract_versions_id_seq'::regclass) NOT NULL,
    abstract_id integer,
    version integer,
    title character varying(255),
    body text,
    change_summary character varying(255),
    ready_for_review boolean,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    conference_id integer,
    authors character varying(255),
    license character varying(255),
    summary text,
    published boolean
);


ALTER TABLE abstract_versions OWNER TO postgres;

--
-- Name: abstracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abstracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abstracts_id_seq OWNER TO postgres;

--
-- Name: abstracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abstracts (
    id integer DEFAULT nextval('abstracts_id_seq'::regclass) NOT NULL,
    title character varying(255),
    body text,
    change_summary character varying(255),
    ready_for_review boolean,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer,
    conference_id integer,
    authors character varying(255),
    summary text,
    license character varying(255),
    published boolean
);


ALTER TABLE abstracts OWNER TO postgres;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ar_internal_metadata (
    key character varying(255) NOT NULL,
    value character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO postgres;

--
-- Name: article_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE article_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE article_versions_id_seq OWNER TO postgres;

--
-- Name: article_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE article_versions (
    id integer DEFAULT nextval('article_versions_id_seq'::regclass) NOT NULL,
    article_id integer,
    version integer,
    category character varying(255),
    name character varying(255),
    title character varying(255),
    body text,
    locale character varying(255),
    updated_at timestamp without time zone,
    user_id integer,
    created_at timestamp without time zone
);


ALTER TABLE article_versions OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE articles (
    id integer DEFAULT nextval('articles_id_seq'::regclass) NOT NULL,
    category character varying(255),
    name character varying(255),
    title character varying(255),
    body text,
    locale character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer,
    user_id integer
);


ALTER TABLE articles OWNER TO postgres;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE badges_id_seq OWNER TO postgres;

--
-- Name: badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE badges (
    id integer DEFAULT nextval('badges_id_seq'::regclass) NOT NULL,
    conference_registration_id integer,
    tags character varying(255),
    top character varying(255),
    bottom character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE badges OWNER TO postgres;

--
-- Name: conference_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conference_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conference_registrations_id_seq OWNER TO postgres;

--
-- Name: conference_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conference_registrations (
    id integer DEFAULT nextval('conference_registrations_id_seq'::regclass) NOT NULL,
    user_id integer,
    conference_id integer,
    quantity integer,
    proposition text,
    status_name character varying(255),
    days character varying(255),
    food character varying(255),
    tshirt character varying(255),
    transport_from character varying(255),
    meeting character varying(255),
    phone character varying(255),
    user_type character varying(255) DEFAULT 'normal'::character varying,
    to_pay integer,
    transport_to character varying(255),
    residence character varying(255),
    floor boolean,
    comment character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE conference_registrations OWNER TO postgres;

--
-- Name: conferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conferences_id_seq OWNER TO postgres;

--
-- Name: conferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conferences (
    id integer DEFAULT nextval('conferences_id_seq'::regclass) NOT NULL,
    name character varying(255),
    start_date date,
    finish_date date,
    registration_opened boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE conferences OWNER TO postgres;

--
-- Name: editor_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE editor_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE editor_logs_id_seq OWNER TO postgres;

--
-- Name: editor_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE editor_logs (
    id integer DEFAULT nextval('editor_logs_id_seq'::regclass) NOT NULL,
    url character varying(255),
    body text,
    user_name character varying(255),
    object_name character varying(255),
    change_type character varying(255),
    public boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE editor_logs OWNER TO postgres;

--
-- Name: image_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE image_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE image_uploads_id_seq OWNER TO postgres;

--
-- Name: image_uploads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE image_uploads (
    id integer DEFAULT nextval('image_uploads_id_seq'::regclass) NOT NULL,
    description character varying(255),
    file character varying(255),
    width integer,
    height integer,
    user_id integer
);


ALTER TABLE image_uploads OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE languages (
    name character varying(2),
    description character varying(255),
    published boolean,
    code3 character varying(3)
);


ALTER TABLE languages OWNER TO postgres;

--
-- Name: maillist_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE maillist_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE maillist_subscriptions_id_seq OWNER TO postgres;

--
-- Name: maillist_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE maillist_subscriptions (
    id integer DEFAULT nextval('maillist_subscriptions_id_seq'::regclass) NOT NULL,
    maillist character varying(255),
    email character varying(255)
);


ALTER TABLE maillist_subscriptions OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_id_seq OWNER TO postgres;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE menus (
    id integer DEFAULT nextval('menus_id_seq'::regclass) NOT NULL,
    path character varying(255),
    title character varying(255),
    "position" integer,
    parent_id integer,
    enabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE menus OWNER TO postgres;

--
-- Name: metainfos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metainfos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metainfos_id_seq OWNER TO postgres;

--
-- Name: metainfos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metainfos (
    id integer DEFAULT nextval('metainfos_id_seq'::regclass) NOT NULL,
    page character varying(255),
    language character varying(3),
    keywords text,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE metainfos OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_id_seq OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE news (
    id integer DEFAULT nextval('news_id_seq'::regclass) NOT NULL,
    title character varying(255),
    lead text,
    body text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    locale character varying(2),
    parent_id integer,
    published_at timestamp without time zone,
    version integer
);


ALTER TABLE news OWNER TO postgres;

--
-- Name: news_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_versions_id_seq OWNER TO postgres;

--
-- Name: news_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE news_versions (
    id integer DEFAULT nextval('news_versions_id_seq'::regclass) NOT NULL,
    news_id integer,
    version integer,
    title character varying(255),
    lead text,
    body text,
    user_id integer,
    updated_at timestamp without time zone,
    locale character varying(2),
    parent_id integer,
    published_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE news_versions OWNER TO postgres;

--
-- Name: not_found_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE not_found_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE not_found_redirects_id_seq OWNER TO postgres;

--
-- Name: not_found_redirects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE not_found_redirects (
    id integer DEFAULT nextval('not_found_redirects_id_seq'::regclass) NOT NULL,
    path character varying(255),
    target character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE not_found_redirects OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sites_id_seq OWNER TO postgres;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sites (
    id integer DEFAULT nextval('sites_id_seq'::regclass) NOT NULL,
    name character varying(255),
    "default" boolean,
    file character varying(255),
    stylesheet boolean,
    javascript boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sites OWNER TO postgres;

--
-- Name: sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sponsors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sponsors_id_seq OWNER TO postgres;

--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sponsors (
    id integer DEFAULT nextval('sponsors_id_seq'::regclass) NOT NULL,
    name character varying(255),
    url character varying(255),
    image character varying(255),
    sponsor_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE sponsors OWNER TO postgres;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statuses_id_seq OWNER TO postgres;

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statuses (
    id integer DEFAULT nextval('statuses_id_seq'::regclass) NOT NULL,
    name character varying(255),
    subject character varying(255),
    mail text
);


ALTER TABLE statuses OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE translations_id_seq OWNER TO postgres;

--
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE translations (
    id integer DEFAULT nextval('translations_id_seq'::regclass) NOT NULL,
    key character varying(255),
    value text,
    pluralization_index integer DEFAULT 1,
    language_id character varying(3),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE translations OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    login character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    country character varying(255),
    city character varying(255),
    occupation character varying(255),
    projects text,
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(255),
    remember_token_expires_at timestamp without time zone,
    activation_code character varying(40),
    activated_at timestamp without time zone,
    role character varying(255),
    subscribed boolean,
    avator character varying(255),
    subscribed_talks boolean
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_abstracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_abstracts (
    user_id integer,
    abstract_id integer
);


ALTER TABLE users_abstracts OWNER TO postgres;

--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wiki_page_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_page_versions_id_seq OWNER TO postgres;

--
-- Name: wiki_page_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wiki_page_versions (
    id integer DEFAULT nextval('wiki_page_versions_id_seq'::regclass) NOT NULL,
    wiki_page_id integer,
    version integer,
    name character varying(255),
    body text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE wiki_page_versions OWNER TO postgres;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wiki_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_pages_id_seq OWNER TO postgres;

--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wiki_pages (
    id integer DEFAULT nextval('wiki_pages_id_seq'::regclass) NOT NULL,
    name character varying(255),
    body text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer
);


ALTER TABLE wiki_pages OWNER TO postgres;

--
-- Data for Name: abstract_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abstract_comments (id, abstract_id, user_id, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: abstract_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abstract_comments_id_seq', 1, true);


--
-- Data for Name: abstract_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abstract_files (id, file, abstract_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: abstract_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abstract_files_id_seq', 1, true);


--
-- Data for Name: abstract_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abstract_versions (id, abstract_id, version, title, body, change_summary, ready_for_review, author_id, created_at, updated_at, conference_id, authors, license, summary, published) FROM stdin;
\.


--
-- Name: abstract_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abstract_versions_id_seq', 1, true);


--
-- Data for Name: abstracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY abstracts (id, title, body, change_summary, ready_for_review, author_id, created_at, updated_at, version, conference_id, authors, summary, license, published) FROM stdin;
\.


--
-- Name: abstracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('abstracts_id_seq', 1, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: article_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY article_versions (id, article_id, version, category, name, title, body, locale, updated_at, user_id, created_at) FROM stdin;
\.


--
-- Name: article_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('article_versions_id_seq', 1, true);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY articles (id, category, name, title, body, locale, created_at, updated_at, version, user_id) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('articles_id_seq', 1, true);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY badges (id, conference_registration_id, tags, top, bottom, created_at, updated_at) FROM stdin;
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('badges_id_seq', 1, true);


--
-- Data for Name: conference_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conference_registrations (id, user_id, conference_id, quantity, proposition, status_name, days, food, tshirt, transport_from, meeting, phone, user_type, to_pay, transport_to, residence, floor, comment, created_at, updated_at) FROM stdin;
\.


--
-- Name: conference_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conference_registrations_id_seq', 1, true);


--
-- Data for Name: conferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conferences (id, name, start_date, finish_date, registration_opened, created_at, updated_at) FROM stdin;
\.


--
-- Name: conferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conferences_id_seq', 1, true);


--
-- Data for Name: editor_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY editor_logs (id, url, body, user_name, object_name, change_type, public, created_at, updated_at) FROM stdin;
\.


--
-- Name: editor_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('editor_logs_id_seq', 1, true);


--
-- Data for Name: image_uploads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY image_uploads (id, description, file, width, height, user_id) FROM stdin;
\.


--
-- Name: image_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('image_uploads_id_seq', 1, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (name, description, published, code3) FROM stdin;
\.


--
-- Data for Name: maillist_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY maillist_subscriptions (id, maillist, email) FROM stdin;
\.


--
-- Name: maillist_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('maillist_subscriptions_id_seq', 1, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menus (id, path, title, "position", parent_id, enabled, created_at, updated_at) FROM stdin;
\.


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_id_seq', 1, true);


--
-- Data for Name: metainfos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY metainfos (id, page, language, keywords, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: metainfos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metainfos_id_seq', 1, true);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news (id, title, lead, body, user_id, created_at, updated_at, locale, parent_id, published_at, version) FROM stdin;
\.


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('news_id_seq', 1, true);


--
-- Data for Name: news_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_versions (id, news_id, version, title, lead, body, user_id, updated_at, locale, parent_id, published_at, created_at) FROM stdin;
\.


--
-- Name: news_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('news_versions_id_seq', 1, true);


--
-- Data for Name: not_found_redirects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY not_found_redirects (id, path, target, created_at, updated_at) FROM stdin;
\.


--
-- Name: not_found_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('not_found_redirects_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
1
2
20090111095310
20090118131904
20090124201426
20090208171641
20090215083617
20090308133803
20090315102546
20090317220859
20090321075932
20090404170210
20090411175429
20090418164336
20090419101002
20090426112548
20090526123706
20090606075217
20090612110458
20090626070011
20090808154841
20100402163018
20100607125345
20110628111256
20110803130140
20110818111001
20110818111636
20110912075630
20110922142741
20110922142829
20111017075229
20111017080520
20111019073938
20111024085114
20111024104948
20111024110829
20111115073051
20120611082128
20120709113934
20121008112938
20121015091320
20130218124639
3
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sites (id, name, "default", file, stylesheet, javascript, created_at, updated_at) FROM stdin;
\.


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sites_id_seq', 1, true);


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sponsors (id, name, url, image, sponsor_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sponsors_id_seq', 1, true);


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY statuses (id, name, subject, mail) FROM stdin;
\.


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('statuses_id_seq', 4, true);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY translations (id, key, value, pluralization_index, language_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('translations_id_seq', 2688, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, login, email, first_name, last_name, country, city, occupation, projects, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at, activation_code, activated_at, role, subscribed, avator, subscribed_talks) FROM stdin;
\.


--
-- Data for Name: users_abstracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_abstracts (user_id, abstract_id) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: wiki_page_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wiki_page_versions (id, wiki_page_id, version, name, body, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: wiki_page_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wiki_page_versions_id_seq', 1, true);


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wiki_pages (id, name, body, user_id, created_at, updated_at, version) FROM stdin;
\.


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wiki_pages_id_seq', 1, true);


--
-- Name: abstract_comments abstract_comments_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abstract_comments
    ADD CONSTRAINT abstract_comments_id_pkey PRIMARY KEY (id);


--
-- Name: abstract_files abstract_files_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abstract_files
    ADD CONSTRAINT abstract_files_id_pkey PRIMARY KEY (id);


--
-- Name: abstract_versions abstract_versions_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abstract_versions
    ADD CONSTRAINT abstract_versions_id_pkey PRIMARY KEY (id);


--
-- Name: abstracts abstracts_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abstracts
    ADD CONSTRAINT abstracts_id_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_key_pkey PRIMARY KEY (key);


--
-- Name: article_versions article_versions_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_versions
    ADD CONSTRAINT article_versions_id_pkey PRIMARY KEY (id);


--
-- Name: articles articles_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_id_pkey PRIMARY KEY (id);


--
-- Name: badges badges_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_id_pkey PRIMARY KEY (id);


--
-- Name: conference_registrations conference_registrations_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conference_registrations
    ADD CONSTRAINT conference_registrations_id_pkey PRIMARY KEY (id);


--
-- Name: conferences conferences_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conferences
    ADD CONSTRAINT conferences_id_pkey PRIMARY KEY (id);


--
-- Name: editor_logs editor_logs_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY editor_logs
    ADD CONSTRAINT editor_logs_id_pkey PRIMARY KEY (id);


--
-- Name: image_uploads image_uploads_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY image_uploads
    ADD CONSTRAINT image_uploads_id_pkey PRIMARY KEY (id);


--
-- Name: maillist_subscriptions maillist_subscriptions_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY maillist_subscriptions
    ADD CONSTRAINT maillist_subscriptions_id_pkey PRIMARY KEY (id);


--
-- Name: menus menus_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_id_pkey PRIMARY KEY (id);


--
-- Name: metainfos metainfos_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metainfos
    ADD CONSTRAINT metainfos_id_pkey PRIMARY KEY (id);


--
-- Name: news news_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_id_pkey PRIMARY KEY (id);


--
-- Name: news_versions news_versions_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_versions
    ADD CONSTRAINT news_versions_id_pkey PRIMARY KEY (id);


--
-- Name: not_found_redirects not_found_redirects_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY not_found_redirects
    ADD CONSTRAINT not_found_redirects_id_pkey PRIMARY KEY (id);


--
-- Name: sites sites_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_id_pkey PRIMARY KEY (id);


--
-- Name: sponsors sponsors_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sponsors
    ADD CONSTRAINT sponsors_id_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_id_pkey PRIMARY KEY (id);


--
-- Name: translations translations_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_id_pkey PRIMARY KEY (id);


--
-- Name: users users_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_id_pkey PRIMARY KEY (id);


--
-- Name: wiki_page_versions wiki_page_versions_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wiki_page_versions
    ADD CONSTRAINT wiki_page_versions_id_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wiki_pages
    ADD CONSTRAINT wiki_pages_id_pkey PRIMARY KEY (id);


--
-- Name: abstract_versions_abstract_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX abstract_versions_abstract_id ON abstract_versions USING btree (abstract_id);


--
-- Name: article_versions_article_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX article_versions_article_id ON article_versions USING btree (article_id);


--
-- Name: articles_category_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX articles_category_name ON articles USING btree (category, name);


--
-- Name: articles_category_name_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX articles_category_name_locale ON articles USING btree (category, name, locale);


--
-- Name: badges_conference_registration_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX badges_conference_registration_id ON badges USING btree (conference_registration_id);


--
-- Name: conference_registrations_conference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conference_registrations_conference_id ON conference_registrations USING btree (conference_id);


--
-- Name: maillist_subscriptions_maillist_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX maillist_subscriptions_maillist_email ON maillist_subscriptions USING btree (maillist, email);


--
-- Name: news_parent_id_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX news_parent_id_locale ON news USING btree (parent_id, locale);


--
-- Name: news_versions_news_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_versions_news_id ON news_versions USING btree (news_id);


--
-- Name: schema_migrations_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX schema_migrations_version ON schema_migrations USING btree (version);


--
-- Name: statuses_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX statuses_name ON statuses USING btree (name);


--
-- Name: translations_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX translations_language_id ON translations USING btree (language_id);


--
-- Name: translations_language_id_key_pluralization_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX translations_language_id_key_pluralization_index ON translations USING btree (language_id, key, pluralization_index);


--
-- Name: translations_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX translations_updated_at ON translations USING btree (updated_at);


--
-- Name: users_abstracts_abstract_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_abstracts_abstract_id ON users_abstracts USING btree (abstract_id);


--
-- Name: users_abstracts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_abstracts_user_id ON users_abstracts USING btree (user_id);


--
-- Name: wiki_page_versions_wiki_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_page_versions_wiki_page_id ON wiki_page_versions USING btree (wiki_page_id);


--
-- PostgreSQL database dump complete
--

