--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 10.1

-- Started on 2017-12-04 17:41:31 -02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2326 (class 1262 OID 22530)
-- Name: felipebanco; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE felipebanco WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect felipebanco

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 22562)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 22560)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 190 (class 1259 OID 22572)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 22570)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 186 (class 1259 OID 22554)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 22552)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 204 (class 1259 OID 22720)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- TOC entry 203 (class 1259 OID 22718)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 184 (class 1259 OID 22544)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 22542)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 182 (class 1259 OID 22533)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 22531)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 205 (class 1259 OID 22743)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 22634)
-- Name: manager_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_project (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    admin_id integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 22645)
-- Name: manager_project_contributors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_project_contributors (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 22643)
-- Name: manager_project_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_project_contributors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 199
-- Name: manager_project_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_project_contributors_id_seq OWNED BY manager_project_contributors.id;


--
-- TOC entry 197 (class 1259 OID 22632)
-- Name: manager_project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 197
-- Name: manager_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_project_id_seq OWNED BY manager_project.id;


--
-- TOC entry 202 (class 1259 OID 22653)
-- Name: manager_requirement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_requirement (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    functional boolean NOT NULL,
    project_id integer NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 22651)
-- Name: manager_requirement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_requirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 201
-- Name: manager_requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_requirement_id_seq OWNED BY manager_requirement.id;


--
-- TOC entry 192 (class 1259 OID 22603)
-- Name: manager_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 22618)
-- Name: manager_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 22616)
-- Name: manager_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 193
-- Name: manager_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_user_groups_id_seq OWNED BY manager_user_groups.id;


--
-- TOC entry 191 (class 1259 OID 22601)
-- Name: manager_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 191
-- Name: manager_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_user_id_seq OWNED BY manager_user.id;


--
-- TOC entry 196 (class 1259 OID 22626)
-- Name: manager_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manager_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 22624)
-- Name: manager_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manager_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 195
-- Name: manager_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manager_user_user_permissions_id_seq OWNED BY manager_user_user_permissions.id;


--
-- TOC entry 2098 (class 2604 OID 22565)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 22575)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 22557)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 22723)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 22547)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 22536)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 22637)
-- Name: manager_project id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project ALTER COLUMN id SET DEFAULT nextval('manager_project_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 22648)
-- Name: manager_project_contributors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project_contributors ALTER COLUMN id SET DEFAULT nextval('manager_project_contributors_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 22656)
-- Name: manager_requirement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_requirement ALTER COLUMN id SET DEFAULT nextval('manager_requirement_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 22606)
-- Name: manager_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user ALTER COLUMN id SET DEFAULT nextval('manager_user_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 22621)
-- Name: manager_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_groups ALTER COLUMN id SET DEFAULT nextval('manager_user_groups_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 22629)
-- Name: manager_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('manager_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2304 (class 0 OID 22562)
-- Dependencies: 188
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2306 (class 0 OID 22572)
-- Dependencies: 190
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2302 (class 0 OID 22554)
-- Dependencies: 186
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO auth_permission VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO auth_permission VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO auth_permission VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO auth_permission VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO auth_permission VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO auth_permission VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO auth_permission VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO auth_permission VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO auth_permission VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO auth_permission VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO auth_permission VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO auth_permission VALUES (16, 'Can add requirement', 6, 'add_requirement');
INSERT INTO auth_permission VALUES (17, 'Can change requirement', 6, 'change_requirement');
INSERT INTO auth_permission VALUES (18, 'Can delete requirement', 6, 'delete_requirement');
INSERT INTO auth_permission VALUES (19, 'Can add project', 7, 'add_project');
INSERT INTO auth_permission VALUES (20, 'Can change project', 7, 'change_project');
INSERT INTO auth_permission VALUES (21, 'Can delete project', 7, 'delete_project');
INSERT INTO auth_permission VALUES (22, 'Can add user', 8, 'add_user');
INSERT INTO auth_permission VALUES (23, 'Can change user', 8, 'change_user');
INSERT INTO auth_permission VALUES (24, 'Can delete user', 8, 'delete_user');


--
-- TOC entry 2320 (class 0 OID 22720)
-- Dependencies: 204
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2300 (class 0 OID 22544)
-- Dependencies: 184
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type VALUES (2, 'auth', 'group');
INSERT INTO django_content_type VALUES (3, 'auth', 'permission');
INSERT INTO django_content_type VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (5, 'sessions', 'session');
INSERT INTO django_content_type VALUES (6, 'manager', 'requirement');
INSERT INTO django_content_type VALUES (7, 'manager', 'project');
INSERT INTO django_content_type VALUES (8, 'manager', 'user');


--
-- TOC entry 2298 (class 0 OID 22533)
-- Dependencies: 182
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2017-12-04 17:37:24.354828-02');
INSERT INTO django_migrations VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2017-12-04 17:37:24.387475-02');
INSERT INTO django_migrations VALUES (3, 'auth', '0001_initial', '2017-12-04 17:37:24.999944-02');
INSERT INTO django_migrations VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2017-12-04 17:37:25.021937-02');
INSERT INTO django_migrations VALUES (5, 'auth', '0003_alter_user_email_max_length', '2017-12-04 17:37:25.043684-02');
INSERT INTO django_migrations VALUES (6, 'auth', '0004_alter_user_username_opts', '2017-12-04 17:37:25.063841-02');
INSERT INTO django_migrations VALUES (7, 'auth', '0005_alter_user_last_login_null', '2017-12-04 17:37:25.094583-02');
INSERT INTO django_migrations VALUES (8, 'auth', '0006_require_contenttypes_0002', '2017-12-04 17:37:25.099797-02');
INSERT INTO django_migrations VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2017-12-04 17:37:25.122498-02');
INSERT INTO django_migrations VALUES (10, 'auth', '0008_alter_user_username_max_length', '2017-12-04 17:37:25.147187-02');
INSERT INTO django_migrations VALUES (11, 'manager', '0001_initial', '2017-12-04 17:37:26.514117-02');
INSERT INTO django_migrations VALUES (12, 'admin', '0001_initial', '2017-12-04 17:37:26.805083-02');
INSERT INTO django_migrations VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2017-12-04 17:37:26.838246-02');
INSERT INTO django_migrations VALUES (14, 'sessions', '0001_initial', '2017-12-04 17:37:27.105355-02');


--
-- TOC entry 2321 (class 0 OID 22743)
-- Dependencies: 205
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2314 (class 0 OID 22634)
-- Dependencies: 198
-- Data for Name: manager_project; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO manager_project VALUES (1, 'Mercadinho', 'frutas e verduras', 1);
INSERT INTO manager_project VALUES (2, 'Floricultura', 'flores e ', 2);
INSERT INTO manager_project VALUES (3, 'Minha terra minha vida', 'app para compara casas', 3);
INSERT INTO manager_project VALUES (4, 'MelecOn', 'App para brincar de massa online', 4);
INSERT INTO manager_project VALUES (5, 'Suplements', 'loja online de suplementos', 5);


--
-- TOC entry 2316 (class 0 OID 22645)
-- Dependencies: 200
-- Data for Name: manager_project_contributors; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2318 (class 0 OID 22653)
-- Dependencies: 202
-- Data for Name: manager_requirement; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO manager_requirement VALUES (1, 'Comprar frutas', 'Um cliente pode comprar frutas', true, 1);
INSERT INTO manager_requirement VALUES (2, 'Vender frutas', 'Um cliente pode vender frutas', false, 1);
INSERT INTO manager_requirement VALUES (3, 'Comprar flores', 'Um cliente pode comprar flores', true, 2);
INSERT INTO manager_requirement VALUES (4, 'vender flores', 'Um cliente pode vender flores', false, 2);
INSERT INTO manager_requirement VALUES (5, 'Comprar casas', 'Um cliente pode comprar casas', true, 3);
INSERT INTO manager_requirement VALUES (6, 'vender casas', 'Um cliente pode vender casas', false, 3);
INSERT INTO manager_requirement VALUES (7, 'Comprar massas', 'Um cliente pode comprar massas', true, 4);
INSERT INTO manager_requirement VALUES (8, 'vender massas', 'Um cliente pode vender massas', false, 4);
INSERT INTO manager_requirement VALUES (9, 'Comprar suplementos', 'Um cliente pode comprar suplementos', true, 5);
INSERT INTO manager_requirement VALUES (10, 'vender suplementos', 'Um cliente pode vender suplementos', false, 5);


--
-- TOC entry 2308 (class 0 OID 22603)
-- Dependencies: 192
-- Data for Name: manager_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO manager_user VALUES (1, 'pbkdf2_sha256$36000$77QZpAY7Wp2A$ULe84xGGMxnO72HdfBztehUPlTTaeBWbkHOZgxDmn6E=', NULL, true, 'felipe', '\', '\', false, true, '2017-12-04 12:22:23.292012-02', 'felipe@gmail.com');
INSERT INTO manager_user VALUES (2, 'pbkdf2_sha256$36000$77QZpAY7Wp2A$ULe84xGGMxnO72HdfBztehUPlTTaeBWbkHOZgxDmn6E=', NULL, true, 'camila', '\', '\', false, true, '2017-12-04 12:22:23.292012-02', 'camila@gmail.com');
INSERT INTO manager_user VALUES (3, 'pbkdf2_sha256$36000$77QZpAY7Wp2A$ULe84xGGMxnO72HdfBztehUPlTTaeBWbkHOZgxDmn6E=', NULL, true, 'gabriel', '\', '\', false, true, '2017-12-04 12:22:23.292012-02', 'gabriel@gmail.com');
INSERT INTO manager_user VALUES (4, 'pbkdf2_sha256$36000$77QZpAY7Wp2A$ULe84xGGMxnO72HdfBztehUPlTTaeBWbkHOZgxDmn6E=', NULL, true, 'angelo', '\', '\', false, true, '2017-12-04 12:22:23.292012-02', 'angelo@gmail.com');
INSERT INTO manager_user VALUES (5, 'pbkdf2_sha256$36000$77QZpAY7Wp2A$ULe84xGGMxnO72HdfBztehUPlTTaeBWbkHOZgxDmn6E=', NULL, true, 'ricardo', '\', '\', false, true, '2017-12-04 12:22:23.292012-02', 'ricardo@gmail.com');


--
-- TOC entry 2310 (class 0 OID 22618)
-- Dependencies: 194
-- Data for Name: manager_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2312 (class 0 OID 22626)
-- Dependencies: 196
-- Data for Name: manager_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 8, true);


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 199
-- Name: manager_project_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_project_contributors_id_seq', 1, false);


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 197
-- Name: manager_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_project_id_seq', 5, true);


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 201
-- Name: manager_requirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_requirement_id_seq', 10, true);


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 193
-- Name: manager_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_user_groups_id_seq', 1, false);


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 191
-- Name: manager_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_user_id_seq', 5, true);


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 195
-- Name: manager_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manager_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2121 (class 2606 OID 22569)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2126 (class 2606 OID 22598)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2129 (class 2606 OID 22577)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 22567)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 22584)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2118 (class 2606 OID 22559)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 22729)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 2606 OID 22551)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2113 (class 2606 OID 22549)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 22541)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 22750)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2154 (class 2606 OID 22650)
-- Name: manager_project_contributors manager_project_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project_contributors
    ADD CONSTRAINT manager_project_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 22709)
-- Name: manager_project_contributors manager_project_contributors_project_id_user_id_e1764767_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project_contributors
    ADD CONSTRAINT manager_project_contributors_project_id_user_id_e1764767_uniq UNIQUE (project_id, user_id);


--
-- TOC entry 2152 (class 2606 OID 22642)
-- Name: manager_project manager_project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project
    ADD CONSTRAINT manager_project_pkey PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 22661)
-- Name: manager_requirement manager_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_requirement
    ADD CONSTRAINT manager_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 22615)
-- Name: manager_user manager_user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user
    ADD CONSTRAINT manager_user_email_key UNIQUE (email);


--
-- TOC entry 2140 (class 2606 OID 22623)
-- Name: manager_user_groups manager_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_groups
    ADD CONSTRAINT manager_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 22675)
-- Name: manager_user_groups manager_user_groups_user_id_group_id_3d41e518_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_groups
    ADD CONSTRAINT manager_user_groups_user_id_group_id_3d41e518_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2134 (class 2606 OID 22611)
-- Name: manager_user manager_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user
    ADD CONSTRAINT manager_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 22689)
-- Name: manager_user_user_permissions manager_user_user_permis_user_id_permission_id_56468e97_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_user_permissions
    ADD CONSTRAINT manager_user_user_permis_user_id_permission_id_56468e97_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2148 (class 2606 OID 22631)
-- Name: manager_user_user_permissions manager_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_user_permissions
    ADD CONSTRAINT manager_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 22613)
-- Name: manager_user manager_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user
    ADD CONSTRAINT manager_user_username_key UNIQUE (username);


--
-- TOC entry 2119 (class 1259 OID 22586)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2124 (class 1259 OID 22599)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2127 (class 1259 OID 22600)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2114 (class 1259 OID 22585)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2162 (class 1259 OID 22740)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2165 (class 1259 OID 22741)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2166 (class 1259 OID 22752)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- TOC entry 2169 (class 1259 OID 22751)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2150 (class 1259 OID 22697)
-- Name: manager_project_admin_id_42939d5a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_project_admin_id_42939d5a ON manager_project USING btree (admin_id);


--
-- TOC entry 2155 (class 1259 OID 22710)
-- Name: manager_project_contributors_project_id_44dbf4c1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_project_contributors_project_id_44dbf4c1 ON manager_project_contributors USING btree (project_id);


--
-- TOC entry 2158 (class 1259 OID 22711)
-- Name: manager_project_contributors_user_id_d21b8479; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_project_contributors_user_id_d21b8479 ON manager_project_contributors USING btree (user_id);


--
-- TOC entry 2161 (class 1259 OID 22717)
-- Name: manager_requirement_project_id_ccbe1a2b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_requirement_project_id_ccbe1a2b ON manager_requirement USING btree (project_id);


--
-- TOC entry 2130 (class 1259 OID 22663)
-- Name: manager_user_email_05de0422_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_email_05de0422_like ON manager_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 2138 (class 1259 OID 22677)
-- Name: manager_user_groups_group_id_7dacde94; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_groups_group_id_7dacde94 ON manager_user_groups USING btree (group_id);


--
-- TOC entry 2141 (class 1259 OID 22676)
-- Name: manager_user_groups_user_id_09134427; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_groups_user_id_09134427 ON manager_user_groups USING btree (user_id);


--
-- TOC entry 2146 (class 1259 OID 22691)
-- Name: manager_user_user_permissions_permission_id_aeb65b99; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_user_permissions_permission_id_aeb65b99 ON manager_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2149 (class 1259 OID 22690)
-- Name: manager_user_user_permissions_user_id_5a212e9b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_user_permissions_user_id_5a212e9b ON manager_user_user_permissions USING btree (user_id);


--
-- TOC entry 2135 (class 1259 OID 22662)
-- Name: manager_user_username_54055613_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manager_user_username_54055613_like ON manager_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2172 (class 2606 OID 22592)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2171 (class 2606 OID 22587)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2170 (class 2606 OID 22578)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2181 (class 2606 OID 22730)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2182 (class 2606 OID 22735)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_manager_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_manager_user_id FOREIGN KEY (user_id) REFERENCES manager_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2177 (class 2606 OID 22692)
-- Name: manager_project manager_project_admin_id_42939d5a_fk_manager_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project
    ADD CONSTRAINT manager_project_admin_id_42939d5a_fk_manager_user_id FOREIGN KEY (admin_id) REFERENCES manager_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2178 (class 2606 OID 22698)
-- Name: manager_project_contributors manager_project_cont_project_id_44dbf4c1_fk_manager_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project_contributors
    ADD CONSTRAINT manager_project_cont_project_id_44dbf4c1_fk_manager_p FOREIGN KEY (project_id) REFERENCES manager_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2179 (class 2606 OID 22703)
-- Name: manager_project_contributors manager_project_cont_user_id_d21b8479_fk_manager_u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_project_contributors
    ADD CONSTRAINT manager_project_cont_user_id_d21b8479_fk_manager_u FOREIGN KEY (user_id) REFERENCES manager_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2180 (class 2606 OID 22712)
-- Name: manager_requirement manager_requirement_project_id_ccbe1a2b_fk_manager_project_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_requirement
    ADD CONSTRAINT manager_requirement_project_id_ccbe1a2b_fk_manager_project_id FOREIGN KEY (project_id) REFERENCES manager_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2174 (class 2606 OID 22669)
-- Name: manager_user_groups manager_user_groups_group_id_7dacde94_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_groups
    ADD CONSTRAINT manager_user_groups_group_id_7dacde94_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2173 (class 2606 OID 22664)
-- Name: manager_user_groups manager_user_groups_user_id_09134427_fk_manager_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_groups
    ADD CONSTRAINT manager_user_groups_user_id_09134427_fk_manager_user_id FOREIGN KEY (user_id) REFERENCES manager_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2176 (class 2606 OID 22683)
-- Name: manager_user_user_permissions manager_user_user_pe_permission_id_aeb65b99_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_user_permissions
    ADD CONSTRAINT manager_user_user_pe_permission_id_aeb65b99_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2175 (class 2606 OID 22678)
-- Name: manager_user_user_permissions manager_user_user_pe_user_id_5a212e9b_fk_manager_u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manager_user_user_permissions
    ADD CONSTRAINT manager_user_user_pe_user_id_5a212e9b_fk_manager_u FOREIGN KEY (user_id) REFERENCES manager_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-12-04 17:41:31 -02

--
-- PostgreSQL database dump complete
--

