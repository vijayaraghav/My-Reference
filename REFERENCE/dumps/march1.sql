--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.11

-- Started on 2018-03-02 21:36:29 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE bloodhound;
--
-- TOC entry 2643 (class 1262 OID 41543)
-- Name: bloodhound; Type: DATABASE; Schema: -; Owner: bloodhound
--

CREATE DATABASE bloodhound WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE bloodhound OWNER TO bloodhound;

\connect bloodhound

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 254 (class 1259 OID 49395)
-- Name: Dpiaudit; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE "Dpiaudit" (
    id integer NOT NULL,
    question_id integer NOT NULL,
    section_id integer NOT NULL,
    description character varying(255) NOT NULL,
    owner_id character varying(255) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE "Dpiaudit" OWNER TO bloodhound;

--
-- TOC entry 253 (class 1259 OID 49393)
-- Name: Dpiaudit_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE "Dpiaudit_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Dpiaudit_id_seq" OWNER TO bloodhound;

--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 253
-- Name: Dpiaudit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE "Dpiaudit_id_seq" OWNED BY "Dpiaudit".id;


--
-- TOC entry 258 (class 1259 OID 49432)
-- Name: action_note; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE action_note (
    id integer NOT NULL,
    question_id integer NOT NULL,
    owner_id integer NOT NULL,
    type character varying(255) NOT NULL,
    notes character varying(999) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE action_note OWNER TO bloodhound;

--
-- TOC entry 257 (class 1259 OID 49430)
-- Name: action_note_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE action_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_note_id_seq OWNER TO bloodhound;

--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 257
-- Name: action_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE action_note_id_seq OWNED BY action_note.id;


--
-- TOC entry 227 (class 1259 OID 42076)
-- Name: address; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE address (
    id integer NOT NULL,
    addressline1 character varying(255),
    addressline2 character varying(255),
    city character varying(120),
    state character varying(120),
    country character varying(120),
    pincode integer,
    user_id integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    modification_time timestamp without time zone,
    created_by character varying(255),
    modified_by character varying(255)
);


ALTER TABLE address OWNER TO bloodhound;

--
-- TOC entry 226 (class 1259 OID 42074)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_id_seq OWNER TO bloodhound;

--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 226
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- TOC entry 238 (class 1259 OID 42356)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO bloodhound;

--
-- TOC entry 260 (class 1259 OID 49448)
-- Name: answer; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    section_id integer NOT NULL,
    answer_sel character varying(255),
    comments character varying(255) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE answer OWNER TO bloodhound;

--
-- TOC entry 259 (class 1259 OID 49446)
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answer_id_seq OWNER TO bloodhound;

--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 259
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE answer_id_seq OWNED BY answer.id;


--
-- TOC entry 248 (class 1259 OID 49347)
-- Name: assessment; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE assessment (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "assignedTo" character varying(255),
    ass_desc character varying(9999) NOT NULL,
    ass_status character varying(15) NOT NULL,
    template boolean NOT NULL,
    owner_id integer,
    template_id integer,
    project_id integer,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone,
    sending_mail boolean
);


ALTER TABLE assessment OWNER TO bloodhound;

--
-- TOC entry 247 (class 1259 OID 49345)
-- Name: assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assessment_id_seq OWNER TO bloodhound;

--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 247
-- Name: assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE assessment_id_seq OWNED BY assessment.id;


--
-- TOC entry 242 (class 1259 OID 49320)
-- Name: assessmentassigned; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE assessmentassigned (
    id integer NOT NULL,
    assessment_id integer NOT NULL,
    "assignedTo" integer NOT NULL,
    "assginedBy" integer NOT NULL,
    assgined_date timestamp without time zone NOT NULL
);


ALTER TABLE assessmentassigned OWNER TO bloodhound;

--
-- TOC entry 241 (class 1259 OID 49318)
-- Name: assessmentassigned_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE assessmentassigned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assessmentassigned_id_seq OWNER TO bloodhound;

--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 241
-- Name: assessmentassigned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE assessmentassigned_id_seq OWNED BY assessmentassigned.id;


--
-- TOC entry 193 (class 1259 OID 41766)
-- Name: attachment; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE attachment (
    type text NOT NULL,
    id text NOT NULL,
    filename text NOT NULL,
    size integer,
    "time" bigint,
    description text,
    author text,
    ipnr text,
    product text NOT NULL
);


ALTER TABLE attachment OWNER TO bloodhound;

--
-- TOC entry 256 (class 1259 OID 49416)
-- Name: attachments; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE attachments (
    id integer NOT NULL,
    "fileName" character varying(255) NOT NULL,
    "documentLink" character varying(255) NOT NULL,
    question_id integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE attachments OWNER TO bloodhound;

--
-- TOC entry 255 (class 1259 OID 49414)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachments_id_seq OWNER TO bloodhound;

--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 255
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- TOC entry 209 (class 1259 OID 41968)
-- Name: audit; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE audit (
    id integer NOT NULL,
    action character varying(255),
    module character varying(255),
    info character varying(255),
    "createdBy" character varying(255),
    "modifiedBy" character varying(255),
    "creationTime" timestamp without time zone,
    "modificationTime" timestamp without time zone
);


ALTER TABLE audit OWNER TO bloodhound;

--
-- TOC entry 208 (class 1259 OID 41966)
-- Name: audit_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audit_id_seq OWNER TO bloodhound;

--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 208
-- Name: audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE audit_id_seq OWNED BY audit.id;


--
-- TOC entry 181 (class 1259 OID 41560)
-- Name: auth_cookie; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE auth_cookie (
    cookie text NOT NULL,
    name text NOT NULL,
    ipnr text NOT NULL,
    "time" integer
);


ALTER TABLE auth_cookie OWNER TO bloodhound;

--
-- TOC entry 188 (class 1259 OID 41711)
-- Name: bloodhound_product; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE bloodhound_product (
    prefix text NOT NULL,
    name text NOT NULL,
    description text,
    owner text
);


ALTER TABLE bloodhound_product OWNER TO bloodhound;

--
-- TOC entry 203 (class 1259 OID 41890)
-- Name: bloodhound_productconfig; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE bloodhound_productconfig (
    product text NOT NULL,
    section text NOT NULL,
    option text NOT NULL,
    value text
);


ALTER TABLE bloodhound_productconfig OWNER TO bloodhound;

--
-- TOC entry 190 (class 1259 OID 41721)
-- Name: bloodhound_productresourcemap; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE bloodhound_productresourcemap (
    id integer NOT NULL,
    product_id text,
    resource_type text,
    resource_id text
);


ALTER TABLE bloodhound_productresourcemap OWNER TO bloodhound;

--
-- TOC entry 189 (class 1259 OID 41719)
-- Name: bloodhound_productresourcemap_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE bloodhound_productresourcemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bloodhound_productresourcemap_id_seq OWNER TO bloodhound;

--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 189
-- Name: bloodhound_productresourcemap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE bloodhound_productresourcemap_id_seq OWNED BY bloodhound_productresourcemap.id;


--
-- TOC entry 207 (class 1259 OID 41921)
-- Name: bloodhound_relations; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE bloodhound_relations (
    source text NOT NULL,
    type text NOT NULL,
    destination text NOT NULL,
    comment text,
    author text,
    "time" bigint
);


ALTER TABLE bloodhound_relations OWNER TO bloodhound;

--
-- TOC entry 184 (class 1259 OID 41586)
-- Name: cache; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE cache (
    id integer NOT NULL,
    generation integer,
    key text
);


ALTER TABLE cache OWNER TO bloodhound;

--
-- TOC entry 195 (class 1259 OID 41795)
-- Name: component; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE component (
    name text NOT NULL,
    owner text,
    description text,
    product text NOT NULL
);


ALTER TABLE component OWNER TO bloodhound;

--
-- TOC entry 219 (class 1259 OID 42022)
-- Name: department; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying(255),
    "defaultAssignedEmailId" character varying(255)
);


ALTER TABLE department OWNER TO bloodhound;

--
-- TOC entry 218 (class 1259 OID 42020)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE department_id_seq OWNER TO bloodhound;

--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 218
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 198 (class 1259 OID 41837)
-- Name: enum; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE enum (
    type text NOT NULL,
    name text NOT NULL,
    value text,
    product text NOT NULL
);


ALTER TABLE enum OWNER TO bloodhound;

--
-- TOC entry 221 (class 1259 OID 42033)
-- Name: history; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE history (
    id integer NOT NULL,
    sar_id integer,
    "fieldName" character varying(255),
    "oldValue" character varying(255),
    "newValue" character varying(255),
    "createdBy" character varying(255),
    "modifiedBy" character varying(255),
    "creationTime" timestamp without time zone,
    "modificationTime" timestamp without time zone
);


ALTER TABLE history OWNER TO bloodhound;

--
-- TOC entry 220 (class 1259 OID 42031)
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_id_seq OWNER TO bloodhound;

--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 220
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- TOC entry 225 (class 1259 OID 42060)
-- Name: license; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE license (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    customer_name character varying(255),
    file character varying(10000),
    "publicKey" character varying(10000),
    "privateKey" character varying(10000),
    signature character varying(10000),
    license_type character varying(255),
    email character varying(255),
    domain character varying(255),
    no_of_users integer,
    users_left integer,
    no_of_modules integer,
    expary_date timestamp without time zone,
    creation_time timestamp without time zone,
    modification_time timestamp without time zone,
    created_by character varying(255),
    modified_by character varying(255)
);


ALTER TABLE license OWNER TO bloodhound;

--
-- TOC entry 224 (class 1259 OID 42058)
-- Name: license_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE license_id_seq OWNER TO bloodhound;

--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 224
-- Name: license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE license_id_seq OWNED BY license.id;


--
-- TOC entry 213 (class 1259 OID 41992)
-- Name: mail_audit; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE mail_audit (
    id integer NOT NULL,
    email_content character varying(50000),
    receiver_mail character varying(255),
    sender_mail character varying(255),
    status character varying(255),
    subject character varying(255)
);


ALTER TABLE mail_audit OWNER TO bloodhound;

--
-- TOC entry 212 (class 1259 OID 41990)
-- Name: mail_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE mail_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mail_audit_id_seq OWNER TO bloodhound;

--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 212
-- Name: mail_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE mail_audit_id_seq OWNED BY mail_audit.id;


--
-- TOC entry 196 (class 1259 OID 41809)
-- Name: milestone; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE milestone (
    name text NOT NULL,
    due bigint,
    completed bigint,
    description text,
    product text NOT NULL
);


ALTER TABLE milestone OWNER TO bloodhound;

--
-- TOC entry 187 (class 1259 OID 41628)
-- Name: node_change; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE node_change (
    repos integer NOT NULL,
    rev text NOT NULL,
    path text NOT NULL,
    node_type text,
    change_type text NOT NULL,
    base_path text,
    base_rev text
);


ALTER TABLE node_change OWNER TO bloodhound;

--
-- TOC entry 223 (class 1259 OID 42044)
-- Name: organization; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE organization (
    id integer NOT NULL,
    "registrationNumber" character varying(255),
    "companyName" character varying(255),
    "contactNo" character varying(255),
    "vatNumber" character varying(255),
    primary_user character varying(255),
    secondary_user character varying(255),
    user_id integer
);


ALTER TABLE organization OWNER TO bloodhound;

--
-- TOC entry 222 (class 1259 OID 42042)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organization_id_seq OWNER TO bloodhound;

--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 222
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE organization_id_seq OWNED BY organization.id;


--
-- TOC entry 215 (class 1259 OID 42003)
-- Name: payment_plans; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE payment_plans (
    id integer NOT NULL,
    name character varying(255),
    amount integer
);


ALTER TABLE payment_plans OWNER TO bloodhound;

--
-- TOC entry 214 (class 1259 OID 42001)
-- Name: payment_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE payment_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_plans_id_seq OWNER TO bloodhound;

--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 214
-- Name: payment_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE payment_plans_id_seq OWNED BY payment_plans.id;


--
-- TOC entry 199 (class 1259 OID 41851)
-- Name: permission; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE permission (
    username text NOT NULL,
    action text NOT NULL,
    product text NOT NULL
);


ALTER TABLE permission OWNER TO bloodhound;

--
-- TOC entry 246 (class 1259 OID 49336)
-- Name: projects; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE projects (
    id integer NOT NULL,
    proj_id character varying(10) NOT NULL,
    proj_name character varying(255) NOT NULL,
    proj_desc character varying(9999) NOT NULL,
    proj_status character varying(25) NOT NULL,
    created_by integer NOT NULL,
    modified_by integer,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE projects OWNER TO bloodhound;

--
-- TOC entry 245 (class 1259 OID 49334)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO bloodhound;

--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 245
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- TOC entry 252 (class 1259 OID 49379)
-- Name: question; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE question (
    id integer NOT NULL,
    question_type character varying(255) NOT NULL,
    question_label character varying(255) NOT NULL,
    section_id integer,
    action_status character varying(255),
    owner_id integer NOT NULL,
    "isAnswered" boolean NOT NULL,
    comments character varying(255),
    risk_weightage_status character varying(255),
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone
);


ALTER TABLE question OWNER TO bloodhound;

--
-- TOC entry 251 (class 1259 OID 49377)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_id_seq OWNER TO bloodhound;

--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 251
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE question_id_seq OWNED BY question.id;


--
-- TOC entry 240 (class 1259 OID 49312)
-- Name: questionassigned; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE questionassigned (
    id integer NOT NULL,
    question_id integer NOT NULL,
    "assignedTo" integer NOT NULL,
    "assignedBy" integer NOT NULL,
    section_id integer NOT NULL,
    assessment_id integer NOT NULL,
    question_label character varying(255),
    assgined_date timestamp without time zone NOT NULL
);


ALTER TABLE questionassigned OWNER TO bloodhound;

--
-- TOC entry 239 (class 1259 OID 49310)
-- Name: questionassigned_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE questionassigned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questionassigned_id_seq OWNER TO bloodhound;

--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 239
-- Name: questionassigned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE questionassigned_id_seq OWNED BY questionassigned.id;


--
-- TOC entry 201 (class 1259 OID 41867)
-- Name: report; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE report (
    id integer NOT NULL,
    author text,
    title text,
    query text,
    description text,
    product text NOT NULL
);


ALTER TABLE report OWNER TO bloodhound;

--
-- TOC entry 200 (class 1259 OID 41865)
-- Name: report_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_id_seq OWNER TO bloodhound;

--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 200
-- Name: report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE report_id_seq OWNED BY report.id;


--
-- TOC entry 185 (class 1259 OID 41611)
-- Name: repository; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE repository (
    id integer NOT NULL,
    name text NOT NULL,
    value text
);


ALTER TABLE repository OWNER TO bloodhound;

--
-- TOC entry 186 (class 1259 OID 41619)
-- Name: revision; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE revision (
    repos integer NOT NULL,
    rev text NOT NULL,
    "time" bigint,
    author text,
    message text
);


ALTER TABLE revision OWNER TO bloodhound;

--
-- TOC entry 229 (class 1259 OID 42092)
-- Name: sar; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE sar (
    id integer NOT NULL,
    "assignedTo" integer NOT NULL,
    "otherInfo" character varying(255),
    "sarDescription" character varying(255),
    "externalUser" character varying(255),
    representative character varying(255),
    user_confirmed character varying(255),
    rep_confirmed character varying(255),
    priority character varying(255),
    "completionTime" timestamp without time zone,
    status character varying(255),
    user_id integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    modification_time timestamp without time zone,
    created_by character varying(255),
    modified_by character varying(255),
    "isEscalated" boolean
);


ALTER TABLE sar OWNER TO bloodhound;

--
-- TOC entry 237 (class 1259 OID 42168)
-- Name: sar_attachment; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE sar_attachment (
    id integer NOT NULL,
    sarresponse_id integer NOT NULL,
    "documentLink" character varying(255),
    "fileName" character varying(255)
);


ALTER TABLE sar_attachment OWNER TO bloodhound;

--
-- TOC entry 236 (class 1259 OID 42166)
-- Name: sar_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE sar_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sar_attachment_id_seq OWNER TO bloodhound;

--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 236
-- Name: sar_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE sar_attachment_id_seq OWNED BY sar_attachment.id;


--
-- TOC entry 235 (class 1259 OID 42152)
-- Name: sar_escalation; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE sar_escalation (
    id integer NOT NULL,
    user_id integer,
    escalation_data character varying(255),
    sar_id integer NOT NULL,
    justify character varying(255)
);


ALTER TABLE sar_escalation OWNER TO bloodhound;

--
-- TOC entry 234 (class 1259 OID 42150)
-- Name: sar_escalation_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE sar_escalation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sar_escalation_id_seq OWNER TO bloodhound;

--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 234
-- Name: sar_escalation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE sar_escalation_id_seq OWNED BY sar_escalation.id;


--
-- TOC entry 228 (class 1259 OID 42090)
-- Name: sar_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE sar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sar_id_seq OWNER TO bloodhound;

--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 228
-- Name: sar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE sar_id_seq OWNED BY sar.id;


--
-- TOC entry 233 (class 1259 OID 42136)
-- Name: sar_response; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE sar_response (
    id integer NOT NULL,
    sar_id integer NOT NULL,
    "fromUser" character varying(255),
    "toUser" character varying(255),
    "responseText" character varying(255),
    user_id integer,
    user_name character varying(255)
);


ALTER TABLE sar_response OWNER TO bloodhound;

--
-- TOC entry 232 (class 1259 OID 42134)
-- Name: sar_response_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE sar_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sar_response_id_seq OWNER TO bloodhound;

--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 232
-- Name: sar_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE sar_response_id_seq OWNED BY sar_response.id;


--
-- TOC entry 250 (class 1259 OID 49363)
-- Name: section; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE section (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    owner_id integer NOT NULL,
    "parentSectionId" integer,
    assessment_id integer NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_date timestamp without time zone,
    status character varying(255)
);


ALTER TABLE section OWNER TO bloodhound;

--
-- TOC entry 249 (class 1259 OID 49361)
-- Name: section_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE section_id_seq OWNER TO bloodhound;

--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 249
-- Name: section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE section_id_seq OWNED BY section.id;


--
-- TOC entry 244 (class 1259 OID 49328)
-- Name: sectionassigned; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE sectionassigned (
    id integer NOT NULL,
    section_id integer NOT NULL,
    "assignedTo" integer NOT NULL,
    assgined_date timestamp without time zone NOT NULL
);


ALTER TABLE sectionassigned OWNER TO bloodhound;

--
-- TOC entry 243 (class 1259 OID 49326)
-- Name: sectionassigned_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE sectionassigned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sectionassigned_id_seq OWNER TO bloodhound;

--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 243
-- Name: sectionassigned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE sectionassigned_id_seq OWNED BY sectionassigned.id;


--
-- TOC entry 182 (class 1259 OID 41568)
-- Name: session; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE session (
    sid text NOT NULL,
    authenticated integer NOT NULL,
    last_visit integer
);


ALTER TABLE session OWNER TO bloodhound;

--
-- TOC entry 183 (class 1259 OID 41578)
-- Name: session_attribute; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE session_attribute (
    sid text NOT NULL,
    authenticated integer NOT NULL,
    name text NOT NULL,
    value text
);


ALTER TABLE session_attribute OWNER TO bloodhound;

--
-- TOC entry 202 (class 1259 OID 41882)
-- Name: system; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE system (
    name text NOT NULL,
    value text,
    product text NOT NULL
);


ALTER TABLE system OWNER TO bloodhound;

--
-- TOC entry 206 (class 1259 OID 41908)
-- Name: ticket; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE ticket (
    uid integer NOT NULL,
    type text,
    "time" bigint,
    changetime bigint,
    component text,
    severity text,
    priority text,
    owner text,
    reporter text,
    cc text,
    version text,
    milestone text,
    status text,
    resolution text,
    summary text,
    description text,
    keywords text,
    product text,
    id integer NOT NULL,
    sar_id integer,
    created_time timestamp without time zone,
    modified_time timestamp without time zone
);


ALTER TABLE ticket OWNER TO bloodhound;

--
-- TOC entry 191 (class 1259 OID 41736)
-- Name: ticket_change; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE ticket_change (
    ticket integer NOT NULL,
    "time" bigint NOT NULL,
    author text,
    field text NOT NULL,
    oldvalue text,
    newvalue text,
    product text NOT NULL
);


ALTER TABLE ticket_change OWNER TO bloodhound;

--
-- TOC entry 192 (class 1259 OID 41752)
-- Name: ticket_custom; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE ticket_custom (
    ticket integer NOT NULL,
    name text NOT NULL,
    value text,
    product text NOT NULL
);


ALTER TABLE ticket_custom OWNER TO bloodhound;

--
-- TOC entry 205 (class 1259 OID 41906)
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket_id_seq OWNER TO bloodhound;

--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 205
-- Name: ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE ticket_id_seq OWNED BY ticket.id;


--
-- TOC entry 231 (class 1259 OID 42113)
-- Name: ticket_info; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE ticket_info (
    id integer NOT NULL,
    ticket integer NOT NULL,
    department_id integer NOT NULL,
    sar_id integer NOT NULL
);


ALTER TABLE ticket_info OWNER TO bloodhound;

--
-- TOC entry 230 (class 1259 OID 42111)
-- Name: ticket_info_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE ticket_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket_info_id_seq OWNER TO bloodhound;

--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 230
-- Name: ticket_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE ticket_info_id_seq OWNED BY ticket_info.id;


--
-- TOC entry 204 (class 1259 OID 41904)
-- Name: ticket_uid_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE ticket_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket_uid_seq OWNER TO bloodhound;

--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 204
-- Name: ticket_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE ticket_uid_seq OWNED BY ticket.uid;


--
-- TOC entry 217 (class 1259 OID 42011)
-- Name: user_group; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE user_group (
    id integer NOT NULL,
    name character varying(255),
    members character varying(255)
);


ALTER TABLE user_group OWNER TO bloodhound;

--
-- TOC entry 216 (class 1259 OID 42009)
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_group_id_seq OWNER TO bloodhound;

--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE user_group_id_seq OWNED BY user_group.id;


--
-- TOC entry 211 (class 1259 OID 41979)
-- Name: users; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(1000) NOT NULL,
    password character varying(255) NOT NULL,
    user_type character varying(255),
    user_group character varying(255),
    creation_time timestamp without time zone NOT NULL,
    modification_time timestamp without time zone,
    created_by character varying(255),
    modified_by character varying(255),
    confirmed boolean NOT NULL,
    confirmed_on timestamp without time zone,
    token character varying(255),
    password_reset_token character varying
);


ALTER TABLE users OWNER TO bloodhound;

--
-- TOC entry 210 (class 1259 OID 41977)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bloodhound
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO bloodhound;

--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bloodhound
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 197 (class 1259 OID 41823)
-- Name: version; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE version (
    name text NOT NULL,
    "time" bigint,
    description text,
    product text NOT NULL
);


ALTER TABLE version OWNER TO bloodhound;

--
-- TOC entry 194 (class 1259 OID 41780)
-- Name: wiki; Type: TABLE; Schema: public; Owner: bloodhound
--

CREATE TABLE wiki (
    name text NOT NULL,
    version integer NOT NULL,
    "time" bigint,
    author text,
    ipnr text,
    text text,
    comment text,
    readonly integer,
    product text NOT NULL
);


ALTER TABLE wiki OWNER TO bloodhound;

--
-- TOC entry 2309 (class 2604 OID 49398)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY "Dpiaudit" ALTER COLUMN id SET DEFAULT nextval('"Dpiaudit_id_seq"'::regclass);


--
-- TOC entry 2311 (class 2604 OID 49435)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY action_note ALTER COLUMN id SET DEFAULT nextval('action_note_id_seq'::regclass);


--
-- TOC entry 2296 (class 2604 OID 42079)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- TOC entry 2312 (class 2604 OID 49451)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY answer ALTER COLUMN id SET DEFAULT nextval('answer_id_seq'::regclass);


--
-- TOC entry 2306 (class 2604 OID 49350)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY assessment ALTER COLUMN id SET DEFAULT nextval('assessment_id_seq'::regclass);


--
-- TOC entry 2303 (class 2604 OID 49323)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY assessmentassigned ALTER COLUMN id SET DEFAULT nextval('assessmentassigned_id_seq'::regclass);


--
-- TOC entry 2310 (class 2604 OID 49419)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- TOC entry 2287 (class 2604 OID 41971)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY audit ALTER COLUMN id SET DEFAULT nextval('audit_id_seq'::regclass);


--
-- TOC entry 2283 (class 2604 OID 41724)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY bloodhound_productresourcemap ALTER COLUMN id SET DEFAULT nextval('bloodhound_productresourcemap_id_seq'::regclass);


--
-- TOC entry 2292 (class 2604 OID 42025)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2293 (class 2604 OID 42036)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- TOC entry 2295 (class 2604 OID 42063)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY license ALTER COLUMN id SET DEFAULT nextval('license_id_seq'::regclass);


--
-- TOC entry 2289 (class 2604 OID 41995)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY mail_audit ALTER COLUMN id SET DEFAULT nextval('mail_audit_id_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 42047)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY organization ALTER COLUMN id SET DEFAULT nextval('organization_id_seq'::regclass);


--
-- TOC entry 2290 (class 2604 OID 42006)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY payment_plans ALTER COLUMN id SET DEFAULT nextval('payment_plans_id_seq'::regclass);


--
-- TOC entry 2305 (class 2604 OID 49339)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- TOC entry 2308 (class 2604 OID 49382)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY question ALTER COLUMN id SET DEFAULT nextval('question_id_seq'::regclass);


--
-- TOC entry 2302 (class 2604 OID 49315)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY questionassigned ALTER COLUMN id SET DEFAULT nextval('questionassigned_id_seq'::regclass);


--
-- TOC entry 2284 (class 2604 OID 41870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY report ALTER COLUMN id SET DEFAULT nextval('report_id_seq'::regclass);


--
-- TOC entry 2297 (class 2604 OID 42095)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar ALTER COLUMN id SET DEFAULT nextval('sar_id_seq'::regclass);


--
-- TOC entry 2301 (class 2604 OID 42171)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_attachment ALTER COLUMN id SET DEFAULT nextval('sar_attachment_id_seq'::regclass);


--
-- TOC entry 2300 (class 2604 OID 42155)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_escalation ALTER COLUMN id SET DEFAULT nextval('sar_escalation_id_seq'::regclass);


--
-- TOC entry 2299 (class 2604 OID 42139)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_response ALTER COLUMN id SET DEFAULT nextval('sar_response_id_seq'::regclass);


--
-- TOC entry 2307 (class 2604 OID 49366)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY section ALTER COLUMN id SET DEFAULT nextval('section_id_seq'::regclass);


--
-- TOC entry 2304 (class 2604 OID 49331)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sectionassigned ALTER COLUMN id SET DEFAULT nextval('sectionassigned_id_seq'::regclass);


--
-- TOC entry 2285 (class 2604 OID 41911)
-- Name: uid; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket ALTER COLUMN uid SET DEFAULT nextval('ticket_uid_seq'::regclass);


--
-- TOC entry 2286 (class 2604 OID 41912)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket ALTER COLUMN id SET DEFAULT nextval('ticket_id_seq'::regclass);


--
-- TOC entry 2298 (class 2604 OID 42116)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_info ALTER COLUMN id SET DEFAULT nextval('ticket_info_id_seq'::regclass);


--
-- TOC entry 2291 (class 2604 OID 42014)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY user_group ALTER COLUMN id SET DEFAULT nextval('user_group_id_seq'::regclass);


--
-- TOC entry 2288 (class 2604 OID 41982)
-- Name: id; Type: DEFAULT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 49395)
-- Dependencies: 254
-- Data for Name: Dpiaudit; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 253
-- Name: Dpiaudit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('"Dpiaudit_id_seq"', 1, false);


--
-- TOC entry 2636 (class 0 OID 49432)
-- Dependencies: 258
-- Data for Name: action_note; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 257
-- Name: action_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('action_note_id_seq', 1, false);


--
-- TOC entry 2605 (class 0 OID 42076)
-- Dependencies: 227
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (1, 'Chennai', 'Niug', 'chni', '', '', 600702, 1, '2018-02-27 11:13:36.659974', '2018-02-27 10:52:48.830123', '', '');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (2, 'chni', 'TN', 'chni', '', '', 1234567, 2, '2018-02-27 11:13:36.674888', '2018-02-27 10:52:48.830123', '', '');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (3, 'chni', 'TN', 'vel', '', '', 1234, 3, '2018-02-27 11:22:35.93628', '2018-02-27 10:52:48.830123', '', '');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (4, 'vel', 'chni', 'vel', '', '', 7890, 4, '2018-02-27 11:22:35.944519', '2018-02-27 10:52:48.830123', '', '');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (5, 'test', '', '', '', '', 0, 5, '2018-02-27 11:31:01.812631', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (6, 'test', '', '', '', '', 0, 6, '2018-02-27 11:31:01.818761', '2018-02-27 10:52:48.830123', '', 'adfa');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (7, '', '', '', '', '', 0, 7, '2018-02-27 11:52:57.447378', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (8, '', '', '', '', '', 0, 8, '2018-02-27 11:57:04.160998', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (9, '', '', '', '', '', 0, 9, '2018-02-27 12:02:57.718414', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (10, 'test', '', '', '', '', 0, 10, '2018-02-27 12:03:39.444094', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (11, 'test', '', '', '', '', 0, 11, '2018-02-27 12:03:39.450653', '2018-02-27 10:52:48.830123', '', 'adfa');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (12, 'test', '', '', '', '', 0, 12, '2018-02-27 12:04:32.972399', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (13, 'test', '', '', '', '', 0, 13, '2018-02-27 12:04:32.978971', '2018-02-27 10:52:48.830123', '', 'adfa');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (14, '', '', '', '', '', 0, 14, '2018-02-27 12:05:34.834263', '2018-02-27 10:52:48.830123', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (15, '', '', '', '', '', 0, 15, '2018-02-28 02:11:25.885394', '2018-02-27 18:17:05.62064', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (16, '', '', '', '', '', 0, 16, '2018-02-28 02:13:57.943937', '2018-02-27 18:17:05.62064', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (17, '', '', '', '', '', 0, 17, '2018-02-28 02:16:15.240068', '2018-02-27 18:17:05.62064', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (18, '', '', '', '', '', 0, 18, '2018-02-28 06:03:18.958573', '2018-02-28 05:29:59.482149', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (19, '', '', '', '', '', 0, 19, '2018-02-28 06:09:11.682574', '2018-02-28 05:29:59.482149', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (20, '', '', '', '', '', 0, 20, '2018-02-28 06:11:32.254935', '2018-02-28 05:29:59.482149', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (21, '', '', '', '', '', 0, 21, '2018-02-28 06:37:59.971182', '2018-02-28 05:29:59.482149', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (22, '', '', '', '', '', 0, 22, '2018-02-28 08:57:20.321296', '2018-02-28 05:29:59.482149', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (23, '', '', '', '', '', 0, 23, '2018-02-28 09:55:15.220636', '2018-02-28 09:08:31.613576', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (24, '', '', '', '', '', 0, 24, '2018-02-28 10:12:40.375215', '2018-02-28 09:08:31.613576', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (25, '', '', '', '', '', 0, 25, '2018-02-28 10:21:53.515529', '2018-02-28 09:08:31.613576', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (26, '', '', '', '', '', 0, 26, '2018-02-28 11:13:37.492703', '2018-02-28 09:08:31.613576', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (27, '', '', '', '', '', 0, 27, '2018-02-28 11:16:16.189704', '2018-02-28 09:08:31.613576', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (28, '', '', '', '', '', 0, 28, '2018-02-28 11:16:16.196044', '2018-02-28 09:08:31.613576', '', 'adfa');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (29, '', '', '', '', '', 0, 29, '2018-02-28 16:44:50.479341', '2018-02-28 13:27:58.293817', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (30, '', '', '', '', '', 0, 31, '2018-03-01 01:08:06.645813', '2018-02-28 20:24:42.988857', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (31, 'SSK38', '', '', '', '', 0, 32, '2018-03-01 06:07:45.338948', '2018-02-28 20:24:42.988857', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (32, 'tjk', 'adf', 'wfd', 'Eckerö', 'Åland Islands', 123, 35, '2018-03-01 06:38:41.155891', '2018-02-28 20:24:42.988857', '', '');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (33, '', '', '', '', '', 0, 36, '2018-03-01 13:45:06.754068', '2018-03-01 06:46:28.492648', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (34, 'ssk41', '', '', '', '', 0, 37, '2018-03-02 07:01:11.31113', '2018-03-01 16:08:13.598637', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (35, 'ssk41', '', '', '', '', 0, 38, '2018-03-02 07:01:11.320584', '2018-03-01 16:08:13.598637', '', 'adfa');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (36, 'lkajdflk', '', '', '', '', 0, 39, '2018-03-02 13:25:39.536766', '2018-03-01 16:08:13.598637', '', 'sdfdsf');
INSERT INTO address (id, addressline1, addressline2, city, state, country, pincode, user_id, creation_time, modification_time, created_by, modified_by) VALUES (37, 'lkajdflkj', '', '', '', '', 0, 40, '2018-03-02 13:25:39.543021', '2018-03-01 16:08:13.598637', '', 'adfa');


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 226
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('address_id_seq', 37, true);


--
-- TOC entry 2616 (class 0 OID 42356)
-- Dependencies: 238
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2638 (class 0 OID 49448)
-- Dependencies: 260
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO answer (id, question_id, section_id, answer_sel, comments, created_date, modified_date) VALUES (1, 1, 1, 'Yes', 'answer', '2018-03-02 19:37:42.259965', NULL);


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 259
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('answer_id_seq', 1, true);


--
-- TOC entry 2626 (class 0 OID 49347)
-- Dependencies: 248
-- Data for Name: assessment; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO assessment (id, name, "assignedTo", ass_desc, ass_status, template, owner_id, template_id, project_id, created_date, modified_date, sending_mail) VALUES (1, 'assessment ', NULL, 'assessment desc', 'Open', false, NULL, NULL, 1, '2018-03-02 13:46:51.353002', '2018-03-02 20:58:10.605912', false);


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 247
-- Name: assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('assessment_id_seq', 1, true);


--
-- TOC entry 2620 (class 0 OID 49320)
-- Dependencies: 242
-- Data for Name: assessmentassigned; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO assessmentassigned (id, assessment_id, "assignedTo", "assginedBy", assgined_date) VALUES (1, 1, 1, 3, '2018-03-02 13:47:22.022312');


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 241
-- Name: assessmentassigned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('assessmentassigned_id_seq', 1, true);


--
-- TOC entry 2571 (class 0 OID 41766)
-- Dependencies: 193
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2634 (class 0 OID 49416)
-- Dependencies: 256
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 255
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- TOC entry 2587 (class 0 OID 41968)
-- Dependencies: 209
-- Data for Name: audit; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (1, 'Assign SAR', 'SAR', 'Assign SAR', '5', NULL, '2018-02-27 11:38:47.392435', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (2, 'Assign SAR', 'SAR', 'Assign SAR', '5', NULL, '2018-02-27 11:47:49.488057', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (3, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 11:48:02.88129', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (4, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 11:48:03.709278', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (5, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 11:49:18.361541', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (6, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 11:49:19.226984', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (7, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 12:07:41.245189', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (8, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 12:07:42.099036', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (9, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 18:29:53.700157', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (10, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 18:29:54.592434', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (11, 'Assign SAR', 'SAR', 'Assign SAR', '9', NULL, '2018-02-27 18:32:47.357186', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (12, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 18:36:49.24564', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (13, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-27 18:36:49.550024', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (14, 'Assign SAR', 'SAR', 'Assign SAR', '17', NULL, '2018-02-28 05:18:18.326576', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (15, 'Assign SAR', 'SAR', 'Assign SAR', '20', NULL, '2018-02-28 06:16:12.390479', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (16, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 06:17:43.811102', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (17, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 06:17:44.638662', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (18, 'Assign SAR', 'SAR', 'Assign SAR', '22', NULL, '2018-02-28 08:59:25.414049', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (19, 'Assign SAR', 'SAR', 'Assign SAR', '25', NULL, '2018-02-28 11:01:58.018442', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (20, 'Complete SAR', 'SAR', 'Complete SAR', '9', NULL, '2018-02-28 14:46:28.188546', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (21, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 14:52:07.334732', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (22, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 14:52:08.154021', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (23, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 14:52:22.780129', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (24, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 14:52:23.065265', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (25, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:38:40.958309', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (26, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:38:41.80259', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (27, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:40:00.192076', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (28, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:40:00.499388', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (29, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:45:18.509419', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (30, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 16:45:19.377862', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (31, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:25.066154', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (32, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:25.310264', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (33, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:25.329605', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (34, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:26.148812', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (35, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:26.375293', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (36, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:45:26.402132', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (37, 'Assign SAR', 'SAR', 'Assign SAR', '14', NULL, '2018-02-28 22:47:19.4681', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (38, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:49:48.742374', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (39, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-02-28 22:49:49.040537', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (40, 'Assign SAR', 'SAR', 'Assign SAR', '5', NULL, '2018-02-28 22:55:18.728032', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (41, 'Assign SAR', 'SAR', 'Assign SAR', '31', NULL, '2018-03-01 01:17:21.529553', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (42, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 01:17:58.897225', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (43, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 01:17:59.696559', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (44, 'Assign SAR', 'SAR', 'Assign SAR', '32', NULL, '2018-03-01 06:09:10.006676', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (45, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:09:46.288806', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (46, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:09:47.130067', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (47, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:17:03.551267', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (48, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:17:04.500327', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (49, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:18:29.559729', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (50, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:18:30.146217', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (51, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:20:51.980095', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (52, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 06:20:52.853971', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (53, 'Assign SAR', 'SAR', 'Assign SAR', '36', NULL, '2018-03-01 13:49:14.442028', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (54, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 13:51:09.505596', NULL);
INSERT INTO audit (id, action, module, info, "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (55, 'Create Ticket', 'SAR', 'Create Ticket', '1', NULL, '2018-03-01 13:51:10.39731', NULL);


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 208
-- Name: audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('audit_id_seq', 55, true);


--
-- TOC entry 2559 (class 0 OID 41560)
-- Dependencies: 181
-- Data for Name: auth_cookie; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO auth_cookie (cookie, name, ipnr, "time") VALUES ('e6a9fa3ce669aff4736624d099a06646', 'admin', '1.186.119.219', 1519837287);
INSERT INTO auth_cookie (cookie, name, ipnr, "time") VALUES ('aa9b47bcfdfdcd7e51ed118ec41a943b', 'admin', '49.206.127.243', 1519837377);
INSERT INTO auth_cookie (cookie, name, ipnr, "time") VALUES ('b4ca938f0b41ae8f2ff3db64d15e1819', 'admin', '122.174.80.88', 1519884651);
INSERT INTO auth_cookie (cookie, name, ipnr, "time") VALUES ('57dc7dc50c9d42a8788f5114fe494b28', 'admin', '122.174.80.88', 1519899971);


--
-- TOC entry 2566 (class 0 OID 41711)
-- Dependencies: 188
-- Data for Name: bloodhound_product; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO bloodhound_product (prefix, name, description, owner) VALUES ('@', 'Default', 'Default product', '');


--
-- TOC entry 2581 (class 0 OID 41890)
-- Dependencies: 203
-- Data for Name: bloodhound_productconfig; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2568 (class 0 OID 41721)
-- Dependencies: 190
-- Data for Name: bloodhound_productresourcemap; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 189
-- Name: bloodhound_productresourcemap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('bloodhound_productresourcemap_id_seq', 1, false);


--
-- TOC entry 2585 (class 0 OID 41921)
-- Dependencies: 207
-- Data for Name: bloodhound_relations; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2562 (class 0 OID 41586)
-- Dependencies: 184
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO cache (id, generation, key) VALUES (1722364385, 0, 'trac.perm.DefaultPermissionStore._all_permissions');
INSERT INTO cache (id, generation, key) VALUES (901198563, 56, 'trac.wiki.api.WikiSystem.pages');


--
-- TOC entry 2573 (class 0 OID 41795)
-- Dependencies: 195
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO component (name, owner, description, product) VALUES ('component1', 'somebody', NULL, '@');
INSERT INTO component (name, owner, description, product) VALUES ('component2', 'somebody', NULL, '@');


--
-- TOC entry 2597 (class 0 OID 42022)
-- Dependencies: 219
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO department (id, name, "defaultAssignedEmailId") VALUES (2, 'Finance', 'rahul@gmail.com');
INSERT INTO department (id, name, "defaultAssignedEmailId") VALUES (1, 'Marketing', 'tharani10d@gmail.com');


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 218
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2576 (class 0 OID 41837)
-- Dependencies: 198
-- Data for Name: enum; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO enum (type, name, value, product) VALUES ('resolution', 'fixed', '1', '@');
INSERT INTO enum (type, name, value, product) VALUES ('resolution', 'invalid', '2', '@');
INSERT INTO enum (type, name, value, product) VALUES ('resolution', 'wontfix', '3', '@');
INSERT INTO enum (type, name, value, product) VALUES ('resolution', 'duplicate', '4', '@');
INSERT INTO enum (type, name, value, product) VALUES ('resolution', 'worksforme', '5', '@');
INSERT INTO enum (type, name, value, product) VALUES ('priority', 'blocker', '1', '@');
INSERT INTO enum (type, name, value, product) VALUES ('priority', 'critical', '2', '@');
INSERT INTO enum (type, name, value, product) VALUES ('priority', 'major', '3', '@');
INSERT INTO enum (type, name, value, product) VALUES ('priority', 'minor', '4', '@');
INSERT INTO enum (type, name, value, product) VALUES ('priority', 'trivial', '5', '@');
INSERT INTO enum (type, name, value, product) VALUES ('ticket_type', 'defect', '1', '@');
INSERT INTO enum (type, name, value, product) VALUES ('ticket_type', 'enhancement', '2', '@');
INSERT INTO enum (type, name, value, product) VALUES ('ticket_type', 'task', '3', '@');


--
-- TOC entry 2599 (class 0 OID 42033)
-- Dependencies: 221
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (1, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:37:54.998329', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (2, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:37:55.236546', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (3, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:37:55.516979', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (4, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:37:55.982278', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (5, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:37:56.97419', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (6, 1, 'assignedTo', '1', '0', '5', 'abinaya12', '2018-02-27 11:38:04.697511', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (7, 1, 'assignedTo', '1', '5', '5', 'abinaya12', '2018-02-27 11:38:47.381426', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (8, 1, 'assignedTo', '5', '0', '5', 'abinaya12', '2018-02-27 11:45:29.492858', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (9, 1, 'assignedTo', '5', '0', '5', 'abinaya12', '2018-02-27 11:45:40.258938', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (10, 1, 'assignedTo', '5', '0', '5', 'abinaya12', '2018-02-27 11:47:40.540508', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (11, 1, 'assignedTo', '5', '5', '5', 'abinaya12', '2018-02-27 11:47:49.47926', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (12, 4, 'assignedTo', '1', '5', '9', 'Sunilsk1', '2018-02-27 18:32:47.345767', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (13, 10, 'assignedTo', '1', '3', '17', '1234ssk', '2018-02-28 05:18:18.317418', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (14, 6, 'Priority', 'Medium', 'Low', '12', 'abinaya1', '2018-02-28 05:59:22.442352', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (15, 13, 'assignedTo', '1', '3', '20', 'ssk23', '2018-02-28 06:16:12.381022', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (16, 15, 'assignedTo', '1', '3', '22', 'ssk25', '2018-02-28 08:59:25.404924', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (17, 18, 'assignedTo', '1', '3', '25', 'ssk28', '2018-02-28 11:01:58.007839', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (18, 4, 'status', 'Active', 'Closed', '9', 'Sunilsk1', '2018-02-28 14:46:28.194018', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (19, 7, 'assignedTo', '1', '3', '14', 'sunil123', '2018-02-28 22:47:19.455624', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (20, 1, 'assignedTo', '5', '3', '5', 'abinaya12', '2018-02-28 22:55:18.718733', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (21, 22, 'assignedTo', '1', '3', '31', 'ssk37', '2018-03-01 01:17:21.520537', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (22, 1, 'Priority', 'Medium', 'Medium', '5', 'abinaya12', '2018-03-01 06:02:35.437978', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (23, 23, 'assignedTo', '1', '3', '32', 'SSK38', '2018-03-01 06:09:09.997061', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (24, 3, 'Priority', 'Medium', 'High', '8', 'Sunilsk', '2018-03-01 06:21:54.294982', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (25, 3, 'Priority', 'High', 'Low', '8', 'Sunilsk', '2018-03-01 06:22:58.837335', NULL);
INSERT INTO history (id, sar_id, "fieldName", "oldValue", "newValue", "createdBy", "modifiedBy", "creationTime", "modificationTime") VALUES (26, 24, 'assignedTo', '1', '3', '36', 'SSK40', '2018-03-01 13:49:14.431401', NULL);


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 220
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('history_id_seq', 26, true);


--
-- TOC entry 2603 (class 0 OID 42060)
-- Dependencies: 225
-- Data for Name: license; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 224
-- Name: license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('license_id_seq', 1, false);


--
-- TOC entry 2591 (class 0 OID 41992)
-- Dependencies: 213
-- Data for Name: mail_audit; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (3, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya12,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/1">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/55653bbe-1708-4388-9656-52e0abed675a">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (4, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinay12rep,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/1">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/d883ec27-f990-4458-ad5d-9e8944c728e7">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12rep@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (1, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear khalisaran,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please <a href="http://35.169.62.69:5000/confirm/9d20f346-4e8a-4e10-8107-801af1314beb" style="color: #F15A25;">verify</a> your email address. <br /> <br />

Your License Key:
	


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The (Company Name) does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'khalisaran@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (2, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please <a href="http://35.169.62.69:5000/confirm/0aadaecf-4332-467d-83b0-59774f66db28" style="color: #F15A25;">verify</a> your email address. <br /> <br />

Your License Key:
	


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The (Company Name) does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (9, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear Sunilsk1,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/4">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/1069fb43-62a6-45ae-bc2a-b7b57040d269">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sunil.kulkarni@compliancecompendium.co.uk', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (7, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear Sunil,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/2">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/6e73c728-43a7-4bd6-8045-421493fdd366">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sunilskulkarni@hotmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (8, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear Sunilsk,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/3">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/e88e2646-034f-42ed-972d-e0408d761ac6">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sunil.kulkarni.s@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (13, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinayrepp,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/6">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/8e65f848-0e31-4c1d-ab9d-6f6646b08e41">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinayarepp@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (14, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear sunil123,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/7">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/d4b07175-19be-4e1f-84aa-d96b6be8f5f6">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dummy@xyz.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (11, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinay12repp,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/5">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/28ee86dd-c86d-47c4-9674-6556a416614a">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12repp@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (12, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya1,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/6">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/75ee57cf-0bc8-47c4-9ca3-661761542a40">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya1@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (17, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear Sunilsk123,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/9">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/02c6ccc6-6e0b-451e-8afa-b03566e78d89">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', '234@xyz.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (18, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear 1234ssk,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/10">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/3ccbd32d-8546-4147-8d64-5144b8623bbd">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', '1234@ssk.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (16, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear Sunil.S.K,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/8">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/4a3c0a26-fa4f-4aaa-8b79-c77adbd347f7">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', '123@xyz.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (21, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk22,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/12">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/ae42d7c4-54e1-4d15-9240-ffb6aa558b8e">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk22@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (24, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk24,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/14">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/c264535b-8052-47d0-b082-ba50dcbcbfb2">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk24@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (22, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk23,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/13">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/94d14ce1-5e5b-4551-809c-b0d87cb49111">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk23@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (27, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk26,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/16">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/666c388d-f271-4d8e-b0e4-e0899ca07b64">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sunilskulkarni@hotmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (26, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:15<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (25, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk25,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/15">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/7f40aa22-0ae2-411a-8cf8-7804de149ca5">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk25@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (28, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk27,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/17">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/d8a025f2-3b75-4a5c-9a22-e03fdeaaebe3">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sunilskulkarni@hotmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (23, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:13<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (20, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk21,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/11">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/39fab40b-8494-4a7b-9969-00ddb75456db">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk21@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (10, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya122,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/5">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/054560a7-2c98-4ae1-b3f4-fdc6965ced40">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya122@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (29, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk28,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/18">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/13ecfb67-2111-4e35-aaa2-f79b22581537">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'tibrewalrahul01@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (31, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk30,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/19">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/ab645927-50f0-4117-a8a2-af40d19a3494">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ccc99vbnbnbn@hotmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (19, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:10<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (15, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya12,<br /><br />

Your subject access request was updated on 2018-02-27 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:4<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (6, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya12,<br /><br />

Your subject access request was updated on 2018-02-27 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:1<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (30, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:18<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (5, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya12,<br /><br />

Your subject access request was updated on 2018-02-27 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:1<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (32, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear sar31,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/20">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/1ba2034d-8479-4861-b8af-8d646c2c96df">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sar31@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (33, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear sar31-2,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/20">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/bad060a1-5428-49b5-a9f0-a550553e91a0">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sar32@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (34, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya12,<br /><br />

We hope you are satisfied with the recent SAR that you raised with  Compliance Compedium<br /> <br />

This SAR is now considered as closed.<br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br /><br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p><br /><br />

Ticket ID:4<br />
Type:SAR<br />
Status:Closed<br />
Priority:Medium
</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya12@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Your SAR closed successfully');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (35, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ,<br /><br />

Your subject access request was updated on  requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 <br /> <br />

Ticket ID:<br />
Type:SAR<br />
Status:<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'tharani10d@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'SAR closed successfully');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (36, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk35,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/21">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/dc59f350-dd2f-4fad-aa58-3b3ad39c8088">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk35@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (37, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:7<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (38, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-02-28 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:1<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (39, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk37,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/22">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/85179c59-26e6-448b-b806-eeb92b043cd0">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk37@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (40, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-03-01 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:22<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (41, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear SSK38,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/23">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/a27744c1-9064-4f6c-a4a5-b3311c76d295">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ramesh2010.web@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (43, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear abinaya,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please <a href="http://35.169.62.69:5000/confirm/79a7297d-267b-486e-a311-c6bad437e365" style="color: #F15A25;">verify</a> your email address. <br /> <br />

Your License Key:
	


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The (Company Name) does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'abinaya.s@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (42, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-03-01 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:23<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (44, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear SSK40,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/24">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/98d7d4c6-f09a-44f2-9e83-a92a49b2682f">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk40@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (45, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>
	
<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear dhinakar,<br /><br />

Your subject access request was updated on 2018-03-01 requires your feedback <br /> <br />

Can you please login using the link below to review your SAR.
<br /><br /><a href="#" style="color: #F15A25;">(Link)</a><br /><br /> 

Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

Ticket ID:24<br />
Type:SAR<br />
Status:Open<br />
Priority:<br /><br /><br />
<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'dhinakar@10decoders.in', 'compliancec2k18@gmail.com', 'sent', 'SAR Assign');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (46, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk41,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/25">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/c91755e7-b300-4407-9bd9-df5529a20d68">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk41@21.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (48, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssura abcd,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/user/26">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/38b47c3f-81f6-4eb8-a64d-aa271a330740">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'sruse@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (49, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ajdlkfja,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/26">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/34e6ad90-b23b-4047-844d-2572e11dbb88">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'alskjfdalkj@gmail.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');
INSERT INTO mail_audit (id, email_content, receiver_mail, sender_mail, status, subject) VALUES (47, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Compliance Compendium</title>
</head>
<body style="font-family: Arial; font-size: 14px; background-color: #eee; padding-top: 20px;">


<table style="width: 600px;" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
	<thead>
		<tr>

<td colspan="2" align="right" style="padding:10px 15px 15px 10px; background-color: #0B1C47;"><img src="https://www.compliancecompendium.co.uk/wp-content/uploads/2018/01/logo.png" height="70" alt="" />
</td>
</tr>
	</thead>

<tr>
<td></td>
<td>
<div class="content">
<table style="padding:15px 20px 20px 20px;">
<tr>
<td>
<p>Dear ssk41,<br /><br />

Thank you for registering your SAR with  Compliance Compedium. <br /> <br />

In accordance with the UK DPA and EU GDPR your SAR will be actioned within 30 days of being
submitted. <br /><br />

The final step before your Subject Access Request goes live – can you please Verify your Account. <br /> <br />

   <a href="http://35.169.62.69:5000/sar/active/representative/25">Activate SAR</a>
    <br />
    <a href="http://35.169.62.69:5000/confirm/807499d1-5982-4a62-901a-3e4bb8aa8b6c">Activate Account</a>
    <br />
    Default password for Representative is: 123

<br /> <br />


Thank you <br /> <br />

Compliance Team <br /> <br />

 Compliance Compedium <br /> <br />

<span style="font-size: 11px;">The information in this email (and any attachment) may be for the intended recipient only. If you know you are not the intended recipient, please do not use or disclose the information in any way and please delete this email (and any attachment) from your system. <br />
The  Compliance Compedium does not accept service of legal documents by e-mail.</span></p>


</td>
</tr>
</table>
</div>
</td>
<td></td>
</tr>
</table>
</body>
</html>', 'ssk41@22.com', 'compliancec2k18@gmail.com', 'sent', 'Please confirm your email');


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 212
-- Name: mail_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('mail_audit_id_seq', 49, true);


--
-- TOC entry 2574 (class 0 OID 41809)
-- Dependencies: 196
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO milestone (name, due, completed, description, product) VALUES ('milestone1', 0, 0, NULL, '@');
INSERT INTO milestone (name, due, completed, description, product) VALUES ('milestone2', 0, 0, NULL, '@');
INSERT INTO milestone (name, due, completed, description, product) VALUES ('milestone3', 0, 0, NULL, '@');
INSERT INTO milestone (name, due, completed, description, product) VALUES ('milestone4', 0, 0, NULL, '@');


--
-- TOC entry 2565 (class 0 OID 41628)
-- Dependencies: 187
-- Data for Name: node_change; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2601 (class 0 OID 42044)
-- Dependencies: 223
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO organization (id, "registrationNumber", "companyName", "contactNo", "vatNumber", primary_user, secondary_user, user_id) VALUES (1, '12345', 'compliance', '123456890', '67890', 'khalisaran@10decoders.in', 'tharani10d@gmail.com', 1);
INSERT INTO organization (id, "registrationNumber", "companyName", "contactNo", "vatNumber", primary_user, secondary_user, user_id) VALUES (2, '12345', '10d', '1234567890', '4567', 'dhinakar@10decoders.in', 'thomas@10decoders.com', 3);


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 222
-- Name: organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('organization_id_seq', 2, true);


--
-- TOC entry 2593 (class 0 OID 42003)
-- Dependencies: 215
-- Data for Name: payment_plans; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 214
-- Name: payment_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('payment_plans_id_seq', 1, false);


--
-- TOC entry 2577 (class 0 OID 41851)
-- Dependencies: 199
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO permission (username, action, product) VALUES ('anonymous', 'LOG_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'FILE_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'WIKI_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'WIKI_CREATE', '@');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'WIKI_MODIFY', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'SEARCH_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'REPORT_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'REPORT_SQL_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'TICKET_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'TICKET_CREATE', '@');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'TICKET_MODIFY', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'BROWSER_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'TIMELINE_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'CHANGESET_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'ROADMAP_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'MILESTONE_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('admin', 'TRAC_ADMIN', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'PRODUCT_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'PRODUCT_VIEW', '@');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'LOG_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'FILE_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'WIKI_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'WIKI_CREATE', '');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'WIKI_MODIFY', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'SEARCH_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'REPORT_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'REPORT_SQL_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'TICKET_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'TICKET_CREATE', '');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'TICKET_MODIFY', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'BROWSER_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'TIMELINE_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'CHANGESET_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'ROADMAP_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'MILESTONE_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('admin', 'TRAC_ADMIN', '');
INSERT INTO permission (username, action, product) VALUES ('anonymous', 'PRODUCT_VIEW', '');
INSERT INTO permission (username, action, product) VALUES ('authenticated', 'PRODUCT_VIEW', '');


--
-- TOC entry 2624 (class 0 OID 49336)
-- Dependencies: 246
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO projects (id, proj_id, proj_name, proj_desc, proj_status, created_by, modified_by, created_date, modified_date) VALUES (1, 'P101', 'proj_name', 'proj_desc test edit', 'Open', 2, NULL, '2018-03-02 13:46:10.807444', '2018-03-02 13:46:21.842992');


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 245
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('projects_id_seq', 1, true);


--
-- TOC entry 2630 (class 0 OID 49379)
-- Dependencies: 252
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO question (id, question_type, question_label, section_id, action_status, owner_id, "isAnswered", comments, risk_weightage_status, created_date, modified_date) VALUES (1, 'single', 'what are you doing?', 1, 'Sign-Off Requested', 2, true, '', '', '2018-03-02 13:47:15.565267', '2018-03-02 19:37:54.048814');


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 251
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('question_id_seq', 1, true);


--
-- TOC entry 2618 (class 0 OID 49312)
-- Dependencies: 240
-- Data for Name: questionassigned; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO questionassigned (id, question_id, "assignedTo", "assignedBy", section_id, assessment_id, question_label, assgined_date) VALUES (1, 1, 1, 3, 1, 1, NULL, '2018-03-02 19:38:34.87144');


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 239
-- Name: questionassigned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('questionassigned_id_seq', 1, true);


--
-- TOC entry 2579 (class 0 OID 41867)
-- Dependencies: 201
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO report (id, author, title, query, description, product) VALUES (1, NULL, 'Active Tickets', 'SELECT p.value AS __color__,
   id AS ticket, summary, component, version, milestone, t.type AS type,
   owner, status,
   time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status <> ''closed''
  ORDER BY CAST(p.value AS int), milestone, t.type, time
', ' * List all active tickets by priority.
 * Color each row based on priority.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (2, NULL, 'Active Tickets by Version', 'SELECT p.value AS __color__,
   version AS __group__,
   id AS ticket, summary, component, version, t.type AS type,
   owner, status,
   time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status <> ''closed''
  ORDER BY (version IS NULL),version, CAST(p.value AS int), t.type, time
', 'This report shows how to color results by priority,
while grouping results by version.

Last modification time, description and reporter are included as hidden fields
for useful RSS export.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (3, NULL, 'Active Tickets by Milestone', 'SELECT p.value AS __color__,
   ''Milestone ''||milestone AS __group__,
   id AS ticket, summary, component, version, t.type AS type,
   owner, status,
   time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status <> ''closed''
  ORDER BY (milestone IS NULL),milestone, CAST(p.value AS int), t.type, time
', 'This report shows how to color results by priority,
while grouping results by milestone.

Last modification time, description and reporter are included as hidden fields
for useful RSS export.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (4, NULL, 'Accepted, Active Tickets by Owner', 'SELECT p.value AS __color__,
   owner AS __group__,
   id AS ticket, summary, component, milestone, t.type AS type, time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status = ''accepted''
  ORDER BY owner, CAST(p.value AS int), t.type, time
', 'List accepted tickets, group by ticket owner, sorted by priority.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (5, NULL, 'Accepted, Active Tickets by Owner (Full Description)', 'SELECT p.value AS __color__,
   owner AS __group__,
   id AS ticket, summary, component, milestone, t.type AS type, time AS created,
   description AS _description_,
   changetime AS _changetime, reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status = ''accepted''
  ORDER BY owner, CAST(p.value AS int), t.type, time
', 'List tickets accepted, group by ticket owner.
This report demonstrates the use of full-row display.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (6, NULL, 'All Tickets By Milestone  (Including closed)', 'SELECT p.value AS __color__,
   t.milestone AS __group__,
   (CASE status
      WHEN ''closed'' THEN ''color: #777; background: #ddd; border-color: #ccc;''
      ELSE
        (CASE owner WHEN $USER THEN ''font-weight: bold'' END)
    END) AS __style__,
   id AS ticket, summary, component, status,
   resolution,version, t.type AS type, priority, owner,
   changetime AS modified,
   time AS _time,reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  ORDER BY (milestone IS NULL), milestone DESC, (status = ''closed''),
        (CASE status WHEN ''closed'' THEN changetime ELSE (-1) * CAST(p.value AS int) END) DESC
', 'A more complex example to show how to make advanced reports.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (7, NULL, 'My Tickets', 'SELECT  __color__, __group,
       (CASE
         WHEN __group = 1 THEN ''Accepted''
         WHEN __group = 2 THEN ''Owned''
         WHEN __group = 3 THEN ''Reported''
         ELSE ''Commented'' END) AS __group__,
       ticket, summary, component, version, milestone,
       type, priority, created, _changetime, _description,
       _reporter
FROM (
 SELECT DISTINCT CAST(p.value AS int) AS __color__,
      (CASE
         WHEN owner = $USER AND status = ''accepted'' THEN 1
         WHEN owner = $USER THEN 2
         WHEN reporter = $USER THEN 3
         ELSE 4 END) AS __group,
       t.id AS ticket, summary, component, version, milestone,
       t.type AS type, priority, t.time AS created,
       t.changetime AS _changetime, description AS _description,
       reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  LEFT JOIN ticket_change tc ON tc.ticket = t.id AND tc.author = $USER
                                AND tc.field = ''comment''
  WHERE t.status <> ''closed''
        AND (owner = $USER OR reporter = $USER OR author = $USER)
) AS sub
ORDER BY __group, __color__, milestone, type, created
', 'This report demonstrates the use of the automatically set
USER dynamic variable, replaced with the username of the
logged in user when executed.
', '@');
INSERT INTO report (id, author, title, query, description, product) VALUES (8, NULL, 'Active Tickets, Mine first', 'SELECT p.value AS __color__,
   (CASE owner
     WHEN $USER THEN ''My Tickets''
     ELSE ''Active Tickets''
    END) AS __group__,
   id AS ticket, summary, component, version, milestone, t.type AS type,
   owner, status,
   time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t
  LEFT JOIN enum p ON p.name = t.priority AND p.type = ''priority''
  WHERE status <> ''closed''
  ORDER BY (COALESCE(owner, '''') = $USER) DESC, CAST(p.value AS int), milestone, t.type, time
', ' * List all active tickets by priority.
 * Show all tickets owned by the logged in user in a group first.
', '@');


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 200
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('report_id_seq', 8, true);


--
-- TOC entry 2563 (class 0 OID 41611)
-- Dependencies: 185
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2564 (class 0 OID 41619)
-- Dependencies: 186
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2607 (class 0 OID 42092)
-- Dependencies: 229
-- Data for Name: sar; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (2, 1, '', 'Personal Info', 'Sunil', '', NULL, NULL, 'Medium', '2018-02-27 11:52:57.453887', 'Open', 7, '2018-02-27 11:52:57.453928', '2018-02-27 10:52:48.852285', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (5, 1, '', 'test', 'abinaya122', 'abinay12repp', NULL, NULL, 'Medium', '2018-02-27 12:03:39.456726', 'Open', 10, '2018-02-27 12:03:39.456749', '2018-02-27 10:52:48.852285', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (8, 1, '', '123', 'Sunil.S.K', '', NULL, NULL, 'Medium', '2018-02-28 02:11:25.894714', 'Open', 15, '2018-02-28 02:11:25.89474', '2018-02-27 18:17:05.642798', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (9, 1, '', '123', 'Sunilsk123', '', NULL, NULL, 'Medium', '2018-02-28 02:13:57.950722', 'Open', 16, '2018-02-28 02:13:57.950742', '2018-02-27 18:17:05.642798', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (10, 3, '', '1234', '1234ssk', '', NULL, NULL, 'Medium', '2018-02-28 02:16:15.246768', 'InProgress', 17, '2018-02-28 02:16:15.246789', '2018-02-27 18:17:05.642798', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (6, 1, '', 'test', 'abinaya1', 'abinayrepp', NULL, NULL, 'Low', '2018-02-27 12:04:32.985013', 'Open', 12, '2018-02-27 12:04:32.985033', '2018-02-27 10:52:48.852285', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (11, 1, '', '21', 'ssk21', '', NULL, NULL, 'Medium', '2018-02-28 06:03:18.967484', 'Open', 18, '2018-02-28 06:03:18.967507', '2018-02-28 05:29:59.503519', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (12, 1, '', '21', 'ssk22', '', NULL, NULL, 'Medium', '2018-02-28 06:09:11.689244', 'Open', 19, '2018-02-28 06:09:11.689267', '2018-02-28 05:29:59.503519', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (13, 3, '', '23', 'ssk23', '', NULL, NULL, 'Medium', '2018-02-28 06:11:32.261251', 'InProgress', 20, '2018-02-28 06:11:32.261271', '2018-02-28 05:29:59.503519', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (14, 1, '', '24', 'ssk24', '', NULL, NULL, 'Medium', '2018-02-28 06:37:59.979939', 'Open', 21, '2018-02-28 06:37:59.979966', '2018-02-28 05:29:59.503519', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (15, 3, '', '25', 'ssk25', '', NULL, NULL, 'Medium', '2018-02-28 08:57:20.328144', 'InProgress', 22, '2018-02-28 08:57:20.328166', '2018-02-28 05:29:59.503519', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (16, 1, '', '26', 'ssk26', '', NULL, NULL, 'Medium', '2018-02-28 09:55:15.230826', 'Open', 23, '2018-02-28 09:55:15.230855', '2018-02-28 09:08:31.636344', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (17, 1, '', '27', 'ssk27', '', NULL, NULL, 'Medium', '2018-02-28 10:12:40.381696', 'Open', 24, '2018-02-28 10:12:40.381717', '2018-02-28 09:08:31.636344', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (18, 3, '', '28', 'ssk28', '', NULL, NULL, 'Medium', '2018-02-28 10:21:53.522423', 'InProgress', 25, '2018-02-28 10:21:53.522444', '2018-02-28 09:08:31.636344', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (19, 1, '', '30', 'ssk30', '', NULL, NULL, 'Medium', '2018-02-28 11:13:37.499169', 'Open', 26, '2018-02-28 11:13:37.49919', '2018-02-28 09:08:31.636344', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (20, 1, '', 'sar31', 'sar31', 'sar31-2', NULL, NULL, 'Medium', '2018-02-28 11:16:16.202596', 'Open', 27, '2018-02-28 11:16:16.202618', '2018-02-28 09:08:31.636344', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (4, 5, '', 'Test', 'Sunilsk1', '', NULL, NULL, 'Medium', '2018-02-28 14:46:28.180532', 'Closed', 9, '2018-02-27 12:02:57.725007', '2018-02-27 10:52:48.852285', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (21, 1, '', 'ssk35', 'ssk35', '', NULL, NULL, 'Medium', '2018-02-28 16:44:50.495491', 'Open', 29, '2018-02-28 16:44:50.495517', '2018-02-28 13:27:58.315868', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (7, 3, '', 'Test', 'sunil123', '', NULL, NULL, 'Medium', '2018-02-27 12:05:34.840681', 'InProgress', 14, '2018-02-27 12:05:34.840703', '2018-02-28 22:47:19.459811', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (22, 3, '', 'ssk37', 'ssk37', '', NULL, NULL, 'Medium', '2018-03-01 01:08:06.65455', 'InProgress', 31, '2018-03-01 01:08:06.654572', '2018-03-01 01:17:21.523268', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (1, 3, '', 'test', 'abinaya12', 'abinay12rep', NULL, NULL, 'Medium', '2018-02-27 11:31:01.825266', 'InProgress', 5, '2018-02-27 11:31:01.825292', '2018-03-01 06:02:35.440688', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (23, 3, '', 'SSK38', 'SSK38', '', NULL, NULL, 'Medium', '2018-03-01 06:07:45.345475', 'InProgress', 32, '2018-03-01 06:07:45.345497', '2018-03-01 06:09:09.999839', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (3, 1, '', 'Personal Info', 'Sunilsk', '', NULL, NULL, 'Low', '2018-02-27 11:57:04.167594', 'Open', 8, '2018-02-27 11:57:04.167616', '2018-03-01 06:22:58.840146', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (24, 3, '', 'Personal info related...', 'SSK40', '', NULL, NULL, 'Medium', '2018-03-01 13:45:06.763696', 'InProgress', 36, '2018-03-01 13:45:06.763722', '2018-03-01 13:49:14.435124', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (25, 1, '', 'ssk41', 'ssk41', 'ssk41', NULL, NULL, 'Medium', '2018-03-02 07:01:11.32719', 'Open', 37, '2018-03-02 07:01:11.327214', '2018-03-01 16:08:13.620726', NULL, NULL, false);
INSERT INTO sar (id, "assignedTo", "otherInfo", "sarDescription", "externalUser", representative, user_confirmed, rep_confirmed, priority, "completionTime", status, user_id, creation_time, modification_time, created_by, modified_by, "isEscalated") VALUES (26, 1, '', 'alkdjflk', 'ssura abcd', 'ajdlkfja', NULL, NULL, 'Medium', '2018-03-02 13:25:39.54935', 'Open', 39, '2018-03-02 13:25:39.549372', '2018-03-01 16:08:13.620726', NULL, NULL, false);


--
-- TOC entry 2615 (class 0 OID 42168)
-- Dependencies: 237
-- Data for Name: sar_attachment; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO sar_attachment (id, sarresponse_id, "documentLink", "fileName") VALUES (20, 25, '/opt/SAR_Ticket_Creation/uploaded_file/6.txt', '6.txt');
INSERT INTO sar_attachment (id, sarresponse_id, "documentLink", "fileName") VALUES (21, 26, '/opt/SAR_Ticket_Creation/uploaded_file/abi.png', 'abi.png');


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 236
-- Name: sar_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('sar_attachment_id_seq', 21, true);


--
-- TOC entry 2613 (class 0 OID 42152)
-- Dependencies: 235
-- Data for Name: sar_escalation; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 234
-- Name: sar_escalation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('sar_escalation_id_seq', 1, false);


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 228
-- Name: sar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('sar_id_seq', 26, true);


--
-- TOC entry 2611 (class 0 OID 42136)
-- Dependencies: 233
-- Data for Name: sar_response; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO sar_response (id, sar_id, "fromUser", "toUser", "responseText", user_id, user_name) VALUES (25, 1, 'khalisaran', NULL, '12345678', NULL, NULL);
INSERT INTO sar_response (id, sar_id, "fromUser", "toUser", "responseText", user_id, user_name) VALUES (26, 10, 'dhinakar', NULL, 'test', NULL, NULL);


--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 232
-- Name: sar_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('sar_response_id_seq', 26, true);


--
-- TOC entry 2628 (class 0 OID 49363)
-- Dependencies: 250
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO section (id, name, owner_id, "parentSectionId", assessment_id, created_date, modified_date, status) VALUES (1, 'sec2', 2, NULL, 1, '2018-03-02 13:47:02.414795', '2018-03-02 20:51:01.410615', NULL);


--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 249
-- Name: section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('section_id_seq', 8, true);


--
-- TOC entry 2622 (class 0 OID 49328)
-- Dependencies: 244
-- Data for Name: sectionassigned; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 243
-- Name: sectionassigned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('sectionassigned_id_seq', 1, false);


--
-- TOC entry 2560 (class 0 OID 41568)
-- Dependencies: 182
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO session (sid, authenticated, last_visit) VALUES ('c7f85c21eff60275e5fee752', 0, 1519732095);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('761b03819dc6ebab65041504', 0, 1519732114);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('bb525789122365af40e4a54c', 0, 1519732141);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('08488ceebece4bf6f997120a', 0, 1519732142);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('d876f4929e8455791a09e64f', 0, 1519732174);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('a6fc60de41e2caadc1851ded', 0, 1519752363);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('fde0aa090e40999740f4308e', 0, 1519798704);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('9b154ba1cab0ff793f6b2829', 0, 1519798745);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('admin', 1, 1519836496);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('572bf99d4c4907ee60a1382d', 0, 1519884628);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('586f4b6a83133bd50d2c28f5', 0, 1519884941);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('502e10ce6ee38265e7a7b76a', 0, 1519884953);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('aa948f5513fd57ed56a4f690', 0, 1519885125);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('97036467223c0269211f3115', 0, 1519885127);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('6a2eb28cefbef143ad4d4921', 0, 1519885264);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('d52bab30bf2fc0bf0c3d1124', 0, 1519899185);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('ca8d749e905bf3c4a307f65d', 0, 1519915625);
INSERT INTO session (sid, authenticated, last_visit) VALUES ('0c3e66670e52aabd6f8f4194', 0, 1519921224);


--
-- TOC entry 2561 (class 0 OID 41578)
-- Dependencies: 183
-- Data for Name: session_attribute; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('c7f85c21eff60275e5fee752', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('761b03819dc6ebab65041504', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('bb525789122365af40e4a54c', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('08488ceebece4bf6f997120a', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('d876f4929e8455791a09e64f', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('a6fc60de41e2caadc1851ded', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('fde0aa090e40999740f4308e', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('9b154ba1cab0ff793f6b2829', 0, 'query_time', '1519798744');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('9b154ba1cab0ff793f6b2829', 0, 'query_constraints', '[{u''status'': [u''!closed'']}]');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('9b154ba1cab0ff793f6b2829', 0, 'query_href', '/main/products/%40/query?status=!closed&order=priority');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('9b154ba1cab0ff793f6b2829', 0, 'query_tickets', '2 5 1 3 4 6');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('admin', 1, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('admin', 1, 'query_time', '1519868343');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('admin', 1, 'query_constraints', '[{''status'': [u''open'']}]');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('admin', 1, 'query_href', '/main/products/%40/query?status=open&order=priority');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('admin', 1, 'query_tickets', '11 13 2 9 10 12 14 15 8 1 3 6 7 4 5 16');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('572bf99d4c4907ee60a1382d', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('586f4b6a83133bd50d2c28f5', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('502e10ce6ee38265e7a7b76a', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('aa948f5513fd57ed56a4f690', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('97036467223c0269211f3115', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('6a2eb28cefbef143ad4d4921', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('d52bab30bf2fc0bf0c3d1124', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('ca8d749e905bf3c4a307f65d', 0, 'ticket_comments_order', 'newest');
INSERT INTO session_attribute (sid, authenticated, name, value) VALUES ('0c3e66670e52aabd6f8f4194', 0, 'ticket_comments_order', 'newest');


--
-- TOC entry 2580 (class 0 OID 41882)
-- Dependencies: 202
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO system (name, value, product) VALUES ('database_version', '29', '');
INSERT INTO system (name, value, product) VALUES ('initial_database_version', '29', '');
INSERT INTO system (name, value, product) VALUES ('bloodhound_multi_product_version', '5', '');
INSERT INTO system (name, value, product) VALUES ('bhrelations', '2', '');


--
-- TOC entry 2584 (class 0 OID 41908)
-- Dependencies: 206
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (1, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'test', 'key', '@', 1, 1, '2018-02-27 10:52:48.866215', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (2, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'test', 'key', '@', 2, 1, '2018-02-27 10:52:48.866215', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (3, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Test', 'key', '@', 3, 7, '2018-02-27 10:52:48.866215', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (4, 'enhancement', NULL, NULL, '', '', 'Low', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Personal Info', 'key', '@', 4, 2, '2018-02-27 18:17:05.656803', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (5, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Test', 'key', '@', 5, 4, '2018-02-27 18:17:05.656803', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (6, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', '23', 'key', '@', 6, 13, '2018-02-28 05:29:59.517203', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (7, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', '1234', 'key', '@', 7, 10, '2018-02-28 13:27:58.329815', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (8, 'enhancement', NULL, NULL, '', '', 'Low', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', '1234', 'key', '@', 8, 10, '2018-02-28 13:27:58.329815', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (9, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', '30', 'key', '@', 9, 19, '2018-02-28 13:27:58.329815', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (10, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', '30', 'key', '@', 10, 19, '2018-02-28 13:27:58.329815', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (11, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'ssk35', 'key', '@', 11, 21, '2018-02-28 13:27:58.329815', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (12, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Test', 'key', '@', 12, 7, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (13, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Test', 'key', '@', 13, 7, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (14, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Test', 'key', '@', 14, 7, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (15, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'test', 'key', '@', 15, 6, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (16, 'task', NULL, 1519868329959249, 'component1', '', 'High', 'CTM', '', 'corbon', '1.0', 'milestone1', 'open', '', 'work', 'ssk37', 'key', '@', 16, 22, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (17, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'SSK38', 'key', '@', 17, 23, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (18, 'enhancement', NULL, NULL, '', '', 'Low', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'test', 'key', '@', 18, 6, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (19, 'enhancement', NULL, NULL, '', '', 'Medium', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'test', 'key', '@', 19, 6, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (20, 'enhancement', NULL, NULL, '', '', 'Medium', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Personal Info', 'key', '@', 20, 3, '2018-02-28 20:24:43.024255', NULL);
INSERT INTO ticket (uid, type, "time", changetime, component, severity, priority, owner, reporter, cc, version, milestone, status, resolution, summary, description, keywords, product, id, sar_id, created_time, modified_time) VALUES (21, 'enhancement', NULL, NULL, '', '', 'High', 'CTM', '', 'corbon', '1.0', '', 'open', '', 'work', 'Personal info related...', 'key', '@', 21, 24, '2018-03-01 06:46:28.52992', NULL);


--
-- TOC entry 2569 (class 0 OID 41736)
-- Dependencies: 191
-- Data for Name: ticket_change; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO ticket_change (ticket, "time", author, field, oldvalue, newvalue, product) VALUES (16, 1519868329959249, 'admin', 'type', 'enhancement', 'task', '@');
INSERT INTO ticket_change (ticket, "time", author, field, oldvalue, newvalue, product) VALUES (16, 1519868329959249, 'admin', 'component', '', 'component1', '@');
INSERT INTO ticket_change (ticket, "time", author, field, oldvalue, newvalue, product) VALUES (16, 1519868329959249, 'admin', 'milestone', '', 'milestone1', '@');
INSERT INTO ticket_change (ticket, "time", author, field, oldvalue, newvalue, product) VALUES (16, 1519868329959249, 'admin', 'comment', '1', '', '@');


--
-- TOC entry 2570 (class 0 OID 41752)
-- Dependencies: 192
-- Data for Name: ticket_custom; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 205
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('ticket_id_seq', 1, false);


--
-- TOC entry 2609 (class 0 OID 42113)
-- Dependencies: 231
-- Data for Name: ticket_info; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (1, 1, 2, 1);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (2, 2, 1, 1);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (3, 3, 2, 7);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (4, 4, 2, 2);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (5, 5, 2, 4);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (6, 6, 1, 13);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (7, 7, 2, 10);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (8, 8, 1, 10);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (9, 9, 2, 19);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (10, 10, 1, 19);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (11, 11, 2, 21);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (12, 12, 2, 7);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (13, 13, 2, 7);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (14, 14, 1, 7);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (15, 15, 1, 6);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (16, 16, 1, 22);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (17, 17, 1, 23);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (18, 18, 2, 6);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (19, 19, 1, 6);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (20, 20, 2, 3);
INSERT INTO ticket_info (id, ticket, department_id, sar_id) VALUES (21, 21, 1, 24);


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 230
-- Name: ticket_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('ticket_info_id_seq', 1, false);


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 204
-- Name: ticket_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('ticket_uid_seq', 21, true);


--
-- TOC entry 2595 (class 0 OID 42011)
-- Dependencies: 217
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: bloodhound
--



--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('user_group_id_seq', 1, false);


--
-- TOC entry 2589 (class 0 OID 41979)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (22, 'ssk25', 'ssk25@21.com', '9742533133', '$2b$04$dSxGSrqp8SOy0vkrX/2NPenn5ZMkus.49oGoCbJfBZXguDnbsaP22', 'External User', 'Group2', '2018-02-28 08:57:20.321189', '2018-02-28 05:29:59.494518', '', '', false, NULL, '7f40aa22-0ae2-411a-8cf8-7804de149ca5', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (1, 'khalisaran', 'khalisaran@10decoders.in', '1234567890', '$2b$04$2/.VIIMuX9lCTTUcnDQxkuDVyeSHZwy8uBBls9e6I3yZ83jfpUG6O', 'Administrator', 'Group1', '2018-02-27 11:13:36.659856', '2018-02-27 10:52:48.843071', '', '', true, NULL, '9d20f346-4e8a-4e10-8107-801af1314beb', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (3, 'dhinakar', 'dhinakar@10decoders.in', '1234567890', '$2b$04$F26ofLlCKiWkfui8d.yN2ONGh841ab5rP9csbfiPj16OQ0/1Z8cG6', 'ComplainceTeamMember', 'Group1', '2018-02-27 11:22:35.936158', '2018-02-27 10:52:48.843071', '', '', true, NULL, '0aadaecf-4332-467d-83b0-59774f66db28', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (4, 'thomas', 'thomas@10decoders.com', '1234567890', '$2b$04$si9XN8.1fIqv5UOCj11dk.fovfsyCbiyZX8wXWdt2Hcw5JAful0Pu', 'ComplainceTeamLeader', 'Group1', '2018-02-27 11:22:35.944435', '2018-02-27 10:52:48.843071', '', '', true, NULL, '0aadaecf-4332-467d-83b0-59774f66db28', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (6, 'abinay12rep', 'abinaya12rep@gmail.com', '123456789012345', '$2b$04$CSfHbS0F9IdeCMepk2rWt.EtHZS9fBga4XQDJ5Og9VyAuRXDAZoee', 'Representative', 'Group2', '2018-02-27 11:31:01.818671', '2018-02-27 10:52:48.843071', '', '', true, NULL, 'd883ec27-f990-4458-ad5d-9e8944c728e7', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (5, 'abinaya12', 'abinaya12@gmail.com', '+91998076543212', '$2b$04$gCzTOz2ReOTFS2mNIVLc0e4HdkszCAXCTV7j/qykduBRqlxU.xjCy', 'ComplainceTeamMember', 'Group2', '2018-02-27 11:31:01.812524', '2018-02-27 10:52:48.843071', '', '', true, NULL, '55653bbe-1708-4388-9656-52e0abed675a', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (2, ' dekshin', 'dekshin@10decoders.com', '1234567890', '$2b$04$BjUtfpbTOB/aCanoUZxKGebK6kJVGLpug7cNyMpmGNpYzhA6FobDO', 'ComplainceTeamLeader', 'Group1', '2018-02-27 11:13:36.674802', '2018-02-27 10:52:48.843071', '', '', true, NULL, '9d20f346-4e8a-4e10-8107-801af1314beb', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (9, 'Sunilsk1', 'sunil.kulkarni@compliancecompendium.co.uk', '9742533133', '$2b$04$fNhhfemFEgpn/.NLYx6/VuREbkUhPaIhb9B/jnzE4gyWquqctr/dW', 'External User', 'Group2', '2018-02-27 12:02:57.718311', '2018-02-27 10:52:48.843071', '', '', false, NULL, '1069fb43-62a6-45ae-bc2a-b7b57040d269', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (10, 'abinaya122', 'abinaya122@gmail.com', '+91998076543212', '$2b$04$EfEHGA8.ZACA32NWFkum6eb.g2IvvoZBCSyB3IPcu/hkYkGKB4uCa', 'External User', 'Group2', '2018-02-27 12:03:39.443989', '2018-02-27 10:52:48.843071', '', '', false, NULL, '054560a7-2c98-4ae1-b3f4-fdc6965ced40', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (11, 'abinay12repp', 'abinaya12repp@gmail.com', '123456789012345', '$2b$04$KG63UUL7IkWmcbylM11Jvu4Qlfdig.HX6ESnJRG4c5wGnYxdO2qWu', 'Representative', 'Group2', '2018-02-27 12:03:39.450571', '2018-02-27 10:52:48.843071', '', '', false, NULL, '28ee86dd-c86d-47c4-9674-6556a416614a', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (12, 'abinaya1', 'abinaya1@gmail.com', '+91998076543212', '$2b$04$CICwHoB.JsB/nxH5Xtb9P.KtoUApFOyAmLiNmhbfJe8lASV.DI/z.', 'External User', 'Group2', '2018-02-27 12:04:32.972298', '2018-02-27 10:52:48.843071', '', '', false, NULL, '75ee57cf-0bc8-47c4-9ca3-661761542a40', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (13, 'abinayrepp', 'abinayarepp@gmail.com', '123456789012345', '$2b$04$VmW1w6utqQEbyEKEizAjoegtd4.q0/l8y.2pIcGWRmuPFpR53HzEq', 'Representative', 'Group2', '2018-02-27 12:04:32.978871', '2018-02-27 10:52:48.843071', '', '', false, NULL, '8e65f848-0e31-4c1d-ab9d-6f6646b08e41', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (14, 'sunil123', 'dummy@xyz.com', '9742533133', '$2b$04$kjgeQAVIN/NwcrSuK9AtsOg9pF0HO2IEDPO4efJJzhiPJ5H9hf8Gi', 'External User', 'Group2', '2018-02-27 12:05:34.834162', '2018-02-27 10:52:48.843071', '', '', false, NULL, 'd4b07175-19be-4e1f-84aa-d96b6be8f5f6', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (15, 'Sunil.S.K', '123@xyz.com', '9742533133', '$2b$04$zMivvxBT/hUNCzPS6Pkx6ekN9Sqlg06bWXBjd1KO/fIA71qfT6JrW', 'External User', 'Group2', '2018-02-28 02:11:25.885278', '2018-02-27 18:17:05.633519', '', '', false, NULL, '4a3c0a26-fa4f-4aaa-8b79-c77adbd347f7', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (16, 'Sunilsk123', '234@xyz.com', '9742533133', '$2b$04$5irciGuZIbBkHBZEPKCnPeEO5hBT0qC.5SzNys7QJ0iPhTDbi9cia', 'External User', 'Group2', '2018-02-28 02:13:57.943823', '2018-02-27 18:17:05.633519', '', '', false, NULL, '02c6ccc6-6e0b-451e-8afa-b03566e78d89', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (17, '1234ssk', '1234@ssk.com', '9742533133', '$2b$04$4bGJDkgOZZGNX80nJ14MbONXAgjIc5hilTae0.yhX9ar7VgJcMQwm', 'External User', 'Group2', '2018-02-28 02:16:15.239959', '2018-02-27 18:17:05.633519', '', '', false, NULL, '3ccbd32d-8546-4147-8d64-5144b8623bbd', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (18, 'ssk21', 'ssk21@21.com', '9742533133', '$2b$04$rBk8BNEwC2EwFtn8.kdmgOsGmmmi1AWq0SkkbOpQ//ZwR5Rcwf5yG', 'External User', 'Group2', '2018-02-28 06:03:18.958455', '2018-02-28 05:29:59.494518', '', '', false, NULL, '39fab40b-8494-4a7b-9969-00ddb75456db', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (19, 'ssk22', 'ssk22@21.com', '9742533133', '$2b$04$/XAjfcXlrIVu5oQ1gxWwU.J25Yzpc5k.oUHYSM/wwtk9tNEkQjL4K', 'External User', 'Group2', '2018-02-28 06:09:11.682464', '2018-02-28 05:29:59.494518', '', '', false, NULL, 'ae42d7c4-54e1-4d15-9240-ffb6aa558b8e', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (20, 'ssk23', 'ssk23@21.com', '9742533133', '$2b$04$ZVX50EXmPQzjzB9qH54Ut.LZtz9rGv8t0OF8HhbL0mk7MOKFAIuIK', 'External User', 'Group2', '2018-02-28 06:11:32.254821', '2018-02-28 05:29:59.494518', '', '', false, NULL, '94d14ce1-5e5b-4551-809c-b0d87cb49111', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (21, 'ssk24', 'ssk24@21.com', '9742533133', '$2b$04$CW2p1.SVtVRH8.XNVGJSH.QZIzRIoN9HHqSvxBgBjxjJ9eIEEXyi6', 'External User', 'Group2', '2018-02-28 06:37:59.971044', '2018-02-28 05:29:59.494518', '', '', false, NULL, 'c264535b-8052-47d0-b082-ba50dcbcbfb2', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (24, 'ssk27', 'sunilskulkarni@hotmail.com', '9742533133', '$2b$04$P4pAHDESrAq0fGHM.R4JEe5p0y.wCAojPQQhxD7BzLxRdKrbJJfLC', 'External User', 'Group2', '2018-02-28 10:12:40.375105', '2018-02-28 09:08:31.626685', '', '', true, '2018-02-28 10:15:31.219019', NULL, NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (25, 'ssk28', 'tibrewalrahul01@gmail.com', '9742533133', '$2b$04$.lWmR/FQsnFUdhNK3qhBf.mjyNXZylOYJPOiJbbGAOlwiSs9hcVte', 'External User', 'Group2', '2018-02-28 10:21:53.515422', '2018-02-28 09:08:31.626685', '', '', false, NULL, '13ecfb67-2111-4e35-aaa2-f79b22581537', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (26, 'ssk30', 'ccc99vbnbnbn@hotmail.com', '9742533133', '$2b$04$1KClt7xAYx1tQwvpS1GNyes7.L4LDfo0FCCjfM8Rfo2n0.8VinwZu', 'External User', 'Group2', '2018-02-28 11:13:37.492597', '2018-02-28 09:08:31.626685', '', '', false, NULL, 'ab645927-50f0-4117-a8a2-af40d19a3494', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (27, 'sar31', 'sar31@21.com', '9742533133', '$2b$04$SKohK.1I/f0Lbf1b9C3ZMuUltaTIGHjVMvuujHmlBW8hxZGoiEd86', 'External User', 'Group2', '2018-02-28 11:16:16.189599', '2018-02-28 09:08:31.626685', '', '', false, NULL, '1ba2034d-8479-4861-b8af-8d646c2c96df', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (28, 'sar31-2', 'sar32@21.com', 'sar31', '$2b$04$yqHucGHv9djnix8GaIb6j.waRx5gcaqvDxwsa1ePc0hiUu6edY8Ia', 'Representative', 'Group2', '2018-02-28 11:16:16.195952', '2018-02-28 09:08:31.626685', '', '', false, NULL, 'bad060a1-5428-49b5-a9f0-a550553e91a0', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (29, 'ssk35', 'ssk35@21.com', '9742533133', '$2b$04$7hZLMNPQWzjgrD.weCWK4uR.m5lGZBoGmCcsF3pONiZ2...ZSiura', 'External User', 'Group2', '2018-02-28 16:44:50.479219', '2018-02-28 13:27:58.306612', '', '', false, NULL, 'dc59f350-dd2f-4fad-aa58-3b3ad39c8088', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (31, 'ssk37', 'ssk37@21.com', '9742533133', '$2b$04$pXFIvaRPPUc1U/mZEW/yQ.Yx9c1NnRx0qLqGYqQkyQCG76Ohg.6Je', 'External User', 'Group2', '2018-03-01 01:08:06.645701', '2018-02-28 20:24:43.001364', '', '', false, NULL, '85179c59-26e6-448b-b806-eeb92b043cd0', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (32, 'SSK38', 'ramesh2010.web@gmail.com', '9742533133', '$2b$04$b0VzMYW5pNhAE4T6D4xIkeT1fxHUugDB18RdzSsT.7kpakl8SxtZi', 'External User', 'Group2', '2018-03-01 06:07:45.338832', '2018-02-28 20:24:43.001364', '', '', false, NULL, 'a27744c1-9064-4f6c-a4a5-b3311c76d295', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (35, 'abinaya', 'abinaya.s@10decoders.in', '9962641175', '$2b$04$u5JxqsZkj0GiwrK0jHTj6OXFKl4qSv7s20iCt6kQejY0kLM8RA5sS', 'External User', 'Group2', '2018-03-01 06:38:41.155689', '2018-02-28 20:24:43.001364', '', '', false, NULL, '79a7297d-267b-486e-a311-c6bad437e365', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (7, 'Sunil', 'sunilskulkarnia@hotmail.com', '9742533133', '$2b$04$/rfsaURW3UwtHFva0DUjkOC8.wC9Ciu9z8mSEy/gKHNcquKDpDp.2', 'Administrator', 'Group2', '2018-02-27 11:52:57.447273', '2018-02-27 10:52:48.843071', '', '', false, NULL, '6e73c728-43a7-4bd6-8045-421493fdd366', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (36, 'SSK40', 'ssk40@21.com', '9742533133', '$2b$04$vC85Z0wjYiqBLLZPPT4fU.0l03B47N18MyZdENQPresFnFGvY9v8u', 'External User', 'Group2', '2018-03-01 13:45:06.753953', '2018-03-01 06:46:28.505801', '', '', false, NULL, '98d7d4c6-f09a-44f2-9e83-a92a49b2682f', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (23, 'ssk26', 'sunilskulkarni2@hotmail.com', '9742533133', '$2b$04$j55l2fT9Sw4BCqnytHqfsufPAn6svvSYR.dSEKx0ls47Q2aeugKpS', 'Administrator', 'Group2', '2018-02-28 09:55:15.220519', '2018-02-28 09:08:31.626685', '', '', false, NULL, '666c388d-f271-4d8e-b0e4-e0899ca07b64', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (8, 'Sunilsk', 'sunil.kulkarni.s1@gmail.com', '9742533133', '$2b$04$XaJtyxQi5XeICrHvynS70eu/NSR2Qaiuhwj821dY3OtL6umjYwGo6', 'Administrator', 'Group2', '2018-02-27 11:57:04.16088', '2018-02-27 10:52:48.843071', '', '', false, NULL, 'e88e2646-034f-42ed-972d-e0408d761ac6', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (37, 'ssk41', 'ssk41@21.com', '9742533133', '$2b$04$26oxz3vVAhaatwI3x1HGZegT6i7OhvYsUwdhbkQKUSA.kXjgfH/ke', 'External User', 'Group2', '2018-03-02 07:01:11.311009', '2018-03-01 16:08:13.611435', '', '', false, NULL, 'c91755e7-b300-4407-9bd9-df5529a20d68', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (38, 'ssk41', 'ssk41@22.com', 'ssk41', '$2b$04$DRtJdGUP8VLBlXGThbLwHe6sUQxP.ciuuN9DZWltF73WmiOR59r1G', 'Representative', 'Group2', '2018-03-02 07:01:11.320498', '2018-03-01 16:08:13.611435', '', '', false, NULL, '807499d1-5982-4a62-901a-3e4bb8aa8b6c', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (39, 'ssura abcd', 'sruse@gmail.com', '1234567890', '$2b$04$IogCCh0wI66Iq95xSmoMRemTH0./I8f1cJDxy64S7uFEzOm.Wsb8W', 'External User', 'Group2', '2018-03-02 13:25:39.536664', '2018-03-01 16:08:13.611435', '', '', false, NULL, '38b47c3f-81f6-4eb8-a64d-aa271a330740', NULL);
INSERT INTO users (id, name, email, phone, password, user_type, user_group, creation_time, modification_time, created_by, modified_by, confirmed, confirmed_on, token, password_reset_token) VALUES (40, 'ajdlkfja', 'alskjfdalkj@gmail.com', '1234567890', '$2b$04$CbP5srER8nUHGvv.K/E10et62CctCWiKOQ2nMbFzfGGFlABSGiJN6', 'Representative', 'Group2', '2018-03-02 13:25:39.542937', '2018-03-01 16:08:13.611435', '', '', false, NULL, '34e6ad90-b23b-4047-844d-2572e11dbb88', NULL);


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bloodhound
--

SELECT pg_catalog.setval('users_id_seq', 40, true);


--
-- TOC entry 2575 (class 0 OID 41823)
-- Dependencies: 197
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO version (name, "time", description, product) VALUES ('1.0', 0, NULL, '@');
INSERT INTO version (name, "time", description, product) VALUES ('2.0', 0, NULL, '@');


--
-- TOC entry 2572 (class 0 OID 41780)
-- Dependencies: 194
-- Data for Name: wiki; Type: TABLE DATA; Schema: public; Owner: bloodhound
--

INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('CamelCase', 1, 1519728656502452, 'trac', '127.0.0.1', '= !CamelCase =
New words created by smashing together capitalized words.

CamelCase is the original wiki convention for creating hyperlinks, with the additional requirement that the capitals are followed by a lower-case letter; hence “AlabamA” and “ABc” will not be links.

== Customizing the Wiki behavior ==

Some people dislike linking by CamelCase.  While Trac remains faithful to the original Wiki style, it provides a number of ways to accomodate users with different preferences:
 * There''s an option (`ignore_missing_pages` in the [wiki:TracIni#wiki-section "[wiki]"] section of TracIni) to simply ignore links to missing pages when the link is written using the CamelCase style, instead of that word being replaced by a gray link followed by a question mark.[[BR]]
   That can be useful when CamelCase style is used to name code artifacts like class names and there''s no corresponding page for them.
 * There''s an option (`split_page_names` in the  [wiki:TracIni#wiki-section "[wiki]"] section of TracIni) to automatically insert space characters between the words of a CamelCase link when rendering the link.
 * Creation of explicit Wiki links is also easy, see WikiPageNames for details.
 * In addition, Wiki formatting can be disabled completely in some places (e.g. when rendering commit log messages). See `wiki_format_messages` in the [wiki:TracIni#changeset-section "[changeset]"] section of TracIni.

See TracIni for more information on the available options.

== More information on !CamelCase ==

 * http://c2.com/cgi/wiki?WikiCase
 * http://en.wikipedia.org/wiki/CamelCase

----
See also: WikiPageNames, WikiNewPage, WikiFormatting, TracWiki
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('InterMapTxt', 1, 1519728656512829, 'trac', '127.0.0.1', '= InterMapTxt =

== This is the place for defining InterWiki prefixes ==

This page was modelled after the MeatBall:InterMapTxt page.
In addition, an optional comment is allowed after the mapping.


This page is interpreted in a special way by Trac, in order to support
!InterWiki links in a flexible and dynamic way.

The code block after the first line separator in this page
will be interpreted as a list of !InterWiki specifications:
{{{
prefix <space> URL [<space> # comment]
}}}

By using `$1`, `$2`, etc. within the URL, it is possible to create 
InterWiki links which support multiple arguments, e.g. Trac:ticket:40.
The URL itself can be optionally followed by a comment, 
which will subsequently be used for decorating the links 
using that prefix.

New !InterWiki links can be created by adding to that list, in real time.
Note however that ''''deletions'''' are also taken into account immediately,
so it may be better to use comments for disabling prefixes.

Also note that !InterWiki prefixes are case insensitive.


== List of Active Prefixes ==

[[InterWiki]]


----

== Prefix Definitions ==

{{{
PEP     http://www.python.org/peps/pep-$1.html    # Python Enhancement Proposal 
PythonBug    http://bugs.python.org/issue$1       # Python Issue #$1
Python-issue http://bugs.python.org/issue$1       # Python Issue #$1

Trac-ML  http://thread.gmane.org/gmane.comp.version-control.subversion.trac.general/ # Message $1 in Trac Mailing List
trac-dev http://thread.gmane.org/gmane.comp.version-control.subversion.trac.devel/   # Message $1 in Trac Development Mailing List

Mercurial http://www.selenic.com/mercurial/wiki/index.cgi/ # the wiki for the Mercurial distributed SCM

RFC       http://tools.ietf.org/html/rfc$1          # IETF''s RFC $1
ISO       http://en.wikipedia.org/wiki/ISO_         # ISO Standard $1 in Wikipedia
kb        http://support.microsoft.com/kb/$1/en-us/ # Article $1 in Microsoft''s Knowledge Base

chromium-issue  http://code.google.com/p/chromium/issues/detail?id=

Django      http://code.djangoproject.com/intertrac/ # Django''s Trac

CreoleWiki   http://wikicreole.org/wiki/
Creole1Wiki  http://wikicreole.org/wiki/
Creole2Wiki  http://wiki.wikicreole.org/

MediaWiki    http://www.mediawiki.org/wiki/

SO  http://stackoverflow.com/questions/ # Question $1 in StackOverflow

Transifex https://www.transifex.com/projects/p/trac/

kwquery      /query?group=status&keywords=~  # Custom query for tickets matching keyword $1

#
# A arbitrary pick of InterWiki prefixes...
#
Acronym          http://www.acronymfinder.com/af-query.asp?String=exact&Acronym=
C2find           http://c2.com/cgi/wiki?FindPage&value=
Cache            http://www.google.com/search?q=cache:
CPAN             http://search.cpan.org/perldoc?
DebianBug        http://bugs.debian.org/
DebianPackage    http://packages.debian.org/
DebianPTS        http://packages.qa.debian.org/
Dictionary       http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=
Google           http://www.google.com/search?q=
lmgtfy           http://lmgtfy.com/?q= # Well, just search for "$1", follow the link to see how to do it...
GoogleGroups     http://groups.google.com/group/$1/msg/$2        # Message $2 in $1 Google Group
gdiscussion      https://groups.google.com/d/topic/$1/$2/discussion # Discussion $2 in $1 Google 
gmessage         https://groups.google.com/d/msg/$1/$2 # Message $2 in $1 Google Group
JargonFile       http://downlode.org/perl/jargon-redirect.cgi?term=
MeatBall         http://www.usemod.com/cgi-bin/mb.pl?
MetaWiki         http://sunir.org/apps/meta.pl?
MetaWikiPedia    http://meta.wikipedia.org/wiki/
MoinMoin         http://moinmo.in/
TracHacks        http://trac-hacks.org/wiki/
OSM              http://www.openstreetmap.org/wiki/
WhoIs            http://www.whois.sc/
Why              http://clublet.com/c/c/why?
c2Wiki           http://c2.com/cgi/wiki?
WikiPedia        http://en.wikipedia.org/wiki/
}}}


----
See also: InterWiki, InterTrac', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('InterTrac', 1, 1519728656516715, 'trac', '127.0.0.1', '= InterTrac Links  =

Trac supports a convenient way to refer to resources of other Trac servers, from within the Wiki markup, since version 0.10.

== Definitions ==

An InterTrac link can be seen as a scoped TracLinks.
It is used for referring to a Trac resource 
(Wiki page, changeset, ticket, ...) located in another
Trac environment.

== List of Active InterTrac Prefixes ==

[[InterTrac]]

== Link Syntax ==

Simply use the name of the other Trac environment as a prefix, 
followed by a colon, ending with the resource located in the other environment.

{{{
<target_environment>:<TracLinks>
}}}

The other resource is specified using a regular TracLinks, of any flavor.

That target environment name is either the real name of the 
environment, or an alias for it. 
The aliases are defined in `trac.ini` (see below).
The prefix is case insensitive.

If the InterTrac link is enclosed in square brackets (like `[th:WikiExtrasPlugin]`), the InterTrac prefix is removed in the displayed link, like a normal link resolver would be (i.e. the above would be displayed as `WikiExtrasPlugin`).

For convenience, there''s also some alternative short-hand form, 
where one can use an alias as an immediate prefix 
for the identifier of a ticket, changeset or report:
(e.g. `#T234`, `[T1508]`, `[trac 1508]`, ...)

== Examples ==

It is necessary to setup a configuration for the InterTrac facility.
This configuration has to be done in the TracIni file, `[intertrac]` section.

Example configuration:
{{{
...
[intertrac]
# -- Example of setting up an alias:
t = trac

# -- Link to an external Trac:
trac.title = Edgewall''s Trac for Trac
trac.url = http://trac.edgewall.org
}}}

The `.url` is mandatory and is used for locating the other Trac.
This can be a relative URL in case that Trac environment is located 
on the same server.

The `.title` information will be used for providing an useful tooltip
when moving the cursor over an InterTrac links.

Finally, the `.compat` option can be used to activate or disable
a ''''compatibility'''' mode:
 * If the targeted Trac is running a version below [trac:milestone:0.10 0.10] 
   ([trac:r3526 r3526] to be precise), then it doesn''t know how to dispatch an InterTrac 
   link, and it''s up to the local Trac to prepare the correct link. 
   Not all links will work that way, but the most common do. 
   This is called the compatibility mode, and is `true` by default. 
 * If you know that the remote Trac knows how to dispatch InterTrac links, 
   you can explicitly disable this compatibility mode and then ''''any'''' 
   TracLinks can become an InterTrac link.

Now, given the above configuration, one could create the following links:
 * to this InterTrac page:
   * `trac:wiki:InterTrac` trac:wiki:InterTrac
   * `t:wiki:InterTrac` t:wiki:InterTrac
   * Keys are case insensitive: `T:wiki:InterTrac` T:wiki:InterTrac
 * to the ticket #234:
   * `trac:ticket:234` trac:ticket:234
   * `trac:#234` trac:#234 
   * `#T234` #T234
 * to the changeset [1912]:
   * `trac:changeset:1912` trac:changeset:1912
   * `[T1912]` [T1912]
 * to the log range [3300:3330]: ''''''(Note: the following ones need `trac.compat=false`)''''''
   * `trac:log:@3300:3330` trac:log:@3300:3330  
   * `[trac 3300:3330]` [trac 3300:3330] 
 * finally, to link to the start page of a remote trac, simply use its prefix followed by '':'', inside an explicit link. Example: `[th: Trac Hacks]` (''''since 0.11; note that the ''''remote'''' Trac has to run 0.11 for this to work'''')

The generic form `intertrac_prefix:module:id` is translated
to the corresponding URL `<remote>/module/id`, shorthand links
are specific to some modules (e.g. !#T234 is processed by the
ticket module) and for the rest (`intertrac_prefix:something`),
we rely on the TracSearch#quickjump facility of the remote Trac.

----
See also: TracLinks, InterWiki
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('InterWiki', 1, 1519728656519706, 'trac', '127.0.0.1', '= Support for InterWiki links =

''''(since [trac:milestone:0.10 0.10])''''

== Definition ==

An InterWiki link can be used for referring to a Wiki page
located in another Wiki system, and by extension, to any object
located in any other Web application, provided a simple URL 
mapping can be done.

At the extreme, InterWiki prefixes can even be used to simply introduce
links to new protocols, such as `tsvn:` used by [trac:TortoiseSvn TortoiseSvn].

== Link Syntax ==

{{{
<target_wiki>(:<identifier>)+
}}}

The link is composed by the targeted Wiki (or system) name,
followed by a colon (e.g. `MeatBall:`),
followed by a page specification in the target.
Note that, as for InterTrac prefixes, ''''''InterWiki prefixes are case insensitive''''''.

The target Wiki URL is looked up in the `[interwiki]` section of TracIni or in the InterMapTxt wiki page, modeled after MeatBall:InterMapTxt. If a prefix is defined in both the `[interwiki]` section and InterMapTxt, the `[interwiki]` section takes precedence.

In addition to traditional InterWiki links, where the target
is simply ''''appended'''' to the URL, 
Trac supports parametric InterWiki URLs:
identifiers `$1`, `$2`, ... in the URL
will be replaced by corresponding arguments.
The argument list is formed by splitting the page identifier
using the ":" separator.

=== [interwiki] ===
Every option in the `[interwiki]` section in TracIni defines one InterWiki prefix. The option name defines the prefix. The option value defines the URL, optionally followed by a description separated from the URL by whitespace. Parametric URLs are supported as well.

''''''Example:''''''
{{{
[interwiki]
MeatBall = http://www.usemod.com/cgi-bin/mb.pl?
PEP = http://www.python.org/peps/pep-$1.html Python Enhancement Proposal $1
tsvn = tsvn: Interact with TortoiseSvn
}}}

== Examples ==

If the following is an excerpt of the InterMapTxt page:

{{{
= InterMapTxt =
== This is the place for defining InterWiki prefixes ==

Currently active prefixes: [[InterWiki]]

This page is modelled after the MeatBall:InterMapTxt page.
In addition, an optional comment is allowed after the mapping.
----
{{{
PEP      http://www.python.org/peps/pep-$1.html           # Python Enhancement Proposal $1 
Trac-ML  http://thread.gmane.org/gmane.comp.version-control.subversion.trac.general/$1  # Message $1 in Trac Mailing List

tsvn     tsvn:                                            # Interact with TortoiseSvn
...
MeatBall http://www.usemod.com/cgi-bin/mb.pl?
MetaWiki http://sunir.org/apps/meta.pl?
MetaWikiPedia http://meta.wikipedia.org/wiki/
MoinMoin http://moinmoin.wikiwikiweb.de/
...
}}}
}}}

Then, 
 * `MoinMoin:InterWikiMap` should be rendered as MoinMoin:InterWikiMap
   and the ''''title'''' for that link would be "!InterWikiMap in !MoinMoin"
 * `Trac-ML:4346` should be rendered as Trac-ML:4346
   and the ''''title'''' for that link would be "Message 4346 in Trac Mailing List"

----
See also: InterTrac, InterMapTxt
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('PageTemplates', 1, 1519728656522596, 'trac', '127.0.0.1', '= Wiki Page Templates = 

  ''''(since [http://trac.edgewall.org/milestone/0.11 0.11])''''

The default content for a new wiki page can be chosen from a list of page templates. 

That list is generated from all the wiki pages having a name starting with ''''PageTemplates/''''.
The initial content of a new page will simply be the content of the chosen template page, or a blank page if the special ''''(blank page)'''' entry is selected. When there are no wiki pages with the ''''PageTemplates/'''' prefix, the initial content will always be the blank page and the list selector will not be shown (i.e. this matches the behavior we had up to now).

To create a new template, simply create a new page having a name starting with ''''PageTemplates/''''.

(Hint: one could even create a ''''!PageTemplates/Template'''' for facilitating the creation of new templates!)

After the first template has been created, a drop-down selection box will automatically appear on any new wiki pages that are created.  By default it is located on the right side of the ''Create this page'' button. The default selection will be ''''blank page'''', or ''''!DefaultPage'''' if ''''!PageTemplates/DefaultPage'''' exists.

Available templates: 
[[TitleIndex(PageTemplates/)]]
----
See also: TracWiki
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('RecentChanges', 1, 1519728656525403, 'trac', '127.0.0.1', ''''''' [TitleIndex Index by Title] '''''' | '''''' Index by Date ''''''

[[RecentChanges]]', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('SandBox', 1, 1519728656528067, 'trac', '127.0.0.1', '= The Sandbox =

This is just a page to practice and learn WikiFormatting. 

Go ahead, edit it freely.
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TitleIndex', 1, 1519728656530723, 'trac', '127.0.0.1', ''''''' Index by Title '''''' | '''''' [RecentChanges Index by Date] ''''''

[[TitleIndex(format=group,min=4)]]', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracAccessibility', 1, 1519728656533400, 'trac', '127.0.0.1', '= Accessibility Support in Trac =

Not every user has a graphic environment with a mouse or other pointing device. Some users rely on keyboard, alternative keyboard or voice input to navigate links, activate form controls, etc. In Trac, we work to assure users may interact with devices other than a pointing device.

The keyboard shortcuts must be enabled for a session through the [/prefs/keybindings Keyboard Shortcuts] preferences panel.

Trac supports accessibility keys for the most common operations.
 - on Linux platforms, press any of the keys listed below in combination with the `<Alt>` key 
 - on a Mac, use the `<ctrl>` key instead
 - on Windows, you need to hit `<Shift> + <Alt> + <Key>`. This works for most browsers (Firefox, Chrome, Safari and Internet Explorer)

== Global Access Keys ==

 * `1` - WikiStart
 * `2` - [wiki:TracTimeline Timeline]
 * `3` - [wiki:TracRoadmap Roadmap]
 * `4` - [wiki:TracSearch Search]
 * `6` - [wiki:TracGuide Trac Guide / Documentation]
 * `7` - [wiki:TracTickets New Ticket]
 * `9` - [/about About Trac]
 * `0` - This page
 * `e` - Edit this page
 * `f` - Search


----
See also: TracGuide', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracAdmin', 1, 1519728656536364, 'trac', '127.0.0.1', '= TracAdmin =
[[TracGuideToc]]

Trac is distributed with a powerful command-line configuration tool. This tool can be used  to configure and customize your Trac-installation to better fit your needs.

Some of those operations can also be performed via the ''''Admin'''' web interface, an updated version of the [trac:WebAdmin] plugin now integrated within Trac (since version 0.11).

== Usage ==

For nearly every `trac-admin` command, you''ll need to specify the path to the TracEnvironment that you want to administer as the first argument, for example:
{{{
trac-admin /path/to/projenv wiki list
}}}

The only exception is for the `help` command, but even in this case if you omit the environment, you''ll only get a very succinct list of commands (`help` and `initenv`), the same list you''d get when invoking `trac-admin` alone.
Also, `trac-admin --version` will tell you about the Trac version (e.g. 0.12) corresponding to the program.

If you want to get a comprehensive list of the available commands and sub-commands, you need to specify an existing environment:
{{{
trac-admin /path/to/projenv help
}}}

Some commands have a more detailed help, which you can access by specifying the command''s name as a subcommand for `help`:

{{{
trac-admin /path/to/projenv help <command>
}}}

=== `trac-admin <targetdir> initenv` === #initenv

This subcommand is very important as it''s the one used to create a TracEnvironment in the specified `<targetdir>`. That directory must not exist prior to the call.

[[TracAdminHelp(initenv)]]

It supports an extra `--inherit` option, which can be used to specify a global configuration file which can be used share settings between several environments. You can also inherit from a shared configuration afterwards, by setting the `[inherit] file` option in the `conf/trac.ini` file in your newly created environment, but the advantage of specifying the inherited configuration file at environment creation time is that only the options ''''not'''' already specified in the global configuration file will be written in the created environment''s `conf/trac.ini` file.
See TracIni#GlobalConfiguration.

Note that in version 0.11 of Trac, `initenv` lost an extra last argument `<templatepath>`, which was used in previous versions to point to the `templates` folder. If you are using the one-liner ''`trac-admin /path/to/trac/ initenv <projectname> <db> <repostype> <repospath>`'' in the above and getting an error that reads ''''''''`Wrong number of arguments to initenv: 4`'''''''', then this is because you''re using a `trac-admin` script from an ''''''older'''''' version of Trac.

== Interactive Mode ==

When passing the environment path as the only argument, `trac-admin` starts in interactive mode.
Commands can then be executed on the selected environment using the prompt, which offers tab-completion
(on non-Windows environments, and when the Python `readline` module is available) and automatic repetition of the last command issued.

Once you''re in interactive mode, you can also get help on specific commands or subsets of commands:

For example, to get an explanation of the `resync` command, run:
{{{
> help resync
}}}

To get help on all the Wiki-related commands, run:
{{{
> help wiki
}}}

== Full Command Reference ==

You''ll find below the detailed help for all the commands available by default in `trac-admin`. Note that this may not match the list given by `trac-admin <yourenv> help`, as the commands  pertaining to components disabled in that environment won''t be available and conversely some plugins activated in the environment can add their own commands.

[[TracAdminHelp()]]

----
See also: TracGuide, TracBackup, TracPermissions, TracEnvironment, TracIni, [trac:TracMigrate TracMigrate]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracBackup', 1, 1519728656539381, 'trac', '127.0.0.1', '= Trac Backup =
[[TracGuideToc]]

Since Trac uses a database backend, some extra care is required to safely create a backup of a [wiki:TracEnvironment project environment]. Luckily, [wiki:TracAdmin trac-admin] has a command to make backups easier: `hotcopy`.

  ''''Note: Trac uses the `hotcopy` nomenclature to match that of [http://subversion.tigris.org/ Subversion], to make it easier to remember when managing both Trac and Subversion servers.''''

== Creating a Backup ==

To create a backup of a live TracEnvironment, simply run:
{{{

  $ trac-admin /path/to/projenv hotcopy /path/to/backupdir

}}}

[wiki:TracAdmin trac-admin] will lock the database while copying.''''

The resulting backup directory is safe to handle using standard file-based backup tools like `tar` or `dump`/`restore`.

Please, note, that hotcopy command does not overwrite target directory and when such exists, hotcopy ends with error: `Command failed: [Errno 17] File exists:` This is discussed in [trac:ticket:3198 #3198].

=== Restoring a Backup ===

Backups are simply a copied snapshot of the entire [wiki:TracEnvironment project environment] directory, including the SQLite database. 

To restore an environment from a backup, stop the process running Trac (i.e. the Web server or [wiki:TracStandalone tracd]), restore the contents of your backup (path/to/backupdir) to your [wiki:TracEnvironment project environment] directory and restart the service.

----
See also: TracAdmin, TracEnvironment, TracGuide, [trac:TracMigrate TracMigrate]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracBatchModify', 1, 1519728656542380, 'trac', '127.0.0.1', '= Trac Ticket Batch Modification =
[[TracGuideToc]]

From [wiki:TracQuery custom query] results Trac provides support for modifying a batch of tickets in one request.

To perform a batch modification select the tickets you wish to modify and set the new field values using the section underneath the query results. 

== List fields

The `Keywords` and `Cc` fields are treated as lists, where list items can be added and/or removed in addition of replacing the entire list value. All list field controls accept multiple items (i.e. multiple keywords or cc addresses).
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracBrowser', 1, 1519728656545248, 'trac', '127.0.0.1', '= The Trac Repository Browser =
[[TracGuideToc]]

The Trac repository browser can be used to browse specific revisions of directories 
and files stored in the repositories associated with the Trac environment.

''''(since 0.12)'''': 
At the top-level of the repository browser is the ''''''Repository Index'''''', 
listing all the configured repositories. 
Each repository has a name which is used as a path prefix in a 
"virtual" file hierarchy encompassing all the available repositories.
One of the repositories can be configured with an empty name; this is the default repository.  When such a default repository is present, its top-level files and directories 
are also listed, in a ''''''Default Repository'''''' section placed before the 
repository index. If the default repository is the only repository associated 
with the Trac environment the ''''''Repository Index'''''' will be omitted ^[#note-multirepos (1)]^.

Directory entries are displayed in a list with sortable columns. The list 
entries can be sorted by ''''Name'''', ''''Size'''', ''''Age'''' or ''''Author'''' by clicking on the column
headers. The sort order can be reversed by clicking on a given column
header again.

The browser can be used to navigate through the directory structure 
by clicking on the directory names. 
Clicking on a file name will show the contents of the file. 
Clicking on the revision number of a file or directory will take 
you to the TracRevisionLog for that file.
Note that there''s also a ''''Revision Log'''' navigation link that will do the 
same for the path currently being examined.
Clicking on the ''''diff'''' icon after revision number will display the changes made 
to the files modified in that revision.
Clicking on the ''''Age'''' of the file - will take you to that changeset in the timeline.

It''s also possible to browse directories or files as they were in history,
at any given repository revision. The default behavior is to display the
latest revision but another revision number can easily be selected using
the ''''View revision'''' input field at the top of the page.

The color bar next to the ''''Age'''' column gives a visual indication of the age
of the last change to a file or directory, following the convention that
''''''[[span(style=color:#88f,blue)]]'''''' is oldest and ''''''[[span(style=color:#f88,red)]]''''''
is newest, but this can be [TracIni#browser-section configured].

At the top of the browser page, there''s a ''''Visit'''' drop-down menu which you can use 
to select some interesting places in the repository, for example branches or tags. 
This is sometimes referred to as the ''''browser quickjump'''' facility.
The precise meaning and content of this menu depends on your repository backend.
For Subversion, this list contains by default the top-level trunk directory 
and sub-directories of the top-level branches and tags directories 
(`/trunk`, `/branches/*`, and `/tags/*`).  This can be [TracIni#svn-section configured] 
for more advanced cases.

If you''re using a Javascript enabled browser, you''ll be able to expand and 
collapse directories in-place by clicking on the arrow head at the right side of a 
directory. Alternatively, the [trac:TracKeys keyboard] can also be used for this: 
 - use `''j''` and `''k''` to select the next or previous entry, starting with the first
 - `''o''` (open) to toggle between expanded and collapsed state of the selected 
   directory or for visiting the selected file 
 - `''v''` (view, visit) and `''<Enter>''`, same as above
 - `''r''` can be used to force the reload of an already expanded directory
 - `''A''` can be used to directly visit a file in annotate (blame) mode
 - `''L''` to view the log for the selected entry
If no row has been selected using `''j''` or `''k''` these keys will operate on the entry under the mouse.

{{{#!comment
MMM: I guess that some keys are upper case and some lower to avoid conflicts with browser defined keys.
I find for example in Firefox and IE on windows that ''a'' works as well as ''A'' but ''l'' does not work for ''L''.
 cboos: ''l'' is reserved for Vim like behavior, see #7867
}}}

For the Subversion backend, some advanced additional features are available:
 - The `svn:needs-lock` property will be displayed
 - Support for the `svn:mergeinfo` property showing the merged and eligible information
 - Support for browsing the `svn:externals` property 
   (which can be [TracIni#svn:externals-section configured])
 - The `svn:mime-type` property is used to select the syntax highlighter for rendering 
   the file. For example, setting `svn:mime-type` to `text/html` will ensure the file is 
   highlighted as HTML, regardless of the file extension. It also allows selecting the character 
   encoding used in the file content. For example, if the file content is encoded in UTF-8, 
   set `svn:mime-type` to `text/html;charset=utf-8`. The `charset=` specification overrides the 
   default encoding defined in the `default_charset` option of the `[trac]` section 
   of [TracIni#trac-section trac.ini].
{{{#!comment
MMM: I found this section a bit hard to understand. I changed the first item as I understood that well.
but I think the other items could be changed also
 cboos: in the meantime, I''ve added the ''''advanced'''' word as a hint this can be a bit complex...
}}}


----
{{{#!div style="font-size:85%"
[=#note-multirepos (1)] This means that after upgrading a single-repository Trac of version 
0.11 (or below) to a multi-repository Trac (0.12), the repository browser will look and feel 
the same, that single repository becoming automatically the "default" repository.
}}}

See also: TracGuide, TracChangeset, TracFineGrainedPermissions
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracCgi', 1, 1519728656548530, 'trac', '127.0.0.1', '= Installing Trac as CGI =

{{{
#!div class=important
  ''''Please note that using Trac via CGI is the slowest deployment method available. It is slower than [TracModPython mod_python], [TracFastCgi FastCGI] and even [trac:TracOnWindowsIisAjp IIS/AJP] on Windows.''''
}}}

CGI script is the entrypoint that web-server calls when a web-request to an application is made. To generate the `trac.cgi` script run:
{{{
trac-admin /path/to/env deploy /path/to/www/trac
}}}
`trac.cgi` will be in the `cgi-bin` folder inside the given path. ''''Make sure it is executable by your web server''''. This command also copies `static resource` files to a `htdocs` directory of a given destination.

== Apache web-server configuration ==

In [http://httpd.apache.org/ Apache] there are two ways to run Trac as CGI:

 1. Use a `ScriptAlias` directive that maps an URL to the `trac.cgi` script (recommended)
 2. Copy the `trac.cgi` file into the directory for CGI executables used by your web server (commonly named `cgi-bin`). You can also create a symbolic link, but in that case make sure that the `FollowSymLinks` option is enabled for the `cgi-bin` directory.

To make Trac available at `http://yourhost.example.org/trac` add `ScriptAlias` directive to Apache configuration file, changing `trac.cgi` path to match your installation:
{{{
ScriptAlias /trac /path/to/www/trac/cgi-bin/trac.cgi
}}}

 ''''Note that this directive requires enabled `mod_alias` module.''''

If you''re using Trac with a single project you need to set its location using the `TRAC_ENV` environment variable:
{{{
<Location "/trac">
  SetEnv TRAC_ENV "/path/to/projectenv"
</Location>
}}}

Or to use multiple projects you can specify their common parent directory using the `TRAC_ENV_PARENT_DIR` variable:
{{{
<Location "/trac">
  SetEnv TRAC_ENV_PARENT_DIR "/path/to/project/parent/dir"
</Location>
}}}

 ''''Note that the `SetEnv` directive requires enabled `mod_env` module. It is also possible to set TRAC_ENV in trac.cgi. Just add the following code between "try:" and "from trac.web ...":''''

{{{
    import os
    os.environ[''TRAC_ENV''] = "/path/to/projectenv"
}}}

 '''' Or for TRAC_ENV_PARENT_DIR: ''''

{{{
    import os
    os.environ[''TRAC_ENV_PARENT_DIR''] = "/path/to/project/parent/dir"
}}}

If you are using the [http://httpd.apache.org/docs/suexec.html Apache suEXEC] feature please see [http://trac.edgewall.org/wiki/ApacheSuexec].

On some systems, you ''''may'''' need to edit the shebang line in the `trac.cgi` file to point to your real Python installation path. On a Windows system you may need to configure Windows to know how to execute a .cgi file (Explorer -> Tools -> Folder Options -> File Types -> CGI).

=== Using WSGI ===

You can run a [http://henry.precheur.org/python/how_to_serve_cgi WSGI handler] [http://pythonweb.org/projects/webmodules/doc/0.5.3/html_multipage/lib/example-webserver-web-wsgi-simple-cgi.html under CGI].  You can [wiki:TracModWSGI#Thetrac.wsgiscript write your own application function], or use the deployed trac.wsgi''s application.

== Mapping Static Resources ==

See TracInstall#MappingStaticResources.

== Adding Authentication ==

See TracInstall#ConfiguringAuthentication.

----
See also:  TracGuide, TracInstall, [wiki:TracModWSGI], TracFastCgi, TracModPython', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracChangeset', 1, 1519728656551295, 'trac', '127.0.0.1', '= Trac Changeset Module =
[[TracGuideToc]]

Trac has a built-in functionality for visualizing “diffs” - changes to files.

There are different kinds of ''''change sets''''. 
Some can correspond to revisions made in the repositories,
others can aggregate changes made in several revisions, 
but in the end, any kind of differences can be shown.

The changeset view consists of two parts, the ''''header'''' 
and the ''''diff views''''.

== Changeset Header ==

The header shows an overview of the whole changeset.
Here you will find information such as:

 * Timestamp — When the changeset was commited
 * Author — Who commited the changeset
 * Message — A brief description from the author (the commit log message)
 * Location — Parent directory of all files affected by this changeset
 * Files — A list of files affected by this changeset

If more than one revision is involved in the set of changes being
displayed, the ''''Timestamp'''', ''''Author'''' and ''''Message'''' fields 
won''t be shown.

In front of each listed file, you''ll find  a colored rectangle. The color
indicates how the file is affected by the changeset.
 
 [[span(style=background:#bfb;border:1px solid #999;font-size:80%;margin-right:.5em,''''  '''')]] Green: Added \\
 [[span(style=background:#f88;border:1px solid #999;font-size:80%;margin-right:.5em,''''  '''')]] Red: Removed \\
 [[span(style=background:#fd8;border:1px solid #999;font-size:80%;margin-right:.5em,''''  '''')]] Yellow: Modified \\
 [[span(style=background:#88f;border:1px solid #999;font-size:80%;margin-right:.5em,''''  '''')]] Blue: Copied \\
 [[span(style=background:#ccc;border:1px solid #999;font-size:80%;margin-right:.5em,''''  '''')]] Gray: Moved \\
The color legend is located below the header as a reminder.

== Diff Views ==

Below the header is the main part of the changeset, the diff view. Each file is shown in a separate section, each of which will contain only the regions of the file that are affected by the changeset. There are two different styles of displaying the diffs: ''''inline'''' or ''''side-by-side'''' (you can switch between those styles using the preferences form):

 * The ''''inline'''' style shows the changed regions of a file underneath each other. A region removed from the file will be colored red, an added region will be colored green. If a region was modified, the old version is displayed above the new version. Line numbers on the left side indicate the exact position of the change in both the old and the new version of the file.
 * The ''''side-by-side'''' style shows the old version on the left and the new version on the right (this will typically require more screen width than the inline style.) Added and removed regions will be colored in the same way as with the inline style (green and red, respectively), but modified regions will have a yellow background.

In addition, various advanced options are available in the preferences form for adjusting the display of the diffs:
 * You can set how many lines are displayed before and after every change
   (if the value ''''all'''' is used, then the full file will be shown)
 * You can toggle whether blank lines, case changes and white space changes are ignored, thereby letting you find the functional changes more quickly


== The Different Ways to Get a Diff ==

=== Examining a Changeset ===

When viewing a repository check-in, such as when following a
changeset [wiki:TracLinks link] or a changeset event in the 
[wiki:TracTimeline timeline], Trac will display the exact changes
made by the check-in.

There will be also navigation links to the ''''Previous Changeset''''
to and ''''Next Changeset''''.

=== Examining Differences Between Revisions ===

Often you''ll want to look at changes made on a file 
or on a directory spanning multiple revisions. The easiest way
to get there is from the TracRevisionLog, where you can select
the ''''old'''' and the ''''new'''' revisions of the file or directory, and
then click the ''''View changes'''' button.

=== Examining Differences Between Branches ===

One of the core features of version control systems is the possibility
to work simultaneously on different ''''Lines of Developments'''', commonly
called “branches”. Trac enables you to examine the exact differences
between such branches.

Using the ''''''View changes ...'''''' button in the TracBrowser allows you to enter
''''From:'''' and ''''To:'''' path/revision pairs. The resulting set of differences consist
of the changes that should be applied to the ''''From:'''' content in order
to get to the ''''To:'''' content.

For convenience, it is possible to invert the roles of the ''''old'''' and the ''''new''''
path/revision pairs by clicking the ''''Reverse Diff'''' link on the changeset page.

=== Checking the Last Change ===

The last possibility for examining changes is to use the ''''Last Change''''
link provided by the TracBrowser.

This link will take you to the last change that was made on that path.
From there, you can use the ''''Previous Change'''' and ''''Next Change'''' links
to traverse the change history of the file or directory.

----
See also: TracGuide, TracBrowser
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracEnvironment', 1, 1519728656554386, 'trac', '127.0.0.1', '= The Trac Environment =

Trac uses a directory structure and a database for storing project data. The directory is referred to as the “environment”.

== Creating an Environment ==

A new Trac environment is created using  [TracAdmin#initenv trac-admin''s initenv]:
{{{
$ trac-admin /path/to/myproject initenv
}}}

`trac-admin` will ask you for the name of the project and the
database connection string (explained below).

=== Some Useful Tips
 - The user under which the web server runs will require file system write permission to 
 the environment directory and all the files inside. Please remember to set
 the appropriate permissions. The same applies to the source code repository, 
 although the user under which Trac runs will only require write access to a Subversion repository created with the BDB file system; for other repository types, check the corresponding plugin''s documentation. 
 
 - `initenv`, when using an svn repository, does not imply that trac-admin will perform `svnadmin create` for the specified repository path. You need to perform the `svnadmin create` prior to `trac-admin initenv` if you''re creating a new svn repository altogether with a new trac environment, otherwise you will see a message "Warning: couldn''t index the repository" when initializing the environment.

 - Non-ascii environment paths are not supported
 
 - Also, it seems that project names with spaces can be problematic for authentication (see [trac:#7163]).

 - TracPlugins located in a [TracIni#inherit-section shared plugins folder] that is defined in an [TracIni#GlobalConfiguration inherited configuration] are currently not loaded during creation, and hence, if they need to create extra tables for example, you''ll need to [TracUpgrade#UpgradetheTracEnvironment upgrade the environment] before being able to use it.

== Database Connection Strings ==

Since version 0.9, Trac supports both [http://sqlite.org/ SQLite] and
[http://www.postgresql.org/ PostgreSQL] database backends.  Preliminary
support for [http://mysql.com/ MySQL] was added in 0.10.  The default is
to use SQLite, which is probably sufficient for most projects. The database
file is then stored in the environment directory, and can easily be 
[wiki:TracBackup backed up] together with the rest of the environment.

=== SQLite Connection String ===
The connection string for an SQLite database is:
{{{
sqlite:db/trac.db
}}}
where `db/trac.db` is the path to the database file within the Trac environment.

=== PostgreSQL Connection String ===
If you want to use PostgreSQL or MySQL instead, you''ll have to use a
different connection string. For example, to connect to a PostgreSQL
database on the same machine called `trac`, that allows access to the
user `johndoe` with the password `letmein`, use:
{{{
postgres://johndoe:letmein@localhost/trac
}}}
''''Note that due to the way the above string is parsed, the "/" and "@" characters cannot be part of the password.''''

If PostgreSQL is running on a non-standard port (for example 9342), use:
{{{
postgres://johndoe:letmein@localhost:9342/trac
}}}

On UNIX, you might want to select a UNIX socket for the transport,
either the default socket as defined by the PGHOST environment variable:
{{{
postgres://user:password@/database
}}}
or a specific one:
{{{
postgres://user:password@/database?host=/path/to/socket/dir
}}}

Note that with PostgreSQL you will have to create the database before running
`trac-admin initenv`.

See the [http://www.postgresql.org/docs/ PostgreSQL documentation] for detailed instructions on how to administer [http://postgresql.org PostgreSQL].
Generally, the following is sufficient to create a database user named `tracuser`, and a database named `trac`.
{{{
createuser -U postgres -E -P tracuser
createdb -U postgres -O tracuser -E UTF8 trac
}}}
When running `createuser` you will be prompted for the password for the user ''tracuser''. This new user will not be a superuser, will not be allowed to create other databases and will not be allowed to create other roles. These privileges are not needed to run a trac instance. If no password is desired for the user, simply remove the `-P` and `-E` options from the `createuser` command.  Also note that the database should be created as UTF8. LATIN1 encoding causes errors trac''s use of unicode in trac.  SQL_ASCII also seems to work.

Under some default configurations (debian) one will have run the `createuser` and `createdb` scripts as the `postgres` user.  For example:
{{{
sudo su - postgres -c ''createuser -U postgres -S -D -R -E -P tracuser''
sudo su - postgres -c ''createdb -U postgres -O tracuser -E UTF8 trac''
}}}

Trac uses the `public` schema by default but you can specify a different schema in the connection string:
{{{
postgres://user:pass@server/database?schema=yourschemaname
}}}

=== MySQL Connection String ===

If you want to use MySQL instead, you''ll have to use a
different connection string. For example, to connect to a MySQL
database on the same machine called `trac`, that allows access to the
user `johndoe` with the password `letmein`, the mysql connection string is:
{{{
mysql://johndoe:letmein@localhost:3306/trac
}}}

== Source Code Repository ==

Since version 0.12, a single Trac environment can be connected to more than one repository. There are many different ways to connect repositories to an environment, see TracRepositoryAdmin. This page also details the various attributes that can be set for a repository (like `type`, `url`, `description`).

In Trac 0.12 `trac-admin` no longer asks questions related to repositories. Therefore, by default Trac is not connected to any source code repository, and the ''''Browse Source'''' toolbar item will not be displayed.
You can also explicitly disable the `trac.versioncontrol.*` components (which are otherwise still loaded)
{{{
[components]
trac.versioncontrol.* = disabled
}}}

For some version control systems, it is possible to specify not only the path to the repository,
but also a ''''scope'''' within the repository. Trac will then only show information
related to the files and changesets below that scope. The Subversion backend for
Trac supports this; for other types, check the corresponding plugin''s documentation.

Example of a configuration for a Subversion repository used as the default repository:
{{{
[trac]
repository_type = svn
repository_dir = /path/to/your/repository
}}}

The configuration for a scoped Subversion repository would be:
{{{
[trac]
repository_type = svn
repository_dir = /path/to/your/repository/scope/within/repos
}}}

== Directory Structure ==

An environment directory will usually consist of the following files and directories:

 * `README` - Brief description of the environment.
 * `VERSION` - Contains the environment version identifier.
 * `attachments` - Attachments to wiki pages and tickets are stored here.
 * `conf`
   * `trac.ini` - Main configuration file. See TracIni.
 * `db`
   * `trac.db` - The SQLite database (if you''re using SQLite).
 * `htdocs` - directory containing web resources, which can be referenced in Genshi templates using `/htdocs/site/...` URLs. ''''(since 0.11)''''
 * `log` - default directory for log files, if logging is turned on and a relative path is given.
 * `plugins` - Environment-specific [wiki:TracPlugins plugins] (Python eggs or single file plugins, since [trac:milestone:0.10 0.10])
 * `templates` - Custom Genshi environment-specific templates. ''''(since 0.11)''''
   * `site.html` - method to customize header, footer, and style, described in TracInterfaceCustomization#SiteAppearance

=== Caveat: don''t confuse a ''''Trac environment directory'''' with the ''''source code repository directory'''' #Caveat

This is a common beginners'' mistake.
It happens that the structure for a Trac environment is loosely modelled after the Subversion repository directory 
structure, but those are two disjoint entities and they are not and ''''must not'''' be located at the same place.

----
See also: TracAdmin, TracBackup, TracIni, TracGuide
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracFastCgi', 1, 1519728656557559, 'trac', '127.0.0.1', '[[PageOutline]]

= Trac with FastCGI =

[http://www.fastcgi.com/ FastCGI] interface allows Trac to remain resident much like with [wiki:TracModPython mod_python] or [wiki:TracModWSGI mod_wsgi]. It is faster than external CGI interfaces which must start a new process for each request.  Additionally, it is supported by much wider variety of web servers.

Note that unlike mod_python, FastCGI supports [http://httpd.apache.org/docs/suexec.html Apache SuEXEC], i.e. run with different permissions than web server running with (`mod_wsgi` supports the `WSGIDaemonProcess` with user / group parameters to achieve the same effect).

''''''Note for Windows:'''''' Trac''s FastCGI does not run under Windows, as Windows does not implement `Socket.fromfd`, which is used by `_fcgi.py`. If you want to connect to IIS, you may want to try [trac:TracOnWindowsIisAjp AJP]/[trac:TracOnWindowsIisAjp ISAPI].

[[PageOutline(2-3,Overview,inline)]]


== Simple Apache configuration ==

There are two FastCGI modules commonly available for Apache: `mod_fastcgi` and
`mod_fcgid` (preferred). The latter is more up-to-date.

The following sections focus on the FCGI specific setup, see also [wiki:TracModWSGI#ConfiguringAuthentication] for configuring the authentication in Apache.

Regardless of which cgi module is used, be sure the web server has executable permissions on the cgi-bin folder. While FastCGI will throw specific permissions errors, mod_fcgid will throw an ambiguous error if this has not been done. (Connection reset by peer: mod_fcgid: error reading data from FastCGI server) 

=== Set up with `mod_fastcgi` ===
`mod_fastcgi` uses `FastCgiIpcDir` and `FastCgiConfig` directives that should be added to an appropriate Apache configuration file:
{{{
# Enable fastcgi for .fcgi files
# (If you''re using a distro package for mod_fcgi, something like
# this is probably already present)
<IfModule mod_fastcgi.c>
   AddHandler fastcgi-script .fcgi
   FastCgiIpcDir /var/lib/apache2/fastcgi 
</IfModule>
LoadModule fastcgi_module /usr/lib/apache2/modules/mod_fastcgi.so
}}}
Setting `FastCgiIpcDir` is optional if the default is suitable. Note that the `LoadModule` line must be after the `IfModule` group.

Configure `ScriptAlias` or similar options as described in TracCgi, but
calling `trac.fcgi` instead of `trac.cgi`.

Add the following to the Apache configuration file (below the `FastCgiIpcDir` line) if you intend to set up the `TRAC_ENV` as an overall default:
{{{
FastCgiConfig -initial-env TRAC_ENV=/path/to/env/trac
}}}

Alternatively, you can serve multiple Trac projects in a directory by adding this:
{{{
FastCgiConfig -initial-env TRAC_ENV_PARENT_DIR=/parent/dir/of/projects
}}}

=== Set up with `mod_fcgid` ===
Configure `ScriptAlias` (see TracCgi for details), but call `trac.fcgi`
instead of `trac.cgi`. Note that slash at the end - it is important.
{{{
ScriptAlias /trac /path/to/www/trac/cgi-bin/trac.fcgi/
}}}

To set up Trac environment for `mod_fcgid` it is necessary to use
`DefaultInitEnv` directive. It cannot be used in `Directory` or
`Location` context, so if you need to support multiple projects, try
alternative environment setup below.

{{{
DefaultInitEnv TRAC_ENV /path/to/env/trac/
}}}

=== alternative environment setup ===
A better method to specify path to Trac environment is to embed the path
into `trac.fcgi` script itself. That doesn''t require configuration of server
environment variables, works for both FastCgi modules
(and for [http://www.lighttpd.net/ lighttpd] and CGI as well):
{{{
import os
os.environ[''TRAC_ENV''] = "/path/to/projectenv"
}}}
or
{{{
import os
os.environ[''TRAC_ENV_PARENT_DIR''] = "/path/to/project/parent/dir"
}}}

With this method different projects can be supported by using different
`.fcgi` scripts with different `ScriptAliases`.

See [https://coderanger.net/~coderanger/httpd/fcgi_example.conf this fcgid example config] which uses a !ScriptAlias directive with trac.fcgi with a trailing / like this:
{{{
ScriptAlias / /srv/tracsite/cgi-bin/trac.fcgi/
}}}

== Simple Cherokee Configuration ==

The configuration on Cherokee''s side is quite simple. You will only need to know that you can spawn Trac as an SCGI process.
You can either start it manually, or better yet, automatically by letting Cherokee spawn the server whenever it is down.
First set up an information source in cherokee-admin with a local interpreter.

{{{
Host:
localhost:4433

Interpreter:
/usr/bin/tracd —single-env —daemonize —protocol=scgi —hostname=localhost —port=4433 /path/to/project/
}}}

If the port was not reachable, the interpreter command would be launched. Note that, in the definition of the information source, you will have to manually launch the spawner if you use a ''''Remote host'''' as ''''Information source'''' instead of a ''''Local interpreter''''.

After doing this, we will just have to create a new rule managed by the SCGI handler to access Trac. It can be created in a new virtual server, trac.example.net for instance, and will only need two rules. The ''''''default'''''' one will use the SCGI handler associated to the previously created information source.
The second rule will be there to serve the few static files needed to correctly display the Trac interface. Create it as ''''Directory rule'''' for ''''/common'''' and just set it to the ''''Static files'''' handler and with a ''''Document root'''' that points to the appropriate files: ''''$TRAC_LOCAL/htdocs/'''' (where $TRAC_LOCAL is a directory defined by the user or the system administrator to place local trac resources).

Note:\\
If the tracd process fails to start up, and cherokee displays a 503 error page, you might be missing the [http://trac.saddi.com/flup python-flup] package.\\
Python-flup is a dependency which provides trac with SCGI capability. You can install it on debian based systems with:
{{{
sudo apt-get install python-flup
}}}


== Simple Lighttpd Configuration ==

The FastCGI front-end was developed primarily for use with alternative webservers, such as [http://www.lighttpd.net/ lighttpd].

lighttpd is a secure, fast, compliant and very flexible web-server that has been optimized for high-performance
environments.  It has a very low memory footprint compared to other web servers and takes care of CPU load.

For using `trac.fcgi`(prior to 0.11) / fcgi_frontend.py (0.11) with lighttpd add the following to your lighttpd.conf:
{{{
#var.fcgi_binary="/usr/bin/python /path/to/fcgi_frontend.py" # 0.11 if installed with easy_setup, it is inside the egg directory
var.fcgi_binary="/path/to/cgi-bin/trac.fcgi" # 0.10 name of prior fcgi executable
fastcgi.server = ("/trac" =>
   
                   ("trac" =>
                     ("socket" => "/tmp/trac-fastcgi.sock",
                      "bin-path" => fcgi_binary,
                      "check-local" => "disable",
                      "bin-environment" =>
                        ("TRAC_ENV" => "/path/to/projenv")
                     )
                   )
                 )
}}}

Note that you will need to add a new entry to `fastcgi.server` for each separate Trac instance that you wish to run. Alternatively, you may use the `TRAC_ENV_PARENT_DIR` variable instead of `TRAC_ENV` as described above,
and you may set one of the two in `trac.fcgi` instead of in `lighttpd.conf`
using `bin-environment` (as in the section above on Apache configuration).

Note that lighttpd has a bug related to ''SCRIPT_NAME'' and ''PATH_INFO'' when the uri of fastcgi.server is ''/'' instead of ''/trac'' in this example (see [trac:#2418]). This is fixed in lighttpd 1.5, and under lighttpd 1.4.23 or later the workaround is to add `"fix-root-scriptname" => "enable"` as a parameter of fastcgi.server.

For using two projects with lighttpd add the following to your `lighttpd.conf`:
{{{
fastcgi.server = ("/first" =>
                   ("first" =>
                    ("socket" => "/tmp/trac-fastcgi-first.sock",
                     "bin-path" => fcgi_binary,
                     "check-local" => "disable",
                     "bin-environment" =>
                       ("TRAC_ENV" => "/path/to/projenv-first")
                    )
                  ),
                  "/second" =>
                    ("second" =>
                    ("socket" => "/tmp/trac-fastcgi-second.sock",
                     "bin-path" => fcgi_binary,
                     "check-local" => "disable",
                     "bin-environment" =>
                       ("TRAC_ENV" => "/path/to/projenv-second")
                    )
                  )
                )
}}}
Note that field values are different.  If you prefer setting the environment
variables in the `.fcgi` scripts, then copy/rename `trac.fcgi`, e.g., to
`first.fcgi` and `second.fcgi`, and reference them in the above settings.
Note that the above will result in different processes in any event, even
if both are running from the same `trac.fcgi` script.

{{{
#!div class=important
''''''Note'''''' It''s very important the order on which server.modules are loaded, if mod_auth is not loaded ''''''BEFORE'''''' mod_fastcgi, then the server will fail to authenticate the user.
}}}

For authentication you should enable mod_auth in lighttpd.conf ''server.modules'', select auth.backend and auth rules:
{{{
server.modules              = (
...
  "mod_auth",
...
)

auth.backend               = "htpasswd"

# Separated password files for each project
# See "Conditional Configuration" in
# http://trac.lighttpd.net/trac/file/branches/lighttpd-merge-1.4.x/doc/configuration.txt

$HTTP["url"] =~ "^/first/" {
  auth.backend.htpasswd.userfile = "/path/to/projenv-first/htpasswd.htaccess"
}
$HTTP["url"] =~ "^/second/" {
  auth.backend.htpasswd.userfile = "/path/to/projenv-second/htpasswd.htaccess"
}

# Enable auth on trac URLs, see
# http://trac.lighttpd.net/trac/file/branches/lighttpd-merge-1.4.x/doc/authentication.txt

auth.require = ("/first/login" =>
                ("method"  => "basic",
                 "realm"   => "First project",
                 "require" => "valid-user"
                ),
                "/second/login" =>
                ("method"  => "basic",
                 "realm"   => "Second project",
                 "require" => "valid-user"
                )
               )


}}}
Note that lighttpd (I use version 1.4.3) stopped if password file doesn''t exist.

Note that lighttpd doesn''t support ''valid-user'' in versions prior to 1.3.16.

Conditional configuration is also useful for mapping static resources, i.e. serving out images and CSS directly instead of through FastCGI:
{{{
# Aliasing functionality is needed
server.modules += ("mod_alias")

# Set up an alias for the static resources
alias.url = ("/trac/chrome/common" => "/usr/share/trac/htdocs")

# Use negative lookahead, matching all requests that ask for any resource under /trac, EXCEPT in
# /trac/chrome/common, and use FastCGI for those
$HTTP["url"] =~ "^/trac(?!/chrome/common)" {
# Even if you have other fastcgi.server declarations for applications other than Trac, do NOT use += here
fastcgi.server = ("/trac" =>
                   ("trac" =>
                     ("socket" => "/tmp/trac-fastcgi.sock",
                      "bin-path" => fcgi_binary,
                      "check-local" => "disable",
                      "bin-environment" =>
                        ("TRAC_ENV" => "/path/to/projenv")
                     )
                   )
                 )
}
}}}
The technique can be easily adapted for use with multiple projects by creating aliases for each of them, and wrapping the fastcgi.server declarations inside conditional configuration blocks.
Also there is another way to handle multiple projects and it''s to use TRAC_ENV_PARENT_DIR instead of TRAC_ENV and use global auth, let''s see an example:
{{{
#  This is for handling multiple projects
  alias.url       = ( "/trac/" => "/path/to/trac/htdocs/" )

  fastcgi.server += ("/projects"  =>
                      ("trac" =>
                        (
                          "socket" => "/tmp/trac.sock",
                          "bin-path" => fcgi_binary,
                          "check-local" => "disable",
                          "bin-environment" =>
                            ("TRAC_ENV_PARENT_DIR" => "/path/to/parent/dir/of/projects/" )
                        )
                      )
                    )
#And here starts the global auth configuration
  auth.backend = "htpasswd"
  auth.backend.htpasswd.userfile = "/path/to/unique/htpassword/file/trac.htpasswd"
  $HTTP["url"] =~ "^/projects/.*/login$" {
    auth.require = ("/" =>
                     (
                       "method"  => "basic",
                       "realm"   => "trac",
                       "require" => "valid-user"
                     )
                   )
  }
}}}

Changing date/time format also supported by lighttpd over environment variable LC_TIME
{{{
fastcgi.server = ("/trac" =>
                   ("trac" =>
                     ("socket" => "/tmp/trac-fastcgi.sock",
                      "bin-path" => fcgi_binary,
                      "check-local" => "disable",
                      "bin-environment" =>
                        ("TRAC_ENV" => "/path/to/projenv",
                        "LC_TIME" => "ru_RU")
                     )
                   )
                 )
}}}
For details about languages specification see [trac:TracFaq TracFaq] question 2.13.

Other important information like the [wiki:TracInstall#MappingStaticResources mapping static resources advices] are useful for non-fastcgi specific installation aspects.
]

Relaunch lighttpd, and browse to `http://yourhost.example.org/trac` to access Trac.

Note about running lighttpd with reduced permissions:

If nothing else helps and trac.fcgi doesn''t start with lighttpd settings `server.username = "www-data"`, `server.groupname = "www-data"`, then in the `bin-environment` section set `PYTHON_EGG_CACHE` to the home directory of `www-data` or some other directory accessible to this account for writing.


== Simple !LiteSpeed Configuration ==

The FastCGI front-end was developed primarily for use with alternative webservers, such as [http://www.litespeedtech.com/ LiteSpeed].

!LiteSpeed web server is an event-driven asynchronous Apache replacement designed from the ground-up to be secure, scalable, and operate with minimal resources. !LiteSpeed can operate directly from an Apache config file and is targeted for business-critical environments.

 1. Please make sure you have first have a working install of a Trac project. Test install with “tracd” first.

 2. Create a Virtual Host for this setup. From now on we will refer to this vhost as !TracVhost. For this tutorial we will be assuming that your trac project will be accessible via:

{{{
http://yourdomain.com/trac/
}}}

 3. Go “!TracVhost → External Apps” tab and create a new “External Application”.

{{{
Name: MyTracFCGI	
Address: uds://tmp/lshttpd/mytracfcgi.sock
Max Connections: 10
Environment: TRAC_ENV=/fullpathto/mytracproject/ <--- path to root folder of trac project
Initial Request Timeout (secs): 30
Retry Timeout (secs): 0
Persistent Connection	Yes
Connection Keepalive Timeout: 30
Response Bufferring: No	
Auto Start: Yes
Command: /usr/share/trac/cgi-bin/trac.fcgi  <--- path to trac.fcgi
Back Log: 50
Instances: 10
}}}

 4. Optional. If you need to use htpasswd based authentication. Go to “!TracVhost → Security” tab and create a new security “Realm”.

{{{
DB Type: Password File
Realm Name: MyTracUserDB               <--- any name you wish and referenced later
User DB Location: /fullpathto/htpasswd <--- path to your htpasswd file
}}}

If you don’t have a htpasswd file or don’t know how to create the entries within one, go to http://sherylcanter.com/encrypt.php, to generate the user:password combos.

 5. Go to “!PythonVhost → Contexts” and create a new “FCGI Context”.

{{{
URI: /trac/                              <--- URI path to bind to python fcgi app we created	
Fast CGI App: [VHost Level] MyTractFCGI  <--- select the trac fcgi extapp we just created
Realm: TracUserDB                        <--- only if (4) is set. select realm created in (4)
}}}

 6. Modify `/fullpathto/mytracproject/conf/trac.ini`

{{{
#find/set base_rul, url, and link variables
base_url = http://yourdomain.com/trac/ <--- base url to generate correct links to
url = http://yourdomain.com/trac/      <--- link of project
link = http://yourdomain.com/trac/     <--- link of graphic logo
}}}

 7. Restart !LiteSpeed, “lswsctrl restart”, and access your new Trac project at: 

{{{
http://yourdomain.com/trac/
}}}


== Simple Nginx Configuration ==

Nginx is able to communicate with FastCGI processes, but can not spawn them. So you need to start FastCGI server for Trac separately.

 1. Nginx configuration with basic authentication handled by Nginx - confirmed to work on 0.6.32
{{{
    server {
        listen       10.9.8.7:443;
        server_name  trac.example;

        ssl                  on;
        ssl_certificate      /etc/ssl/trac.example.crt;
        ssl_certificate_key  /etc/ssl/trac.example.key;

        ssl_session_timeout  5m;

        ssl_protocols  SSLv2 SSLv3 TLSv1;
        ssl_ciphers  ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
        ssl_prefer_server_ciphers   on;

        # (Or ``^/some/prefix/(.*)``.
        if ($uri ~ ^/(.*)) {
             set $path_info /$1;
        }

        # it makes sense to serve static resources through Nginx
        location /chrome/ {
             alias /home/trac/instance/static/htdocs/;
        }

        # You can copy this whole location to ``location [/some/prefix]/login``
        # and remove the auth entries below if you want Trac to enforce
        # authorization where appropriate instead of needing to authenticate
        # for accessing the whole site.
        # (Or ``location /some/prefix``.)
        location / {
            auth_basic            "trac realm";
            auth_basic_user_file /home/trac/htpasswd;

            # socket address
            fastcgi_pass   unix:/home/trac/run/instance.sock;

            # python - wsgi specific
            fastcgi_param HTTPS on;

            ## WSGI REQUIRED VARIABLES
            # WSGI application name - trac instance prefix.
	    # (Or ``fastcgi_param  SCRIPT_NAME  /some/prefix``.)
            fastcgi_param  SCRIPT_NAME        "";
            fastcgi_param  PATH_INFO          $path_info;

            ## WSGI NEEDED VARIABLES - trac warns about them
            fastcgi_param  REQUEST_METHOD     $request_method;
            fastcgi_param  SERVER_NAME        $server_name;
            fastcgi_param  SERVER_PORT        $server_port;
            fastcgi_param  SERVER_PROTOCOL    $server_protocol;
            fastcgi_param  QUERY_STRING       $query_string;

            # For Nginx authentication to work - do not forget to comment these
            # lines if not using Nginx for authentication
            fastcgi_param  AUTH_USER          $remote_user;
            fastcgi_param  REMOTE_USER        $remote_user;

            # for ip to work
            fastcgi_param REMOTE_ADDR         $remote_addr;

            # For attchments to work
            fastcgi_param    CONTENT_TYPE     $content_type;
            fastcgi_param    CONTENT_LENGTH   $content_length;
        }
    }
}}}

 2. Modified trac.fcgi:

{{{
#!/usr/bin/env python
import os
sockaddr = ''/home/trac/run/instance.sock''
os.environ[''TRAC_ENV''] = ''/home/trac/instance''

try:
     from trac.web.main import dispatch_request
     import trac.web._fcgi

     fcgiserv = trac.web._fcgi.WSGIServer(dispatch_request, 
          bindAddress = sockaddr, umask = 7)
     fcgiserv.run()

except SystemExit:
    raise
except Exception, e:
    print ''Content-Type: text/plain\r\n\r\n'',
    print ''Oops...''
    print
    print ''Trac detected an internal error:''
    print
    print e
    print
    import traceback
    import StringIO
    tb = StringIO.StringIO()
    traceback.print_exc(file=tb)
    print tb.getvalue()

}}}

 3. reload nginx and launch trac.fcgi like that:

{{{
trac@trac.example ~ $ ./trac-standalone-fcgi.py 
}}}

The above assumes that:
 * There is a user named ''trac'' for running trac instances and keeping trac environments in its home directory.
 * `/home/trac/instance` contains a trac environment
 * `/home/trac/htpasswd` contains authentication information
 * `/home/trac/run` is owned by the same group the nginx runs under
  * and if your system is Linux the `/home/trac/run` has setgid bit set (`chmod g+s run`)
  * and patch from ticket #T7239 is applied, or you''ll have to fix the socket file permissions every time

Unfortunately nginx does not support variable expansion in fastcgi_pass directive. 
Thus it is not possible to serve multiple trac instances from one server block. 

If you worry enough about security, run trac instances under separate users. 

Another way to run trac as a FCGI external application is offered in ticket #T6224

----
See also:  TracGuide, TracInstall, [wiki:TracModWSGI ModWSGI], [wiki:TracCgi CGI], [wiki:TracModPython ModPython], [trac:TracNginxRecipe TracNginxRecipe]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracFineGrainedPermissions', 1, 1519728656561719, 'trac', '127.0.0.1', '[[PageOutline(2-5, Contents, floated)]]
= Fine grained permissions =

Before Trac 0.11, it was only possible to define fine-grained permissions checks on the repository browser sub-system.

Since 0.11, there''s a general mechanism in place that allows custom **permission policy plugins** to grant or deny any action on any kind of Trac resources, even at the level of specific versions of such resources.

Note that for Trac 0.12, `authz_policy` has been integrated as an optional module (in `tracopt.perm.authz_policy.*`), so it''s installed by default and can simply be activated via the //Plugins// panel in the Trac administration module.


== Permission Policies ==

A great diversity of permission policies can be implemented, and Trac comes with a few examples. 

Which policies are currently active is determined by a configuration setting in TracIni:
e.g.
{{{
[trac]
permission_policies = AuthzSourcePolicy, DefaultPermissionPolicy, LegacyAttachmentPolicy
}}}
This lists the [#AuthzSourcePolicy] described below as the first policy, followed by the !DefaultPermissionPolicy which checks for the traditional coarse grained style permissions described in TracPermissions, and the !LegacyAttachmentPolicy which knows how to use the coarse grained permissions for checking the permissions available on attachments.

Among the possible optional choices, there is [#AuthzPolicy], a very generic permission policy, based on an Authz-style system. See
[trac:source:branches/0.12-stable/tracopt/perm/authz_policy.py authz_policy.py] for details. 

Another popular permission policy [#AuthzSourcePolicy], re-implements the pre-0.12 support for checking fine-grained permissions limited to Subversion repositories in terms of the new system.

See also [trac:source:branches/0.12-stable/sample-plugins/permissions sample-plugins/permissions] for more examples.


=== !AuthzPolicy === 
==== Configuration ====
* Install [http://www.voidspace.org.uk/python/configobj.html ConfigObj] (still needed for 0.12).
* Copy authz_policy.py into your plugins directory (only for Trac 0.11).
* Put a [http://swapoff.org/files/authzpolicy.conf authzpolicy.conf] file somewhere, preferably on a secured location on the server, not readable for others than the webuser. If the  file contains non-ASCII characters, the UTF-8 encoding should be used.
* Update your `trac.ini`:
  1. modify the [TracIni#trac-section permission_policies] entry in the `[trac]` section
{{{
[trac]
...
permission_policies = AuthzPolicy, DefaultPermissionPolicy, LegacyAttachmentPolicy
}}}
  1. add a new `[authz_policy]` section
{{{
[authz_policy]
authz_file = /some/trac/env/conf/authzpolicy.conf
}}}
  1. enable the plugin through [/admin/general/plugin WebAdmin] or by editing the `[components]` section
{{{
[components]
...
# Trac 0.12
tracopt.perm.authz_policy.* = enabled
# for Trac 0.11 use this
#authz_policy.* = enabled 
}}}


==== Usage Notes ====
Note that the order in which permission policies are specified is quite critical, 
as policies will be examined in the sequence provided.

A policy will return either `True`, `False` or `None` for a given permission check. `True` is returned if the policy explicitly grants the permission. `False` is returned if the policy explicitly denies the permission. `None` is returned if the policy is unable to either grant or deny the permission.

NOTE: Only if the return value is `None` will the ''''next'''' permission policy be consulted.
If none of the policies explicitly grants the permission, the final result will be `False` 
(i.e. permission denied).

The `authzpolicy.conf` file is a `.ini` style configuration file:
{{{
[wiki:PrivatePage@*]
john = WIKI_VIEW, !WIKI_MODIFY
jack = WIKI_VIEW
* =
}}}
* Each section of the config is a glob pattern used to match against a Trac resource
  descriptor. These descriptors are in the form:
{{{
<realm>:<id>@<version>[/<realm>:<id>@<version> ...]
}}}
  Resources are ordered left to right, from parent to child. If any
  component is inapplicable, `*` is substituted. If the version pattern is
  not specified explicitely, all versions (`@*`) is added implicitly

  Example: Match the WikiStart page
{{{
[wiki:*]
[wiki:WikiStart*]
[wiki:WikiStart@*]
[wiki:WikiStart]
}}}

  Example: Match the attachment `wiki:WikiStart@117/attachment/FOO.JPG@*`
  on WikiStart
{{{
[wiki:*]
[wiki:WikiStart*]
[wiki:WikiStart@*]
[wiki:WikiStart@*/attachment/*]
[wiki:WikiStart@117/attachment/FOO.JPG]
}}}

* Sections are checked against the current Trac resource descriptor ''''''IN ORDER'''''' of
  appearance in the configuration file. ''''''ORDER IS CRITICAL''''''.

* Once a section matches, the current username is matched against the keys 
  (usernames) of the section, ''''''IN ORDER''''''. 
  * If a key (username) is prefixed with a `@`, it is treated as a group. 
  * If a value (permission) is prefixed with a `!`, the permission is
    denied rather than granted.

  The username will match any of ''anonymous'', ''authenticated'', <username> or ''*'', using normal Trac permission rules. || ''''''Note:'''''' Other groups which are created by user (e.g. by ''adding subjects to groups'' on web interface page //Admin / Permissions//) cannot be used. See [trac:ticket:5648 #5648] for details about this missing feature ||

For example, if the `authz_file` contains:
{{{
[wiki:WikiStart@*]
* = WIKI_VIEW

[wiki:PrivatePage@*]
john = WIKI_VIEW
* = !WIKI_VIEW
}}}
and the default permissions are set like this:
{{{
john           WIKI_VIEW
jack           WIKI_VIEW
# anonymous has no WIKI_VIEW
}}}

Then: 
  * All versions of WikiStart will be viewable by everybody (including anonymous)
  * !PrivatePage will be viewable only by john
  * other pages will be viewable only by john and jack

Groups:
{{{
[groups]
admins = john, jack
devs = alice, bob

[wiki:Dev@*]
@admins = TRAC_ADMIN
@devs = WIKI_VIEW
* =

[*]
@admins = TRAC_ADMIN
* =
}}}

Then:
- everything is blocked (whitelist approach), but
- admins get all TRAC_ADMIN everywhere and
- devs can view wiki pages.

Some repository examples (Browse Source specific):
{{{
# A single repository:
[repository:test_repo@*]
john = BROWSER_VIEW, FILE_VIEW
# John has BROWSER_VIEW and FILE_VIEW for the entire test_repo

# All repositories:
[repository:*@*]
jack = BROWSER_VIEW, FILE_VIEW
# John has BROWSER_VIEW and FILE_VIEW for all repositories
}}}

Very fine grain repository access:
{{{
# John has BROWSER_VIEW and FILE_VIEW access to trunk/src/some/location/ only
[repository:test_repo@*/source:trunk/src/some/location/*@*]
john = BROWSER_VIEW, FILE_VIEW


# John has BROWSER_VIEW and FILE_VIEW access to only revision 1 of all files at trunk/src/some/location only
[repository:test_repo@*/source:trunk/src/some/location/*@1]
john = BROWSER_VIEW, FILE_VIEW


# John has BROWSER_VIEW and FILE_VIEW access to all revisions of ''somefile'' at trunk/src/some/location only 
[repository:test_repo@*/source:trunk/src/some/location/somefile@*]
john = BROWSER_VIEW, FILE_VIEW


# John has BROWSER_VIEW and FILE_VIEW access to only revision 1 of ''somefile'' at trunk/src/some/location only
[repository:test_repo@*/source:trunk/src/some/location/somefile@1]
john = BROWSER_VIEW, FILE_VIEW
}}}

Note: In order for Timeline to work/visible for John, we must add CHANGESET_VIEW to the above permission list.


==== Missing Features ====
Although possible with the !DefaultPermissionPolicy handling (see Admin panel), fine-grained permissions still miss those grouping features (see [trac:ticket:9573 #9573], [trac:ticket:5648 #5648]). Patches are partially available, see forgotten authz_policy.2.patch  part of [trac:ticket:6680 #6680]).

You cannot do the following:
{{{
[groups]
team1 = a, b, c
team2 = d, e, f
team3 = g, h, i
departmentA = team1, team2
}}}

Permission groups are not supported either. You cannot do the following:
{{{
[groups]
permission_level_1 = WIKI_VIEW, TICKET_VIEW
permission_level_2  = permission_level_1, WIKI_MODIFY, TICKET_MODIFY
[*]
@team1 = permission_level_1
@team2 = permission_level_2
@team3 = permission_level_2, TICKET_CREATE
}}}

=== !AuthzSourcePolicy  (mod_authz_svn-like permission policy) === #AuthzSourcePolicy

At the time of this writing, the old fine grained permissions system from Trac 0.11 and before used for restricting access to the repository has  been converted to a permission policy component, but from the user point of view, this makes little if no difference.

That kind of fine-grained permission control needs a definition file, which is the one used by Subversion''s mod_authz_svn. 
More information about this file format and about its usage in Subversion is available in the  [http://svnbook.red-bean.com/en/1.5/svn.serverconfig.pathbasedauthz.html Path-Based Authorization] section in the Server Configuration chapter of the svn book.

Example:
{{{
[/]
* = r

[/branches/calc/bug-142]
harry = rw
sally = r

[/branches/calc/bug-142/secret]
harry =
}}}

 * ''''''/'''''' = ''''Everyone has read access by default''''
 * ''''''/branches/calc/bug-142'''''' = ''''harry has read/write access, sally read only''''
 * ''''''/branches/calc/bug-142/secret'''''' = ''''harry has no access, sally has read access (inherited as a sub folder permission)''''

==== Trac Configuration ====

To activate fine grained permissions you __must__ specify the {{{authz_file}}} option in the {{{[trac]}}} section of trac.ini. If this option is set to null or not specified the permissions will not be used.

{{{
[trac]
authz_file = /path/to/svnaccessfile
}}}

If you want to support the use of the `[`''''modulename''''`:/`''''some''''`/`''''path''''`]` syntax within the `authz_file`, add 

{{{
authz_module_name = modulename
}}}

where ''''modulename'''' refers to the same repository indicated by the `repository_dir` entry in the `[trac]` section. As an example, if the `repository_dir` entry in the `[trac]` section is {{{/srv/active/svn/blahblah}}}, that would yield the following:

{{{ 
[trac]
authz_file = /path/to/svnaccessfile
authz_module_name = blahblah
...
repository_dir = /srv/active/svn/blahblah 
}}}

where the svn access file, {{{/path/to/svnaccessfile}}}, contains entries such as {{{[blahblah:/some/path]}}}.

''''''Note:'''''' Usernames inside the Authz file __must__ be the same as those used inside trac. 

As of version 0.12, make sure you have ''''!AuthzSourcePolicy'''' included in the permission_policies list in trac.ini, otherwise the authz permissions file will be ignored.

{{{ 
[trac]
permission_policies = AuthzSourcePolicy, DefaultPermissionPolicy, LegacyAttachmentPolicy
}}}

==== Subversion Configuration ====

The same access file is typically applied to the corresponding Subversion repository using an Apache directive like this:
{{{
<Location /repos>
  DAV svn
  SVNParentPath /usr/local/svn

  # our access control policy
  AuthzSVNAccessFile /path/to/svnaccessfile
</Location>
}}}

For information about how to restrict access to entire projects in a multiple project environment see [trac:wiki:TracMultipleProjectsSVNAccess]

== Debugging permissions
In trac.ini set:
{{{
[logging]
log_file = trac.log
log_level = DEBUG
log_type = file
}}}

And watch:
{{{
tail -n 0 -f log/trac.log | egrep ''\[perm\]|\[authz_policy\]''
}}}

to understand what checks are being performed. See the sourced documentation of the plugin for more info.


----
See also: TracPermissions,
[http://trac-hacks.org/wiki/FineGrainedPageAuthzEditorPlugin TracHacks:FineGrainedPageAuthzEditorPlugin] for a simple editor plugin.', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracGuide', 1, 1519728656565004, 'trac', '127.0.0.1', '= The Trac User and Administration Guide =
[[TracGuideToc]]
{{{#!span style="font-size:90%"
//The TracGuide is meant to serve as a starting point for all documentation regarding Trac usage and development. The guide is a free document, a collaborative effort, and a part of the [http://trac.edgewall.org Trac Project] itself.//
}}}

== Introduction

Trac is an enhanced wiki and issue tracking system for software development projects. Trac uses a minimalistic approach to web-based software project management. It strives to help developers write great software while staying out of the way. Trac should impose as little as possible on a team''s established development process and policies.

It provides an interface to Subversion (and other version control systems), an integrated Wiki and convenient reporting facilities.

Trac allows wiki markup in issue descriptions and commit messages, creating links and seamless references between bugs, tasks, changesets, files and wiki pages. A timeline shows all current and past project events in order, making the acquisition of an overview of the project and tracking progress very easy. The roadmap shows the road ahead, listing the upcoming milestones.
== User Guide
   * Using the Wiki subsystem
     * TracWiki — How to use the built-in Wiki.
     * WikiFormatting — Reference to the wiki syntax used throughout.
   * Using the Version Control subsystem
     * TracBrowser — Browsing source code with Trac.
     * TracChangeset — Viewing changes to source code.
     * TracRevisionLog — Viewing change history.
   * Using the Ticket subsystem
     * TracTickets — Using the issue tracker.
     * TracRoadmap — The roadmap helps tracking project progress.
     * TracReports — Writing and using reports.
     * TracQuery — Executing custom ticket queries.
     * TracBatchModify - Modifying a batch of tickets in one request.
   * Other modules and general topics
     * TracSearch — Full text search in all content.
     * TracTimeline — The timeline provides a historic perspective on a project.
     * TracRss — RSS content syndication in Trac.
     * TracAccessibility — Accessibility keys support


== Administrator Guide
   * Installation and upgrade
     * TracInstall — How to install and run Trac.
     * TracUpgrade — How to upgrade existing installations.
     * TracImport — Importing tickets from other bug databases.
     * TracPlugins — Installing and managing Trac extensions.
   * Configuration and customization
     * TracIni — Trac configuration file reference. 
     * TracPermissions — Access control and permissions.
     * TracNavigation — Customize main navigation menus.
     * TracInterfaceCustomization — Customizing the Trac interface.
     * TracLogging — The Trac logging facility.
   * Administering the Version Control subsystem
     * TracRepositoryAdmin — Management of Source Code Repositories.
   * Administering the Ticket subsystem
     * TracTicketsCustomFields — Expanding tickets with customized fields.
     * TracNotification — Email notification.
     * TracWorkflow — Configurable Ticket Workflow.
   * Reference
     * TracEnvironment — All you need to know about Trac environments
     * TracAdmin — Administering a Trac project via the command-line.

== Support and Other Sources of Information ==

 * [trac:TracFaq Trac FAQ] — A collection of Frequently Asked Questions (on the project website).
 * [trac:TracDev] and [trac:TracDev/ApiDocs API docs] — Trac Developer documentation
 * TracSupport — How to get more information

If you are looking for a good place to ask a question about Trac, look no further than the [http://trac.edgewall.org/wiki/MailingList MailingList]. It provides a friendly environment to discuss openly among Trac users and developers.
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracImport', 1, 1519728656568078, 'trac', '127.0.0.1', '= Importing ticket data =
[[PageOutline]]

By means of migrating from other issue-tracking systems, perform some external actions over tickets or simply synchronize different data bases, there are some available tools, plug-ins or scripts which lets you import or up-date tickets into Trac.

Below, follows a collection of some of those.

== !TicketImportPlugin ==

 [http://trac-hacks.org/wiki/TicketImportPlugin TicketImportPlugin] :: mainly, but not only, this plug-in lets you import or up-date into Trac a series of tickets from a ''''''CSV file'''''' or (if the [http://pypi.python.org/pypi/xlrd xlrd library] is installed) from an ''''''Excel file''''''. 

== !ExportImportXlsPlugin ==

 [http://trac-hacks.org/wiki/ExportImportXlsPlugin ExportImportXlsPlugin] :: this plug-in add an admin panel for export and import tickets via ''''''XLS file''''''.
  * It depends on the python packages xlwt/rxld.

== Bugzilla ==

 [http://trac-hacks.org/wiki/BugzillaIssueTrackingPlugin BugzillaIssueTrackingPlugin] :: integrates Bugzilla into Trac keeping TracLinks

Ticket data can be imported from Bugzilla using the [http://trac.edgewall.org/browser/trunk/contrib/bugzilla2trac.py bugzilla2trac.py] script, available in the contrib/ directory of the Trac distribution.

{{{
$ bugzilla2trac.py
bugzilla2trac - Imports a bug database from Bugzilla into Trac.

Usage: bugzilla2trac.py [options]

Available Options:
  --db <MySQL dbname>              - Bugzilla''s database
  --tracenv /path/to/trac/env      - full path to Trac db environment
  -h | --host <MySQL hostname>     - Bugzilla''s DNS host name
  -u | --user <MySQL username>     - effective Bugzilla''s database user
  -p | --passwd <MySQL password>   - Bugzilla''s user password
  -c | --clean                     - remove current Trac tickets before importing
  --help | help                    - this help info

Additional configuration options can be defined directly in the script.
}}}

Currently, the following data is imported from Bugzilla:

  * bugs
  * bug activity (field changes)
  * bug attachments
  * user names and passwords (put into a htpasswd file)

The script provides a number of features to ease the conversion, such as:

  * PRODUCT_KEYWORDS:  Trac doesn''t have the concept of products, so the script provides the ability to attach a ticket keyword instead.

  * IGNORE_COMMENTS:  Don''t import Bugzilla comments that match a certain regexp.

  * STATUS_KEYWORDS:  Attach ticket keywords for the Bugzilla statuses not available in Trac.  By default, the ''VERIFIED'' and ''RELEASED'' Bugzilla statuses are translated into Trac keywords.

For more details on the available options, see the configuration section at the top of the script.

== Jira ==

 [http://trac-hacks.org/wiki/JiraToTracIntegration JiraToTracIntegration] :: provides tools to import Atlassian Jira backup files into Trac. The plug-in consists of a Python 3.1 commandline tool that:
   - Parses the Jira backup XML file
   - Sends the imported Jira data and attachments to Trac using the [http://trac-hacks.org/wiki/XmlRpcPlugin XmlRpcPlugin]
   - Generates a htpasswd file containing the imported Jira users and their SHA-512 base64 encoded passwords

== Mantis ==

 [http://trac-hacks.org/wiki/MantisImportScript MantisImportScript] :: script to import from Mantis into Trac the following data:
  * bugs
  * bug comments
  * bug activity (field changes)
  * attachments (as long as the files live in the mantis db, not on the filesystem) .

== !PlanetForge ==

 [http://trac-hacks.org/wiki/PlanetForgeImportExportPlugin PlanetForgeImportExportPlugin] :: this plugin exports Trac data (wiki, tickets, compoments, permissions, repositories, etc.) using the open format designed by the COCLICO project. It extends the webadmin panel and the ''trac admin ...'' command. Still has no ''import'' feature. 

== Scarab ==

 [http://trac-hacks.org/wiki/ScarabToTracScript ScarabToTracScript] :: script that migrates Scarab issues to Trac tickets
    * Requires [http://trac-hacks.org/wiki/XmlRpcPlugin XmlRpcPlugin]

== Sourceforge ==

 [http://trac-hacks.org/wiki/SfnToTracScript SfnToTracScript] :: importer of !SourceForge''s new backup file (originated from #Trac3521)

Also, ticket data can be imported from Sourceforge using the [http://trac.edgewall.org/browser/trunk/contrib/sourceforge2trac.py sourceforge2trac.py] script, available in the contrib/ directory of the Trac distribution.

== Other ==

Since trac uses a SQL database to store the data, you can import from other systems by examining the database tables. Just go into [http://www.sqlite.org/sqlite.html sqlite] command line to look at the tables and import into them from your application.

=== Comma delimited file - CSV ===
See [http://trac.edgewall.org/attachment/wiki/TracSynchronize/csv2trac.2.py csv2trac.2.py] for details.  This approach is particularly useful if one needs to enter a large number of tickets by hand. (note that the ticket type type field, (task etc...) is also needed for this script to work with more recent Trac releases)
Comments on script: The script has an error on line 168, (''Ticket'' needs to be ''ticket'').  Also, the listed values for severity and priority are swapped. 

----
See also: 
 * to import/export wiki pages: TracAdmin, 
 * to export tickets: TracTickets, TracQuery', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracIni', 1, 1519728656571383, 'trac', '127.0.0.1', '= The Trac Configuration File =

 ''''[Note To Editors] Please discuss documentation changes in the [#Discussion] section. Even better, send us [TracDev/SubmittingPatches documentation patches] against the ''''code'''' (i.e. where the configuration entries are documented), either on Trac-dev or on new tickets. ''''

[[TracGuideToc]]
[[PageOutline]]

Trac configuration is done by editing the ''''''`trac.ini`'''''' config file, located in `<projectenv>/conf/trac.ini`.  Changes to the configuration are usually reflected immediately, though changes to the `[components]` or `[logging]` sections will require restarting the web server. You may also need to restart the web server after creating a global configuration file when none was previously present.

The `trac.ini` configuration file and its parent directory should be writable by the web server, as Trac currently relies on the possibility to trigger a complete environment reload to flush its caches.

== Global Configuration ==

In versions prior to 0.11, the global configuration was by default located in `$prefix/share/trac/conf/trac.ini` or /etc/trac/trac.ini, depending on the distribution. If you''re upgrading, you may want to specify that file to inherit from.  Literally, when you''re upgrading to 0.11, you have to add an `[inherit]` section to your project''s `trac.ini` file. Additionally, you have to move your customized templates and common images from `$prefix/share/trac/...` to the new location.

Global options will be merged with the environment-specific options, where local options override global options. The options file is specified as follows:
{{{
[inherit]
file = /path/to/global/trac.ini
}}}
Multiple files can be specified using a comma-separated list.

Note that you can also specify a global option file when creating a new project,  by adding the option `--inherit=/path/to/global/trac.ini` to [TracAdmin#initenv trac-admin]''s `initenv` command.  If you do not do this but nevertheless intend to use a global option file with your new environment, you will have to go through the newly generated `conf/trac.ini` file and delete the entries that will otherwise override those set in the global file.

There are two more entries in the [[#inherit-section| [inherit] ]] section, `templates_dir` for sharing global templates and `plugins_dir`, for sharing plugins. Those entries can themselves be specified in the shared configuration file, and in fact, configuration files can even be chained if you specify another `[inherit] file` there.

Note that the templates found in the `templates/` directory of the TracEnvironment have precedence over those found in `[inherit] templates_dir`. In turn, the latter have precedence over the installed templates, so be careful about what you put there, notably if you override a default template be sure to refresh your modifications when you upgrade to a new version of Trac (the preferred way to perform TracInterfaceCustomization being still to write a custom plugin doing an appropriate `ITemplateStreamFilter` transformation).

== Reference for settings

This is a brief reference of available configuration options, and their default settings.

[[TracIni]]

----
See also: TracGuide, TracAdmin, TracEnvironment
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracInstall', 1, 1519728656574348, 'trac', '127.0.0.1', '= Trac Installation Guide for 1.0 = 
[[TracGuideToc]]

Trac is written in the Python programming language and needs a database, [http://sqlite.org/ SQLite], [http://www.postgresql.org/ PostgreSQL], or [http://mysql.com/ MySQL]. For HTML rendering, Trac uses the [http://genshi.edgewall.org Genshi] templating system.

Since version 0.12, Trac can also be localized, and there''s probably a translation available for your language. If you want to be able to use the Trac interface in other languages, then make sure you have installed the optional package [#OtherPythonPackages Babel]. Pay attention to the extra steps for localization support in the [#InstallingTrac Installing Trac] section below. Lacking Babel, you will only get the default english version, as usual.

If you''re interested in contributing new translations for other languages or enhance the existing translations, then please have a look at [[trac:TracL10N]].

What follows are generic instructions for installing and setting up Trac and its requirements. While you may find instructions for installing Trac on specific systems at [trac:TracInstallPlatforms TracInstallPlatforms] on the main Trac site, please be sure to ''''''first read through these general instructions'''''' to get a good understanding of the tasks involved.

[[PageOutline(2-3,Installation Steps,inline)]]

== Dependencies ==
=== Mandatory Dependencies
To install Trac, the following software packages must be installed:

 * [http://www.python.org/ Python], version >= 2.5 and < 3.0
   (note that we dropped the support for Python 2.4 in this release)
 * [http://peak.telecommunity.com/DevCenter/setuptools setuptools], version >= 0.6, or better yet, [http://pypi.python.org/pypi/distribute distribute]
 * [http://genshi.edgewall.org/wiki/Download Genshi], version >= 0.6 (unreleased version 0.7dev should work as well)

You also need a database system and the corresponding python bindings.
The database can be either SQLite, PostgreSQL or MySQL.

==== For the SQLite database #ForSQLite

As you must be using Python 2.5, 2.6 or 2.7, you already have the SQLite database bindings bundled with the standard distribution of Python (the `sqlite3` module).

However, if you''d like, you can download the latest and greatest version of [[trac:Pysqlite]] from 
[http://code.google.com/p/pysqlite/downloads/list google code], where you''ll find the Windows
installers or the `tar.gz` archive for building from source: 
{{{
$ tar xvfz <version>.tar.gz 
$ cd <version> 
$ python setup.py build_static install 
}}}
 
This will download the latest SQLite code and build the bindings. 

SQLite 2.x is no longer supported.

A known bug PySqlite versions 2.5.2-4 prohibits upgrade of trac databases
from 0.11.x to 0.12. Please use versions 2.5.5 and newer or 2.5.1 and
older. See #9434 for more detail.

See additional information in [trac:PySqlite PySqlite].

==== For the PostgreSQL database #ForPostgreSQL

You need to install the database and its Python bindings:
 * [http://www.postgresql.org/ PostgreSQL], version 8.0 or later
 * [http://pypi.python.org/pypi/psycopg2 psycopg2]

See [trac:DatabaseBackend#Postgresql DatabaseBackend] for details.


==== For the MySQL database #ForMySQL

Trac can now work quite well with MySQL, provided you follow the guidelines.

 * [http://mysql.com/ MySQL], version 5.0 or later
 * [http://sf.net/projects/mysql-python MySQLdb], version 1.2.2 or later

It is ''''''very'''''' important to read carefully the  [trac:MySqlDb] page before creating the database.

=== Optional Dependencies

==== Version Control System ====

===== Subversion =====
 * [http://subversion.apache.org/ Subversion], 1.5.x or 1.6.x and the ''''''''''corresponding'''''''''' Python bindings. Older versions starting from 1.0, like 1.2.4, 1.3.2 or 1.4.2, etc. should still work. For troubleshooting information, check the [trac:TracSubversion#Troubleshooting TracSubversion] page.

There are [http://subversion.apache.org/packages.html pre-compiled SWIG bindings] available for various platforms. (Good luck finding precompiled SWIG bindings for any Windows package at that listing. TracSubversion points you to [http://alagazam.net Algazam], which works for me under Python 2.6.)

Note that Trac ''''''doesn''t'''''' use [http://pysvn.tigris.org/ PySVN], neither does it work yet with the newer `ctype`-style bindings. 


''''''Please note:'''''' if using Subversion, Trac must be installed on the ''''''same machine''''''. Remote repositories are currently [trac:ticket:493 not supported].


===== Others =====

Support for other version control systems is provided via third-parties. See [trac:PluginList] and [trac:VersionControlSystem].

==== Web Server ====
A web server is optional because Trac is shipped with a server included, see the [#RunningtheStandaloneServer Running the Standalone Server ] section below.

Alternatively you configure Trac to run in any of the following environments.
 * [http://httpd.apache.org/ Apache] with 
   - [http://code.google.com/p/modwsgi/ mod_wsgi], see [wiki:TracModWSGI] and 
     http://code.google.com/p/modwsgi/wiki/IntegrationWithTrac
   - [http://modpython.org/ mod_python 3.3.1], deprecated: see TracModPython)
 * a [http://www.fastcgi.com/ FastCGI]-capable web server (see TracFastCgi)
 * an [http://tomcat.apache.org/connectors-doc/ajp/ajpv13a.html AJP]-capable web
   server (see [trac:TracOnWindowsIisAjp TracOnWindowsIisAjp])
 * a CGI-capable web server (see TracCgi), ''''''but usage of Trac as a cgi script 
   is highly discouraged'''''', better use one of the previous options. 
   

==== Other Python Packages ====

 * [http://babel.edgewall.org Babel], version >= 0.9.5, 
   needed for localization support (unreleased version 1.0dev should work as well)
 * [http://docutils.sourceforge.net/ docutils], version >= 0.3.9 
   for WikiRestructuredText.
 * [http://pygments.pocoo.org Pygments] for 
   [wiki:TracSyntaxColoring syntax highlighting].
   [http://silvercity.sourceforge.net/ SilverCity] and/or 
   [http://gnu.org/software/enscript/enscript.html Enscript] may still be used
   but are deprecated and you really should be using Pygments.
 * [http://pytz.sf.net pytz] to get a complete list of time zones,
   otherwise Trac will fall back on a shorter list from 
   an internal time zone implementation.

''''''Attention'''''': The various available versions of these dependencies are not necessarily interchangable, so please pay attention to the version numbers above. If you are having trouble getting Trac to work please double-check all the dependencies before asking for help on the [trac:MailingList] or [trac:IrcChannel].

Please refer to the documentation of these packages to find out how they are best installed. In addition, most of the [trac:TracInstallPlatforms platform-specific instructions] also describe the installation of the dependencies. Keep in mind however that the information there ''''probably concern older versions of Trac than the one you''re installing'''' (there are even some pages that are still talking about Trac 0.8!).


== Installing Trac ==
=== Using `easy_install`
One way to install Trac is using [http://pypi.python.org/pypi/setuptools setuptools].
With setuptools you can install Trac from the subversion repository; 

A few examples:

 - install Trac 1.0:
   {{{
   easy_install Trac==1.0
   }}}
   (NOT YET ENABLED)
 - install latest development version 1.0dev:
   {{{
   easy_install Trac==dev
   }}}
   Note that in this case you won''t have the possibility to run a localized version of Trac;
   either use a released version or install from source 

=== Using `pip`
''pip'' is an easy_install replacement that is very useful to quickly install python packages.
To get a trac installation up and running in less than 5 minutes:

Assuming you want to have your entire pip installation in `/opt/user/trac`

 - 
{{{
pip -E /opt/user/trac install trac psycopg2 
}}}
or
 - 
{{{
pip -E /opt/user/trac install trac mysql-python 
}}}

Make sure your OS specific headers are available for pip to automatically build PostgreSQL (libpq-dev) or MySQL (libmysqlclient-dev) bindings.

pip will automatically resolve all dependencies (like Genshi, pygments, etc.) and download the latest packages on pypi.python.org and create a self contained installation in `/opt/user/trac`.

All commands (`tracd`, `trac-admin`) are available in `/opt/user/trac/bin`. This can also be leveraged for `mod_python` (using `PythonHandler` directive) and `mod_wsgi` (using `WSGIDaemonProcess` directive)

Additionally, you can install several trac plugins (listed [http://pypi.python.org/pypi?:action=search&term=trac&submit=search here]) through pip.



=== From source
Of course, using the python-typical setup at the top of the source directory also works.

You can obtain the source for a .tar.gz or .zip file corresponding to a release (e.g. Trac-1.0.tar.gz), or you can get the source directly from the repository (see Trac:SubversionRepository for details).

{{{
$ python ./setup.py install
}}}

''''You''ll need root permissions or equivalent for this step.''''

This will byte-compile the python source code and install it as an .egg file or folder in the `site-packages` directory
of your Python installation. The .egg will also contain all other resources needed by standard Trac, such as htdocs and templates.

The script will also install the [wiki:TracAdmin trac-admin] command-line tool, used to create and maintain [wiki:TracEnvironment project environments], as well as the [wiki:TracStandalone tracd] standalone server.

If you install from source and want to make Trac available in other languages, make sure  Babel is installed. Only then, perform the `install` (or simply redo the `install` once again afterwards if you realize Babel was not yet installed):
{{{
$ python ./setup.py install
}}}
Alternatively, you can do a `bdist_egg` and copy the .egg from dist/ to the place of your choice, or you can create a Windows installer (`bdist_wininst`).

=== Advanced Options ===

To install Trac to a custom location, or find out about other advanced installation options, run:
{{{
easy_install --help
}}}

Also see [http://docs.python.org/inst/inst.html Installing Python Modules] for detailed information.

Specifically, you might be interested in:
{{{
easy_install --prefix=/path/to/installdir
}}}
or, if installing Trac to a Mac OS X system:
{{{
easy_install --prefix=/usr/local --install-dir=/Library/Python/2.5/site-packages
}}}
Note: If installing on Mac OS X 10.6 running {{{ easy_install http://svn.edgewall.org/repos/trac/trunk }}} will install into {{{ /usr/local }}} and {{{ /Library/Python/2.6/site-packages }}} by default

The above will place your `tracd` and `trac-admin` commands into `/usr/local/bin` and will install the Trac libraries and dependencies into `/Library/Python/2.5/site-packages`, which is Apple''s preferred location for third-party Python application installations.


== Creating a Project Environment ==

A [TracEnvironment Trac environment] is the backend storage where Trac stores information like wiki pages, tickets, reports, settings, etc. An environment is basically a directory that contains a human-readable [TracIni configuration file], and various other files and directories.

A new environment is created using [wiki:TracAdmin trac-admin]:
{{{
$ trac-admin /path/to/myproject initenv
}}}

[TracAdmin trac-admin] will prompt you for the information it needs to create the environment, such as the name of the project and the [TracEnvironment#DatabaseConnectionStrings database connection string]. If you''re not sure what to specify for one of these options, just press `<Enter>` to use the default value. 

Using the default database connection string in particular will always work as long as you have SQLite installed.
For the other [DatabaseBackend database backends] you should plan ahead and already have a database ready to use at this point.

Since 0.12, Trac doesn''t ask for a [TracEnvironment#SourceCodeRepository source code repository] anymore when creating an environment. Repositories can be [TracRepositoryAdmin added] afterward, or the version control support can be disabled completely if you don''t need it.

Also note that the values you specify here can be changed later by directly editing the [TracIni conf/trac.ini] configuration file.

Finally, make sure the user account under which the web front-end runs will have ''''''write permissions'''''' to the environment directory and all the files inside. This will be the case if you run `trac-admin ... initenv` as this user. If not, you should set the correct user afterwards. For example on Linux, with the web server running as user `apache` and group `apache`, enter:
{{{
# chown -R apache.apache /path/to/myproject
}}}

{{{#!div class=important
''''''Warning:'''''' Please only use ASCII-characters for account name and project path, unicode characters are not supported there.
}}}


== Deploying Trac

=== Running the Standalone Server ===

After having created a Trac environment, you can easily try the web interface by running the standalone server [wiki:TracStandalone tracd]:
{{{
$ tracd --port 8000 /path/to/myproject
}}}

Then, fire up a browser and visit `http://localhost:8000/`. You should get a simple listing of all environments that `tracd` knows about. Follow the link to the environment you just created, and you should see Trac in action. If you only plan on managing a single project with Trac you can have the standalone server skip the environment list by starting it like this:
{{{
$ tracd -s --port 8000 /path/to/myproject
}}}

=== Running Trac on a Web Server ===

Trac provides various options for connecting to a "real" web server: 
 - [wiki:TracFastCgi FastCGI]
 - [wiki:TracModWSGI mod_wsgi] 
 - //[wiki:TracModPython mod_python] (no longer recommended, as mod_python is not actively maintained anymore)//
 - //[wiki:TracCgi CGI] (should not be used, as the performance is far from optimal)//

Trac also supports [trac:TracOnWindowsIisAjp AJP] which may be your choice if you want to connect to IIS. Other deployment scenarios are possible: [trac:TracNginxRecipe nginx], [http://projects.unbit.it/uwsgi/wiki/Example#Traconapacheinasub-uri uwsgi], [trac:TracOnWindowsIisIsapi Isapi-wsgi] etc.

==== Generating the Trac cgi-bin directory ==== #cgi-bin

In order for Trac to function properly with FastCGI you need to have a `trac.fcgi` file and for mod_wsgi a `trac.wsgi` file. These are Python scripts which load the appropriate Python code. They can be generated using the `deploy` option of [wiki:TracAdmin trac-admin].

There is, however, a bit of a chicken-and-egg problem. The [wiki:TracAdmin trac-admin] command requires an existing environment to function, but complains if the deploy directory already exists. This is a problem, because environments are often stored in a subdirectory of the deploy. The solution is to do something like this:
{{{
mkdir -p /usr/share/trac/projects/my-project
trac-admin /usr/share/trac/projects/my-project initenv
trac-admin /usr/share/trac/projects/my-project deploy /tmp/deploy
mv /tmp/deploy/* /usr/share/trac
}}}


==== Mapping Static Resources ====

Out of the box, Trac will pass static resources such as style sheets or images through itself. For anything but a tracd only based deployment, this is far from optimal as the web server could be set up to directly serve those static resources (for CGI setup, this is ''''''highly undesirable'''''' and will cause abysmal performance).

Web servers such as [http://httpd.apache.org/ Apache] allow you to create “Aliases” to resources, giving them a virtual URL that doesn''t necessarily reflect the layout of the servers file system. We also can map requests for static resources directly to the directory on the file system, avoiding processing these requests by Trac itself.

There are two primary URL paths for static resources - `/chrome/common` and `/chrome/site`. Plugins can add their own resources, usually accessible by `/chrome/<plugin>` path, so its important to override only known paths and not try to make universal `/chrome` alias for everything.

Note that in order to get those static resources on the filesystem, you need first to extract the relevant resources from Trac using the [TracAdmin trac-admin]` <environment> deploy` command:
[[TracAdminHelp(deploy)]]

The target `<directory>` will then contain an `htdocs` directory with:
 - `site/` - a copy of the environment''s directory `htdocs/` 
 - `common/` - the static resources of Trac itself
 - `<plugins>/` - one directory for each resource directory managed by the plugins enabled for this environment

===== Example: Apache and `ScriptAlias` ===== #ScriptAlias-example

Assuming the deployment has been done this way:
{{{
$ trac-admin /var/trac/env deploy /path/to/trac/htdocs/common
}}}

Add the following snippet to Apache configuration ''''before'''' the `ScriptAlias` or `WSGIScriptAlias` (which map all the other requests to the Trac application), changing paths to match your deployment:
{{{
Alias /trac/chrome/common /path/to/trac/htdocs/common
Alias /trac/chrome/site /path/to/trac/htdocs/site

<Directory "/path/to/www/trac/htdocs">
  Order allow,deny
  Allow from all
</Directory>
}}}

If using mod_python, you might want to add this too (otherwise, the alias will be ignored):
{{{
<Location "/trac/chrome/common/">
  SetHandler None
</Location>
}}}

Note that we mapped `/trac` part of the URL to the `trac.*cgi` script, and the path `/trac/chrome/common` is the path you have to append to that location to intercept requests to the static resources. 

Similarly, if you have static resources in a project''s `htdocs` directory (which is referenced by `/trac/chrome/site` URL in themes), you can configure Apache to serve those resources (again, put this ''''before'''' the `ScriptAlias` or `WSGIScriptAlias` for the .*cgi scripts, and adjust names and locations to match your installation):
{{{
Alias /trac/chrome/site /path/to/projectenv/htdocs

<Directory "/path/to/projectenv/htdocs">
  Order allow,deny
  Allow from all
</Directory>
}}}

Alternatively to aliasing `/trac/chrome/common`, you can tell Trac to generate direct links for those static resources (and only those), using the [[wiki:TracIni#trac-section| [trac] htdocs_location]] configuration setting:
{{{
[trac]
htdocs_location = http://static.example.org/trac-common/
}}}
Note that this makes it easy to have a dedicated domain serve those static resources (preferentially [http://code.google.com/speed/page-speed/docs/request.html#ServeFromCookielessDomain cookie-less]).

Of course, you still need to make the Trac `htdocs/common` directory available through the web server at the specified URL, for example by copying (or linking) the directory into the document root of the web server:
{{{
$ ln -s /path/to/trac/htdocs/common /var/www/static.example.org/trac-common
}}}


==== Setting up the Plugin Cache ====

Some Python plugins need to be extracted to a cache directory. By default the cache resides in the home directory of the current user. When running Trac on a Web Server as a dedicated user (which is highly recommended) who has no home directory, this might prevent the plugins from starting. To override the cache location you can set the PYTHON_EGG_CACHE environment variable. Refer to your server documentation for detailed instructions on how to set environment variables.

== Configuring Authentication ==

Trac uses HTTP authentication. You''ll need to configure your webserver to request authentication when the `.../login` URL is hit (the virtual path of the "login" button). Trac will automatically pick the REMOTE_USER variable up after you provide your credentials. Therefore, all user management goes through your web server configuration. Please consult the documentation of your web server for more info.

The process of adding, removing, and configuring user accounts for authentication depends on the specific way you run Trac. 

Please refer to one of the following sections:
 * TracStandalone#UsingAuthentication if you use the standalone server, `tracd`.
 * [wiki:TracModWSGI#ConfiguringAuthentication TracModWSGI#ConfiguringAuthentication] if you use the Apache web server, with any of its front end: `mod_wsgi` of course, but the same instructions applies also for `mod_python`, `mod_fcgi` or `mod_fastcgi`.
 * TracFastCgi if you''re using another web server with FCGI support (Cherokee, Lighttpd, !LiteSpeed, nginx)

== Granting admin rights to the admin user
Grant admin rights to user admin:
{{{
$ trac-admin /path/to/myproject permission add admin TRAC_ADMIN
}}}
This user will have an "Admin" entry menu that will allow you to admin your trac project.

== Finishing the install

=== Automatic reference to the SVN changesets in Trac tickets ===

You can configure SVN to automatically add a reference to the changeset into the ticket comments, whenever changes are committed to the repository. The description of the commit needs to contain one of the following formulas:
 * ''''''`Refs #123`'''''' - to reference this changeset in `#123` ticket
 * ''''''`Fixes #123`'''''' - to reference this changeset and close `#123` ticket with the default status ''''fixed''''

This functionality requires a post-commit hook to be installed as described in [wiki:TracRepositoryAdmin#ExplicitSync TracRepositoryAdmin], and enabling the optional commit updater components by adding the following line to the `[components]` section of your [wiki:TracIni#components-section trac.ini], or enabling the components in the "Plugins" admin panel.
{{{
tracopt.ticket.commit_updater.* = enabled
}}}
For more information, see the documentation of the `CommitTicketUpdater` component in the "Plugins" admin panel.

=== Using Trac ===

Once you have your Trac site up and running, you should be able to create tickets, view the timeline, browse your version control repository if configured, etc.

Keep in mind that //anonymous// (not logged in) users can by default access only a few of the features, in particular they will have a read-only access to the resources. You will need to configure authentication and grant additional [wiki:TracPermissions permissions] to authenticated users to see the full set of features.

'''' Enjoy! ''''

[trac:TracTeam The Trac Team]

----
See also: [trac:TracInstallPlatforms TracInstallPlatforms], TracGuide, TracUpgrade, TracPermissions
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracInterfaceCustomization', 1, 1519728656578426, 'trac', '127.0.0.1', '= Customizing the Trac Interface =
[[TracGuideToc]]
[[PageOutline]]

== Introduction ==
This page is meant to give users suggestions on how they can customize the look of Trac.  Topics on this page cover editing the HTML templates and CSS files, but not the program code itself.  The topics are intended to show users how they can modify the look of Trac to meet their specific needs.  Suggestions for changes to Trac''s interface applicable to all users should be filed as tickets, not listed on this page.

== Project Logo and Icon ==
The easiest parts of the Trac interface to customize are the logo and the site icon.  Both of these can be configured with settings in [wiki:TracIni trac.ini].

The logo or icon image should be put in a folder named "htdocs" in your project''s environment folder.  (''''Note: in projects created with a Trac version prior to 0.9 you will need to create this folder'''')

 ''''Note: you can actually put the logo and icon anywhere on your server (as long as it''s accessible through the web server), and use their absolute or server-relative URLs in the configuration.''''

Now configure the appropriate section of your [wiki:TracIni trac.ini]:

=== Logo ===
Change the `src` setting to `site/` followed by the name of your image file.  The `width` and `height` settings should be modified to match your image''s dimensions (the Trac chrome handler uses "`site/`" for files within the project directory `htdocs`, and "`common/`" for the common `htdocs` directory belonging to a Trac installation). Note that ''site/'' is not a placeholder for your project name, it is the actual prefix that should be used (literally). For example, if your project is named ''sandbox'', and the image file is ''red_logo.gif'' then the ''src'' setting would be ''site/red_logo.gif'', not ''sandbox/red_logo.gif''.

{{{
[header_logo]
src = site/my_logo.gif
alt = My Project
width = 300
height = 100
}}}

=== Icon ===
Icons should be a 32x32 image in `.gif` or `.ico` format.  Change the `icon` setting to `site/` followed by the name of your icon file.  Icons will typically be displayed by your web browser next to the site''s URL and in the `Bookmarks` menu.

{{{
[project]
icon = site/my_icon.ico
}}}

Note though that this icon is ignored by Internet Explorer, which only accepts a file named ``favicon.ico`` at the root of the host. To make the project icon work in both IE and other browsers, you can store the icon in the document root of the host, and reference it from ``trac.ini`` as follows:

{{{
[project]
icon = /favicon.ico
}}}

Should your browser have issues with your favicon showing up in the address bar, you may put a "?" (less the quotation marks) after your favicon file extension. 

{{{
[project]
icon = /favicon.ico?
}}}

== Custom Navigation Entries ==
The new [mainnav] and [metanav] can now be used to customize the text and link used for the navigation items, or even to disable them (but not for adding new ones).

In the following example, we rename the link to the Wiki start "Home", and hide the "!Help/Guide". We also make the "View Tickets" entry link to a specific report .
{{{
[mainnav]
wiki.label = Home
tickets.href = /report/24

[metanav]
help = disabled
}}}

See also TracNavigation for a more detailed explanation of the mainnav and metanav terms.

== Site Appearance == #SiteAppearance

Trac is using [http://genshi.edgewall.org Genshi] as the templating engine. Documentation is yet to be written, in the meantime the following tip should work.

Say you want to add a link to a custom stylesheet, and then your own
header and footer. Save the following content as `site.html` inside your projects `templates/` directory (each Trac project can have their own `site.html`), e.g. {{{/path/to/env/templates/site.html}}}:

{{{
#!xml
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/"
      py:strip="">

  <!--! Add site-specific style sheet -->
  <head py:match="head" py:attrs="select(''@*'')">
    ${select(''*|comment()|text()'')}
    <link rel="stylesheet" type="text/css"
          href="${href.chrome(''site/style.css'')}" />
  </head>

  <body py:match="body" py:attrs="select(''@*'')">
    <!--! Add site-specific header -->
    <div id="siteheader">
      <!--! Place your header content here... -->
    </div>

    ${select(''*|text()'')}

    <!--! Add site-specific footer -->
    <div id="sitefooter">
      <!--! Place your footer content here... -->
    </div>
  </body>
</html>
}}}

Those who are familiar with XSLT may notice that Genshi templates bear some similarities. However, there are some Trac specific features - for example `${href.chrome(''site/style.css'')}` attribute references a CSS file placed into environment''s `htdocs/` directory. In a similar fashion `${chrome.htdocs_location}` is used to specify the common `htdocs/` directory belonging to a Trac installation. That latter location can however be overriden using the [[TracIni#trac-config|[trac] htdocs_location]] configuration setting.

`site.html` is one file to contain all your modifications. It usually works using the `py:match` directive (element or attribute), and it allows you to modify the page as it renders - the matches hook onto specific sections depending on what it tries to find
and modify them.
See [http://groups.google.com/group/trac-users/browse_thread/thread/70487fb2c406c937/ this thread] for a detailed explanation of the above example `site.html`.
A `site.html` can contain any number of such `py:match` sections for whatever you need to modify. This is all Genshi, so the [http://genshi.edgewall.org/wiki/Documentation/xml-templates.html docs on the exact syntax] can be found there.


Example snippet of adding introduction text to the new ticket form (but not shown during preview):

{{{#!xml
<form py:match="div[@id=''content'' and @class=''ticket'']/form" py:attrs="select(''@*'')">
  <py:if test="req.environ[''PATH_INFO''] == ''/newticket'' and (not ''preview'' in req.args)">
    <p>Please make sure to search for existing tickets before reporting a new one!</p>
  </py:if>
  ${select(''*'')} 
</form>
}}}

This example illustrates a technique of using `req.environ[''PATH_INFO'']` to limit scope of changes to one view only. For instance, to make changes in `site.html` only for timeline and avoid modifying other sections - use  `req.environ[''PATH_INFO''] == ''/timeline''` condition in `<py:if>` test.

More examples snippets for `site.html` can be found at [trac:wiki:CookBook/SiteHtml CookBook/SiteHtml].

Example snippets for `style.css` can be found at [trac:wiki:CookBook/SiteStyleCss CookBook/SiteStyleCss].

If the environment is upgraded from 0.10 and a `site_newticket.cs` file already exists, it can actually be loaded by using a workaround - providing it contains no ClearSilver processing. In addition, as only one element can be imported, the content needs some sort of wrapper such as a `<div>` block or other similar parent container. The XInclude namespace must be specified to allow includes, but that can be moved to document root along with the others:
{{{
#!xml
<form py:match="div[@id=''content'' and @class=''ticket'']/form" py:attrs="select(''@*'')"
        xmlns:xi="http://www.w3.org/2001/XInclude">
  <py:if test="req.environ[''PATH_INFO''] == ''/newticket'' and (not ''preview'' in req.args)"> 
    <xi:include href="site_newticket.cs"><xi:fallback /></xi:include>
  </py:if>
  ${select(''*'')} 
</form>
}}}

Also note that the `site.html` (despite its name) can be put in a common templates directory - see the [[TracIni#inherit-section|[inherit] templates_dir]] option. This could provide easier maintainence (and a migration path from 0.10 for larger installations) as one new global `site.html` file can be made to include any existing header, footer and newticket snippets.

== Project List == #ProjectList

You can use a custom Genshi template to display the list of projects if you are using Trac with multiple projects.  

The following is the basic template used by Trac to display a list of links to the projects.  For projects that could not be loaded it displays an error message. You can use this as a starting point for your own index template.

{{{
#!text/html
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/"
      xmlns:xi="http://www.w3.org/2001/XInclude">
  <head>
    <title>Available Projects</title>
  </head>
  <body>
    <h1>Available Projects</h1>
    <ul>
      <li py:for="project in projects" py:choose="">
        <a py:when="project.href" href="$project.href"
           title="$project.description">$project.name</a>
        <py:otherwise>
          <small>$project.name: <em>Error</em> <br /> ($project.description)</small>
        </py:otherwise>
      </li>
    </ul>
  </body>
</html>
}}}

Once you''ve created your custom template you will need to configure the webserver to tell Trac where the template is located (pls verify ... not yet changed to 0.11):

For [wiki:TracModWSGI mod_wsgi]:
{{{
os.environ[''TRAC_ENV_INDEX_TEMPLATE''] = ''/path/to/template.html''
}}}

For [wiki:TracFastCgi FastCGI]:
{{{
FastCgiConfig -initial-env TRAC_ENV_PARENT_DIR=/parent/dir/of/projects \
              -initial-env TRAC_ENV_INDEX_TEMPLATE=/path/to/template
}}}

For [wiki:TracModPython mod_python]:
{{{
PythonOption TracEnvParentDir /parent/dir/of/projects
PythonOption TracEnvIndexTemplate /path/to/template
}}}

For [wiki:TracCgi CGI]:
{{{
SetEnv TRAC_ENV_INDEX_TEMPLATE /path/to/template
}}}

For [wiki:TracStandalone], you''ll need to set up the `TRAC_ENV_INDEX_TEMPLATE` environment variable in the shell used to launch tracd:
 - Unix
   {{{
#!sh
$ export TRAC_ENV_INDEX_TEMPLATE=/path/to/template
   }}}
 - Windows
   {{{
#!sh
$ set TRAC_ENV_INDEX_TEMPLATE=/path/to/template
   }}}

== Project Templates ==

The appearance of each individual Trac environment (that is, instance of a project) can be customized independently of other projects, even those hosted by the same server. The recommended way is to use a `site.html` template (see [#SiteAppearance]) whenever possible. Using `site.html` means changes are made to the original templates as they are rendered, and you should not normally need to redo modifications whenever Trac is upgraded. If you do make a copy of `theme.html` or any other Trac template, you need to migrate your modifiations to the newer version - if not, new Trac features or bug fixes may not work as expected.

With that word of caution, any Trac template may be copied and customized. The default Trac templates are located inside the installed Trac egg (`/usr/lib/pythonVERSION/site-packages/Trac-VERSION.egg/trac/templates, .../trac/ticket/templates, .../trac/wiki/templates, ++`). The [#ProjectList] template file is called `index.html`, while the template responsible for main layout is called `theme.html`. Page assets such as images and CSS style sheets are located in the egg''s `trac/htdocs` directory.

However, do not edit templates or site resources inside the Trac egg - installing Trac again can completely delete your modifications. Instead use one of two alternatives:
 * For a modification to one project only, copy the template to project `templates` directory.
 * For a modification shared by several projects, copy the template to a shared location and have each project point to this location using the `[inherit] templates_dir =` trac.ini option.

Trac resolves requests for a template by first looking inside the project, then in any inherited templates location, and finally inside the Trac egg.

Trac caches templates in memory by default to improve performance. To apply a template you need to restart the server.

----
See also TracGuide, TracIni
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracLinks', 1, 1519728656581812, 'trac', '127.0.0.1', '= Trac Links =
[[TracGuideToc]]

TracLinks are a fundamental feature of Trac, because they allow easy hyperlinking between the various entities in the system—such as tickets, reports, changesets, Wiki pages, milestones, and source files—from anywhere WikiFormatting is used.

TracLinks are generally of the form ''''''type:id'''''' (where ''''id'''' represents the
number, name or path of the item) though some frequently used kinds of items
also have short-hand notations.

== Where to use TracLinks ==
You can use TracLinks in:

 * Source code (Subversion) commit messages
 * Wiki pages
 * Full descriptions for tickets, reports and milestones

and any other text fields explicitly marked as supporting WikiFormatting.

== Overview ==

||= Wiki Markup =||= Display =||
{{{#!td
 Wiki pages :: `CamelCase` or `wiki:CamelCase`
 Parent page :: `[..]`
 Tickets :: `#1` or `ticket:1`
 Ticket comments :: `comment:1:ticket:2`
 Reports :: `{1}` or `report:1`
 Milestones :: `milestone:1.0`
 Attachment :: `attachment:example.tgz` (for current page attachment), `attachment:attachment.1073.diff:ticket:944` (absolute path)
 Changesets :: `r1`, `[1]`, `changeset:1` or (restricted) `[1/trunk]`, `changeset:1/trunk`
 Revision log :: `r1:3`, `[1:3]` or `log:@1:3`, `log:trunk@1:3`, `[2:5/trunk]`
 Diffs :: `diff:@1:3`, `diff:plugins/0.12/mercurial-plugin@9128:9953`,
          `diff:tags/trac-0.9.2/wiki-default//tags/trac-0.9.3/wiki-default` 
          or `diff:trunk/trac@3538//sandbox/vc-refactoring@3539`
 Files :: `source:trunk/COPYING`, `source:/trunk/COPYING@200` (at version 200), `source:/trunk/COPYING@200#L25` (at version 200, line 25)
}}}
{{{#!td
 Wiki pages :: CamelCase or wiki:CamelCase
 Parent page :: [..]
 Tickets :: #1 or ticket:1
 Ticket comments :: comment:1:ticket:2 
 Reports :: {1} or report:1
 Milestones :: milestone:1.0
 Attachment :: attachment:example.tgz (for current page attachment), attachment:attachment.1073.diff:ticket:944 (absolute path)
 Changesets :: r1, [1], changeset:1 or (restricted) [1/trunk], changeset:1/trunk
 Revision log :: r1:3, [1:3] or log:@1:3, log:trunk@1:3, [2:5/trunk]
 Diffs :: diff:@1:3, diff:plugins/0.12/mercurial-plugin@9128:9953,
          diff:tags/trac-0.9.2/wiki-default//tags/trac-0.9.3/wiki-default 
          or diff:trunk/trac@3538//sandbox/vc-refactoring@3539
 Files :: source:trunk/COPYING, source:/trunk/COPYING@200 (at version 200), source:/trunk/COPYING@200#L25 (at version 200, line 25)
}}}

''''''Note:'''''' The wiki:CamelCase form is rarely used, but it can be convenient to refer to
pages whose names do not follow WikiPageNames rules, i.e., single words,
non-alphabetic characters, etc. See WikiPageNames for more about features specific
to links to Wiki page names.


{{{#!table class=""
|||| Trac links using the full (non-shorthand) notation can also be given a custom link title like this: ||
{{{#!td
{{{
[ticket:1 This is a link to ticket number one] or
[[ticket:1|This is another link to ticket number one]].
}}}
}}}
{{{#!td
[ticket:1 This is a link to ticket number one] or
[[ticket:1|This is another link to ticket number one]].
}}}
|--------------------------------------------------------------------------------------
|||| If the title is omitted, only the id (the part after the colon) is displayed:  ||
{{{#!td
{{{
[ticket:1] or [[ticket:2]]
}}}
}}}
{{{#!td
[ticket:1] or [[ticket:2]]
}}}
|--------------------------------------------------------------------------------------
|||| `wiki` is the default if the namespace part of a full link is omitted:  || 
{{{#!td
{{{
[SandBox the sandbox] or
[[SandBox|the sandbox]]
}}}
}}}
{{{#!td
[SandBox the sandbox] or
[[SandBox|the sandbox]]
}}}
|--------------------------------------------------------------------------------------
|||| The short form ''''realm:target'''' can also be wrapped within a <...> pair, [[br]] which allow for arbitrary characters (i.e. anything but >)  ||
{{{#!td
{{{
<wiki:Strange(page@!)>
}}}
}}}
{{{#!td
<wiki:Strange(page@!)>
}}}
}}}

TracLinks are a very simple idea, but actually allow quite a complex network of information. In practice, it''s very intuitive and simple to use, and we''ve found the "link trail" extremely helpful to better understand what''s happening in a project or why a particular change was made.


== Advanced use of TracLinks ==

=== Relative links ===

To create a link to a [trac:SubWiki SubWiki]-page just use a ''/'':
{{{
 WikiPage/SubWikiPage or ./SubWikiPage
}}}

To link from a [trac:SubWiki SubWiki] page to a parent, simply use a ''..'':
{{{
  [..] or [[..]]
}}}
  [..] or [[..]]

To link from a [trac:SubWiki SubWiki] page to a [=#sibling sibling] page, use a ''../'':
{{{
  [../Sibling see next sibling] or [[../Sibling|see next sibling]]
}}}
  [../Sibling see next sibling] or [[../Sibling|see next sibling]]

But in practice you often won''t need to add the `../` prefix to link to a sibling page.
For resolving the location of a wiki link, it''s the target page closest in the hierarchy
to the page where the link is written which will be selected. So for example, within 
a sub-hierarchy, a sibling page will be targeted in preference to a toplevel page.
This makes it easy to copy or move pages to a sub-hierarchy by [[WikiNewPage#renaming|renaming]] without having to adapt the links.

In order to link explicitly to a [=#toplevel toplevel] Wiki page,
use the `wiki:/` prefix.
Be careful **not** to use the `/` prefix alone, as this corresponds to the
[#Server-relativelinks] syntax and with such a link you will lack the `/wiki/` 
part in the resulting URL.

''''(Changed in 0.11)'''' Note that in Trac 0.10, using e.g. `[../newticket]`  may have worked for linking to the `/newticket` top-level URL, but since 0.11, such a link will stay in the wiki namespace and therefore link to a sibling page. 
See [#Server-relativelinks] for the new syntax.

=== Link anchors ===

To create a link to a specific anchor in a page, use ''#'':
{{{
 [#Linkanchors Link anchors] or [[#Linkanchors|Link anchors]]
}}}
  [#Linkanchors Link anchors] or [[#Linkanchors|Link anchors]]

Hint: when you move your mouse over the title of a section, a ''¶'' character will be displayed. This is a link to that specific section and you can use this to copy the `#...` part inside a relative link to an anchor.

To create a link to the first or last occurrence of a term on a page, use a ''''pseudo anchor'''' starting with ''#/'' or ''#?'':
{{{
 [#/Milestone first occurrence of Milestone] or
 [#?Milestone last occurrence of Milestone]
}}}
 [#/Milestone first occurrence of Milestone] or
 [#?Milestone last occurrence of Milestone]
This will also highlight all other matches on the linked page. By default only case sensitive matches are considered. To include case insensitive matches append ''/i'':
{{{
 [#/Milestone/i first occurrence of Milestone or milestone] or
 [#?Milestone/i last occurrence of Milestone or milestone]
}}}
 [#/Milestone/i first occurrence of Milestone or milestone] or
 [#?Milestone/i last occurrence of Milestone or milestone]

''''(since Trac 1.0)''''

Such anchors can be very useful for linking to specific lines in a file in the source browser:
{{{
 [trac:source:tags/trac-0.12/trac/wiki/api.py#L127 Line 127] or
 [trac:source:tags/trac-0.12/trac/ticket/roadmap.py#L47 Line 47]
}}}
 [trac:source:tags/trac-0.12/trac/wiki/api.py#L127 Line 127] or
 [trac:source:tags/trac-0.12/trac/ticket/roadmap.py#L47 Line 47]
(Hint: The line numbers displayed in the source browser are links to anchors on the respective lines.)

Since such links become outdated when the file changes, it can be useful to link using a ''#/'' pseudo anchor instead:
{{{
 [trac:source:trunk/trac/wiki/api.py#/IWikiSyntaxProvider IWikiSyntaxProvider] or
 [trac:source:trunk/trac/env.py#/ISystemInfoProvider ISystemInfoProvider]
}}}
 [trac:source:trunk/trac/wiki/api.py#/IWikiSyntaxProvider IWikiSyntaxProvider] or
 [trac:source:trunk/trac/env.py#/ISystemInfoProvider ISystemInfoProvider]

=== InterWiki links ===

Other prefixes can be defined freely and made to point to resources in other Web applications. The definition of those prefixes as well as the URLs of the corresponding Web applications is defined in a special Wiki page, the InterMapTxt page. Note that while this could be used to create links to other Trac environments, there''s a more specialized way to register other Trac environments which offers greater flexibility.

=== InterTrac links ===

This can be seen as a kind of InterWiki link specialized for targeting other Trac projects.

Any type of Trac link can be written in one Trac environment and actually refer to resources in another Trac environment. All that is required is to prefix the Trac link with the name of the other Trac environment followed by a colon. The other Trac environment must be registered on the InterTrac page. 

A distinctive advantage of InterTrac links over InterWiki links is that the shorthand form of Trac links (e.g. `{}`, `r`, `#`) can also be used. For example if T was set as an alias for Trac, links to Trac tickets can be written #T234, links to Trac changesets can be written [trac 1508].
See InterTrac for the complete details. 

=== Server-relative links ===

It is often useful to be able to link to objects in your project that
have no built-in Trac linking mechanism, such as static resources, `newticket`,
a shared `/register` page on the server, etc.

To link to resources inside the project, use either an absolute path from the project root, 
or a relative link from the URL of the current page (''''Changed in 0.11''''):

{{{
[/newticket Create a new ticket] or [[//newticket|Create a new ticket]]
[/ home] or [[/|home]]
}}}

Display: [/newticket Create a new ticket] or [[//newticket|Create a new ticket]]
[/ home] or [[/|home]]

To link to another location on the server (possibly outside the project but on the same host), use the `//` prefix (''''Changed in 0.11''''):

{{{
[//register Register Here] or [[//register|Register Here]]
}}}

Display: [//register Register Here] or [[//register|Register Here]]

=== Quoting space in TracLinks ===

Immediately after a TracLinks prefix, targets containing space characters should
be enclosed in a pair of quotes or double quotes.
Examples:
 * !wiki:"The whitespace convention"
 * !attachment:''the file.txt'' or
 * !attachment:"the file.txt" 
 * !attachment:"the file.txt:ticket:123" 

Note that by using [trac:WikiCreole] style links, it''s quite natural to write links containing spaces:
 * ![[The whitespace convention]]
 * ![[attachment:the file.txt]]

=== Escaping Links ===

To prevent parsing of a !TracLink, you can escape it by preceding it with a ''!'' (exclamation mark).
{{{
 !NoLinkHere.
 ![42] is not a link either.
}}}

Display:
 !NoLinkHere.
 ![42] is not a link either.


=== Parameterized Trac links ===

Many Trac resources have more than one way to be rendered, depending on some extra parameters. For example, a Wiki page can accept a `version` or a `format` parameter, a report can make use of dynamic variables, etc.

Trac links can support an arbitrary set of parameters, written in the same way as they would be for the corresponding URL. Some examples:
 - `wiki:WikiStart?format=txt`
 - `ticket:1?version=1`
 - `[/newticket?component=module1 create a ticket for module1]`
 - `[/newticket?summary=Add+short+description+here create a ticket with URL with spaces]`


== TracLinks Reference ==
The following sections describe the individual link types in detail, as well as notes on advanced usage of links.

=== attachment: links ===

The link syntax for attachments is as follows:
 * !attachment:the_file.txt creates a link to the attachment the_file.txt of the current object
 * !attachment:the_file.txt:wiki:MyPage creates a link to the attachment the_file.txt of the !MyPage wiki page
 * !attachment:the_file.txt:ticket:753 creates a link to the attachment the_file.txt of the ticket 753

Note that the older way, putting the filename at the end, is still supported: !attachment:ticket:753:the_file.txt.

If you''d like to create a direct link to the content of the attached file instead of a link to the attachment page, simply use `raw-attachment:` instead of `attachment:`.

This can be useful for pointing directly to an HTML document, for example. Note that for this use case, you''d have to allow the web browser to render the content by setting `[attachment] render_unsafe_content = yes` (see TracIni#attachment-section). Caveat: only do that in environments for which you''re 100% confident you can trust the people who are able to attach files, as otherwise this would open up your site to [wikipedia:Cross-site_scripting cross-site scripting] attacks.

See also [#export:links].

=== comment: links ===

When you''re inside a given ticket, you can simply write e.g. !comment:3 to link to the third change comment.
It is possible to link to a comment of a specific ticket from anywhere using one of the following syntax:
 - `comment:3:ticket:123` 
 - `ticket:123#comment:3` (note that you can''t write `#123#!comment:3`!)
It is also possible to link to the ticket''s description using one of the following syntax:
 - `comment:description` (within the ticket)
 - `comment:description:ticket:123`
 - `ticket:123#comment:description`

=== htdocs: links ===

Use `htdocs:path/to/file` to reference files in the `htdocs` directory of the Trac environment, the [TracEnvironment#DirectoryStructure web resource directory].

=== query: links ===

See TracQuery#UsingTracLinks and [#ticket:links].

=== search: links ===

See TracSearch#SearchLinks 

=== ticket: links ===
 ''''alias:'''' `bug:`

Besides the obvious `ticket:id` form, it is also possible to specify a list of tickets or even a range of tickets instead of the `id`. This generates a link to a custom query view containing this fixed set of tickets.

Example: 
 - `ticket:5000-6000`
 - `ticket:1,150`

''''(since Trac 0.11)''''

=== timeline: links ===

Links to the timeline can be created by specifying a date in the ISO:8601 format. The date can be optionally followed by a time specification. The time is interpreted as being UTC time, but alternatively you can specify your local time, followed by your timezone if you don''t want to compute the UTC time.

Examples:
 - `timeline:2008-01-29`
 - `timeline:2008-01-29T15:48`
 - `timeline:2008-01-29T15:48Z`
 - `timeline:2008-01-29T16:48+01`

''''(since Trac 0.11)''''

=== wiki: links ===

See WikiPageNames and [#QuotingspaceinTracLinks quoting space in TracLinks] above. It is possible to create a link to a specific page revision using the syntax WikiStart@1.

=== Version Control related links ===

It should be noted that multiple repository support works by creating a kind of virtual namespace for versioned files in which the toplevel folders correspond to the repository names. Therefore, in presence of multiple repositories, a ''''/path'''' specification in the syntax of links detailed below should start with the name of the repository. If omitted, the default repository is used. In case a toplevel folder of the default repository has the same name as a repository, the latter "wins". One can always access such folder by fully qualifying it (the default repository can be an alias of a named repository, or conversely, it is always possible to create an alias for the default repository, ask your Trac administrator).

For example, `source:/trunk/COPYING` targets the path `/trunk/COPYING` in the default repository, whereas `source:/projectA/trunk/COPYING` targets the path `/trunk/COPYING` in the repository named `projectA`. This can be the same file if `''projectA''` is an alias to the default repository or if `''''` (the default repository) is an alias to `''projectA''`.

==== source: links ====
 ''''aliases:'''' `browser:`, `repos:`

The default behavior for a source:/some/path link is to open the browser in that directory directory 
if the path points to a directory or to show the latest content of the file.

It''s also possible to link directly to a specific revision of a file like this:
 - `source:/some/file@123` - link to the file''s revision 123
 - `source:/some/file@head` - link explicitly to the latest revision of the file

If the revision is specified, one can even link to a specific line number:
 - `source:/some/file@123#L10`
 - `source:/tag/0.10@head#L10`

Finally, one can also highlight an arbitrary set of lines:
 - `source:/some/file@123:10-20,100,103#L99` - highlight lines 10 to 20, and lines 100 and 103.
   ''''(since 0.11)''''

Note that in presence of multiple repositories, the name of the repository is simply integrated in the path you specify for `source:` (e.g. `source:reponame/trunk/README`). ''''(since 0.12)''''

==== export: links ====

To force the download of a file in the repository, as opposed to displaying it in the browser, use the `export` link.  Several forms are available:
 * `export:/some/file` - get the HEAD revision of the specified file
 * `export:123:/some/file` - get revision 123 of the specified file
 * `export:/some/file@123` - get revision 123 of the specified file

This can be very useful for displaying XML or HTML documentation with correct stylesheets and images, in case that has been checked in into the repository. Note that for this use case, you''d have to allow the web browser to render the content by setting `[browser] render_unsafe_content = yes` (see TracIni#browser-section), otherwise Trac will force the files to be downloaded as attachments for security concerns. 

If the path is to a directory in the repository instead of a specific file, the source browser will be used to display the directory (identical to the result of `source:/some/dir`).

==== log: links ====

The `log:` links are used to display revision ranges. In its simplest form, it can link to the latest revisions of the specified path, but it can also support displaying an arbitrary set of revisions.
 - `log:/` - the latest revisions starting at the root of the repository
 - `log:/trunk/tools` - the latest revisions in `trunk/tools`
 - `log:/trunk/tools@10000` - the revisions in `trunk/tools` starting from  revision 10000
 - `log:@20788,20791:20795` - list revision 20788 and the revisions from 20791 to 20795 
 - `log:/trunk/tools@20788,20791:20795` - list revision 20788 and the revisions from 20791 to 20795 which affect the given path

There are short forms for revision ranges as well:
 - `[20788,20791:20795]`
 - `[20788,20791:20795/trunk/tools]`
 - `r20791:20795` (but not `r20788,20791:20795` nor `r20791:20795/trunk`)

Finally, note that in all of the above, a revision range can be written either as `x:y` or `x-y`.

In the presence of multiple repositories, the name of the repository should be specified as the first part of the path, e.g. `log:repos/branches` or `[20-40/repos]`.

----
See also: WikiFormatting, TracWiki, WikiPageNames, InterTrac, InterWiki
 
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracLogging', 1, 1519728656585675, 'trac', '127.0.0.1', '= Trac Logging =
[[TracGuideToc]]

Trac supports logging of system messages using the standard [http://docs.python.org/library/logging.html logging module] that comes with Python.

Logging is configured in the `[logging]` section in [wiki:TracIni#logging-section trac.ini].

== Supported Logging Methods ==

The log method is set using the `log_type` option in [wiki:TracIni#logging-section trac.ini], which takes any of the following values:

 ''''''none'''':: Suppress all log messages.
 ''''''file'''''':: Log messages to a file, specified with the `log_file` option in [wiki:TracIni#logging-section trac.ini]. Relative paths in `log_file` are resolved relative to the `log` directory of the environment.
 ''''''stderr'''''':: Output all log entries to console ([wiki:TracStandalone tracd] only).
 ''''''syslog'''''':: (UNIX) Send all log messages to the local syslogd via named pipe `/dev/log`. By default, syslog will write them to the file /var/log/messages.
 ''''''eventlog'''''':: (Windows) Use the system''s NT Event Log for Trac logging.

== Log Levels ==

The verbosity level of logged messages can be set using the `log_level` option in [wiki:TracIni#logging-section trac.ini]. The log level defines the minimum level of urgency required for a message to be logged, and those levels are:

 ''''''CRITICAL'''''':: Log only the most critical (typically fatal) errors.
 ''''''ERROR'''''':: Log failures, bugs and errors. 
 ''''''WARN'''''':: Log warnings, non-interrupting events.
 ''''''INFO'''''':: Diagnostic information, log information about all processing.
 ''''''DEBUG'''''':: Trace messages, profiling, etc.

Note that starting with Trac 0.11.5 you can in addition enable logging of SQL statements, at debug level. This is turned off by default, as it''s very verbose (set `[trac] debug_sql = yes` in TracIni to activate).

== Log Format ==

Starting with Trac 0.10.4 (see [trac:#2844 #2844]), it is possible to set the output format for log entries. This can be done through the `log_format` option in [wiki:TracIni#logging-section trac.ini]. The format is a string which can contain any of the [http://docs.python.org/library/logging.html#logrecord-attributes Python logging Formatter variables]. Additonally, the following Trac-specific variables can be used:
 ''''''$(basename)s'''''':: The last path component of the current environment.
 ''''''$(path)s'''''':: The absolute path for the current environment.
 ''''''$(project)s'''''':: The originating project''s name.

Note that variables are identified using a dollar sign (`$(...)s`) instead of percent sign (`%(...)s`).

The default format is:
{{{
log_format = Trac[$(module)s] $(levelname)s: $(message)s
}}}

In a multi-project environment where all logs are sent to the same place (e.g. `syslog`), it makes sense to add the project name. In this example we use `basename` since that can generally be used to identify a project:
{{{
log_format = Trac[$(basename)s:$(module)s] $(levelname)s: $(message)s
}}}

----
See also: TracIni, TracGuide, TracEnvironment', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracModPython', 1, 1519728656588720, 'trac', '127.0.0.1', '= Trac and mod_python =
[[TracGuideToc]]

Trac supports [http://www.modpython.org/ mod_python], which speeds up Trac''s response times considerably, especially compared to [TracCgi CGI], and permits use of many Apache features not possible with [wiki:TracStandalone tracd]/mod_proxy.

{{{#!div class="important"
** A Word of Warning **

As of 16^th^ June 2010, the mod_python project is officially dead.  If you are considering using mod_python for a new installation, ''''''please don''t''''''!  There are known issues which will not be fixed and there are now better alternatives.  Check out the main TracInstall pages for your target version for more information.
}}}


These instructions are for Apache 2; if you are still using Apache 1.3, you may have some luck with [trac:wiki:TracModPython2.7 TracModPython2.7], but you''ll be totally on your own.

[[PageOutline(2-3,Overview,inline)]]

== Simple configuration: single project == #Simpleconfiguration

If you just installed mod_python, you may have to add a line to load the module in the Apache configuration:
{{{
LoadModule python_module modules/mod_python.so
}}}

''''Note: The exact path to the module depends on how the HTTPD installation is laid out.''''

On Debian using apt-get
{{{
apt-get install libapache2-mod-python libapache2-mod-python-doc
}}}
(Still on Debian) after you have installed mod_python, you must enable the modules in apache2 (equivalent of the above Load Module directive):
{{{
a2enmod python
}}}
On Fedora use, using yum:
{{{
yum install mod_python
}}}
You can test your mod_python installation by adding the following to your httpd.conf.  You should remove this when you are done testing for security reasons. Note: mod_python.testhandler is only available in mod_python 3.2+.
{{{
#!xml
<Location /mpinfo>
   SetHandler mod_python
   PythonInterpreter main_interpreter
   PythonHandler mod_python.testhandler
   Order allow,deny
   Allow from all
</Location>
}}}

A simple setup of Trac on mod_python looks like this:
{{{
#!xml
<Location /projects/myproject>
   SetHandler mod_python
   PythonInterpreter main_interpreter
   PythonHandler trac.web.modpython_frontend 
   PythonOption TracEnv /var/trac/myproject
   PythonOption TracUriRoot /projects/myproject
   Order allow,deny
   Allow from all
</Location>
}}}

The option ''''''`TracUriRoot`'''''' may or may not be necessary in your setup. Try your configuration without it; if the URLs produced by Trac look wrong, if Trac does not seem to recognize URLs correctly, or you get an odd "No handler matched request to..." error, add the ''''''`TracUriRoot`'''''' option.  You will notice that the `Location` and ''''''`TracUriRoot`'''''' have the same path.

The options available are
{{{
    # For a single project
    PythonOption TracEnv /var/trac/myproject

    # For multiple projects
    PythonOption TracEnvParentDir /var/trac/myprojects

    # For the index of multiple projects
    PythonOption TracEnvIndexTemplate /srv/www/htdocs/trac/project_list_template.html

    # A space delimitted list, with a "," between key and value pairs.
    PythonOption TracTemplateVars key1,val1 key2,val2

    # Useful to get the date in the wanted order
    PythonOption TracLocale en_GB.UTF8

    # See description above        
    PythonOption TracUriRoot /projects/myproject
}}}

=== Python Egg Cache ===

Compressed python eggs like Genshi are normally extracted into a directory named `.python-eggs` in the users home directory. Since apache''s home usually is not writable an alternate egg cache directory can be specified like this:
{{{
PythonOption PYTHON_EGG_CACHE /var/trac/myprojects/egg-cache
}}}

or you can uncompress the Genshi egg to resolve problems extracting from it.

=== Configuring Authentication ===

See corresponding section in the [wiki:TracModWSGI#ConfiguringAuthentication] page.


== Advanced Configuration

=== Setting the Python Egg Cache ===

If the Egg Cache isn''t writeable by your Web server, you''ll either have to change the permissions, or point Python to a location where Apache can write. This can manifest itself as a ''''500 internal server error'''' and/or a complaint in the syslog. 

{{{
#!xml
<Location /projects/myproject>
  ...
  PythonOption PYTHON_EGG_CACHE /tmp 
  ...
</Location>
}}}


=== Setting the !PythonPath ===

If the Trac installation isn''t installed in your Python path, you''ll have to tell Apache where to find the Trac mod_python handler  using the `PythonPath` directive:
{{{
#!xml
<Location /projects/myproject>
  ...
  PythonPath "sys.path + [''/path/to/trac'']"
  ...
</Location>
}}}

Be careful about using the !PythonPath directive, and ''''not'''' `SetEnv PYTHONPATH`, as the latter won''t work.

=== Setting up multiple projects ===

The Trac mod_python handler supports a configuration option similar to Subversion''s `SvnParentPath`, called `TracEnvParentDir`:
{{{
#!xml
<Location /projects>
  SetHandler mod_python
  PythonInterpreter main_interpreter
  PythonHandler trac.web.modpython_frontend 
  PythonOption TracEnvParentDir /var/trac
  PythonOption TracUriRoot /projects
</Location>
}}}

When you request the `/projects` URL, you will get a listing of all subdirectories of the directory you set as `TracEnvParentDir` that look like Trac environment directories. Selecting any project in the list will bring you to the corresponding Trac environment.

If you don''t want to have the subdirectory listing as your projects home page you can use a
{{{
#!xml
<LocationMatch "/.+/">
}}}

This will instruct Apache to use mod_python for all locations different from root while having the possibility of placing a custom home page for root in your !DocumentRoot folder.

You can also use the same authentication realm for all of the projects using a `<LocationMatch>` directive:
{{{
#!xml
<LocationMatch "/projects/[^/]+/login">
  AuthType Basic
  AuthName "Trac"
  AuthUserFile /var/trac/.htpasswd
  Require valid-user
</LocationMatch>
}}}

=== Virtual Host Configuration ===

Below is the sample configuration required to set up your trac as a virtual server (i.e. when you access it at the URLs like
!http://trac.mycompany.com):

{{{
#!xml
<VirtualHost * >
    DocumentRoot /var/www/myproject
    ServerName trac.mycompany.com
    <Location />
        SetHandler mod_python
        PythonInterpreter main_interpreter
        PythonHandler trac.web.modpython_frontend
        PythonOption TracEnv /var/trac/myproject
        PythonOption TracUriRoot /
    </Location>
    <Location /login>
        AuthType Basic
        AuthName "MyCompany Trac Server"
        AuthUserFile /var/trac/myproject/.htpasswd
        Require valid-user
    </Location>
</VirtualHost>
}}}

This does not seem to work in all cases. What you can do if it does not:
 * Try using `<LocationMatch>` instead of `<Location>`
 * <Location /> may, in your server setup, refer to the complete host instead of simple the root of the server. This means that everything (including the login directory referenced below) will be sent to python and authentication does not work (i.e. you get the infamous Authentication information missing error). If this applies to you, try using a sub-directory for trac instead of the root (i.e. /web/ and /web/login instead of / and /login).
 * Depending on apache''s `NameVirtualHost` configuration, you may need to use `<VirtualHost *:80>` instead of `<VirtualHost *>`.

For a virtual host that supports multiple projects replace "`TracEnv`" /var/trac/myproject with "`TracEnvParentDir`" /var/trac/

Note: !DocumentRoot should not point to your Trac project env. As Asmodai wrote on #trac: "suppose there''s a webserver bug that allows disclosure of !DocumentRoot they could then leech the entire Trac environment".

== Troubleshooting ==

In general, if you get server error pages, you can either check the Apache error log, or enable the `PythonDebug` option:
{{{
#!xml
<Location /projects/myproject>
  ...
  PythonDebug on
</Location>
}}}

For multiple projects, try restarting the server as well.

=== Login Not Working ===
If you''ve used `<Location />` directive, it will override any other directives, as well as `<Location /login>`.
The workaround is to use negation expression as follows (for multi project setups):
{{{
#!xml
#this one for other pages
<Location ~ "/*(?!login)">
   SetHandler mod_python
   PythonHandler trac.web.modpython_frontend
   PythonOption TracEnvParentDir /projects
   PythonOption TracUriRoot /

</Location>
#this one for login page
<Location ~ "/[^/]+/login">
   SetHandler mod_python
   PythonHandler trac.web.modpython_frontend
   PythonOption TracEnvParentDir /projects
   PythonOption TracUriRoot /

   #remove these if you don''t want to force SSL
   RewriteEngine On 
   RewriteCond %{HTTPS} off
   RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

   AuthType Basic
   AuthName "Trac"
   AuthUserFile /projects/.htpasswd
   Require valid-user
</Location>
}}}

=== Expat-related segmentation faults === #expat

This problem will most certainly hit you on Unix when using Python 2.4.
In Python 2.4, some version of Expat (an XML parser library written in C) is used, 
and if Apache is using another version, this results in segmentation faults.
As Trac 0.11 is using Genshi, which will indirectly use Expat, that problem
can now hit you even if everything was working fine before with Trac 0.10.

See Graham Dumpleton''s detailed [http://www.dscpl.com.au/wiki/ModPython/Articles/ExpatCausingApacheCrash explanation and workarounds] for the issue.

=== Form submission problems ===

If you''re experiencing problems submitting some of the forms in Trac (a common problem is that you get redirected to the start page after submission), check whether your {{{DocumentRoot}}} contains a folder or file with the same path that you mapped the mod_python handler to. For some reason, mod_python gets confused when it is mapped to a location that also matches a static resource.

=== Problem with virtual host configuration ===

If the <Location /> directive is used, setting the `DocumentRoot` may result in a ''''403 (Forbidden)'''' error. Either remove the `DocumentRoot` directive, or make sure that accessing the directory it points is allowed (in a corresponding `<Directory>` block).

Using <Location /> together with `SetHandler` resulted in having everything handled by mod_python, which leads to not being able download any CSS or images/icons. I used <Location /trac> `SetHandler None` </Location> to circumvent the problem, though I do not know if this is the most elegant solution.

=== Problem with zipped egg ===

It''s possible that your version of mod_python will not import modules from zipped eggs. If you encounter an `ImportError: No module named trac` in your Apache logs but you think everything is where it should be, this might be your problem. Look in your site-packages directory; if the Trac module appears as a ''''file'''' rather than a ''''directory'''', then this might be your problem. To rectify, try installing Trac using the `--always-unzip` option, like this:

{{{
easy_install --always-unzip Trac-0.12b1.zip
}}}

=== Using .htaccess ===

Although it may seem trivial to rewrite the above configuration as a directory in your document root with a `.htaccess` file, this does not work. Apache will append a "/" to any Trac URLs, which interferes with its correct operation.

It may be possible to work around this with mod_rewrite, but I failed to get this working. In all, it is more hassle than it is worth. Stick to the provided instructions. :)

A success story: For me it worked out-of-box, with following trivial config:
{{{#!xml
SetHandler mod_python
PythonInterpreter main_interpreter
PythonHandler trac.web.modpython_frontend 
PythonOption TracEnv /system/path/to/this/directory
PythonOption TracUriRoot /path/on/apache

AuthType Basic
AuthName "ProjectName"
AuthUserFile /path/to/.htpasswd
Require valid-user
}}}

The `TracUriRoot` is obviously the path you need to enter to the browser to get to the trac (e.g. domain.tld/projects/trac)

=== Additional .htaccess help ===

If you are using the .htaccess method you may have additional problems if your trac directory is inheriting .htaccess directives from another.  This may also help to add to your .htaccess file:

{{{
<IfModule mod_rewrite.c>
  RewriteEngine Off
</IfModule>
}}}

=== Platform specific issues
==== Win32 Issues ====
If you run trac with mod_python < 3.2 on Windows, uploading attachments will ''''''not'''''' work. This problem is resolved in mod_python 3.1.4 or later, so please upgrade mod_python to fix this.


==== OS X issues ====

When using mod_python on OS X you will not be able to restart Apache using `apachectl restart`. This is apparently fixed in mod_python 3.2, but there''s also a patch available for earlier versions [http://www.dscpl.com.au/projects/vampire/patches.html here].

==== SELinux issues ====

If Trac reports something like: ''''Cannot get shared lock on db.lock''''
The security context on the repository may need to be set:

{{{
chcon -R -h -t httpd_sys_content_t PATH_TO_REPOSITORY
}}}

See also [http://subversion.tigris.org/faq.html#reposperms]

==== FreeBSD issues ====
Pay attention to the version of the installed mod_python and sqlite packages. Ports have both the new and old ones, but earlier versions of pysqlite and mod_python won''t integrate as the former requires threaded support in python, and the latter requires a threadless install.

If you compiled and installed apache2, apache wouldn´t support threads (cause it doesn´t work very well on FreeBSD). You could force thread support when running ./configure for apache, using --enable-threads, but this isn´t recommendable.
The best option [http://modpython.org/pipermail/mod_python/2006-September/021983.html seems to be] adding to /usr/local/apache2/bin/ennvars the line 

{{{
export LD_PRELOAD=/usr/lib/libc_r.so
}}}


==== Fedora 7 Issues ====
Make sure you install the ''python-sqlite2'' package as it seems to be required for TracModPython but not for tracd


=== Subversion issues ===

If you get the following Trac Error `Unsupported version control system "svn"` only under mod_python, though it works well on the command-line and even with TracStandalone, chances are that you forgot to add the path to the Python bindings with the [TracModPython#ConfiguringPythonPath PythonPath] directive. (The better way is to add a link to the bindings in the Python `site-packages` directory, or create a `.pth` file in that directory.)

If this is not the case, it''s possible that you''re using Subversion libraries that are binary incompatible with the apache ones (an incompatibility of the `apr` libraries is usually the cause). In that case, you also won''t be able to use the svn modules for Apache (`mod_dav_svn`).

You also need a recent version of `mod_python` in order to avoid a runtime error ({{{argument number 2: a ''apr_pool_t *'' is expected}}}) due to the default usage of multiple sub-interpreters. 3.2.8 ''''should'''' work, though it''s probably better to use the workaround described in [trac:#3371 #3371], in order to force the use of the main interpreter:
{{{
PythonInterpreter main_interpreter
}}}
This is anyway the recommended workaround for other well-known issues seen when using the Python bindings for Subversion within mod_python ([trac:#2611 #2611], [trac:#3455 #3455]). See in particular Graham Dumpleton''s comment in [trac:comment:9:ticket:3455 #3455] explaining the issue.

=== Page layout issues ===

If the formatting of the Trac pages look weird chances are that the style sheets governing the page layout are not handled properly by the web server. Try adding the following lines to your apache configuration:
{{{
#!xml
Alias /myproject/css "/usr/share/trac/htdocs/css"
<Location /myproject/css>
    SetHandler None
</Location>
}}}

Note: For the above configuration to have any effect it must be put after the configuration of your project root location, i.e. {{{<Location /myproject />}}}.

Also, setting `PythonOptimize On` seems to mess up the page headers and footers, in addition to hiding the documentation for macros and plugins (see #Trac8956). Considering how little effect the option has, it is probably a good idea to leave it `Off`.

=== HTTPS issues ===

If you want to run Trac fully under https you might find that it tries to redirect to plain http. In this case just add the following line to your apache configuration:
{{{
#!xml
<VirtualHost * >
    DocumentRoot /var/www/myproject
    ServerName trac.mycompany.com
    SetEnv HTTPS 1
    ....
</VirtualHost>
}}}


=== Segmentation fault with php5-mhash or other php5 modules ===
You may encounter segfaults (reported on debian etch) if php5-mhash module is installed. Try to remove it to see if this solves the problem. See debian bug report [http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=411487]

Some people also have troubles when using php5 compiled with its own 3rd party libraries instead of system libraries. Check here [http://www.djangoproject.com/documentation/modpython/#if-you-get-a-segmentation-fault]

----
See also:  TracGuide, TracInstall, [wiki:TracModWSGI ModWSGI], [wiki:TracFastCgi FastCGI],  [trac:TracNginxRecipe TracNginxRecipe]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracModWSGI', 1, 1519728656592443, 'trac', '127.0.0.1', '= Trac and mod_wsgi =


[http://code.google.com/p/modwsgi/ mod_wsgi] is an Apache module for running WSGI-compatible Python applications directly on top of the Apache webserver. The mod_wsgi adapter is written completely in C and provides very good performances.

[[PageOutline(2-3,Overview,inline)]]

== The `trac.wsgi` script

Trac can be run on top of mod_wsgi with the help of the following application script, which is just a Python file, though usually saved with a `.wsgi` extension). 

=== A very basic script
In its simplest form, the script could be:

{{{#!python
import os

os.environ[''TRAC_ENV''] = ''/usr/local/trac/mysite''
os.environ[''PYTHON_EGG_CACHE''] = ''/usr/local/trac/mysite/eggs''

import trac.web.main
application = trac.web.main.dispatch_request
}}}

The `TRAC_ENV` variable should naturally be the directory for your Trac environment (if you have several Trac environments in a directory, you can also use `TRAC_ENV_PARENT_DIR` instead), while the `PYTHON_EGG_CACHE` should be a directory where Python can temporarily extract Python eggs.

=== A more elaborate script

If you''re using multiple `.wsgi` files (for example one per Trac environment) you must ''''not'''' use `os.environ[''TRAC_ENV'']` to set the path to the Trac environment. Using this method may lead to Trac delivering the content of another Trac environment, as the variable may be filled with the path of a previously viewed Trac environment. 

To solve this problem, use the following `.wsgi` file instead:
{{{#!python
import os

os.environ[''PYTHON_EGG_CACHE''] = ''/usr/local/trac/mysite/eggs''

import trac.web.main
def application(environ, start_response):
  environ[''trac.env_path''] = ''/usr/local/trac/mysite'' 
  return trac.web.main.dispatch_request(environ, start_response)
}}}

For clarity, you should give this file a `.wsgi` extension. You should probably put the file in its own directory, since you will expose it to Apache. 

If you have installed Trac and eggs in a path different from the standard one you should add that path by adding the following code at the top of the wsgi script:

{{{#!python
import site
site.addsitedir(''/usr/local/trac/lib/python2.4/site-packages'')
}}}

Change it according to the path you installed the Trac libs at.

=== Recommended `trac.wsgi` script

A somewhat robust and generic version of this file can be created using the `trac-admin <env> deploy <dir>` command which automatically substitutes the required paths (see TracInstall#cgi-bin).


== Mapping requests to the script

After you''ve done preparing your .wsgi script, add the following to your Apache configuration file (`httpd.conf` for example).

{{{
WSGIScriptAlias /trac /usr/local/trac/mysite/apache/mysite.wsgi

<Directory /usr/local/trac/mysite/apache>
    WSGIApplicationGroup %{GLOBAL}
    Order deny,allow
    Allow from all
</Directory>
}}}

Here, the script is in a subdirectory of the Trac environment.

If you followed the directions [http://trac.edgewall.org/wiki/TracInstall#cgi-bin Generating the Trac cgi-bin directory], your Apache configuration file should look like following:

{{{
WSGIScriptAlias /trac /usr/share/trac/cgi-bin/trac.wsgi

<Directory /usr/share/trac/cgi-bin>
    WSGIApplicationGroup %{GLOBAL}
    Order deny,allow
    Allow from all
</Directory>
}}}

In order to let Apache run the script, access to the directory in which the script resides is opened up to all of Apache. Additionally, the `WSGIApplicationGroup` directive ensures that Trac is always run in the first Python interpreter created by mod_wsgi; this is necessary because the Subversion Python bindings, which are used by Trac, don''t always work in other sub-interpreters and may cause requests to hang or cause Apache to crash as a result. After adding this configuration, restart Apache, and then it should work.

To test the setup of Apache, mod_wsgi and Python itself (ie. without involving Trac and dependencies), this simple wsgi application can be used to make sure that requests gets served (use as only content in your `.wsgi` script):

{{{#!python
def application(environ, start_response):
        start_response(''200 OK'',[(''Content-type'',''text/html'')])
        return [''<html><body>Hello World!</body></html>'']
}}}

For more information about using the mod_wsgi specific directives, see the [http://code.google.com/p/modwsgi/wiki/ mod_wsgi''s wiki] and more specifically the [http://code.google.com/p/modwsgi/wiki/IntegrationWithTrac IntegrationWithTrac] page.


== Configuring Authentication

We describe in the the following sections different methods for setting up authentication.

See also [http://httpd.apache.org/docs/2.2/howto/auth.html Authentication, Authorization and Access Control] in the Apache guide.

=== Using Basic Authentication ===

The simplest way to enable authentication with Apache is to create a password file. Use the `htpasswd` program to create the password file:
{{{
$ htpasswd -c /somewhere/trac.htpasswd admin
New password: <type password>
Re-type new password: <type password again>
Adding password for user admin
}}}

After the first user, you dont need the "-c" option anymore:
{{{
$ htpasswd /somewhere/trac.htpasswd john
New password: <type password>
Re-type new password: <type password again>
Adding password for user john
}}}

  ''''See the man page for `htpasswd` for full documentation.''''

After you''ve created the users, you can set their permissions using TracPermissions.

Now, you''ll need to enable authentication against the password file in the Apache configuration:
{{{
<Location "/trac/login">
  AuthType Basic
  AuthName "Trac"
  AuthUserFile /somewhere/trac.htpasswd
  Require valid-user
</Location>
}}}

If you''re hosting multiple projects you can use the same password file for all of them:
{{{
<LocationMatch "/trac/[^/]+/login">
  AuthType Basic
  AuthName "Trac"
  AuthUserFile /somewhere/trac.htpasswd
  Require valid-user
</LocationMatch>
}}}
Note that neither a file nor a directory named ''login'' needs to exist.[[BR]]
See also the [http://httpd.apache.org/docs/2.2/mod/mod_auth_basic.html mod_auth_basic] documentation.

=== Using Digest Authentication ===

For better security, it is recommended that you either enable SSL or at least use the “digest” authentication scheme instead of “Basic”. 

You''ll have to create your `.htpasswd` file with the `htdigest` command instead of `htpasswd`, as follows:
{{{
# htdigest -c /somewhere/trac.htpasswd trac admin
}}}

The "trac" parameter above is the "realm", and will have to be reused in the Apache configuration in the !AuthName directive:

{{{
<Location "/trac/login">

    AuthType Digest
    AuthName "trac"
    AuthDigestDomain /trac
    AuthUserFile /somewhere/trac.htpasswd
    Require valid-user
</Location>
}}}

For multiple environments, you can use the same `LocationMatch` as described with the previous method.

Don''t forget to activate the mod_auth_digest. For example, on a Debian 4.0r1 (etch) system:
{{{
    LoadModule auth_digest_module /usr/lib/apache2/modules/mod_auth_digest.so
}}}


See also the [http://httpd.apache.org/docs/2.2/mod/mod_auth_digest.html mod_auth_digest] documentation.

=== Using LDAP Authentication 

Configuration for [http://httpd.apache.org/docs/2.2/mod/mod_ldap.html mod_ldap] authentication in Apache is a bit tricky (httpd 2.2.x and OpenLDAP: slapd 2.3.19)

1. You need to load the following modules in Apache httpd.conf
{{{
LoadModule ldap_module modules/mod_ldap.so
LoadModule authnz_ldap_module modules/mod_authnz_ldap.so
}}}

2. Your httpd.conf also needs to look something like:

{{{
<Location /trac/>
  # (if you''re using it, mod_python specific settings go here)
  Order deny,allow
  Deny from all
  Allow from 192.168.11.0/24
  AuthType Basic
  AuthName "Trac"
  AuthBasicProvider "ldap"
  AuthLDAPURL "ldap://127.0.0.1/dc=example,dc=co,dc=ke?uid?sub?(objectClass=inetOrgPerson)"
  authzldapauthoritative Off
  Require valid-user
</Location>
}}}


3. You can use the LDAP interface as a way to authenticate to a Microsoft Active Directory:


Use the following as your LDAP URL:
{{{
    AuthLDAPURL "ldap://directory.example.com:3268/DC=example,DC=com?sAMAccountName?sub?(objectClass=user)"
}}}

You will also need to provide an account for Apache to use when checking
credentials. As this password will be listed in plaintext in the
config, you should be sure to use an account specifically for this task:
{{{
    AuthLDAPBindDN ldap-auth-user@example.com
    AuthLDAPBindPassword "password"
}}}

The whole section looks like:
{{{
<Location /trac/>
  # (if you''re using it, mod_python specific settings go here)
  Order deny,allow
  Deny from all
  Allow from 192.168.11.0/24
  AuthType Basic
  AuthName "Trac"
  AuthBasicProvider "ldap"
  AuthLDAPURL "ldap://adserver.company.com:3268/DC=company,DC=com?sAMAccountName?sub?(objectClass=user)"
  AuthLDAPBindDN       ldap-auth-user@company.com
  AuthLDAPBindPassword "the_password"
  authzldapauthoritative Off
  # require valid-user
  require ldap-group CN=Trac Users,CN=Users,DC=company,DC=com
</Location>
}}}

Note 1: This is the case where the LDAP search will get around the multiple OUs, conecting to Global Catalog Server portion of AD (Notice the port is 3268, not the normal LDAP 389). The GCS is basically a "flattened" tree which allows searching for a user without knowing to which OU they belong.

Note 2: You can also require the user be a member of a certain LDAP group, instead of
just having a valid login:
{{{
    Require ldap-group CN=Trac Users,CN=Users,DC=example,DC=com
}}}

See also:
  - [http://httpd.apache.org/docs/2.2/mod/mod_authnz_ldap.html mod_authnz_ldap], documentation for mod_authnz_ldap
    
 - [http://httpd.apache.org/docs/2.2/mod/mod_ldap.html mod_ldap], documentation for mod_ldap, which provides connection pooling and a shared cache.
 - [http://trac-hacks.org/wiki/LdapPlugin TracHacks:LdapPlugin] for storing TracPermissions in LDAP.

=== Using SSPI Authentication

If you are using Apache on Windows, you can use mod_auth_sspi to provide
single-sign-on. Download the module from the !SourceForge [http://sourceforge.net/projects/mod-auth-sspi/ mod-auth-sspi project] and then add the
following to your !VirtualHost:
{{{
    <Location /trac/login>
        AuthType SSPI
        AuthName "Trac Login"
        SSPIAuth On
        SSPIAuthoritative On
        SSPIDomain MyLocalDomain
        SSPIOfferBasic On
        SSPIOmitDomain Off
        SSPIBasicPreferred On
        Require valid-user
    </Location>
}}}

Using the above, usernames in Trac will be of the form `DOMAIN\username`, so
you may have to re-add permissions and such. If you do not want the domain to
be part of the username, set `SSPIOmitDomain On` instead.

Some common problems with SSPI authentication: [trac:#1055], [trac:#1168] and [trac:#3338].

See also [trac:TracOnWindows/Advanced].

=== Using Apache authentication with the Account Manager plugin''s Login form ===

To begin with, see the basic instructions for using the Account Manager plugin''s [http://trac-hacks.org/wiki/AccountManagerPlugin/Modules#LoginModule Login module] and its [http://trac-hacks.org/wiki/AccountManagerPlugin/AuthStores#HttpAuthStore HttpAuthStore authentication module].

''''''Note:'''''' If is difficult to get !HttpAuthStore to work with WSGI when using any Account Manager version prior to acct_mgr-0.4. Upgrading is recommended.

Here is an example (from the !HttpAuthStore link) using acct_mgr-0.4 for hosting a single project:
{{{
[components]
; be sure to enable the component
acct_mgr.http.HttpAuthStore = enabled

[account-manager]
; configure the plugin to use a page that is secured with http authentication
authentication_url = /authFile
password_store = HttpAuthStore
}}}
This will generally be matched with an Apache config like:
{{{
<Location /authFile>
   …HTTP authentication configuration…
   Require valid-user
</Location>
}}}
Note that ''''''authFile'''''' need not exist. See the !HttpAuthStore link above for examples where multiple Trac projects are hosted on a server.

=== Example: Apache/mod_wsgi with Basic Authentication, Trac being at the root of a virtual host

Per the mod_wsgi documentation linked to above, here is an example Apache configuration that a) serves the Trac instance from a virtualhost subdomain and b) uses Apache basic authentication for Trac authentication.


If you want your Trac to be served from e.g. !http://trac.my-proj.my-site.org, then from the folder e.g. `/home/trac-for-my-proj`, if you used the command `trac-admin the-env initenv` to create a folder `the-env`, and you used `trac-admin the-env deploy the-deploy` to create a folder `the-deploy`, then first:

Create the htpasswd file:
{{{
cd /home/trac-for-my-proj/the-env
htpasswd -c htpasswd firstuser
### and add more users to it as needed:
htpasswd htpasswd seconduser
}}}
(keep the file above your document root for security reasons)

Create this file e.g. (ubuntu) `/etc/apache2/sites-enabled/trac.my-proj.my-site.org.conf` with the following contents:

{{{
<Directory /home/trac-for-my-proj/the-deploy/cgi-bin/trac.wsgi>
  WSGIApplicationGroup %{GLOBAL}
  Order deny,allow
  Allow from all
</Directory>

<VirtualHost *:80>
  ServerName trac.my-proj.my-site.org
  DocumentRoot /home/trac-for-my-proj/the-env/htdocs/
  WSGIScriptAlias / /home/trac-for-my-proj/the-deploy/cgi-bin/trac.wsgi
  <Location ''/''>
    AuthType Basic
    AuthName "Trac"
    AuthUserFile /home/trac-for-my-proj/the-env/htpasswd
    Require valid-user
  </Location>
</VirtualHost>

}}}

Note: for subdomains to work you would probably also need to alter `/etc/hosts` and add A-Records to your host''s DNS.


== Troubleshooting

=== Use a recent version

Please use either version 1.6, 2.4 or later of `mod_wsgi`. Versions prior to 2.4 in the 2.X branch have problems with some Apache configurations that use WSGI file wrapper extension. This extension is used in Trac to serve up attachments and static media files such as style sheets. If you are affected by this problem attachments will appear to be empty and formatting of HTML pages will appear not to work due to style sheet files not loading properly. Another frequent symptom is that binary attachment downloads are truncated. See mod_wsgi tickets [http://code.google.com/p/modwsgi/issues/detail?id=100 #100] and [http://code.google.com/p/modwsgi/issues/detail?id=132 #132].

''''Note: using mod_wsgi 2.5 and Python 2.6.1 gave an Internal Server Error on my system (Apache 2.2.11 and Trac 0.11.2.1). Upgrading to Python 2.6.2 (as suggested [http://www.mail-archive.com/modwsgi@googlegroups.com/msg01917.html here]) solved this for me[[BR]]-- Graham Shanks''''

If you plan to use `mod_wsgi` in embedded mode on Windows or with the MPM worker on Linux, then you''ll even need version 0.3.4 or greater (see [trac:#10675] for details).

=== Getting Trac to work nicely with SSPI and ''Require Group'' ===
If like me you''ve set Trac up on Apache, Win32 and configured SSPI, but added a ''Require group'' option to your apache configuration, then the SSPIOmitDomain option is probably not working.  If its not working your usernames in trac are probably looking like ''DOMAIN\user'' rather than ''user''.

This WSGI script ''fixes'' things, hope it helps:
{{{#!python
import os
import trac.web.main

os.environ[''TRAC_ENV''] = ''/usr/local/trac/mysite''
os.environ[''PYTHON_EGG_CACHE''] = ''/usr/local/trac/mysite/eggs''

def application(environ, start_response):
    if "\\" in environ[''REMOTE_USER'']:
        environ[''REMOTE_USER''] = environ[''REMOTE_USER''].split("\\", 1)[1]
    return trac.web.main.dispatch_request(environ, start_response)
}}}


=== Trac with PostgreSQL ===

When using the mod_wsgi adapter with multiple Trac instances and PostgreSQL (or MySQL?) as a database back-end, the server ''''may'''' create a lot of open database connections and thus PostgreSQL processes.

A somewhat brutal workaround is to disabled connection pooling in Trac. This is done by setting `poolable = False` in `trac.db.postgres_backend` on the `PostgreSQLConnection` class.

But it''s not necessary to edit the source of Trac, the following lines in `trac.wsgi` will also work:

{{{
import trac.db.postgres_backend
trac.db.postgres_backend.PostgreSQLConnection.poolable = False
}}}

or

{{{
import trac.db.mysql_backend
trac.db.mysql_backend.MySQLConnection.poolable = False
}}}

Now Trac drops the connection after serving a page and the connection count on the database will be kept minimal.

//This is not a recommended approach though. See also the notes at the bottom of the [http://code.google.com/p/modwsgi/wiki/IntegrationWithTrac mod_wsgi''s IntegrationWithTrac] wiki page.//

=== Other resources

For more troubleshooting tips, see also the [TracModPython#Troubleshooting mod_python troubleshooting] section, as most Apache-related issues are quite similar, plus discussion of potential [http://code.google.com/p/modwsgi/wiki/ApplicationIssues application issues] when using mod_wsgi. The wsgi page also has a [http://code.google.com/p/modwsgi/wiki/IntegrationWithTrac Integration With Trac] document.


----
See also:  TracGuide, TracInstall, [wiki:TracFastCgi FastCGI], [wiki:TracModPython ModPython], [trac:TracNginxRecipe TracNginxRecipe]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracNavigation', 1, 1519728656596016, 'trac', '127.0.0.1', '= Trac Navigation =

Starting with Trac 0.11, it is now possible to customize the main and meta navigation entries in some basic ways.

The new `[mainnav]` and `[metanav]` configuration sections can now be used to customize the text and link used for the navigation items, or even to disable them.  The `mainnav` and `metanav` options in the `[trac]` configuration section can also be used to change the order.

=== `[mainnav]` #mainnav-bar
`[mainnav]` corresponds to the ''''''main navigation bar'''''', the one containing entries such as ''''Wiki'''', ''''Timeline'''', ''''Roadmap'''', ''''Browse Source'''' and so on. This navigation bar is meant to access the default page of the main modules enabled in Trac that are accessible for the current user.


** [=#Example Example] ** 

In the following example, we rename the link to the Wiki start "Home", and make the "View Tickets" entry link to a specific report.  The second example (below) also hides the "!Help/Guide" link.

Relevant excerpt from the TracIni:
{{{
[mainnav]
wiki.label = Home
tickets.href = /report/24
}}}

=== `[metanav]` #metanav-bar
`[metanav]` corresponds to the ''''''meta navigation bar'''''', by default positioned above the main navigation bar and below the ''''Search'''' box. It contains the ''''Log in'''', ''''Logout'''', ''''!Help/Guide'''' etc. entries. This navigation bar is meant to access some global information about the Trac project and the current user.

There is one special entry in the  `[metanav]` section: `logout.redirect` is the page the user sees after hitting the logout button. 
[[comment(see also #Trac3808)]]

** Example ** 

{{{
[metanav]
help = disabled
logout.redirect = wiki/Logout
}}}


=== Notes
Possible URL formats (for `.href` or `.redirect`):
|| ''''''config'''''' || ''''''redirect to'''''' ||
|| `wiki/Logout` || `/projects/env/wiki/Logout` ||
|| `http://hostname/` || `http://hostname/` ||
|| `/projects` || `/projects` ||


=== `[trac]` #nav-order
The `mainnav` and `metanav` options in the `[trac]` configuration section control the order in which the navigation items are displayed (left to right).  This can be useful with plugins that add navigation items.

** Example ** 

In the following example, we change the order to prioritise the ticket related items further left.

Relevant excerpt from the TracIni:
{{{
[trac]
mainnav = wiki,tickets,newticket,timeline,roadmap,browser,search,admin
}}}

The default order and item names can be viewed in the [TracIni#trac-section trac section of TracIni].

=== Context Navigation #ctxtnav-bar

Note that it is still not possible to customize the ''''''contextual navigation bar'''''', i.e. the one usually placed below the main navigation bar.


----
See also: TracInterfaceCustomization, and the [http://trac-hacks.org/wiki/NavAddPlugin TracHacks:NavAddPlugin] or [http://trac-hacks.org/wiki/MenusPlugin TracHacks:MenusPlugin] (still needed for adding entries)', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracNotification', 1, 1519728656599017, 'trac', '127.0.0.1', '= Email Notification of Ticket Changes =
[[TracGuideToc]]

Trac supports notification of ticket changes via email. 

Email notification is useful to keep users up-to-date on tickets/issues of interest, and also provides a convenient way to post all ticket changes to a dedicated mailing list. For example, this is how the [http://lists.edgewall.com/archive/trac-tickets/ Trac-tickets] mailing list is set up.

Disabled by default, notification can be activated and configured in [wiki:TracIni trac.ini].

== Receiving Notification Mails ==
When reporting a new ticket or adding a comment, enter a valid email address or your username in the ''''reporter'''', ''''assigned to/owner'''' or ''''cc'''' field. Trac will automatically send you an email when changes are made to the ticket (depending on how notification is configured).

This is useful to keep up-to-date on an issue or enhancement request that interests you.

=== How to use your username to receive notification mails ===

To receive notification mails, you can either enter a full email address or your username. To get notified with a simple username or login, you need to specify a valid email address in the ''''Preferences'''' page. 

Alternatively, a default domain name (''''''`smtp_default_domain`'''''') can be set in the TracIni file (see [#ConfigurationOptions Configuration Options] below). In this case, the default domain will be appended to the username, which can be useful for an "Intranet" kind of installation.

When using apache and mod_kerb for authentication against Kerberos / Active Directory, usernames take the form (''''''`username@EXAMPLE.LOCAL`''''''). To avoid this being interpreted as an email address, add the Kerberos domain to  (''''''`ignore_domains`'''''').

== Configuring SMTP Notification ==

''''''Important:'''''' For TracNotification to work correctly, the `[trac] base_url` option must be set in [wiki:TracIni trac.ini]. 

=== Configuration Options ===
These are the available options for the `[notification]` section in trac.ini.

 * ''''''`smtp_enabled`'''''': Enable email notification.
 * ''''''`smtp_from`'''''': Email address to use for ''''Sender''''-headers in notification emails.
 * ''''''`smtp_from_name`'''''': Sender name to use for ''''Sender''''-headers in notification emails.
 * ''''''`smtp_from_author`'''''': (''''since 1.0'''') Use the author of a change (the reporter of a new ticket, or the author of a comment) as the `From:` header value in notification e-mails (default: false). If the author hasn''t set an e-mail address, `smtp_from` and `smtp_from_name` are used instead.
 * ''''''`smtp_replyto`'''''': Email address to use for ''''Reply-To''''-headers in notification emails.
 * ''''''`smtp_default_domain`'''''': (''''since 0.10'''') Append the specified domain to addresses that do not contain one. Fully qualified addresses are not modified. The default domain is appended to all username/login for which an email address cannot be found from the user settings.
 * ''''''`smtp_always_cc`'''''': List of email addresses to always send notifications to. ''''Typically used to post ticket changes to a dedicated mailing list.''''
 * ''''''`smtp_always_bcc`'''''': (''''since 0.10'''') List of email addresses to always send notifications to, but keeps addresses not visible from other recipients of the notification email 
 * ''''''`smtp_subject_prefix`'''''': (''''since 0.10.1'''') Text that is inserted before the subject of the email. Set to "!__default!__" by default.
 * ''''''`always_notify_reporter`'''''':  Always send notifications to any address in the reporter field (default: false).
 * ''''''`always_notify_owner`'''''': (''''since 0.9'''') Always send notifications to the address in the owner field (default: false).
 * ''''''`always_notify_updater`'''''': (''''since 0.10'''') Always send a notification to the updater of a ticket (default: true).
 * ''''''`use_public_cc`'''''': (''''since 0.10'''') Addresses in To: (owner, reporter) and Cc: lists are visible by all recipients (default is ''''Bcc:'''' - hidden copy).
 * ''''''`use_short_addr`'''''': (''''since 0.10'''') Enable delivery of notifications to addresses that do not contain a domain (i.e. do not end with ''''@<domain.com>'''').This option is useful for intranets, where the SMTP server can handle local addresses and map the username/login to a local mailbox. See also `smtp_default_domain`. Do not use this option with a public SMTP server. 
 * ''''''`ignore_domains`'''''': Comma-separated list of domains that should not be considered part of email addresses (for usernames with Kerberos domains).
 * ''''''`mime_encoding`'''''': (''''since 0.10'''') This option allows selecting the MIME encoding scheme. Supported values:
   * `none`: default value, uses 7bit encoding if the text is plain ASCII, or 8bit otherwise. 
   * `base64`: works with any kind of content. May cause some issues with touchy anti-spam/anti-virus engines.
   * `qp` or `quoted-printable`: best for european languages (more compact than base64) if 8bit encoding cannot be used.
 * ''''''`ticket_subject_template`'''''': (''''since 0.11'''') A [http://genshi.edgewall.org/wiki/Documentation/text-templates.html Genshi text template] snippet used to get the notification subject.
 * ''''''`email_sender`'''''': (''''since 0.12'''') Name of the component implementing `IEmailSender`. This component is used by the notification system to send emails. Trac currently provides the following components:
   * `SmtpEmailSender`: connects to an SMTP server (default).
   * `SendmailEmailSender`: runs a `sendmail`-compatible executable.

Either ''''''`smtp_from`'''''' or ''''''`smtp_replyto`'''''' (or both) ''''must'''' be set, otherwise Trac refuses to send notification mails.

The following options are specific to email delivery through SMTP.
 * ''''''`smtp_server`'''''': SMTP server used for notification messages.
 * ''''''`smtp_port`'''''': (''''since 0.9'''') Port used to contact the SMTP server.
 * ''''''`smtp_user`'''''': (''''since 0.9'''') User name for authentication SMTP account.
 * ''''''`smtp_password`'''''': (''''since 0.9'''') Password for authentication SMTP account.
 * ''''''`use_tls`'''''': (''''since 0.10'''') Toggle to send notifications via a SMTP server using [http://en.wikipedia.org/wiki/Transport_Layer_Security TLS], such as GMail.

The following option is specific to email delivery through a `sendmail`-compatible executable.
 * ''''''`sendmail_path`'''''': (''''since 0.12'''') Path to the sendmail executable. The sendmail program must accept the `-i` and `-f` options.

=== Example Configuration (SMTP) ===
{{{
[notification]
smtp_enabled = true
smtp_server = mail.example.com
smtp_from = notifier@example.com
smtp_replyto = myproj@projects.example.com
smtp_always_cc = ticketmaster@example.com, theboss+myproj@example.com
}}}

=== Example Configuration (`sendmail`) ===
{{{
[notification]
smtp_enabled = true
email_sender = SendmailEmailSender
sendmail_path = /usr/sbin/sendmail
smtp_from = notifier@example.com
smtp_replyto = myproj@projects.example.com
smtp_always_cc = ticketmaster@example.com, theboss+myproj@example.com
}}}

=== Customizing the e-mail subject ===
The e-mail subject can be customized with the `ticket_subject_template` option, which contains a [http://genshi.edgewall.org/wiki/Documentation/text-templates.html Genshi text template] snippet. The default value is:
{{{
$prefix #$ticket.id: $summary
}}}
The following variables are available in the template:

 * `env`: The project environment (see [trac:source:/trunk/trac/env.py env.py]).
 * `prefix`: The prefix defined in `smtp_subject_prefix`.
 * `summary`: The ticket summary, with the old value if the summary was edited.
 * `ticket`: The ticket model object (see [trac:source:/trunk/trac/ticket/model.py model.py]). Individual ticket fields can be addressed by appending the field name separated by a dot, e.g. `$ticket.milestone`.

=== Customizing the e-mail content ===

The notification e-mail content is generated based on `ticket_notify_email.txt` in `trac/templates`.  You can add your own version of this template by adding a `ticket_notify_email.txt` to the templates directory of your environment. The default looks like this:

{{{
$ticket_body_hdr
$ticket_props
{% choose ticket.new %}\
{%   when True %}\
$ticket.description
{%   end %}\
{%   otherwise %}\
{%     if changes_body %}\
${_(''Changes (by %(author)s):'', author=change.author)}

$changes_body
{%     end %}\
{%     if changes_descr %}\
{%       if not changes_body and not change.comment and change.author %}\
${_(''Description changed by %(author)s:'', author=change.author)}
{%       end %}\
$changes_descr
--
{%     end %}\
{%     if change.comment %}\

${changes_body and _(''Comment:'') or _(''Comment (by %(author)s):'', author=change.author)}

$change.comment
{%     end %}\
{%   end %}\
{% end %}\

-- 
${_(''Ticket URL: <%(link)s>'', link=ticket.link)}
$project.name <${project.url or abs_href()}>
$project.descr
}}}
== Sample Email ==
{{{
#42: testing
---------------------------+------------------------------------------------
       Id:  42             |      Status:  assigned                
Component:  report system  |    Modified:  Fri Apr  9 00:04:31 2004
 Severity:  major          |   Milestone:  0.9                     
 Priority:  lowest         |     Version:  0.6                     
    Owner:  anonymous      |    Reporter:  jonas@example.com               
---------------------------+------------------------------------------------
Changes:
  * component:  changset view => search system
  * priority:  low => highest
  * owner:  jonas => anonymous
  * cc:  daniel@example.com =>
         daniel@example.com, jonas@example.com
  * status:  new => assigned

Comment:
I''m interested too!

--
Ticket URL: <http://example.com/trac/ticket/42>
My Project <http://myproj.example.com/>
}}}


== Customizing e-mail content for MS Outlook ==

Out-of-the-box, MS Outlook normally presents plain text e-mails with a variable-width font; the ticket properties table will most certainly look like a mess in MS Outlook. This can be fixed with some customization of the [#Customizingthee-mailcontent e-mail template].

Replace the following second row in the template:
{{{
$ticket_props
}}}

with this instead (''''requires Python 2.6 or later''''):
{{{
--------------------------------------------------------------------------
{% with
   pv = [(a[0].strip(), a[1].strip()) for a in [b.split('':'') for b in
         [c.strip() for c in 
          ticket_props.replace(''|'', ''\n'').splitlines()[1:-1]] if '':'' in b]];
   sel = [''Reporter'', ''Owner'', ''Type'', ''Status'', ''Priority'', ''Milestone'', 
          ''Component'', ''Severity'', ''Resolution'', ''Keywords''] %}\
${''\n''.join(''%s\t%s'' % (format(p[0]+'':'', '' <12''), p[1]) for p in pv if p[0] in sel)}
{% end %}\
--------------------------------------------------------------------------
}}}

The table of ticket properties is replaced with a list of a selection of the properties. A tab character separates the name and value in such a way that most people should find this more pleasing than the default table, when using MS Outlook.
{{{#!div style="margin: 1em 1.75em; border:1px dotted"
{{{#!html
#42: testing<br />
--------------------------------------------------------------------------<br />
<table cellpadding=0>
<tr><td>Reporter:</td><td>jonas@example.com</td></tr>
<tr><td>Owner:</td><td>anonymous</td></tr>
<tr><td>Type:</td><td>defect</td></tr>
<tr><td>Status:</td><td>assigned</td></tr>
<tr><td>Priority:</td><td>lowest</td></tr>
<tr><td>Milestone:</td><td>0.9</td></tr>
<tr><td>Component:</td><td>report system</td></tr>
<tr><td>Severity:</td><td>major</td></tr>
<tr><td>Resolution:</td><td> </td></tr>
<tr><td>Keywords:</td><td> </td></tr>
</table>
--------------------------------------------------------------------------<br />
Changes:<br />
<br />
&nbsp;&nbsp;* component: &nbsp;changset view =&gt; search system<br />
&nbsp;&nbsp;* priority: &nbsp;low =&gt; highest<br />
&nbsp;&nbsp;* owner: &nbsp;jonas =&gt; anonymous<br />
&nbsp;&nbsp;* cc: &nbsp;daniel@example.com =&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;daniel@example.com, jonas@example.com<br />
&nbsp;&nbsp;* status: &nbsp;new =&gt; assigned<br />
<br />
Comment:<br />
I''m interested too!<br />
<br />
--<br />
Ticket URL: &lt;http://example.com/trac/ticket/42&gt;<br />
My Project &lt;http://myproj.example.com/&gt;<br />
}}}
}}}

**Important**: Only those ticket fields that are listed in `sel` are part of the HTML mail. If you have defined custom ticket fields which shall be part of the mail they have to be added to `sel`, example:
{{{
   sel = [''Reporter'', ..., ''Keywords'', ''Custom1'', ''Custom2'']
}}}

However, it''s not as perfect as an automatically HTML-formatted e-mail would be, but presented ticket properties are at least readable by default in MS Outlook...


== Using GMail as the SMTP relay host ==

Use the following configuration snippet
{{{
[notification]
smtp_enabled = true
use_tls = true
mime_encoding = base64
smtp_server = smtp.gmail.com
smtp_port = 587
smtp_user = user
smtp_password = password
}}}

where ''''user'''' and ''''password'''' match an existing GMail account, ''''i.e.'''' the ones you use to log in on [http://gmail.com]

Alternatively, you can use `smtp_port = 25`.[[br]]
You should not use `smtp_port = 465`. It will not work and your ticket submission may deadlock. Port 465 is reserved for the SMTPS protocol, which is not supported by Trac. See [comment:ticket:7107:2 #7107] for details.
 
== Filtering notifications for one''s own changes ==
In Gmail, use the filter:

{{{
from:(<smtp_from>) (("Reporter: <username>" -Changes) OR "Changes (by <username>)")
}}}

For Trac .10, use the filter:
{{{
from:(<smtp_from>) (("Reporter: <username>" -Changes -Comment) OR "Changes (by <username>)" OR "Comment (by <username>)")
}}}

to delete these notifications.

In Thunderbird, there is no such solution if you use IMAP
(see http://kb.mozillazine.org/Filters_(Thunderbird)#Filtering_the_message_body).

The best you can do is to set "always_notify_updater" in conf/trac.ini to false.
You will however still get an email if you comment a ticket that you own or have reported.

You can also add this plugin:
http://trac-hacks.org/wiki/NeverNotifyUpdaterPlugin

== Troubleshooting ==

If you cannot get the notification working, first make sure the log is activated and have a look at the log to find if an error message has been logged. See TracLogging for help about the log feature.

Notification errors are not reported through the web interface, so the user who submit a change or a new ticket never gets notified about a notification failure. The Trac administrator needs to look at the log to find the error trace.

=== ''''Permission denied'''' error ===

Typical error message:
{{{
  ...
  File ".../smtplib.py", line 303, in connect
    raise socket.error, msg
  error: (13, ''Permission denied'')
}}}

This error usually comes from a security settings on the server: many Linux distributions do not let the web server (Apache, ...) to post email message to the local SMTP server.

Many users get confused when their manual attempts to contact the SMTP server succeed:
{{{
telnet localhost 25
}}}
The trouble is that a regular user may connect to the SMTP server, but the web server cannot:
{{{
sudo -u www-data telnet localhost 25
}}}

In such a case, you need to configure your server so that the web server is authorized to post to the SMTP server. The actual settings depend on your Linux distribution and current security policy. You may find help browsing the Trac [trac:MailingList MailingList] archive.

Relevant ML threads:
 * SELinux: http://article.gmane.org/gmane.comp.version-control.subversion.trac.general/7518

For SELinux in Fedora 10:
{{{
$ setsebool -P httpd_can_sendmail 1
}}}
=== ''''Suspected spam'''' error ===

Some SMTP servers may reject the notification email sent by Trac.

The default Trac configuration uses Base64 encoding to send emails to the recipients. The whole body of the email is encoded, which sometimes trigger ''''false positive'''' SPAM detection on sensitive email servers. In such an event, it is recommended to change the default encoding to "quoted-printable" using the `mime_encoding` option.

Quoted printable encoding works better with languages that use one of the Latin charsets. For Asian charsets, it is recommended to stick with the Base64 encoding.

=== ''''501, 5.5.4 Invalid Address'''' error ===

On IIS 6.0 you could get a 
{{{
Failure sending notification on change to ticket #1: SMTPHeloError: (501, ''5.5.4 Invalid Address'')
}}}
in the trac log. Have a look [http://support.microsoft.com/kb/291828 here] for instructions on resolving it.


----
See also: TracTickets, TracIni, TracGuide
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracPermissions', 1, 1519728656602843, 'trac', '127.0.0.1', '= Trac Permissions =
[[TracGuideToc]]

Trac uses a simple, case sensitive, permission system to control what users can and can''t access.

Permission privileges are managed using the [TracAdmin trac-admin] tool or (new in version 0.11) the ''''General / Permissions'''' panel in the ''''Admin'''' tab of the web interface.

In addition to the default permission policy described in this page, it is possible to activate additional permission policies by enabling plugins and listing them in the `[trac] permission_policies` configuration entry in the TracIni. See TracFineGrainedPermissions for more details.

Non-authenticated users accessing the system are assigned the name "anonymous". Assign permissions to the "anonymous" user to set privileges for anonymous/guest users. The parts of Trac that a user does not have the privileges for will not be displayed in the navigation.
In addition to these privileges, users can be granted additional individual rights in effect when authenticated and logged into the system. All logged in users belong to the virtual group "authenticated", which inherits permissions from "anonymous".

== Graphical Admin Tab ==
''''This feature is new in version 0.11.''''

To access this tab, a user must have one of the following permissions: `TRAC_ADMIN`, `PERMISSION_ADMIN`, `PERMISSION_ADD`, `PERMISSION_REMOVE`. The permissions can granted using the `trac-admin` command (more on `trac-admin` below):
{{{
  $ trac-admin /path/to/projenv permission add bob TRAC_ADMIN
}}}

Then, the user `bob` will be able to see the Admin tab, and can then access the permissions menu. This menu will allow you to perform all the following actions, but from the browser without requiring root access to the server (just the correct permissions for your user account). ''''''Use at least one lowercase character in user names, as all-uppercase names are reserved for permissions.''''''

 1. [[Image(htdocs:../common/guide/admin.png)]]
 1. [[Image(htdocs:../common/guide/admin-permissions.png)]]
 1. [[Image(htdocs:../common/guide/admin-permissions-TICKET_ADMIN.png)]]

An easy way to quickly secure a new Trac install is to run the above command on the anonymous user, install the [http://trac-hacks.org/wiki/AccountManagerPlugin AccountManagerPlugin], create a new admin account graphically and then remove the TRAC_ADMIN permission from the anonymous user.

== Available Privileges ==

To enable all privileges for a user, use the `TRAC_ADMIN` permission. Having `TRAC_ADMIN` is like being `root` on a *NIX system: it will allow you to perform any operation.

Otherwise, individual privileges can be assigned to users for the various different functional areas of Trac (''''''note that the privilege names are case-sensitive''''''):

=== Repository Browser ===

|| `BROWSER_VIEW` || View directory listings in the [wiki:TracBrowser repository browser] ||
|| `LOG_VIEW` || View revision logs of files and directories in the [wiki:TracBrowser repository browser] ||
|| `FILE_VIEW` || View files in the [wiki:TracBrowser repository browser] ||
|| `CHANGESET_VIEW` || View [wiki:TracChangeset repository check-ins] ||

=== Ticket System ===

|| `TICKET_VIEW` || View existing [wiki:TracTickets tickets] and perform [wiki:TracQuery ticket queries] ||
|| `TICKET_CREATE` || Create new [wiki:TracTickets tickets] ||
|| `TICKET_APPEND` || Add comments or attachments to [wiki:TracTickets tickets] ||
|| `TICKET_CHGPROP` || Modify [wiki:TracTickets ticket] properties (priority, assignment, keywords, etc.) with the following exceptions: edit description field, add/remove other users from cc field when logged in, and set email to pref ||
|| `TICKET_MODIFY` || Includes both `TICKET_APPEND` and `TICKET_CHGPROP`, and in addition allows resolving [wiki:TracTickets tickets]. Tickets can be assigned to users through a [TracTickets#Assign-toasDrop-DownList drop-down list] when the list of possible owners has been restricted. ||
|| `TICKET_EDIT_CC` || Full modify cc field ||
|| `TICKET_EDIT_DESCRIPTION` || Modify description field ||
|| `TICKET_EDIT_COMMENT` || Modify comments ||
|| `TICKET_BATCH_MODIFY` || [wiki:TracBatchModify Batch modify] tickets ||
|| `TICKET_ADMIN` || All `TICKET_*` permissions, plus the deletion of ticket attachments and modification of the reporter and description fields. It also allows managing ticket properties in the WebAdmin panel. ||

Attention: the "view tickets" button appears with the `REPORT_VIEW` permission.

=== Roadmap ===

|| `MILESTONE_VIEW` || View milestones and assign tickets to milestones. ||
|| `MILESTONE_CREATE` || Create a new milestone ||
|| `MILESTONE_MODIFY` || Modify existing milestones ||
|| `MILESTONE_DELETE` || Delete milestones ||
|| `MILESTONE_ADMIN` || All `MILESTONE_*` permissions ||
|| `ROADMAP_VIEW` || View the [wiki:TracRoadmap roadmap] page, is not (yet) the same as MILESTONE_VIEW, see [trac:#4292 #4292] ||
|| `ROADMAP_ADMIN` || to be removed with [trac:#3022 #3022], replaced by MILESTONE_ADMIN ||

=== Reports ===

|| `REPORT_VIEW` || View [wiki:TracReports reports], i.e. the "view tickets" link. ||
|| `REPORT_SQL_VIEW` || View the underlying SQL query of a [wiki:TracReports report] ||
|| `REPORT_CREATE` || Create new [wiki:TracReports reports] ||
|| `REPORT_MODIFY` || Modify existing [wiki:TracReports reports] ||
|| `REPORT_DELETE` || Delete [wiki:TracReports reports] ||
|| `REPORT_ADMIN` || All `REPORT_*` permissions ||

=== Wiki System ===

|| `WIKI_VIEW` || View existing [wiki:TracWiki wiki] pages ||
|| `WIKI_CREATE` || Create new [wiki:TracWiki wiki] pages ||
|| `WIKI_MODIFY` || Change [wiki:TracWiki wiki] pages ||
|| `WIKI_RENAME` || Rename [wiki:TracWiki wiki] pages ||
|| `WIKI_DELETE` || Delete [wiki:TracWiki wiki] pages and attachments ||
|| `WIKI_ADMIN` || All `WIKI_*` permissions, plus the management of ''''readonly'''' pages. ||

=== Permissions ===

|| `PERMISSION_GRANT` || add/grant a permission ||
|| `PERMISSION_REVOKE` || remove/revoke a permission ||
|| `PERMISSION_ADMIN` || All `PERMISSION_*` permissions ||

=== Others ===

|| `TIMELINE_VIEW` || View the [wiki:TracTimeline timeline] page ||
|| `SEARCH_VIEW` || View and execute [wiki:TracSearch search] queries ||
|| `CONFIG_VIEW` || Enables additional pages on ''''About Trac'''' that show the current configuration or the list of installed plugins ||
|| `EMAIL_VIEW` || Shows email addresses even if [wiki:TracIni#trac-section trac show_email_addresses] configuration option is false ||

== Creating New Privileges ==

To create custom permissions, for example to be used in a custom workflow, enable the optional [trac:ExtraPermissionsProvider tracopt.perm.config_perm_provider.ExtraPermissionsProvider] component in the "Plugins" admin panel, and add the desired permissions to the `[extra-permissions]` section in your [wiki:TracIni#extra-permissions-section trac.ini]. For more information, please refer to the documentation of the component in the admin panel.

== Granting Privileges ==

You grant privileges to users using [wiki:TracAdmin trac-admin]. The current set of privileges can be listed with the following command:
{{{
  $ trac-admin /path/to/projenv permission list
}}}

This command will allow the user ''''bob'''' to delete reports:
{{{
  $ trac-admin /path/to/projenv permission add bob REPORT_DELETE
}}}

The `permission add` command also accepts multiple privilege names:
{{{
  $ trac-admin /path/to/projenv permission add bob REPORT_DELETE WIKI_CREATE
}}}

Or add all privileges:
{{{
  $ trac-admin /path/to/projenv permission add bob TRAC_ADMIN
}}}

== Permission Groups ==

There are two built-in groups, "authenticated" and "anonymous".
Any user who has not logged in is automatically in the "anonymous" group.
Any user who has logged in is also in the "authenticated" group.
The "authenticated" group inherits permissions from the "anonymous" group.
For example, if the "anonymous" group has permission WIKI_MODIFY, 
it is not necessary to add the WIKI_MODIFY permission to the "authenticated" group as well.

Custom groups may be defined that inherit permissions from the two built-in groups.

Permissions can be grouped together to form roles such as ''''developer'''', ''''admin'''', etc.
{{{
  $ trac-admin /path/to/projenv permission add developer WIKI_ADMIN
  $ trac-admin /path/to/projenv permission add developer REPORT_ADMIN
  $ trac-admin /path/to/projenv permission add developer TICKET_MODIFY
  $ trac-admin /path/to/projenv permission add bob developer
  $ trac-admin /path/to/projenv permission add john developer
}}}

Group membership can be checked by doing a {{{permission list}}} with no further arguments; the resulting output will include group memberships. ''''''Use at least one lowercase character in group names, as all-uppercase names are reserved for permissions''''''.

== Adding a New Group and Permissions ==
Permission groups can be created by assigning a user to a group you wish to create, then assign permissions to that group.

The following will add ''''bob'''' to the new group called ''''beta_testers'''' and then will assign WIKI_ADMIN permissions to that group. (Thus, ''''bob'''' will inherit the WIKI_ADMIN permission)
{{{ 
   $ trac-admin /path/to/projenv permission add bob beta_testers
   $ trac-admin /path/to/projenv permission add beta_testers WIKI_ADMIN

}}}

== Removing Permissions ==

Permissions can be removed using the ''remove'' command. For example:

This command will prevent the user ''''bob'''' from deleting reports:
{{{
  $ trac-admin /path/to/projenv permission remove bob REPORT_DELETE
}}}

Just like `permission add`, this command accepts multiple privilege names.

You can also remove all privileges for a specific user:
{{{
  $ trac-admin /path/to/projenv permission remove bob ''*''
}}}

Or one privilege for all users:
{{{
  $ trac-admin /path/to/projenv permission remove ''*'' REPORT_ADMIN
}}}

== Default Permissions ==

By default on a new Trac installation, the `anonymous` user will have ''''view'''' access to everything in Trac, but will not be able to create or modify anything.
On the other hand, the `authenticated` users will have the permissions to ''''create and modify tickets and wiki pages''''.

''''''anonymous''''''
{{{
 BROWSER_VIEW 
 CHANGESET_VIEW 
 FILE_VIEW 
 LOG_VIEW 
 MILESTONE_VIEW 
 REPORT_SQL_VIEW 
 REPORT_VIEW 
 ROADMAP_VIEW 
 SEARCH_VIEW 
 TICKET_VIEW 
 TIMELINE_VIEW
 WIKI_VIEW
}}}

''''''authenticated''''''
{{{
 TICKET_CREATE 
 TICKET_MODIFY 
 WIKI_CREATE 
 WIKI_MODIFY  
}}}
----
See also: TracAdmin, TracGuide and TracFineGrainedPermissions
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracPlugins', 1, 1519728656606460, 'trac', '127.0.0.1', '= Trac plugins =
[[TracGuideToc]]

From version 0.9 onwards, Trac is extensible with [trac:PluginList plugins]. Plugin functionality is based on the [trac:TracDev/ComponentArchitecture component architecture], with peculiarities described in the [TracDev/PluginDevelopment plugin development] page.

== Plugin discovery ==

From the user''s point of view, a plugin is either a standalone .py file or an .egg package. Trac looks for plugins in the global shared plugins directory (see [TracIni#GlobalConfiguration Global Configuration]) and in the `plugins` directory of the local TracEnvironment. Components defined in globally-installed plugins should be explicitly enabled in the [[TracIni#components-section| [components] ]] section of the trac.ini file.

== Requirements for Trac eggs ==

To use egg-based plugins in Trac, you need to have [http://peak.telecommunity.com/DevCenter/setuptools setuptools] (version 0.6) installed.

To install `setuptools`, download the bootstrap module [http://peak.telecommunity.com/dist/ez_setup.py ez_setup.py] and execute it as follows:

{{{
$ python ez_setup.py
}}}

If the `ez_setup.py` script fails to install the setuptools release, you can download it from [http://www.python.org/pypi/setuptools PyPI] and install it manually.

Plugins can also consist of a single `.py` file dropped directly into either the project''s or the shared `plugins` directory.

== Installing a Trac plugin ==

=== For a single project ===

Plugins are typically packaged as [http://peak.telecommunity.com/DevCenter/PythonEggs Python eggs]. That means they are .zip archives with the file extension `.egg`.

If you have downloaded a source distribution of a plugin, and want to build the `.egg` file:

 * Unpack the source. It should provide `setup.py`.
 * Run:

{{{
$ python setup.py bdist_egg
}}}

You should have a *.egg file. Examine the output of running python to find where this was created.

Once you have the plugin archive, copy it into the `plugins` directory of the [wiki:TracEnvironment project environment]. Also, make sure that the web server has sufficient permissions to read the plugin egg. Then restart the web server. If you are running as a [wiki:TracStandalone "tracd" standalone server], restart tracd (kill and run again).

To uninstall a plugin installed this way, remove the egg from the `plugins` directory and restart the web server.

Note: the Python version that the egg is built with ''''must'''' match the Python version with which Trac is run. For example, if you''re running Trac under Python 2.5, but have upgraded your standalone Python to 2.6, the eggs won''t be recognized.

Note also: in a multi-project setup, a pool of Python interpreter instances will be dynamically allocated to projects based on need; since plugins occupy a place in Python''s module system, the first version of any given plugin to be loaded will be used for all projects. In other words, you cannot use different versions of a single plugin in two projects of a multi-project setup. It may be safer to install plugins for all projects (see below), and then enable them selectively on a project-by-project basis.

=== For all projects ===

==== With an .egg file ====

Some plugins (such as [trac:SpamFilter SpamFilter]) are downloadable as an `.egg` file that can be installed with the `easy_install` program:
{{{
easy_install TracSpamFilter
}}}

If `easy_install` is not on your system, see the Requirements section above to install it. Windows users will need to add the `Scripts` directory of their Python installation (for example, `C:\Python24\Scripts`) to their `PATH` environment variable (see [http://peak.telecommunity.com/DevCenter/EasyInstall#windows-notes easy_install Windows notes] for more information).

If Trac reports permission errors after installing a zipped egg, and you would rather not bother providing a egg cache directory writable by the web server, you can get around it by simply unzipping the egg. Just pass `--always-unzip` to `easy_install`:
{{{
easy_install --always-unzip TracSpamFilter-0.4.1_r10106-py2.6.egg
}}}
You should end up with a directory having the same name as the zipped egg (complete with `.egg` extension) and containing its uncompressed contents.

Trac also searches for plugins installed in the shared plugins directory ''''(since 0.10)''''; see TracIni#GlobalConfiguration. This is a convenient way to share the installation of plugins across several, but not all, environments.

==== From source ====

`easy_install` makes installing from source a snap. Just give it the URL to either a Subversion repository or a tarball/zip of the source:
{{{
easy_install http://svn.edgewall.com/repos/trac/plugins/0.12/spam-filter-captcha
}}}

==== Enabling the plugin ====

Unlike plugins installed per-environment, you''ll have to explicitly enable globally installed plugins via [wiki:TracIni trac.ini]. This also applies to plugins installed in the shared plugins directory, i.e. the path specified in the `[inherit] plugins_dir` configuration option. 

This is done in the `[components]` section of the configuration file. For example:
{{{
[components]
tracspamfilter.* = enabled
}}}

The name of the option is the Python package of the plugin. This should be specified in the documentation of the plugin, but can also be easily discovered by looking at the source (look for a top-level directory that contains a file named `__init__.py`).

Note: After installing the plugin, you must restart your web server.

==== Uninstalling ====

`easy_install` or `python setup.py` does not have an uninstall feature. Hower, it is usually quite trivial to remove a globally-installed egg and reference:

 1. Do `easy_install -m [plugin name]` to remove references from `$PYTHONLIB/site-packages/easy-install.pth` when the plugin installed by setuptools.
 1. Delete executables from `/usr/bin`, `/usr/local/bin`, or `C:\\Python*\Scripts`. To find what executables are involved, refer to the `[console-script]` section of `setup.py`.
 1. Delete the .egg file or folder from where it''s installed (usually inside `$PYTHONLIB/site-packages/`).
 1. Restart the web server.

If you are uncertain about the location of the egg, here''s a small tip to help locate an egg (or any package). Just replace `myplugin` with whatever namespace the plugin uses (as used when enabling the plugin):
{{{
>>> import myplugin
>>> print myplugin.__file__
/opt/local/python24/lib/site-packages/myplugin-0.4.2-py2.4.egg/myplugin/__init__.pyc
}}}

== Setting up the plugin cache ==

Some plugins will need to be extracted by the Python eggs runtime (`pkg_resources`), so that their contents are actual files on the file system. The directory in which they are extracted defaults to `.python-eggs` in the home directory of the current user, which may or may not be a problem. You can, however, override the default location using the `PYTHON_EGG_CACHE` environment variable.

To do this from the Apache configuration, use the `SetEnv` directive:
{{{
SetEnv PYTHON_EGG_CACHE /path/to/dir
}}}

This works whether you''re using the [wiki:TracCgi CGI] or the [wiki:TracModPython mod_python] front-end. Put this directive next to where you set the path to the [wiki:TracEnvironment Trac environment], i.e. in the same `<Location>` block.

For example (for CGI):
{{{
 <Location /trac>
   SetEnv TRAC_ENV /path/to/projenv
   SetEnv PYTHON_EGG_CACHE /path/to/dir
 </Location>
}}}

Or (for mod_python):
{{{
 <Location /trac>
   SetHandler mod_python
   ...
   SetEnv PYTHON_EGG_CACHE /path/to/dir
 </Location>
}}}

 ''''Note: !SetEnv requires the `mod_env` module which needs to be activated for Apache. In this case the !SetEnv directive can also be used in the `mod_python` Location block.''''

For [wiki:TracFastCgi FastCGI], you''ll need to `-initial-env` option, or whatever is provided by your web server for setting environment variables. 

 ''''Note: that if you already use -initial-env to set the project directory for either a single project or parent you will need to add an additional -initial-env directive to the !FastCgiConfig directive. I.e.

{{{
FastCgiConfig -initial-env TRAC_ENV=/var/lib/trac -initial-env PYTHON_EGG_CACHE=/var/lib/trac/plugin-cache
}}}

=== About hook scripts ===

If you''ve set up some subversion hook scripts that call the Trac engine, such as the post-commit hook script provided in the `/contrib` directory, make sure you define the `PYTHON_EGG_CACHE` environment variable within these scripts as well.

== Troubleshooting ==

=== Is setuptools properly installed? ===

Try this from the command line:
{{{
$ python -c "import pkg_resources"
}}}

If you get ''''''no output'''''', setuptools ''''''is'''''' installed. Otherwise, you''ll need to install it before plugins will work in Trac.

=== Did you get the correct version of the Python egg? ===

Python eggs have the Python version encoded in their filename. For example, `MyPlugin-1.0-py2.5.egg` is an egg for Python 2.5, and will ''''''not'''''' be loaded if you''re running a different Python version (such as 2.4 or 2.6).

Also, verify that the egg file you downloaded is indeed a .zip archive. If you downloaded it from a Trac site, chances are you downloaded the HTML preview page instead.

=== Is the plugin enabled? ===

If you install a plugin globally (i.e., ''''not'''' inside the `plugins` directory of the Trac project environment), you must explicitly enable it in [TracIni trac.ini]. Make sure that:

 * ...you actually added the necessary line(s) to the `[components]` section.
 * ...the package/module names are correct.
 * ...the value is "enabled", not "enable" or "Enable".

=== Check the permissions on the .egg file ===

Trac must be able to read the .egg file. 

=== Check the log files ===

Enable [wiki:TracLogging logging] and set the log level to `DEBUG`, then watch the log file for messages about loading plugins.

=== Verify you have proper permissions ===

Some plugins require you have special permissions in order to use them. [trac:WebAdmin WebAdmin], for example, requires the user to have TRAC_ADMIN permissions for it to show up on the navigation bar.

=== Is the wrong version of the plugin loading? ===

If you put your plugins inside plugins directories, and certainly if you have more than one project, you need to make sure that the correct version of the plugin is loading. Here are some basic rules:

 * Only one version of the plugin can be loaded for each running Trac server (i.e., each Python process). The Python namespaces and module list will be shared, and it cannot handle duplicates. Whether a plugin is `enabled` or `disabled` makes no difference.
 * A globally-installed plugin (typically `setup.py install`) will override any version in the global or project plugins directories. A plugin from the global plugins directory will be located ''''before'''' any project plugins directory.
 * If your Trac server hosts more than one project (as with `TRAC_ENV_PARENT_DIR` setups), having two versions of a plugin in two different projects will give uncertain results. Only one of them will load, and the one loaded will be shared by both projects. Trac will load the first plugin found, usually from the project that receives the first request.
 * Having more than one version listed inside Python site-packages is fine (i.e., installed with `setup.py install`) -- setuptools will make sure you get the version installed most recently. However, don''t store more than one version inside a global or project plugins directory -- neither version number nor installed date will matter at all. There is no way to determine which one will be located first when Trac searches the directory for plugins.

=== If all of the above failed ===

Okay, so the logs don''t mention plugins, the egg is readable, the Python version is correct, ''''and'''' the egg has been installed globally (and is enabled in trac.ini)... and it ''''still'''' doesn''t work or give any error messages or any other indication as to why. Hop on the [trac:IrcChannel IrcChannel] and ask away!

== Web-based plugin administration ==

The WebAdmin plugin (part of the core since 0.11) offers limited support for plugin configuration through the web to users with `TRAC_ADMIN` permission:

* en/disabling installed plugins
* installing plugins by uploading them as eggs

You probably want to disable the second function for security reasons: in `trac.ini`, in the `[components]` section, add the line
{{{
trac.admin.web_ui.PluginAdminPanel = disabled
}}}
This disables the whole panel, so the first function will no longer be available either.

----
See also TracGuide, [trac:PluginList plugin list], [trac:TracDev/ComponentArchitecture component architecture].', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracQuery', 1, 1519728656610047, 'trac', '127.0.0.1', '= Trac Ticket Queries =
[[TracGuideToc]]

In addition to [wiki:TracReports reports], Trac provides support for ''''custom ticket queries'''', used to display lists of tickets meeting a specified set of criteria. 

To configure and execute a custom query, switch to the ''''View Tickets'''' module from the navigation bar, and select the ''''Custom Query'''' link.

== Filters ==

When you first go to the query page the default filter will display tickets relevant to you:
 * If logged in then all open tickets it will display open tickets assigned to you.
 * If not logged in but you have specified a name or email address in the preferences then it will display all open tickets where your email (or name if email not defined) is in the CC list.
 * If not logged and no name/email defined in the preferences then all open issues are displayed.

Current filters can be removed by clicking the button to the left with the minus sign on the label.  New filters are added from the pulldown lists at the bottom corners of the filters box (''And'' conditions on the left, ''Or'' conditions on the right).  Filters with either a text box or a pulldown menu of options can be added multiple times to perform an ''''or'''' of the criteria.

You can use the fields just below the filters box to group the results based on a field, or display the full description for each ticket.

Once you''ve edited your filters click the ''''Update'''' button to refresh your results.

== Navigating Tickets ==
Clicking on one of the query results will take you to that ticket.  You can navigate through the results by clicking the ''''Next Ticket'''' or ''''Previous Ticket'''' links just below the main menu bar, or click the ''''Back to Query'''' link to return to the query page.  

You can safely edit any of the tickets and continue to navigate through the results using the ''''!Next/Previous/Back to Query'''' links after saving your results.  When you return to the query ''''any tickets which were edited'''' will be displayed with italicized text.  If one of the tickets was edited such that [[html(<span style="color: grey">it no longer matches the query criteria </span>)]] the text will also be greyed. Lastly, if ''''''a new ticket matching the query criteria has been created'''''', it will be shown in bold. 

The query results can be refreshed and cleared of these status indicators by clicking the ''''Update'''' button again.

== Saving Queries ==

Trac allows you to save the query as a named query accessible from the reports module. To save a query ensure that you have ''''Updated'''' the view and then click the ''''Save query'''' button displayed beneath the results.
You can also save references to queries in Wiki content, as described below.

''''Note:'''' one way to easily build queries like the ones below, you can build and test the queries in the Custom report module and when ready - click ''''Save query''''. This will build the query string for you. All you need to do is remove the extra line breaks.

''''Note:'''' you must have the ''''''REPORT_CREATE'''''' permission in order to save queries to the list of default reports. The ''''Save query'''' button will only appear if you are logged in as a user that has been granted this permission. If your account does not have permission to create reports, you can still use the methods below to save a query.


=== Using TracLinks ===

You may want to save some queries so that you can come back to them later.  You can do this by making a link to the query from any Wiki page.
{{{
[query:status=new|assigned|reopened&version=1.0 Active tickets against 1.0]
}}}

Which is displayed as:
  [query:status=new|assigned|reopened&version=1.0 Active tickets against 1.0]

This uses a very simple query language to specify the criteria (see [wiki:TracQuery#QueryLanguage Query Language]).

Alternatively, you can copy the query string of a query and paste that into the Wiki link, including the leading `?` character:
{{{
[query:?status=new&status=assigned&status=reopened&group=owner Assigned tickets by owner]
}}}

Which is displayed as:
  [query:?status=new&status=assigned&status=reopened&group=owner Assigned tickets by owner]

=== Using the `[[TicketQuery]]` Macro ===

The [trac:TicketQuery TicketQuery] macro lets you display lists of tickets matching certain criteria anywhere you can use WikiFormatting.

Example:
{{{
[[TicketQuery(version=0.6|0.7&resolution=duplicate)]]
}}}

This is displayed as:
  [[TicketQuery(version=0.6|0.7&resolution=duplicate)]]

Just like the [wiki:TracQuery#UsingTracLinks query: wiki links], the parameter of this macro expects a query string formatted according to the rules of the simple [wiki:TracQuery#QueryLanguage ticket query language]. This also allows displaying the link and description of a single ticket:
{{{
[[TicketQuery(id=123)]]
}}}

This is displayed as:
  [[TicketQuery(id=123)]]

A more compact representation without the ticket summaries is also available:
{{{
[[TicketQuery(version=0.6|0.7&resolution=duplicate, compact)]]
}}}

This is displayed as:
  [[TicketQuery(version=0.6|0.7&resolution=duplicate, compact)]]

Finally, if you wish to receive only the number of defects that match the query, use the ``count`` parameter.

{{{
[[TicketQuery(version=0.6|0.7&resolution=duplicate, count)]]
}}}

This is displayed as:
  [[TicketQuery(version=0.6|0.7&resolution=duplicate, count)]]

=== Customizing the ''''table'''' format ===
You can also customize the columns displayed in the table format (''''format=table'''') by using ''''col=<field>'''' - you can specify multiple fields and what order they are displayed by placing pipes (`|`) between the columns like below:

{{{
[[TicketQuery(max=3,status=closed,order=id,desc=1,format=table,col=resolution|summary|owner|reporter)]]
}}}

This is displayed as:
[[TicketQuery(max=3,status=closed,order=id,desc=1,format=table,col=resolution|summary|owner|reporter)]]

==== Full rows ====
In ''''table'''' format you can also have full rows by using ''''rows=<field>'''' like below:

{{{
[[TicketQuery(max=3,status=closed,order=id,desc=1,format=table,col=resolution|summary|owner|reporter,rows=description)]]
}}}

This is displayed as:
[[TicketQuery(max=3,status=closed,order=id,desc=1,format=table,col=resolution|summary|owner|reporter,rows=description)]]


=== Query Language ===

`query:` TracLinks and the `[[TicketQuery]]` macro both use a mini “query language” for specifying query filters. Basically, the filters are separated by ampersands (`&`). Each filter then consists of the ticket field name, an operator, and one or more values. More than one value are separated by a pipe (`|`), meaning that the filter matches any of the values. To include a literal `&` or `|` in a value, escape the character with a backslash (`\`).

The available operators are:
|| ''''''`=`'''''' || the field content exactly matches one of the values ||
|| ''''''`~=`'''''' || the field content contains one or more of the values ||
|| ''''''`^=`'''''' || the field content starts with one of the values ||
|| ''''''`$=`'''''' || the field content ends with one of the values ||

All of these operators can also be negated:
|| ''''''`!=`'''''' || the field content matches none of the values ||
|| ''''''`!~=`'''''' || the field content does not contain any of the values ||
|| ''''''`!^=`'''''' || the field content does not start with any of the values ||
|| ''''''`!$=`'''''' || the field content does not end with any of the values ||

The date fields `created` and `modified` can be constrained by using the `=` operator and specifying a value containing two dates separated by two dots (`..`). Either end of the date range can be left empty, meaning that the corresponding end of the range is open. The date parser understands a few natural date specifications like "3 weeks ago", "last month" and "now", as well as Bugzilla-style date specifications like "1d", "2w", "3m" or "4y" for 1 day, 2 weeks, 3 months and 4 years, respectively. Spaces in date specifications can be left out to avoid having to quote the query string. 
|| ''''''`created=2007-01-01..2008-01-01`'''''' || query tickets created in 2007 ||
|| ''''''`created=lastmonth..thismonth`'''''' || query tickets created during the previous month ||
|| ''''''`modified=1weekago..`'''''' || query tickets that have been modified in the last week ||
|| ''''''`modified=..30daysago`'''''' || query tickets that have been inactive for the last 30 days ||

----
See also: TracTickets, TracReports, TracGuide
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracReports', 1, 1519728656613391, 'trac', '127.0.0.1', '= Trac Reports =
[[TracGuideToc]]

The Trac reports module provides a simple, yet powerful reporting facility
to present information about tickets in the Trac database.

Rather than have its own report definition format, TracReports relies on standard SQL
`SELECT` statements for custom report definition. 

  ''''''Note:'''''' ''''The report module is being phased out in its current form because it seriously limits the ability of the Trac team to make adjustments to the underlying database schema. We believe that the [wiki:TracQuery query module] is a good replacement that provides more flexibility and better usability. While there are certain reports that cannot yet be handled by the query module, we intend to further enhance it so that at some point the reports module can be completely removed. This also means that there will be no major enhancements to the report module anymore.''''

  ''''You can already completely replace the reports module by the query module simply by disabling the former in [wiki:TracIni trac.ini]:''''
  {{{
  [components]
  trac.ticket.report.* = disabled
  }}}
  ''''This will make the query module the default handler for the “View Tickets” navigation item. We encourage you to try this configuration and report back what kind of features of reports you are missing, if any.''''

A report consists of these basic parts:
 * ''''''ID'''''' — Unique (sequential) identifier 
 * ''''''Title'''''' — Descriptive title
 * ''''''Description'''''' — A brief description of the report, in WikiFormatting text.
 * ''''''Report Body'''''' — List of results from report query, formatted according to the methods described below.
 * ''''''Footer'''''' — Links to alternative download formats for this report.

== Changing Sort Order ==
Simple reports - ungrouped reports to be specific - can be changed to be sorted by any column simply by clicking the column header. 

If a column header is a hyperlink (red), click the column you would like to sort by. Clicking the same header again reverses the order.

== Changing Report Numbering ==
There may be instances where you need to change the ID of the report, perhaps to organize the reports better. At present this requires changes to the trac database. The ''''report'''' table has the following schema ''''(since 0.10)'''':
 * id integer PRIMARY KEY
 * author text
 * title text
 * query text
 * description text
Changing the ID changes the shown order and number in the ''''Available Reports'''' list and the report''s perma-link. This is done by running something like:
{{{
update report set id=5 where id=3;
}}}
Keep in mind that the integrity has to be maintained (i.e., ID has to be unique, and you don''t want to exceed the max, since that''s managed by SQLite someplace).

You may also need to update or remove the report number stored in the report or query.

== Navigating Tickets ==
Clicking on one of the report results will take you to that ticket. You can navigate through the results by clicking the ''''Next Ticket'''' or ''''Previous Ticket'''' links just below the main menu bar, or click the ''''Back to Report'''' link to return to the report page.

You can safely edit any of the tickets and continue to navigate through the results using the ''''!Next/Previous/Back to Report'''' links after saving your results, but when you return to the report, there will be no hint about what has changed, as would happen if you were navigating a list of tickets obtained from a query (see TracQuery#NavigatingTickets). ''''(since 0.11)''''

== Alternative Download Formats ==
Aside from the default HTML view, reports can also be exported in a number of alternative formats.
At the bottom of the report page, you will find a list of available data formats. Click the desired link to 
download the alternative report format.

=== Comma-delimited - CSV (Comma Separated Values) ===
Export the report as plain text, each row on its own line, columns separated by a single comma ('','').
''''''Note:'''''' The output is fully escaped so carriage returns, line feeds, and commas will be preserved in the output.

=== Tab-delimited ===
Like above, but uses tabs (\t) instead of comma.

=== RSS - XML Content Syndication ===
All reports support syndication using XML/RSS 2.0. To subscribe to an RSS feed, click the orange ''XML'' icon at the bottom of the page. See TracRss for general information on RSS support in Trac.

----

== Creating Custom Reports ==

''''Creating a custom report requires a comfortable knowledge of SQL.''''

''''''Note that you need to set up [TracPermissions#Reports permissions] in order to see the buttons for adding or editing reports.''''''

A report is basically a single named SQL query, executed and presented by
Trac.  Reports can be viewed and created from a custom SQL expression directly
in the web interface.

Typically, a report consists of a SELECT-expression from the ''ticket'' table,
using the available columns and sorting the way you want it.

== Ticket columns ==
The ''''ticket'''' table has the following columns:
 * id
 * type
 * time
 * changetime
 * component
 * severity  
 * priority 
 * owner
 * reporter
 * cc
 * version
 * milestone
 * status
 * resolution
 * summary
 * description
 * keywords

See TracTickets for a detailed description of the column fields.

Example: ''''''All active tickets, sorted by priority and time''''''
{{{
SELECT id AS ticket, status, severity, priority, owner, 
       time AS created, summary FROM ticket 
  WHERE status IN (''new'', ''assigned'', ''reopened'')
  ORDER BY priority, time
}}}


== Advanced Reports: Dynamic Variables ==
For more flexible reports, Trac supports the use of ''''dynamic variables'''' in report SQL statements. 
In short, dynamic variables are ''''special'''' strings that are replaced by custom data before query execution.

=== Using Variables in a Query ===
The syntax for dynamic variables is simple, any upper case word beginning with ''$'' is considered a variable.

Example:
{{{
SELECT id AS ticket,summary FROM ticket WHERE priority=$PRIORITY
}}}

To assign a value to $PRIORITY when viewing the report, you must define it as an argument in the report URL, leaving out the leading ''$''.

Example:
{{{
 http://trac.edgewall.org/reports/14?PRIORITY=high
}}}

To use multiple variables, separate them with an ''&''.

Example:
{{{
 http://trac.edgewall.org/reports/14?PRIORITY=high&SEVERITY=critical
}}}

Dynamic variables can also be used in the report title and description (since 1.1.1).

=== !Special/Constant Variables ===
There is one dynamic variable whose value is set automatically (the URL does not have to be changed) to allow practical reports. 

 * $USER — Username of logged in user.

Example (''''List all tickets assigned to me''''):
{{{
SELECT id AS ticket,summary FROM ticket WHERE owner=$USER
}}}



== Advanced Reports: Custom Formatting ==
Trac is also capable of more advanced reports, including custom layouts,
result grouping and user-defined CSS styles. To create such reports, we''ll use
specialized SQL statements to control the output of the Trac report engine.

=== Special Columns ===
To format reports, TracReports looks for ''magic'' column names in the query
result. These ''magic'' names are processed and affect the layout and style of the 
final report.

=== Automatically formatted columns ===
 * ''''''ticket'''''' — Ticket ID number. Becomes a hyperlink to that ticket. 
 * ''''''id'''''' — same as ''''''ticket'''''' above when ''''''realm'''''' is not set
 * ''''''realm'''''' — together with ''''''id'''''', can be used to create links to other resources than tickets (e.g. a realm of ''''wiki'''' and an ''''id'''' to a page name will create a link to that wiki page)
 * ''''''created, modified, date, time'''''' — Format cell as a date and/or time.
 * ''''''description'''''' — Ticket description field, parsed through the wiki engine.

''''''Example:''''''
{{{
SELECT id AS ticket, created, status, summary FROM ticket 
}}}

Those columns can also be defined but marked as hidden, see [#column-syntax below].

See trac:wiki/CookBook/Configuration/Reports for some example of creating reports for realms other than ''''ticket''''.

=== Custom formatting columns ===
Columns whose names begin and end with 2 underscores (Example: ''''''`__color__`'''''') are
assumed to be ''''formatting hints'''', affecting the appearance of the row.
 
 * ''''''`__group__`'''''' — Group results based on values in this column. Each group will have its own header and table.
 * ''''''`__grouplink__`'''''' — Make the header of each group a link to the specified URL. The URL is taken from the first row of each group.
 * ''''''`__color__`'''''' — Should be a numeric value ranging from 1 to 5 to select a pre-defined row color. Typically used to color rows by issue priority.
{{{
#!html
<div style="margin-left:7.5em">Defaults: 
<span style="border: none; color: #333; background: transparent;  font-size: 85%; background: #fdc; border-color: #e88; color: #a22">Color 1</span>
<span style="border: none; color: #333; background: transparent;  font-size: 85%; background: #ffb; border-color: #eea; color: #880">Color 2</span>
<span style="border: none; color: #333; background: transparent;  font-size: 85%; background: #fbfbfb; border-color: #ddd; color: #444">Color 3</span>
<span style="border: none; color: #333; background: transparent; font-size: 85%; background: #e7ffff; border-color: #cee; color: #099">Color 4</span>
<span style="border: none; color: #333; background: transparent;  font-size: 85%; background: #e7eeff; border-color: #cde; color: #469">Color 5</span>
</div>
}}}
 * ''''''`__style__`'''''' — A custom CSS style expression to use on the `<tr>` element of the current row.
 * ''''''`__class__`'''''' — Zero or more space-separated CSS class names to be set on the `<tr>` element of the current row. These classes are added to the class name derived from `__color__` and the odd / even indicator.

''''''Example:'''''' ''''List active tickets, grouped by milestone, group header linked to milestone page, colored by priority''''
{{{
SELECT p.value AS __color__,
     t.milestone AS __group__,
     ''../milestone/'' || t.milestone AS __grouplink__,
     (CASE owner WHEN ''daniel'' THEN ''font-weight: bold; background: red;'' ELSE '''' END) AS __style__,
       t.id AS ticket, summary
  FROM ticket t,enum p
  WHERE t.status IN (''new'', ''assigned'', ''reopened'') 
    AND p.name=t.priority AND p.type=''priority''
  ORDER BY t.milestone, p.value, t.severity, t.time
}}}

''''''Note:'''''' A table join is used to match ''''ticket'''' priorities with their
numeric representation from the ''''enum'''' table.

=== Changing layout of report rows === #column-syntax
By default, all columns on each row are display on a single row in the HTML
report, possibly formatted according to the descriptions above. However, it''s
also possible to create multi-line report entries.

 * ''''''`column_`'''''' — ''''Break row after this''''. By appending an underscore (''_'') to the column name, the remaining columns will be continued on a second line.

 * ''''''`_column_`'''''' — ''''Full row''''. By adding an underscore (''_'') both at the beginning and the end of a column name, the data will be shown on a separate row.

 * ''''''`_column`'''''' — ''''Hide data''''. Prepending an underscore (''_'') to a column name instructs Trac to hide the contents from the HTML output. This is useful for information to be visible only if downloaded in other formats (like CSV or RSS/XML).
   This can be used to hide any kind of column, even important ones required for identifying the resource, e.g. `id as _id` will hide the ''''''Id'''''' column but the link to the ticket will be present.

''''''Example:'''''' ''''List active tickets, grouped by milestone, colored by priority, with  description and multi-line layout''''

{{{
SELECT p.value AS __color__,
       t.milestone AS __group__,
       (CASE owner 
          WHEN ''daniel'' THEN ''font-weight: bold; background: red;'' 
          ELSE '''' END) AS __style__,
       t.id AS ticket, summary AS summary_,             -- ## Break line here
       component,version, severity, milestone, status, owner,
       time AS created, changetime AS modified,         -- ## Dates are formatted
       description AS _description_,                    -- ## Uses a full row
       changetime AS _changetime, reporter AS _reporter -- ## Hidden from HTML output
  FROM ticket t,enum p
  WHERE t.status IN (''new'', ''assigned'', ''reopened'') 
    AND p.name=t.priority AND p.type=''priority''
  ORDER BY t.milestone, p.value, t.severity, t.time
}}}

=== Reporting on custom fields ===

If you have added custom fields to your tickets (a feature since v0.8, see TracTicketsCustomFields), you can write a SQL query to cover them. You''ll need to make a join on the ticket_custom table, but this isn''t especially easy.

If you have tickets in the database ''''before'''' you declare the extra fields in trac.ini, there will be no associated data in the ticket_custom table. To get around this, use SQL''s "LEFT OUTER JOIN" clauses. See [trac:TracIniReportCustomFieldSample TracIniReportCustomFieldSample] for some examples.

=== A note about SQL rewriting #rewriting

Beyond the relatively trivial replacement of dynamic variables, the SQL query is also altered in order to support two features of the reports:
 1. [#sort-order changing the sort order]
 2. pagination support (limitation of the number of result rows displayed on each page)
In order to support the first feature, the sort column is inserted in the `ORDER BY` clause in the first position or in the second position if a `__group__` column is specified (an `ORDER BY` clause is created if needed). In order to support pagination, a `LIMIT ... OFFSET ...` clause is appended.
The query might be too complex for the automatic rewrite to work correctly, resulting in an erroneous query. In this case you still have the possibility to control exactly how the rewrite is done by manually inserting the following tokens:
 - `@SORT_COLUMN@`, the place where the name of the selected sort column will be inserted,
 - `@LIMIT_OFFSET@`, the place where the pagination support clause will be added
Note that if you write them after an SQL comment, `--`, you''ll effectively disable rewriting if this is what you want!

Let''s take an example, consider the following SQL query:
{{{
-- ## 4: Assigned, Active Tickets by Owner ## --

-- 
-- List assigned tickets, group by ticket owner, sorted by priority.
-- 

SELECT p.value AS __color__,
   owner AS __group__,
   id AS ticket, summary, component, milestone, t.type AS type, severity, time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t,enum p
  WHERE status = ''assigned''
AND p.name=t.priority AND p.type=''priority''
  ORDER BY __group__, p.value, severity, time
}}}

The automatic rewrite will be the following (4 rows per page, page 2, sorted by `component`):
{{{
SELECT p.value AS __color__,
   owner AS __group__,
   id AS ticket, summary, component, milestone, t.type AS type, severity, time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t,enum p
  WHERE status = ''assigned''
AND p.name=t.priority AND p.type=''priority''
  ORDER BY __group__ ASC, `component` ASC,  __group__, p.value, severity, time
 LIMIT 4 OFFSET 4
}}}

The equivalent SQL query with the rewrite tokens would have been:
{{{
SELECT p.value AS __color__,
   owner AS __group__,
   id AS ticket, summary, component, milestone, t.type AS type, severity, time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter
  FROM ticket t,enum p
  WHERE status = ''assigned''
AND p.name=t.priority AND p.type=''priority''
  ORDER BY __group__, @SORT_COLUMN@, p.value, severity, time
@LIMIT_OFFSET@
}}}

If you want to always sort first by priority and only then by the user selected sort column, simply use the following `ORDER BY` clause:
{{{
  ORDER BY __group__, p.value, @SORT_COLUMN@, severity, time
}}}

----
See also: TracTickets, TracQuery, TracGuide, [http://www.sqlite.org/lang_expr.html Query Language Understood by SQLite]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracRepositoryAdmin', 1, 1519728656616999, 'trac', '127.0.0.1', '= Repository Administration =
[[PageOutline(2-3)]]

== Quick start == #QuickStart

 * Manage repositories in the "Repository" admin panel, with `trac-admin` or in the `[repositories]` section of [wiki:TracIni#repositories-section trac.ini].
 * Set up a call to `trac-admin $ENV changeset added $REPO $REV` in the post-commit hook of each repository. Additionally, add a call to `trac-admin $ENV changeset modified $REPO $REV` in the post-revprop-change hook of repositories allowing revision property changes.
 * Set the `[trac] repository_sync_per_request` option to an empty value to disable per-request syncing.
 * Make sure the user under which your Subversion hooks are run has write access to the Trac environment, or use a tool like `sudo` to temporarily elevate privileges.

== Specifying repositories == #Repositories
Starting with 0.12, Trac can handle more than one repository per environment. The pre-0.12 way of specifying the repository with the `repository_dir` and `repository_type` options in the `[trac]` section of [wiki:TracIni trac.ini] is still supported, but two new mechanisms allow including additional repositories into an environment.

It is also possible to define aliases of repositories, that act as "pointers" to real repositories. This can be useful when renaming a repository, to avoid breaking all the links to the old name.

A number of attributes can be associated with each repository, which define the repository''s location, type, name and how it is displayed in the source browser. The following attributes are supported:

||=''''''Attribute'''''' =||=''''''Description'''''' =||
||`alias` ||\
||A repository having an `alias` attribute is an alias to a real repository. All TracLinks referencing the alias resolve to the aliased repository. Note that multiple indirection is not supported, so an alias must always point to a real repository. The `alias` and `dir` attributes are mutually exclusive. ||
||`description` ||\
||The text specified in the `description` attribute is displayed below the top-level entry for the repository in the source browser. It supports WikiFormatting. ||
||`dir` ||\
||The `dir` attribute specifies the location of the repository in the filesystem. It corresponds to the value previously specified in the option `[trac] repository_dir`. The `alias` and `dir` attributes are mutually exclusive. ||
||`hidden` ||When set to `true`, the repository is hidden from the repository index page in the source browser. Browsing the repository is still possible, and links referencing the repository remain valid. ||
||`type` ||The `type` attribute sets the type of version control system used by the repository. Trac supports Subversion and Git out-of-the-box, and plugins add support for many other systems. If `type` is not specified, it defaults to the value of the `[trac] repository_type` option. ||
||`url` ||The `url` attribute specifies the root URL to be used for checking out from the repository. When specified, a "Repository URL" link is added to the context navigation links in the source browser, that can be copied into the tool used for creating the working copy. ||

A repository `name` and one of `alias` or `dir` attributes are mandatory. All others are optional.

After adding a repository, the cache for that repository must be re-synchronized once with the `trac-admin $ENV repository resync` command.

 `repository resync <repos>`::
   Re-synchronize Trac with a repository.


=== In `trac.ini` === #ReposTracIni
Repositories and repository attributes can be specified in the `[repositories]` section of [wiki:TracIni#repositories-section trac.ini]. Every attribute consists of a key structured as `{name}.{attribute}` and the corresponding value separated with an equal sign (`=`). The name of the default repository is empty.

The main advantage of specifying repositories in `trac.ini` is that they can be inherited from a global configuration (see the [wiki:TracIni#GlobalConfiguration global configuration] section of TracIni). One drawback is that, due to limitations in the `ConfigParser` class used to parse `trac.ini`, the repository name is always all-lowercase.

The following example defines two Subversion repositories named `project` and `lib`, and an alias to `project` as the default repository. This is a typical use case where a Trac environment previously had a single repository (the `project` repository), and was converted to multiple repositories. The alias ensures that links predating the change continue to resolve to the `project` repository.
{{{
#!ini
[repositories]
project.dir = /var/repos/project
project.description = This is the ''''main'''' project repository.
project.type = svn
project.url = http://example.com/svn/project
project.hidden = true

lib.dir = /var/repos/lib
lib.description = This is the secondary library code.
lib.type = svn
lib.url = http://example.com/svn/lib

.alias = project
}}}
Note that `name.alias = target` makes `name` an alias for the `target` repo, not the other way around.

=== In the database === #ReposDatabase
Repositories can also be specified in the database, using either the "Repositories" admin panel under "Version Control", or the `trac-admin $ENV repository` commands.

The admin panel shows the list of all repositories defined in the Trac environment. It allows adding repositories and aliases, editing repository attributes and removing repositories. Note that repositories defined in `trac.ini` are displayed but cannot be edited.

The following [wiki:TracAdmin trac-admin] commands can be used to perform repository operations from the command line.

 `repository add <repos> <dir> [type]`::
   Add a repository `<repos>` located at `<dir>`, and optionally specify its type.

 `repository alias <name> <target>`::
   Create an alias `<name>` for the repository `<target>`.

 `repository remove <repos>`::
   Remove the repository `<repos>`.

 `repository set <repos> <key> <value>`::
   Set the attribute `<key>` to `<value>` for the repository `<repos>`. 

Note that the default repository has an empty name, so it will likely need to be quoted when running `trac-admin` from a shell. Alternatively, the name "`(default)`" can be used instead, for example when running `trac-admin` in interactive mode.


== Repository synchronization == #Synchronization
Prior to 0.12, Trac synchronized its cache with the repository on every HTTP request. This approach is not very efficient and not practical anymore with multiple repositories. For this reason, explicit synchronization through post-commit hooks was added. 

There is also new functionality in the form of a repository listener extension point ''''(IRepositoryChangeListener)'''' that is triggered by the post-commit hook when a changeset is added or modified, and can be used by plugins to perform actions on commit.

=== Mercurial Repositories ===
Please note that at the time of writing, no initial resynchronization or any hooks are necessary for Mercurial repositories - see [trac:#9485] for more information. 

=== Explicit synchronization === #ExplicitSync
This is the preferred method of repository synchronization. It requires setting the `[trac]  repository_sync_per_request` option in [wiki:TracIni#trac-section trac.ini] to an empty value, and adding a call to `trac-admin` in the post-commit hook of each repository. Additionally, if a repository allows changing revision metadata, a call to `trac-admin` must be added to the post-revprop-change hook as well.

 `changeset added <repos> <rev> [...]`::
   Notify Trac that one or more changesets have been added to a repository.

 `changeset modified <repos> <rev> [...]`::
   Notify Trac that metadata on one or more changesets in a repository has been modified.

The `<repos>` argument can be either a repository name (use "`(default)`" for the default repository) or the path to the repository.

Note that you may have to set the environment variable PYTHON_EGG_CACHE to the same value as was used for the web server configuration before calling trac-admin, if you changed it from its default location. See [wiki:TracPlugins Trac Plugins] for more information.

The following examples are complete post-commit and post-revprop-change scripts for Subversion. They should be edited for the specific environment, marked executable (where applicable) and placed in the `hooks` directory of each repository. On Unix (`post-commit`):
{{{#!sh
#!/bin/sh
export PYTHON_EGG_CACHE="/path/to/dir"
/usr/bin/trac-admin /path/to/env changeset added "$1" "$2"
}}}
Note: Ubuntu doesn''t seem to like /usr/bin/trac-admin, so just use:
{{{#!sh
#!/bin/sh
export PYTHON_EGG_CACHE="/path/to/dir"
trac-admin /path/to/env/ changeset added "$1" "$2"
}}}
On Windows (`post-commit.cmd`):
{{{#!application/x-dos-batch
@C:\Python26\Scripts\trac-admin.exe C:\path\to\env changeset added "%1" "%2"
}}}

The post-revprop-change hook for Subversion is very similar. On Unix (`post-revprop-change`):
{{{#!sh
#!/bin/sh
export PYTHON_EGG_CACHE="/path/to/dir"
/usr/bin/trac-admin /path/to/env changeset modified "$1" "$2"
}}}
On Windows (`post-revprop-change.cmd`):
{{{#!application/x-dos-batch
@C:\Python26\Scripts\trac-admin.exe C:\path\to\env changeset modified "%1" "%2"
}}}

The Unix variants above assume that the user running the Subversion commit has write access to the Trac environment, which is the case in the standard configuration where both the repository and Trac are served by the web server. If you access the repository through another means, for example `svn+ssh://`, you may have to run `trac-admin` with different privileges, for example by using `sudo`.

Note that calling `trac-admin` in your Subversion hooks can slow down the commit and log editing operations on the client side. You might want to use the [trac:source:trunk/contrib/trac-svn-hook contrib/trac-svn-hook] script which starts `trac-admin` in an asynchronous way. The script also comes with a number of safety checks and usage advices which should make it easier to set up and test your hooks. There''s no equivalent `trac-svn-hook.bat` for Windows yet, but the script can be run by Cygwin''s bash.

See the [http://svnbook.red-bean.com/en/1.5/svn.reposadmin.create.html#svn.reposadmin.create.hooks section about hooks] in the Subversion book for more information. Other repository types will require different hook setups.

Git hooks can be used in the same way for explicit syncing of git repositories. Add the following to `.git/hooks/post-commit`:
{{{#!sh
REV=$(git rev-parse HEAD)
trac-admin /path/to/env changeset added <my-repository> $REV
}}}

For Mercurial, add the following entries to the `.hgrc` file of each repository accessed by Trac (if [trac:TracMercurial] is installed in a Trac `plugins` directory, download [trac:source:mercurial-plugin/tracext/hg/hooks.py hooks.py] and place it somewhere accessible):
{{{#!ini
[hooks]
; If mercurial-plugin is installed globally
commit = python:tracext.hg.hooks.add_changesets
changegroup = python:tracext.hg.hooks.add_changesets

; If mercurial-plugin is installed in a Trac plugins directory
commit = python:/path/to/hooks.py:add_changesets
changegroup = python:/path/to/hooks.py:add_changesets

[trac]
env = /path/to/env
trac-admin = /path/to/trac-admin
}}}

=== Per-request synchronization === #PerRequestSync
If the post-commit hooks are not available, the environment can be set up for per-request synchronization. In that case, the `[trac] repository_sync_per_request` option in [wiki:TracIni#trac-section trac.ini] must be set to a comma-separated list of repository names to be synchronized.

Note that in this case, the changeset listener extension point is not called, and therefore plugins using it will not work correctly.


== Migration from a single-repository setup (Subversion) == #Migration
The following procedure illustrates a typical migration from a Subversion single-repository setup to multiple repositories.

 1. Remove the default repository specification from the `[trac] repository_dir` option.
 1. Add the main repository as a named repository.
 1. Re-synchronize the main repository.
 1. Set up post-commit and post-revprop-change hooks on the "main" repository, and set `[trac] repository_sync_per_request` to an empty value.
 1. Add an alias to the main repository as the default repository (by leaving out the the `name`, e.g. `.alias = main`). This ensures that all links predating the migration still resolve to the main repository.
 1. Repeat steps 2, 3 and 4 to add other "named" repositories as needed.

== Migration from a single-repository setup (Mercurial) == #MigrationMercurial
The following procedure illustrates a typical migration from a Mercurial single-repository setup to multiple repositories. Please note that at the time of writing, no initial resynchronization or any hooks are necessary for Mercurial repositories - see [trac:ticket:9485 #9485] for more information.

 1. Upgrade to the latest version of the TracMercurial plugin.
 1. Remove the default repository specification from the `[trac] repository_dir` option.
 1. Add the main repository as a named repository.
 1. Add an alias to the main repository as the default repository (by leaving out the the `name`, e.g. `.alias = main`). This ensures that all links predating the migration still resolve to the main repository.
 1. Repeat step 3 to add other "named" repositories as needed.

== Troubleshooting ==

=== My trac-post-commit-hook doesn''t work anymore === #trac-post-commit-hook

You must now use the optional components from `tracopt.ticket.commit_updater.*`, which you can activate through the Plugins panel in the Administrative part of the web interface, or by directly modifying the [TracIni#components-section "[components]"] section in the trac.ini. Be sure to use [#ExplicitSync explicit synchronization] as explained above.
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracRevisionLog', 1, 1519728656620463, 'trac', '127.0.0.1', '= Viewing Revision Logs =
[[TracGuideToc]]

When you browse the repository, it''s always possible to query the 
''''Revision Log'''' view corresponding to the path you''re currently seeing.
This will display a list of the most recent changesets in which the 
current path or any other path below it has been modified.

== The Revision Log Form ==

It''s possible to set the revision at which the revision log should
start, using the ''''View log starting at'''' field. An empty value
or a value of ''''head'''' is taken to be the newest changeset. 

It''s also possible to specify the revision at which the log should
stop, using the ''''back to'''' field. By default, it''s left empty, 
which means the revision log will stop as soon as 100 revisions have 
been listed.

Also, there are three modes of operation of the revision log.

By default, the revision log ''''stops on copy'''', which means that 
whenever an ''''Add'''', ''''Copy'''' or ''''Rename'''' operation is detected, 
no older revision will be shown. That''s very convenient when working
with branches, as one only sees the history corresponding to what
has been done on the branch.

It''s also possible to indicate that one wants to see what happened
before a ''''Copy'''' or ''''Rename'''' change, by selecting the 
''''Follow copies'''' mode. This will cross all copies or renames changes.
Each time the name of the path changes, there will be an additional
indentation level. That way, the changes on the different paths
are easily grouped together visually.

It''s even possible to go past an ''''Add'''' change, in order to see 
if there has been a ''''Delete'''' change on that path, before 
that ''''Add''''. This mode corresponds to the mode called 
''''Show only adds, moves and deletes''''. 
While quite useful at times, be aware that this operation is quite 
resource intensive.

Finally, there''s also a checkbox ''''Show full log messages'''',
which controls whether the full content of the commit log message
should be displayed for each change, or only a shortened version of it.

== The Revision Log Information ==

For each revision log entry, there are 7 columns:
 1. The first column contains a pair of radio buttons and should be used 
    for selecting the ''''old'''' and the ''''new'''' revisions that will be 
    used for [wiki:TracRevisionLog#viewingtheactualchanges viewing the actual changes].
 1. A color code (similar to the one used for the
    [wiki:TracChangeset#ChangesetHeader changesets]) indicating kind of change.
    Clicking on this column refreshes the revision log so that it restarts
    with this change.
 1. The ''''''Revision'''''' number, displayed as `@xyz`.
    This is a link to the TracBrowser, using the displayed revision as the base line.
 Next to it, you can see a little "wheel" icon [[Image(htdocs:../common/changeset.png)]],  which is clickable and leads to the TracChangeset view for that revision.
 1. The ''''''Date'''''' at which the change was made.
    The date is displayed as the time elapsed from the date of the revision. The time
    elapsed is displayed as the number of hours, days, weeks, months, or years.
 1. The ''''''Author'''''' of the change.
 1. The ''''''Log Message'''''', which contains either the truncated or full commit 
    log message, depending on the value of the ''''Show full log messages'''' 
    checkbox in the form above.
    

== Inspecting Changes Between Revisions ==

The ''''View changes...'''' buttons (placed above and below the list
of changes, on the left side) will show the set of differences
corresponding to the aggregated changes starting from the ''''old''''
revision (first radio-button) to the ''''new'''' revision (second
radio-button), in the TracChangeset view.

Note that the ''''old'''' revision doesn''t need to be actually 
''''older'''' than the ''''new'''' revision: it simply gives a base
for the diff. It''s therefore entirely possible to easily 
generate a ''''reverse diff'''', for reverting what has been done
in the given range of revisions.

Finally, if the two revisions are identical, the corresponding
changeset will be shown (same effect as clicking on the !ChangeSet number).

== Alternative Formats ==

=== The !ChangeLog Text ===

At the bottom of the page, there''s a ''''!ChangeLog'''' link
that will show the range of revisions as currently shown,
but as a simple text, matching the usual conventions for
!ChangeLog files.

=== RSS Support ===

The revision log also provides a RSS feed to monitor the changes.
To subscribe to a RSS feed for a file or directory, open its
revision log in the browser and click the orange ''XML'' icon at the bottom
of the page. For more information on RSS support in Trac, see TracRss.

----
See also: TracBrowser, TracChangeset, TracGuide', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracRoadmap', 1, 1519728656623642, 'trac', '127.0.0.1', '= The Trac Roadmap =
[[TracGuideToc]]

The roadmap provides a view on the [wiki:TracTickets ticket system] that helps planning and managing the future development of a project.

== The Roadmap View ==

Basically, the roadmap is just a list of future milestones. You can add a description to milestones (using WikiFormatting) describing main objectives, for example. In addition, tickets targeted for a milestone are aggregated, and the ratio between active and resolved tickets is displayed as a milestone progress bar.  It is possible to further [trac:TracRoadmapCustomGroups customise the ticket grouping] and have multiple ticket statuses shown on the progress bar.

The roadmap can be filtered to show or hide ''''completed milestones'''' and ''''milestones with no due date''''. In the case that both ''''show completed milestones'''' and ''''hide milestones with no due date'''' are selected, ''''completed'''' milestones with no due date __will__ be shown.

== The Milestone View ==

You can add a description for each milestone (using WikiFormatting) describing main objectives, for example. In addition, tickets targeted for a milestone are aggregated, and the ratio between active and resolved tickets is displayed as a milestone progress bar.  It is possible to further [trac:TracRoadmapCustomGroups customise the ticket grouping] and have multiple ticket statuses shown on the progress bar.

It is possible to drill down into this simple statistic by viewing the individual milestone pages. By default, the active/resolved ratio will be grouped and displayed by component. You can also regroup the status by other criteria, such as ticket owner or severity. Ticket numbers are linked to [wiki:TracQuery custom queries] listing corresponding tickets.

== Roadmap Administration ==

With appropriate permissions it is possible to add, modify and remove milestones using either the web interface (roadmap and milestone pages), web administration interface or by using `trac-admin`. 

''''''Note:'''''' Milestone descriptions can not currently be edited using ''trac-admin''.

== iCalendar Support ==

The Roadmap supports the [http://www.ietf.org/rfc/rfc2445.txt iCalendar] format to keep track of planned milestones and related tickets from your favorite calendar software. Many calendar applications support the iCalendar specification including
 * [http://www.apple.com/ical/ Apple iCal] for Mac OS X
 * the cross-platform [http://www.mozilla.org/projects/calendar/ Mozilla Calendar]
 * [http://chandlerproject.org Chandler]
 * [http://kontact.kde.org/korganizer/ Korganizer] (the calendar application of the [http://www.kde.org/ KDE] project)
 * [http://www.novell.com/de-de/products/desktop/features/evolution.html Evolution] also support iCalendar
 * [http://office.microsoft.com/en-us/outlook/ Microsoft Outlook] can also read iCalendar files (it appears as a new static calendar in Outlook)
 * [https://www.google.com/calendar/ Google Calendar] 

To subscribe to the roadmap, copy the iCalendar link from the roadmap (found at the bottom of the page) and choose the "Subscribe to remote calendar" action (or similar) of your calendar application, and insert the URL just copied.

''''''Note:'''''' For tickets to be included in the calendar as tasks, you need to be logged in when copying the link. You will only see tickets assigned to yourself, and associated with a milestone.

''''''Note:'''''' To include the milestones in Google Calendar you might need to rewrite the URL.
{{{
RewriteEngine on
RewriteRule ([^/.]+)/roadmap/([^/.]+)/ics /$1/roadmap?user=$2&format=ics
}}}

More information about iCalendar can be found at [http://en.wikipedia.org/wiki/ICalendar Wikipedia].
----
See also: TracTickets, TracReports, TracQuery, [trac:TracRoadmapCustomGroups]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracRss', 1, 1519728656626711, 'trac', '127.0.0.1', '= Using RSS with Trac =
[[TracGuideToc]]

Several of the Trac modules support content syndication using the RSS (Really Simple Syndication) XML format.
Using the RSS subscription feature in Trac, you can easily monitor progress of the project, a set of issues or even changes to a single file.

Trac supports RSS feeds in:

 * TracTimeline —  Use the RSS feed to ''''''subscribe to project events''''''.[[br]]Monitor overall project progress in your favorite RSS reader.
 * TracTickets, TracReports, and TracQuery — Allows syndication of report and ticket query results.[[br]]Be notified about important and relevant issue tickets.
 * TracBrowser and TracRevisionLog — Syndication of file changes.[[br]]Stay up to date with changes to a specific file or directory.

== How to access RSS data ==
Anywhere in Trac where RSS is available, you should find a small orange ''''''XML'''''' icon, typically placed at the bottom of the page. Clicking the icon will access the RSS feed for that specific resource.

''''''Note:'''''' Different modules provide different data in their RSS feeds. Usually, the syndicated information corresponds to the current view. For example, if you click the RSS link on a report page, the feed will be based on that report. It might be explained by thinking of the RSS feeds as an ''''alternate view of the data currently displayed''''.

== Links ==
 * ''''Specifications:''''
   * http://blogs.law.harvard.edu/tech/rss — RSS 2.0 Specification

 * ''''Multi-platform RSS readers:''''
   * http://www.rssowl.org/ — Open source, Eclipse-based, RSS reader for Linux, Mac and Windows systems that supports https and authenticated feeds.

 * ''''Linux/BSD/*n*x systems:''''
   * http://liferea.sourceforge.net/ — Open source GTK2 RSS Reader for Linux
   * [http://akregator.sourceforge.net/ Akregator] — Open source KDE RSS Reader (part of KDE-PIM)

 * ''''Mac OS X systems:''''
   * http://ranchero.com/netnewswire/ — An excellent RSS reader for Mac OS X (has both free and pay versions)
   * http://www.utsire.com/shrook/ — An RSS reader for Max OS X that supports https (even with self signed certificates) and authenticated feeds.
   * http://vienna-rss.sourceforge.net/ — Open source Feed Reader for Mac OS X with smart folders support
   * http://www.mesadynamics.com/Tickershock.html — Non-intrusive "news ticker" style RSS reader for Mac OS X

 * ''''Windows systems:''''
   * http://www.rssreader.com/ — Free and powerful RSS Reader for Windows
   * http://www.sharpreader.net/ — A free RSS Reader written in .NET for Windows

 * ''''Firefox:''''
   * http://www.mozilla.org/products/firefox/ — Mozilla Firefox features plenty [https://addons.mozilla.org/en-US/firefox/search/?q=rss&appver=&platform= add-ons] for supporting RSS

----
See also: TracGuide, TracTimeline, TracReports, TracBrowser
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracSearch', 1, 1519728656629677, 'trac', '127.0.0.1', '= Using Search =

Trac has a built-in search engine to allow finding occurrences of keywords and substrings in wiki pages, tickets and changeset properties (author, revision and log message).

Using the Trac search facility is straightforward and its interface should be familiar to most users.

Apart from the [search: Search module], you will also find a small search field above the navigation bar at all time. It provides convenient access to the search module from all pages.

The search results show the most recent modifications ranked first in the results rather than the most relevant result.

== "Quickjump" searches ==
For quick access to various project resources, the quick-search field at the top of every page can be used to enter a [TracLinks wiki link], which will take you directly to the resource identified by that link.

For example:

 * ![42] -- Opens change set 42
 * !#42 -- Opens ticket number 42
 * !{1} -- Opens report 1
 * /trunk -- Opens the browser for the `trunk` directory

== Advanced ==

=== Disabling Quickjumps ===
To disable the quickjump feature for a search keyword - for example when searching for occurences of the literal word !TracGuide - begin the query with an exclamation mark (`!`).

=== Search Links ===
From the Wiki, it is possible to link to a specific search, using
`search:` links:
 * `search:?q=crash` will search for the string "crash" 
 * `search:?q=trac+link&wiki=on` will search for "trac" and "link" 
   in wiki pages only

----
See also: TracGuide, TracLinks, TracQuery', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracStandalone', 1, 1519728656632690, 'trac', '127.0.0.1', '= Tracd =

Tracd is a lightweight standalone Trac web server.
It can be used in a variety of situations, from a test or development server to a multiprocess setup behind another web server used as a load balancer.

== Pros ==

 * Fewer dependencies: You don''t need to install apache or any other web-server.
 * Fast: Should be almost as fast as the [wiki:TracModPython mod_python] version (and much faster than the [wiki:TracCgi CGI]), even more so since version 0.12 where the HTTP/1.1 version of the protocol is enabled by default
 * Automatic reloading: For development, Tracd can be used in ''''auto_reload'''' mode, which will automatically restart the server whenever you make a change to the code (in Trac itself or in a plugin).

== Cons ==

 * Fewer features: Tracd implements a very simple web-server and is not as configurable or as scalable as Apache httpd.
 * No native HTTPS support: [http://www.rickk.com/sslwrap/ sslwrap] can be used instead,
   or [http://trac.edgewall.org/wiki/STunnelTracd stunnel -- a tutorial on how to use stunnel with tracd] or Apache with mod_proxy.

== Usage examples ==

A single project on port 8080. (http://localhost:8080/)
{{{
 $ tracd -p 8080 /path/to/project
}}}
Stricly speaking this will make your Trac accessible to everybody from your network rather than ''''localhost only''''. To truly limit it use ''''--hostname'''' option.
{{{
 $ tracd --hostname=localhost -p 8080 /path/to/project
}}}
With more than one project. (http://localhost:8080/project1/ and http://localhost:8080/project2/)
{{{
 $ tracd -p 8080 /path/to/project1 /path/to/project2
}}}

You can''t have the last portion of the path identical between the projects since Trac uses that name to keep the URLs of the
different projects unique. So if you use `/project1/path/to` and `/project2/path/to`, you will only see the second project.

An alternative way to serve multiple projects is to specify a parent directory in which each subdirectory is a Trac project, using the `-e` option. The example above could be rewritten:
{{{
 $ tracd -p 8080 -e /path/to
}}}

To exit the server on Windows, be sure to use {{{CTRL-BREAK}}} -- using {{{CTRL-C}}} will leave a Python process running in the background.

== Installing as a Windows Service ==

=== Option 1 ===
To install as a Windows service, get the [http://www.google.com/search?q=srvany.exe SRVANY] utility and run:
{{{
 C:\path\to\instsrv.exe tracd C:\path\to\srvany.exe
 reg add HKLM\SYSTEM\CurrentControlSet\Services\tracd\Parameters /v Application /d "\"C:\path\to\python.exe\" \"C:\path\to\python\scripts\tracd-script.py\" <your tracd parameters>"
 net start tracd
}}}

''''''DO NOT'''''' use {{{tracd.exe}}}.  Instead register {{{python.exe}}} directly with {{{tracd-script.py}}} as a parameter.  If you use {{{tracd.exe}}}, it will spawn the python process without SRVANY''s knowledge.  This python process will survive a {{{net stop tracd}}}.

If you want tracd to start automatically when you boot Windows, do:
{{{
 sc config tracd start= auto
}}}

The spacing here is important.

{{{#!div
Once the service is installed, it might be simpler to run the Registry Editor rather than use the `reg add` command documented above.  Navigate to:[[BR]]
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tracd\Parameters`

Three (string) parameters are provided:
||!AppDirectory ||C:\Python26\ ||
||Application ||python.exe ||
||!AppParameters ||scripts\tracd-script.py -p 8080 ... ||

Note that, if the !AppDirectory is set as above, the paths of the executable ''''and'''' of the script name and parameter values are relative to the directory.  This makes updating Python a little simpler because the change can be limited, here, to a single point.
(This is true for the path to the .htpasswd file, as well, despite the documentation calling out the /full/path/to/htpasswd; however, you may not wish to store that file under the Python directory.)
}}}

For Windows 7 User, srvany.exe may not be an option, so you can use [http://www.google.com/search?q=winserv.exe WINSERV] utility and run:
{{{
"C:\path\to\winserv.exe" install tracd -displayname "tracd" -start auto "C:\path\to\python.exe" c:\path\to\python\scripts\tracd-script.py <your tracd parameters>"

net start tracd
}}}

=== Option 2 ===

Use [http://trac-hacks.org/wiki/WindowsServiceScript WindowsServiceScript], available at [http://trac-hacks.org/ Trac Hacks]. Installs, removes, starts, stops, etc. your Trac service.

=== Option 3 ===

also cygwin''s cygrunsrv.exe can be used:
{{{
$ cygrunsrv --install tracd --path /cygdrive/c/Python27/Scripts/tracd.exe --args ''--port 8000 --env-parent-dir E:\IssueTrackers\Trac\Projects''
$ net start tracd
}}}

== Using Authentication ==

Tracd allows you to run Trac without the need for Apache, but you can take advantage of Apache''s password tools (htpasswd and htdigest) to easily create a password file in the proper format for tracd to use in authentication. (It is also possible to create the password file without htpasswd or htdigest; see below for alternatives)

Tracd provides support for both Basic and Digest authentication. Digest is considered more secure. The examples below use Digest; to use Basic authentication, replace `--auth` with `--basic-auth` in the command line.

The general format for using authentication is:
{{{
 $ tracd -p port --auth="base_project_dir,password_file_path,realm" project_path
}}}
where:
 * ''''''base_project_dir'''''': the base directory of the project specified as follows:
   * when serving multiple projects: ''''relative'''' to the `project_path`
   * when serving only a single project (`-s`): the name of the project directory
 Don''t use an absolute path here as this won''t work. ''''Note:'''' This parameter is case-sensitive even for environments on Windows.
 * ''''''password_file_path'''''': path to the password file
 * ''''''realm'''''': the realm name (can be anything)
 * ''''''project_path'''''': path of the project

 * **`--auth`** in the above means use Digest authentication, replace `--auth` with `--basic-auth` if you want to use Basic auth.  Although Basic authentication does not require a "realm", the command parser does, so the second comma is required, followed directly by the closing quote for an empty realm name.

Examples:

{{{
 $ tracd -p 8080 \
   --auth="project1,/path/to/passwordfile,mycompany.com" /path/to/project1
}}}

Of course, the password file can be be shared so that it is used for more than one project:
{{{
 $ tracd -p 8080 \
   --auth="project1,/path/to/passwordfile,mycompany.com" \
   --auth="project2,/path/to/passwordfile,mycompany.com" \
   /path/to/project1 /path/to/project2
}}}

Another way to share the password file is to specify "*" for the project name:
{{{
 $ tracd -p 8080 \
   --auth="*,/path/to/users.htdigest,mycompany.com" \
   /path/to/project1 /path/to/project2
}}}

=== Basic Authorization: Using a htpasswd password file ===
This section describes how to use `tracd` with Apache .htpasswd files.

  Note: It is necessary (at least with Python 2.6) to install the fcrypt package in order to
  decode some htpasswd formats.  Trac source code attempt an `import crypt` first, but there
  is no such package for Python 2.6. Only `SHA-1` passwords (since Trac 1.0) work without this module.

To create a .htpasswd file use Apache''s `htpasswd` command (see [#GeneratingPasswordsWithoutApache below] for a method to create these files without using Apache):
{{{
 $ sudo htpasswd -c /path/to/env/.htpasswd username
}}}
then for additional users:
{{{
 $ sudo htpasswd /path/to/env/.htpasswd username2
}}}

Then to start `tracd` run something like this:
{{{
 $ tracd -p 8080 --basic-auth="projectdirname,/fullpath/environmentname/.htpasswd,realmname" /fullpath/environmentname
}}}

For example:
{{{
 $ tracd -p 8080 --basic-auth="testenv,/srv/tracenv/testenv/.htpasswd,My Test Env" /srv/tracenv/testenv
}}}
''''Note:'''' You might need to pass "-m" as a parameter to htpasswd on some platforms (OpenBSD).

=== Digest authentication: Using a htdigest password file ===

If you have Apache available, you can use the htdigest command to generate the password file. Type ''htdigest'' to get some usage instructions, or read [http://httpd.apache.org/docs/2.0/programs/htdigest.html this page] from the Apache manual to get precise instructions.  You''ll be prompted for a password to enter for each user that you create.  For the name of the password file, you can use whatever you like, but if you use something like `users.htdigest` it will remind you what the file contains. As a suggestion, put it in your <projectname>/conf folder along with the [TracIni trac.ini] file.

Note that you can start tracd without the `--auth` argument, but if you click on the ''''Login'''' link you will get an error.

=== Generating Passwords Without Apache ===

Basic Authorization can be accomplished via this [http://aspirine.org/htpasswd_en.html online HTTP Password generator] which also supports `SHA-1`.  Copy the generated password-hash line to the .htpasswd file on your system. Note that Windows Python lacks the "crypt" module that is the default hash type for htpasswd ; Windows Python can grok MD5 password hashes just fine and you should use MD5.

You can use this simple Python script to generate a ''''''digest'''''' password file:

{{{
#!python
from optparse import OptionParser
# The md5 module is deprecated in Python 2.5
try:
    from hashlib import md5
except ImportError:
    from md5 import md5
realm = ''trac''

# build the options
usage = "usage: %prog [options]"
parser = OptionParser(usage=usage)
parser.add_option("-u", "--username",action="store", dest="username", type = "string",
                  help="the username for whom to generate a password")
parser.add_option("-p", "--password",action="store", dest="password", type = "string",
                  help="the password to use")
parser.add_option("-r", "--realm",action="store", dest="realm", type = "string",
                  help="the realm in which to create the digest")
(options, args) = parser.parse_args()

# check options
if (options.username is None) or (options.password is None):
   parser.error("You must supply both the username and password")
if (options.realm is not None):
   realm = options.realm
   
# Generate the string to enter into the htdigest file
kd = lambda x: md5('':''.join(x)).hexdigest()
print '':''.join((options.username, realm, kd([options.username, realm, options.password])))
}}}

Note: If you use the above script you must set the realm in the `--auth` argument to ''''''`trac`''''''. Example usage (assuming you saved the script as trac-digest.py):

{{{
 $ python trac-digest.py -u username -p password >> c:\digest.txt
 $ tracd --port 8000 --auth=proj_name,c:\digest.txt,trac c:\path\to\proj_name
}}}

==== Using `md5sum`
It is possible to use `md5sum` utility to generate digest-password file:
{{{
user=
realm=
password=
path_to_file=
echo ${user}:${realm}:$(printf "${user}:${realm}:${password}" | md5sum - | sed -e ''s/\s\+-//'') > ${path_to_file}
}}}

== Reference ==

Here''s the online help, as a reminder (`tracd --help`):
{{{
Usage: tracd [options] [projenv] ...

Options:
  --version             show program''s version number and exit
  -h, --help            show this help message and exit
  -a DIGESTAUTH, --auth=DIGESTAUTH
                        [projectdir],[htdigest_file],[realm]
  --basic-auth=BASICAUTH
                        [projectdir],[htpasswd_file],[realm]
  -p PORT, --port=PORT  the port number to bind to
  -b HOSTNAME, --hostname=HOSTNAME
                        the host name or IP address to bind to
  --protocol=PROTOCOL   http|scgi|ajp|fcgi
  -q, --unquote         unquote PATH_INFO (may be needed when using ajp)
  --http10              use HTTP/1.0 protocol version instead of HTTP/1.1
  --http11              use HTTP/1.1 protocol version (default)
  -e PARENTDIR, --env-parent-dir=PARENTDIR
                        parent directory of the project environments
  --base-path=BASE_PATH
                        the initial portion of the request URL''s "path"
  -r, --auto-reload     restart automatically when sources are modified
  -s, --single-env      only serve a single project without the project list
  -d, --daemonize       run in the background as a daemon
  --pidfile=PIDFILE     when daemonizing, file to which to write pid
  --umask=MASK          when daemonizing, file mode creation mask to use, in
                        octal notation (default 022)
  --group=GROUP         the group to run as
  --user=USER           the user to run as
}}}

Use the -d option so that tracd doesn''t hang if you close the terminal window where tracd was started.

== Tips ==

=== Serving static content ===

If `tracd` is the only web server used for the project, 
it can also be used to distribute static content 
(tarballs, Doxygen documentation, etc.)

This static content should be put in the `$TRAC_ENV/htdocs` folder,
and is accessed by URLs like `<project_URL>/chrome/site/...`.

Example: given a `$TRAC_ENV/htdocs/software-0.1.tar.gz` file,
the corresponding relative URL would be `/<project_name>/chrome/site/software-0.1.tar.gz`, 
which in turn can be written as `htdocs:software-0.1.tar.gz` (TracLinks syntax) or `[/<project_name>/chrome/site/software-0.1.tar.gz]` (relative link syntax). 

 ''''Support for `htdocs:` TracLinks syntax was added in version 0.10''''

=== Using tracd behind a proxy

In some situations when you choose to use tracd behind Apache or another web server.

In this situation, you might experience issues with redirects, like being redirected to URLs with the wrong host or protocol. In this case (and only in this case), setting the `[trac] use_base_url_for_redirect` to `true` can help, as this will force Trac to use the value of `[trac] base_url` for doing the redirects.

If you''re using the AJP protocol to connect with `tracd` (which is possible if you have flup installed), then you might experience problems with double quoting. Consider adding the `--unquote` parameter.

See also [trac:TracOnWindowsIisAjp], [trac:TracNginxRecipe].

=== Authentication for tracd behind a proxy
It is convenient to provide central external authentication to your tracd instances, instead of using {{{--basic-auth}}}. There is some discussion about this in #9206.

Below is example configuration based on Apache 2.2, mod_proxy, mod_authnz_ldap.

First we bring tracd into Apache''s location namespace.

{{{
<Location /project/proxified>
        Require ldap-group cn=somegroup, ou=Groups,dc=domain.com
        Require ldap-user somespecificusertoo
        ProxyPass http://localhost:8101/project/proxified/
        # Turns out we don''t really need complicated RewriteRules here at all
        RequestHeader set REMOTE_USER %{REMOTE_USER}s
</Location>
}}}

Then we need a single file plugin to recognize HTTP_REMOTE_USER header as valid authentication source. HTTP headers like ''''''HTTP_FOO_BAR'''''' will get converted to ''''''Foo-Bar'''''' during processing. Name it something like ''''''remote-user-auth.py'''''' and drop it into ''''''proxified/plugins'''''' directory:
{{{
#!python
from trac.core import *
from trac.config import BoolOption
from trac.web.api import IAuthenticator

class MyRemoteUserAuthenticator(Component):

    implements(IAuthenticator)

    obey_remote_user_header = BoolOption(''trac'', ''obey_remote_user_header'', ''false'', 
               """Whether the ''Remote-User:'' HTTP header is to be trusted for user logins 
                (''''since ??.??'').""") 

    def authenticate(self, req):
        if self.obey_remote_user_header and req.get_header(''Remote-User''): 
            return req.get_header(''Remote-User'') 
        return None

}}}

Add this new parameter to your TracIni:
{{{
...
[trac]
...
obey_remote_user_header = true
...
}}}

Run tracd:
{{{
tracd -p 8101 -r -s proxified --base-path=/project/proxified
}}}

Note that if you want to install this plugin for all projects, you have to put it in your [TracPlugins#Plugindiscovery global plugins_dir] and enable it in your global trac.ini.

Global config (e.g. `/srv/trac/conf/trac.ini`):
{{{
[components]
remote-user-auth.* = enabled
[inherit]
plugins_dir = /srv/trac/plugins
[trac]
obey_remote_user_header = true
}}}

Environment config (e.g. `/srv/trac/envs/myenv`):
{{{
[inherit]
file = /srv/trac/conf/trac.ini
}}}

=== Serving a different base path than / ===
Tracd supports serving projects with different base urls than /<project>. The parameter name to change this is
{{{
 $ tracd --base-path=/some/path
}}}

----
See also: TracInstall, TracCgi, TracModPython, TracGuide, [trac:TracOnWindowsStandalone#RunningTracdasservice Running tracd.exe as a Windows service]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracSupport', 1, 1519728656636425, 'trac', '127.0.0.1', '= Trac Support =

Like in most [http://www.opensource.org/ open source projects], "free" Trac support is available primarily through the community itself, mainly through the [trac:MailingList mailing list] and the [trac: project wiki]. The latter is the authoritative source for the TracGuide (administrator and user guides for Trac).

There is also an [trac:IrcChannel IRC channel], where people might be able to help out. Much of the ''live'' development discussions also happen there.

Before you start a new support query, make sure you''ve done the appropriate searching:
 * in the project''s [trac:TracFaq FAQ]
 * in past messages to the [http://groups.google.com/group/trac-users Trac Users Mailing List]
 * in the Trac ticket system, using either a [trac:search:?q=&ticket=on&wiki=on full search] or a [trac:query: ticket query].

Please ''''''don''t'''''' create a ticket in trac.egdewall.org for asking a support question about Trac. Only use it when you face a ''''real'''' and ''''new'''' bug in Trac, and do so only after having read the [trac:NewTicketGuidelines NewTicketGuidelines]. The more a bug report or enhancement request complies with those guidelines, the higher the chances are that it will be fixed or implemented promptly!

----
See also: [trac:MailingList], [trac:TracTroubleshooting], [trac:CommercialServices]
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracSyntaxColoring', 1, 1519728656639291, 'trac', '127.0.0.1', '= Syntax Coloring of Source Code =
Trac supports language-specific syntax highlighting of source code within wiki formatted text in [WikiProcessors#CodeHighlightingSupport wiki processors] blocks and in the [TracBrowser repository browser].

To do this, Trac uses external libraries with support for a great number of programming languages.

Currently Trac supports syntax coloring using one or more of the following packages:

 * [http://pygments.pocoo.org/ Pygments], by far the preferred system, as it covers a wide range of programming languages and other structured texts and is actively supported
 * [http://www.codento.com/people/mtr/genscript/ GNU Enscript], commonly available on Unix but somewhat unsupported on Windows
 * [http://silvercity.sourceforge.net/ SilverCity], legacy system, some versions can be [http://trac.edgewall.org/wiki/TracFaq#why-is-my-css-code-not-being-highlighted-even-though-i-have-silvercity-installed problematic]


To activate syntax coloring, simply install either one (or more) of these packages (see [#ExtraSoftware] section below).
If none of these packages is available, Trac will display the data as plain text. 


=== About Pygments ===

Starting with trac 0.11 [http://pygments.org/ pygments] will be the new default highlighter. It''s a highlighting library implemented in pure python, very fast, easy to extend and [http://pygments.org/docs/ well documented].

The Pygments default style can specified in the [TracIni#mimeviewer-section mime-viewer] section of trac.ini. The default style can be overridden by setting a Style preference on the [/prefs/pygments preferences page]. 

It''s very likely that the list below is outdated because the list of supported pygments lexers is growing weekly. Just have a look at the page of [http://pygments.org/docs/lexers/ supported lexers] on the pygments webpage.


== Syntax Coloring Support ==

=== Known MIME Types

[[KnownMimeTypes]]

Note that the rich content may be directly //rendered// instead of syntax highlighted. This usually depends on which auxiliary packages are installed and on which components are activated in your setup. For example a `text/x-rst` document will be rendered via `docutils` if it is installed and the `trac.mimeview.rst.ReStructuredTextRenderer` is not disabled, and will be syntax highlighted otherwise.

In a similar way, a document with the mimetype `text/x-trac-wiki` is rendered using the Trac wiki formatter, unless the `trac.mimeview.api.WikiTextRenderer` component is disabled.

HTML documents are directly rendered only if the `render_unsafe_html` settings are enabled in the TracIni (those settings are present in multiple sections, as there are different security concerns depending where the document comes from). If you want to ensure that an HTML document gets syntax highlighted and not rendered, use the `text/xml` mimetype.

If mimetype such as ''svn:mime-type'' is set to ''text/plain'', there is no coloring even if file is known type like ''java''.

=== List of Languages Supported, by Highlighter #language-supported

This list is only indicative.

||                 ||= !SilverCity   =||= Enscript      =||= Pygments =||
|| Ada             ||                 ||  ✓              ||     ||
|| Asm             ||                 ||  ✓              ||     ||
|| Apache Conf     ||                 ||                 ||  ✓  ||
|| ASP             ||  ✓              ||  ✓              ||     ||
|| C               ||  ✓              ||  ✓              ||  ✓  ||
|| C#              ||                 ||  ✓ ^[#a1 (1)]^  ||  ✓  ||
|| C++             ||  ✓              ||  ✓              ||  ✓  ||
|| CMake           ||  ?              ||  ?              ||  ✓  ||
|| Java            ||  ✓ ^[#a2 (2)]^  ||  ✓              ||  ✓  ||
|| Awk             ||                 ||  ✓              ||     ||
|| Boo             ||                 ||                 ||  ✓  ||
|| CSS             ||  ✓              ||                 ||  ✓  ||
|| Python Doctests ||                 ||                 ||  ✓  ||
|| Diff            ||                 ||  ✓              ||  ✓  ||
|| Eiffel          ||                 ||  ✓              ||     ||
|| Elisp           ||                 ||  ✓              ||     ||
|| Fortran         ||                 ||  ✓ ^[#a1 (1)]^  ||  ✓  ||
|| Haskell         ||                 ||  ✓              ||  ✓  ||
|| Genshi          ||                 ||                 ||  ✓  ||
|| HTML            ||  ✓              ||  ✓              ||  ✓  ||
|| IDL             ||                 ||  ✓              ||     ||
|| INI             ||                 ||                 ||  ✓  ||
|| Javascript      ||  ✓              ||  ✓              ||  ✓  ||
|| Lua             ||                 ||                 ||  ✓  ||
|| m4              ||                 ||  ✓              ||     ||
|| Makefile        ||                 ||  ✓              ||  ✓  ||
|| Mako            ||                 ||                 ||  ✓  ||
|| Matlab ^[#a3 (3)]^  ||             ||  ✓              ||  ✓  ||
|| Mygthy          ||                 ||                 ||  ✓  ||
|| Objective-C     ||                 ||  ✓              ||  ✓  ||
|| OCaml           ||                 ||                 ||  ✓  ||
|| Pascal          ||                 ||  ✓              ||  ✓  ||
|| Perl            ||  ✓              ||  ✓              ||  ✓  ||
|| PHP             ||  ✓              ||                 ||  ✓  ||
|| PSP             ||  ✓              ||                 ||     ||
|| Pyrex           ||                 ||  ✓              ||     ||
|| Python          ||  ✓              ||  ✓              ||  ✓  ||
|| Ruby            ||  ✓              ||  ✓ ^[#a1 (1)]^  ||  ✓  ||
|| Scheme          ||                 ||  ✓              ||  ✓  ||
|| Shell           ||                 ||  ✓              ||  ✓  ||
|| Smarty          ||                 ||                 ||  ✓  ||
|| SQL             ||  ✓              ||  ✓              ||  ✓  ||
|| Troff           ||                 ||  ✓              ||  ✓  ||
|| TCL             ||                 ||  ✓              ||     ||
|| Tex             ||                 ||  ✓              ||  ✓  ||
|| Verilog         ||  ✓ ^[#a2 (2)]^  ||  ✓              ||     ||
|| VHDL            ||                 ||  ✓              ||     ||
|| Visual Basic    ||                 ||  ✓              ||  ✓  ||
|| VRML            ||                 ||  ✓              ||     ||
|| XML             ||  ✓              ||                 ||  ✓  ||



''''[=#a1 (1)] Not included in the Enscript distribution.  Additional highlighting rules can be obtained for
[http://neugierig.org/software/ruby/ Ruby],
[http://wiki.hasno.info/index.php/Csharp.st C#],
[http://wiki.hasno.info/index.php/F90.st Fortran 90x/2003]

''''[=#a2 (2)] since Silvercity 0.9.7 released on 2006-11-23

''''[=#a3 (3)] By default `.m` files are considered Objective-C files. In order to treat `.m` files as MATLAB files, add "text/matlab:m" to the "mime_map" setting in the [wiki:TracIni#mimeviewer-section "[mimeviewer] section of trac.ini"].

== Extra Software ==
 * GNU Enscript — http://directory.fsf.org/GNU/enscript.html
 * GNU Enscript for Windows — http://gnuwin32.sourceforge.net/packages/enscript.htm
 * !SilverCity — http://silvercity.sf.net/
 * **Pygments — http://pygments.org/**

----
See also: WikiProcessors, WikiFormatting, TracWiki, TracBrowser
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracTickets', 1, 1519728656642412, 'trac', '127.0.0.1', '= The Trac Ticket System =
[[TracGuideToc]]

The Trac ticket database provides simple but effective tracking of issues and bugs within a project.

As the central project management element of Trac, tickets can be used for ''''''project tasks'''''', ''''''feature requests'''''', ''''''bug reports'''''', ''''''software support issues'''''' among others. 

As with the TracWiki, this subsystem has been designed with the goal of making user contribution and participation as simple as possible. It should be as easy as possible to report bugs, ask questions, suggest improvements and discuss resolutions.

An issue is assigned to a person who must resolve it or reassign the ticket to someone else.
All tickets can be edited, annotated, assigned, prioritized and discussed at any time.

[=#edit-permissions]
However, some Trac installations may put restrictions in place about who can change what. For example, the default installation doesn''t permit to non-authenticated users ("anonymous" users) to change anything, even to comment on an issue, for obvious spam prevention reasons. Check the local contributing policy, which you can usually find on the front page WikiStart, or contact your local Trac administrator.

== Ticket Fields ==

A  ticket contains the following information attributes:
 
 * ''''''Reporter'''''' — The author of the ticket.
 * ''''''Type'''''' — The nature of the ticket (for example, defect or enhancement request). See TicketTypes for more details.
 * ''''''Component'''''' — The project module or subsystem this ticket concerns.
 * ''''''Version'''''' — Version of the project that this ticket pertains to.
 * ''''''Keywords'''''' — Keywords that a ticket is marked with. Useful for searching and report generation.
 * ''''''Priority'''''' — The importance of this issue, ranging from ''''trivial'''' to ''''blocker''''. A pull-down if different priorities where defined.
 * ''''''Milestone'''''' — When this issue should be resolved at the latest. A pull-down menu containing a list of milestones.
 * ''''''Assigned to/Owner'''''' — Principal person responsible for handling the issue.
 * ''''''Cc'''''' — A comma-separated list of other users or E-Mail addresses to notify. ''''Note that this does not imply responsiblity or any other policy.''''
 * ''''''Resolution'''''' — Reason for why a ticket was closed. One of {{{fixed}}}, {{{invalid}}}, {{{wontfix}}}, {{{duplicate}}}, {{{worksforme}}}.
 * ''''''Status'''''' — What is the current status? One of {{{new}}}, {{{assigned}}}, {{{closed}}}, {{{reopened}}}.
 * ''''''Summary'''''' — A brief description summarizing the problem or issue. Simple text without WikiFormatting.
 * ''''''Description'''''' — The body of the ticket. A good description should be specific, descriptive and to the point. Accepts WikiFormatting.

''''''Notes:'''''' 
 - Versions of Trac prior to 0.9 did not have the ''''type'''' field, but instead provided a ''''severity'''' field and different default values for the ''''priority'''' field. This change was done to simplify the ticket model by removing the somewhat blurry distinction between ''''priority'''' and ''''severity''''. However, the old model is still available if you prefer it: just add/modify the default values of the ''''priority'''' and ''''severity'''', and optionally hide the ''''type'''' field by removing all the possible values through [wiki:TracAdmin trac-admin].

 - the [trac:TicketTypes type], [trac:TicketComponent component], version, priority and severity fields can be managed with [wiki:TracAdmin trac-admin] or with the [trac:WebAdmin WebAdmin] plugin.

 - Description of the builtin ''''priority'''' values is available at [trac:TicketTypes#Whyistheseverityfieldgone TicketTypes]

== Changing and Commenting Tickets ==

With appropriate permissions, as already mentioned [#edit-permissions above], a ticket entered into Trac can at any time be modified by ''''''annotating''''''.

Then, annotations like changes and comments to the ticket are logged as a part of the ticket itself. When viewing a ticket, the history of changes will appear below the main ticket area.

Comment editing (available since 0.12) is meant to be used to make small corrections to comments, like fixing formatting, forgotten WikiFormatting or spelling errors, not major edits. For longer edits, you should be adding a new comment instead. Editing a comment will not produce a new entry on [/timeline] while entering a new comment or other changes will do.

All edits (field changes, new comments, comment edits) update the "last changed" time of the ticket.


''''''Notes:'''''' 
 - An important feature is being able to use TracLinks and WikiFormatting in ticket descriptions and comments. Use TracLinks to refer to other issues, changesets or files to make your ticket more specific and easier to understand.

 - See TracNotification for how to configure email notifications of ticket changes.

 - See TracWorkflow for information about the state transitions (ticket lifecycle), and how this workflow can be customized.

== Default Values for Drop-Down Fields ==

The option selected by default for the various drop-down fields can be set in [wiki:TracIni trac.ini], in the `[ticket]` section:

 * `default_component`: Name of the component selected by default
 * `default_milestone`: Name of the default milestone
 * `default_priority`: Default priority value
 * `default_severity`: Default severity value
 * `default_type`: Default ticket type
 * `default_version`: Name of the default version
 * `default_owner`: Name of the default owner. If set to the text "< default >" (the default value), the component owner is used.

If any of these options are omitted, the default value will either be the first in the list, or an empty value, depending on whether the field in question is required to be set.  Some of these can be chosen through the [trac:WebAdmin WebAdmin] plugin in the "Ticket System" section (others in the [[wiki:TracIni#ticket-section|"[ticket]"]] section in `trac.ini`).


== Hiding Fields and Adding Custom Fields ==

Many of the default ticket fields can be hidden from the ticket web interface simply by removing all the possible values through [wiki:TracAdmin trac-admin]. This of course only applies to drop-down fields, such as ''''type'''', ''''priority'''', ''''severity'''', ''''component'''', ''''version'''' and ''''milestone''''.

Trac also lets you add your own custom ticket fields. See TracTicketsCustomFields for more information.


== Assign-to as Drop-Down List ==

If the list of possible ticket owners is finite, you can change the ''''assign-to'''' ticket field from a text input to a drop-down list. This is done by setting the `restrict_owner` option of the `[ticket]` section in [wiki:TracIni trac.ini] to “true”. In that case, Trac will use the list of all users who have accessed the project to populate the drop-down field.

To appear in the dropdown list, a user needs be registered with the project, ''''i.e.'''' a user session should exist in the database. Such an entry is automatically created in the database the first time the user submits a change in the project, for example when editing the user''s details in the ''''Settings'''' page, or simply by authenticating if the user has a login. Also, the user must have `TICKET_MODIFY` [TracPermissions permissions].

''''''Notes:'''''' 
 - See [http://pacopablo.com/wiki/pacopablo/blog/set-assign-to-drop-down Populating Assign To Drop Down] on how to add user entries at database level

 - If you need serious flexibility and aren''t afraid of a little plugin coding of your own, see [http://trac-hacks.org/wiki/FlexibleAssignToPlugin FlexibleAssignTo] (disclosure: I''m the author)

 -  Activating this option may cause some performance degradation, read more about this in the [trac:TracPerformance#Configuration Trac performance] page.

== Preset Values for New Tickets ==

To create a link to the new-ticket form filled with preset values, you need to call the `/newticket?` URL with `variable=value` separated by `&`. 

Possible variables are :

 * ''''''type'''''' — The type droplist
 * ''''''reporter'''''' — Name or email of the reporter
 * ''''''summary'''''' — Summary line for the ticket
 * ''''''description'''''' — Long description of the ticket
 * ''''''component'''''' — The component droplist
 * ''''''version'''''' — The version droplist
 * ''''''severity'''''' — The severity droplist
 * ''''''keywords'''''' — The keywords 
 * ''''''priority'''''' — The priority droplist
 * ''''''milestone'''''' — The milestone droplist
 * ''''''owner'''''' — The person responsible for the ticket
 * ''''''cc'''''' — The list of emails for notifying about the ticket change

Example: ''''`[/newticket?summary=Compile%20Error&version=1.0&component=gui]`''''[[BR]]

----
See also:  TracGuide, TracWiki, TracTicketsCustomFields, TracNotification, TracReports, TracQuery
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracTicketsCustomFields', 1, 1519728656645564, 'trac', '127.0.0.1', '= Custom Ticket Fields =
Trac supports adding custom, user-defined fields to the ticket module. Using custom fields, you can add typed, site-specific properties to tickets.

== Configuration ==
Configuring custom ticket fields is done in the [wiki:TracIni trac.ini] file. All field definitions should be under a section named `[ticket-custom]`.

The syntax of each field definition is:
{{{
 FIELD_NAME = TYPE
 (FIELD_NAME.OPTION = VALUE)
 ...
}}}
The example below should help to explain the syntax.

=== Available Field Types and Options ===
 * ''''''text'''''': A simple (one line) text field.
   * label: Descriptive label.
   * value: Default value.
   * order: Sort order placement. (Determines relative placement in forms with respect to other custom fields.)
   * format: One of: 
     * `plain` for plain text 
     * `wiki` to interpret the content as WikiFormatting (''''since 0.11.3'''') 
     * `reference` to treat the content as a queryable value (''''since 1.0'''') 
     * `list` to interpret the content as a list of queryable values, separated by whitespace (''''since 1.0'''')
 * ''''''checkbox'''''': A boolean value check box.
   * label: Descriptive label.
   * value: Default value (0 or 1).
   * order: Sort order placement.
 * ''''''select'''''': Drop-down select box. Uses a list of values.
   * label: Descriptive label.
   * options: List of values, separated by ''''''|'''''' (vertical pipe).
   * value: Default value (one of the values from options).
   * order: Sort order placement.
 * ''''''radio'''''': Radio buttons. Essentially the same as ''''''select''''''.
   * label: Descriptive label.
   * options: List of values, separated by ''''''|'''''' (vertical pipe).
   * value: Default value (one of the values from options).
   * order: Sort order placement.
 * ''''''textarea'''''': Multi-line text area.
   * label: Descriptive label.
   * value: Default text.
   * cols: Width in columns.
   * rows: Height in lines.
   * order: Sort order placement.
   * format: Either `plain` for plain text or `wiki` to interpret the content as WikiFormatting. (''''since 0.11.3'''')

=== Sample Config ===
{{{
[ticket-custom]

test_one = text
test_one.label = Just a text box

test_two = text
test_two.label = Another text-box
test_two.value = Default [mailto:joe@nospam.com owner]
test_two.format = wiki

test_three = checkbox
test_three.label = Some checkbox
test_three.value = 1

test_four = select
test_four.label = My selectbox
test_four.options = one|two|third option|four
test_four.value = two

test_five = radio
test_five.label = Radio buttons are fun
test_five.options = uno|dos|tres|cuatro|cinco
test_five.value = dos

test_six = textarea
test_six.label = This is a large textarea
test_six.value = Default text
test_six.cols = 60
test_six.rows = 30
}}}

''''Note: To make entering an option for a `select` type field optional, specify a leading `|` in the `fieldname.options` option.''''

=== Reports Involving Custom Fields ===

Custom ticket fields are stored in the `ticket_custom` table, not in the `ticket` table. So to display the values from custom fields in a report, you will need a join on the 2 tables. Let''s use an example with a custom ticket field called `progress`.

{{{
#!sql
SELECT p.value AS __color__,
   id AS ticket, summary, owner, c.value AS progress
  FROM ticket t, enum p, ticket_custom c
  WHERE status IN (''assigned'') AND t.id = c.ticket AND c.name = ''progress''
AND p.name = t.priority AND p.type = ''priority''
  ORDER BY p.value
}}}
''''''Note'''''' that this will only show tickets that have progress set in them, which is ''''''not the same as showing all tickets''''''. If you created this custom ticket field ''''after'''' you have already created some tickets, they will not have that field defined, and thus they will never show up on this ticket query. If you go back and modify those tickets, the field will be defined, and they will appear in the query. If that''s all you want, you''re set.

However, if you want to show all ticket entries (with progress defined and without), you need to use a `JOIN` for every custom field that is in the query.
{{{
#!sql
SELECT p.value AS __color__,
   id AS ticket, summary, component, version, milestone, severity,
   (CASE status WHEN ''assigned'' THEN owner||'' *'' ELSE owner END) AS owner,
   time AS created,
   changetime AS _changetime, description AS _description,
   reporter AS _reporter,
  (CASE WHEN c.value = ''0'' THEN ''None'' ELSE c.value END) AS progress
  FROM ticket t
     LEFT OUTER JOIN ticket_custom c ON (t.id = c.ticket AND c.name = ''progress'')
     JOIN enum p ON p.name = t.priority AND p.type=''priority''
  WHERE status IN (''new'', ''assigned'', ''reopened'')
  ORDER BY p.value, milestone, severity, time
}}}

Note in particular the `LEFT OUTER JOIN` statement here.

=== Updating the database ===

As noted above, any tickets created before a custom field has been defined will not have a value for that field. Here''s a bit of SQL (tested with SQLite) that you can run directly on the Trac database to set an initial value for custom ticket fields. Inserts the default value of ''None'' into a custom field called ''request_source'' for all tickets that have no existing value:

{{{
#!sql
INSERT INTO ticket_custom
   (ticket, name, value)
   SELECT 
      id AS ticket,
      ''request_source'' AS name,
      ''None'' AS value
   FROM ticket 
   WHERE id NOT IN (
      SELECT ticket FROM ticket_custom
   );
}}}

If you added multiple custom fields at different points in time, you should be more specific in the subquery on table {{{ticket}}} by adding the exact custom field name to the query:

{{{
#!sql
INSERT INTO ticket_custom
   (ticket, name, value)
   SELECT 
      id AS ticket,
      ''request_source'' AS name,
      ''None'' AS value
   FROM ticket 
   WHERE id NOT IN (
      SELECT ticket FROM ticket_custom WHERE name = ''request_source''
   );
}}}

----
See also: TracTickets, TracIni', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracTimeline', 1, 1519728656648582, 'trac', '127.0.0.1', '= The Trac Timeline =
[[TracGuideToc]]

The timeline provides a historic view of the project in a single report.

It lists all Trac events that have occurred in chronological order, a
brief description of each event and if applicable, the person responsible for
the change.

The timeline lists these kinds of events:
 * ''''''Wiki page events'''''' — Creation and changes
 * ''''''Ticket events'''''' — Creation and resolution/closing (and optionally other changes)
 * ''''''Source code changes '''''' — Repository check-ins
 * ''''''Milestone '''''' — Milestone completed

Each event entry provides a hyperlink to the specific event in question, who authored the change as well as
a brief excerpt of the actual comment or text, if available.

It is possible to filter the displayed events with the various filters in the option panel:
 * ''''View changes from'''' — the date from which to start displaying events (current date if empty). Events that occurred after this date will not be shown, only those that occurred before that date.
 * ''''and X days back'''' — how many days backwards in time to get events.
 * ''''done by'''' — the author of an event. It accepts a space-separated list of authors for which events should be included. Alternatively, if the author names are prefixed by a "-" character, then the events having those authors will be excluded, and all the others included. Single or double quotes can be used for specifying author names containing space characters. ''''(since 0.12)''''
 * ''''Changesets in all repositories'''' — if you have more than one repository connected to your Trac project, then you can filter the output so events from specific repositories are not shown. ''''(since 0.12)''''
 * ''''Milestones reached'''' — display or hide milestones reached.
 * ''''Opened and closed tickets'''' — display or hide ticket open or close events.
 * ''''Wiki changes'''' — display or hide Wiki change events.

See !TracIni''s [wiki:TracIni#timeline-section "[timeline] section"] for timeline configuration options.

== RSS Support ==

The Timeline module supports subscription using RSS 2.0 syndication. To subscribe to project events, click the orange ''''''XML'''''' icon at the bottom of the page. See TracRss for more information on RSS support in Trac.

----
See also: TracGuide, TracIni, TracWiki, WikiFormatting, TracRss, TracNotification
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracUnicode', 1, 1519728656651430, 'trac', '127.0.0.1', '= Unicode Support in Trac =
[[TracGuideToc]]

Trac stores all text using UTF-8 encoding, including text in tickets and wiki pages. Internal processing of text uses true Unicode representations.

As such, it supports most (all?) commonly used character encodings.

If the default encoding in your source code repository is not UTF-8, you can specify it in the [TracIni#trac-section trac.ini], for example:
{{{
default_charset = gbk
}}}

You also must make sure that your [trac:DatabaseBackend database backend] stores its data in UTF-8; otherwise strange things will happen.

To convert your database to UTF-8, the easiest way is to dump the database, convert the dump into UTF-8 and then import the converted dump back into the database.[[BR]]
You can use [http://www.gnu.org/software/libiconv/documentation/libiconv/iconv.1.html iconv] to convert the dump.


== Examples ==

=== Arabic ===
تراك يقوم بحفظ كل الكلمات باستخدام صيغة UTF-8، بما في ذلك الكلمات المستخدمة في صفحات  التيكت والويكي.

=== Bulgarian ===
Българският език работи ли?

=== Česky ===
Čeština v kódování UTF-8, žádný problém.

=== Chinese ===
Traditional: 繁體中文, 漢字測試; Simplified: 简体中文，汉字测试

=== Croatian ===
Ako podržava srpski i slovenski mora podržavati i Hrvatski - čćžšđ ČĆŽŠĐ 

=== English ===
Yes indeed, Trac supports English. Fully.

=== Français ===
Il est possible d''écrire en Français : à, ç, û, ...

=== German ===
Trac-Wiki muß auch deutsche Umlaute richtig anzeigen: ö, ä, ü, Ä, Ö, Ü; und das scharfe ß

=== Greek ===
Τα Ελληνικά υποστηρίζονται επαρκώς επίσης.

=== Hebrew ===
אני יכול לאכול זכוכית וזה לא מזיק לי

=== Hindi ===
अब हिन्दी में।

=== Hungarian ===
Árvíztűrő tükörfúrógép

=== Icelandic ===
Ævar sagði við ömmu sína: Sjáðu hvað ég er stór!

=== Japanese ===
漢字 ひらがな カタカナ ﾊﾝｶｸｶﾅ 日本語試験

=== Korean ===
이번에는 한글로 써보겠습니다. 잘 보이나요? 한글

=== Latvian ===

Latviešu valoda arī strādā!

=== Lithuanian ===
Sudalyvaukime ir mes. Ar veikia lietuviškos raidės? ąčęėįšųūž ĄČĘĖĮŠŲŪŽ Žinoma, kad veikia :)
Kas tie mes?

=== Persian (Farsi) ===
این یک متن فارسی است ولی امکان نوشتن مستقیم فارسی نیست چون حالت متن از راست به چپ و جود ندارد برای فارسی نوشتن باید از HTML استفاده کنید.
{{{
#!html
<div dir="rtl">
}}}
این نمونه یک متن از راست به چپ فارسی است که در HTML نوشته شده تا اعداد 12345 و حروف لاتین ABCDEF در محل خودشان نمایش داده شوند.
{{{
#!html
</div>
}}}

=== Polish ===
Pchnąć w tę łódź jeża lub osiem skrzyń fig; Nocna gżegżółka zawsze dzienną przekuka.

=== Portuguese ===
É possível guardar caracteres especias da língua portuguesa, incluindo o símbolo da moeda européia ''€'', trema ''ü'', crase ''à'', agudos ''áéíóú'', circunflexos ''âêô'', til ''ãõ'', cedilha ''ç'', ordinais ''ªº'', grau ''°¹²³''.

=== Russian ===
Проверка русского языка: кажется работает... И буква "ё" есть...

=== Serbian ===
Podržan, uprkos činjenici da se za njegovo pisanje koriste чак два алфабета.

=== Slovenian ===
Ta suhi škafec pušča vodo že od nekdaj!

=== Spanish ===
Esto es un pequeño texto en Español, donde el veloz murciélago hindú comía cardlllo y kiwi

=== Swedish ===
Räven raskar över isen med luva på.

=== Thai ===
Trac แสดงภาษาไทยได้อย่างถูกต้อง!

=== Ukrainian ===
Перевірка української мови...

=== Urdu ===
ٹریک اردو بھی سپورٹ کرتا ہے۔

=== Vietnamese ===
Viết tiếng Việt cũng được.
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracUpgrade', 1, 1519728656654502, 'trac', '127.0.0.1', '= Upgrade Instructions =
[[TracGuideToc]]
[[PageOutline(2-4,,inline,unnumbered)]]

== Instructions ==

Typically, there are seven steps involved in upgrading to a newer version of Trac:

=== 1. Bring your server off-line

It is not a good idea to update a running server: the server processes may have parts of the current packages cached in memory, and updating the code will likely trigger [#ZipImportError internal errors]. 

=== 2. Update the Trac Code === #UpdatetheTracCode

Get the new version as described in TracInstall, or your operating system specific procedure.

If you already have a 0.11 version of Trac installed via `easy_install`, it might be easiest to also use `easy_install` to upgrade your Trac installation:

{{{
# easy_install --upgrade Trac==0.12
}}}

If you do a manual (not operating system-specific) upgrade, you should also stop any running Trac servers before the installation. Doing "hot" upgrades is not advised, especially on Windows ([trac:#7265]).

You may also want to remove the pre-existing Trac code by deleting the `trac` directory from the Python `lib/site-packages` directory, or remove Trac `.egg` files from former versions.
The location of the site-packages directory depends on the operating system and the location in which Python was installed. However, the following locations are typical:
 * on Linux: `/usr/lib/python2.X/site-packages`
 * on Windows: `C:\Python2.X\lib\site-packages`
 * on MacOSX: `/Library/Python/2.X/site-packages`

You may also want to remove the Trac `cgi-bin`, `htdocs`, `templates` and `wiki-default` directories that are commonly found in a directory called `share/trac`. (The exact location depends on your platform.)

This cleanup is not mandatory, but makes it easier to troubleshoot issues later on, as you won''t waste your time looking at code or templates from a previous release that are not being used anymore... As usual, make a backup before actually deleting things.

=== 3. Upgrade the Trac Environment === #UpgradetheTracEnvironment

Environment upgrades are not necessary for minor version releases unless otherwise noted. 

After restarting, Trac should show the instances which need a manual upgrade via the automated upgrade scripts to ease the pain. These scripts are run via [TracAdmin trac-admin]:
{{{
trac-admin /path/to/projenv upgrade
}}}

This command will do nothing if the environment is already up-to-date.

Note that a backup of your database will be performed automatically prior to the upgrade. 
This feature is relatively new for the PostgreSQL or MySQL database backends, so if it fails, you will have to backup the database manually. Then, to perform the actual upgrade, run:
{{{
trac-admin /path/to/projenv upgrade --no-backup
}}}

=== 4. Update the Trac Documentation === #UpdatetheTracDocumentation

Every [TracEnvironment Trac environment] includes a copy of the Trac documentation for the installed version. As you probably want to keep the included documentation in sync with the installed version of Trac, [TracAdmin trac-admin] provides a command to upgrade the documentation:
{{{
trac-admin /path/to/projenv wiki upgrade
}}}

Note that this procedure will leave your `WikiStart` page intact.


=== 5. Refresh static resources ===

If you have set up a web server to give out static resources directly (accessed using the `/chrome/` URL) then you will need to refresh them using the same command:
{{{
trac-admin /path/to/env deploy /deploy/path
}}}
this will extract static resources and CGI scripts (`trac.wsgi`, etc) from new Trac version and its plugins into `/deploy/path`.

Some web browsers (IE, Opera) cache CSS and Javascript files aggressively, so you may need to instruct your users to manually erase the contents of their browser''s cache, a forced refreshed (`<F5>`) should be enough.
{{{#!comment
Remove above note once #9936 is fixed.
}}}

=== 6. Steps specific to a given Trac version  ===
==== Upgrading from Trac 0.12 to Trac 1.0 ==== #to1.0

The Trac components for Subversion support are no longer enabled by default. To enable the svn support, you need to make sure the `tracopt.versioncontrol.svn` components are enabled, for example by setting the following in the TracIni:
{{{
[components]
tracopt.versioncontrol.svn.* = enabled
}}}
The upgrade procedure should take care of this and change the TracIni appropriately, unless you already had the svn components explicitly disabled.

Another step in the automatic upgrade will change the way the attachments are stored. If you''re a bit paranoid, you might want to take a backup of the `attachments` directory before upgrading (but if you are, you already did a full copy of the environment, no?). In case the `attachments` directory contains some files which are //not// attachments, the last step of the migration to the new layout will fail: the deletion of the now unused `attachments` directory can''t be done if there are still files and folders in it. You may ignore this error, but better go have a look to these files, move them elsewhere and remove the `attachments` directory manually to cleanup the environment. The attachments themselves are now all located in your environment below the `files/attachments` directory.


==== Upgrading from Trac 0.11 to Trac 0.12 ====

===== Python 2.3 no longer supported =====
The minimum supported version of python is now 2.4

===== SQLite v3.x required =====
SQLite v2.x is no longer supported. If you still use a Trac database of this format, you''ll need to convert it to SQLite v3.x first. See [trac:PySqlite#UpgradingSQLitefrom2.xto3.x] for details.

===== PySqlite 2 required =====
PySqlite 1.1.x is no longer supported. Please install 2.5.5 or later if possible (see [#Tracdatabaseupgrade Trac database upgrade] below).

===== Multiple Repository Support =====
The latest version includes support for multiple repositories. If you plan to add more repositories to your Trac instance, please refer to TracRepositoryAdmin#Migration.

This may be of interest to users with only one repository, since there''s now a way to avoid the potentially costly resync check at every request.

===== Resynchronize the Trac Environment Against the Source Code Repository =====

Each [TracEnvironment Trac environment] must be resynchronized against the source code repository in order to avoid errors such as "[http://trac.edgewall.org/ticket/6120 No changeset ??? in the repository]" while browsing the source through the Trac interface:

{{{
trac-admin /path/to/projenv repository resync ''*''
}}}

===== Improved repository synchronization =====
In addition to supporting multiple repositories, there is now a more efficient method for synchronizing Trac and your repositories.

While you can keep the same synchronization as in 0.11 adding the post-commit hook as outlined in TracRepositoryAdmin#Synchronization and TracRepositoryAdmin#ExplicitSync will allow more efficient synchronization and is more or less required for multiple repositories.

Note that if you were using the `trac-post-commit-hook`, ''''you''re strongly advised to upgrade it'''' to the new hook documented in the above references and [TracWorkflow#Howtocombinethetracopt.ticket.commit_updaterwiththetestingworkflow here], as the old hook will not work with anything else than the default repository and even for this case, it won''t trigger the appropriate notifications.

===== Authz permission checking =====
The authz permission checking has been migrated to a fine-grained permission policy. If you use authz permissions (aka `[trac] authz_file` and `authz_module_name`), you must add `AuthzSourcePolicy` in front of your permission policies in `[trac] permission_policies`. You must also remove `BROWSER_VIEW`, `CHANGESET_VIEW`, `FILE_VIEW` and `LOG_VIEW` from your global permissions (with `trac-admin $ENV permission remove` or the "Permissions" admin panel).

===== Microsecond timestamps =====
All timestamps in database tables (except the `session` table) have been changed from "seconds since epoch" to "microseconds since epoch" values. This change should be transparent to most users, except for custom reports. If any of your reports use date/time columns in calculations (e.g. to pass them to `datetime()`), you must divide the values retrieved from the database by 1''000''000. Similarly, if a report provides a calculated value to be displayed as a date/time (i.e. with a column named "time", "datetime", "changetime", "date", "created" or "modified"), you must provide a microsecond timestamp, that is, multiply your previous calculation with 1''000''000.

==== Upgrading from Trac 0.10 to Trac 0.11 ====
===== Site Templates and Styles =====
The templating engine has changed in 0.11 to Genshi, please look at TracInterfaceCustomization for more information.

If you are using custom CSS styles or modified templates in the `templates` directory of the TracEnvironment, you will need to convert them to the Genshi way of doing things. To continue to use your style sheet, follow the instructions at TracInterfaceCustomization#SiteAppearance.

===== Trac Macros, Plugins =====
The Trac macros will need to be adapted, as the old-style wiki-macros are not supported anymore (due to the drop of [trac:ClearSilver] and the HDF); they need to be converted to the new-style macros, see WikiMacros. When they are converted to the new style, they need to be placed into the plugins directory instead and not wiki-macros, which is no longer scanned for macros or plugins.

===== For FCGI/WSGI/CGI users =====
For those who run Trac under the CGI environment, run this command in order to obtain the trac.*gi file:
{{{
trac-admin /path/to/env deploy /deploy/directory/path
}}}

This will create a deploy directory with the following two subdirectories: `cgi-bin` and `htdocs`. Then update your Apache configuration file `httpd.conf` with this new `trac.cgi` location and `htdocs` location.

===== Web Admin plugin integrated =====
If you had the webadmin plugin installed, you can uninstall it as it is part of the Trac code base since 0.11.

=== 7. Restart the Web Server === #RestarttheWebServer

If you are not running [wiki:TracCgi CGI], reload the new Trac code by restarting your web server.

== Known Issues ==

Things you should pay attention to, while upgrading.

=== Customized Templates

Trac supports customization of its Genshi templates by placing copies of the templates in the `<env>/templates` folder of your [TracEnvironment environment] or in a common location specified in the [[TracIni#GlobalConfiguration| [inherit] templates_dir]] configuration setting. If you choose to do so, be wary that you will need to repeat your changes manually on a copy of the new templates when you upgrade to a new release of Trac (even a minor one), as the templates will likely evolve. So keep a diff around ;-)

The preferred way to perform TracInterfaceCustomization is to write a custom plugin doing an appropriate `ITemplateStreamFilter` transformation, as this is more robust in case of changes: we usually won''t modify element `id`s or change CSS `class`es, and if we have to do so, this will be documented in the TracDev/ApiChanges pages.

=== !ZipImportError ===

Due to internal caching of zipped packages,  whenever the content of the packages change on disk, the in-memory zip index will no longer match and you''ll get irrecoverable !ZipImportError errors. Better anticipate and bring your server down for maintenance before upgrading.
See [trac:#7014] for details.

=== Wiki Upgrade ===
`trac-admin` will not delete or remove default wiki pages that were present in a previous version but are no longer in the new version.

=== Trac database upgrade ===

A known issue in some versions of PySqlite (2.5.2-2.5.4) prevents the trac-admin upgrade script from successfully upgrading the database format. It is advised to use either a newer or older version of the sqlite python bindings to avoid this error. For more details see ticket [trac:#9434].

=== parent dir ===
If you use a trac parent env configuration and one of the plugins in one child does not work, none of the children work.

== Related topics

=== Upgrading Python ===

Upgrading Python to a newer version will require reinstallation of Python packages: Trac of course; also [http://pypi.python.org/pypi/setuptools easy_install], if you''ve been using that.  Assuming you''re using Subversion, you''ll also need to upgrade the Python bindings for svn.

==== Windows and Python 2.6 ====

If you''ve been using !CollabNet''s Subversion package, you may need to uninstall that in favor of [http://alagazam.net/ Alagazam], which has the Python bindings readily available (see TracSubversion).  The good news is, that works with no tweaking.

=== Changing Database Backend ===
==== SQLite to PostgreSQL ====

The [http://trac-hacks.org/wiki/SqliteToPgScript sqlite2pg] script on [http://trac-hacks.org trac-hacks.org] has been written to assist in migrating a SQLite database to a PostgreSQL database

=== Upgrading from older versions of Trac === #OlderVersions

For upgrades from versions older than Trac 0.10, refer first to [trac:wiki:0.10/TracUpgrade#SpecificVersions].

-----
See also: TracGuide, TracInstall
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracWiki', 1, 1519728656657982, 'trac', '127.0.0.1', '
= The Trac Wiki System =
[[TracGuideToc]]

Trac has a built-in wiki system which you can use for organizing knowledge and information in a very flexible way by [WikiNewPage creating pages] containing an intuitive and easy to learn textual markup. This text markup is also used in all other parts of the system, not only in [wiki:TitleIndex wiki pages], but also in [wiki:TracTickets ticket] description and comments, [wiki:TracChangeset check-in log messages], [wiki:TracRoadmap milestone] descriptions and [wiki:TracReports report] descriptions, even in third-party extensions.
It allows for formatted text and hyperlinks in and between all Trac modules.

Editing wiki text is easy, using any web browser and a simple [WikiFormatting formatting system], rather than more complex markup languages like HTML.  The reasoning behind its design is that HTML, with its large collection of nestable tags, is too complicated to allow fast-paced editing, and distracts from the actual content of the pages. Note though that Trac also supports [WikiHtml HTML], [WikiRestructuredText reStructuredText] and [http://www.textism.com/tools/textile/ Textile] as alternative markup formats, which can eventually be used in parts of a page (so called wiki “blocks”).

The main goal of the wiki is to make editing text easier and ''''encourage'''' people to contribute and annotate text content for a project. Trac also provides a simple toolbar to make formatting text even easier, and supports the [http://universaleditbutton.org/Universal_Edit_Button universal edit button] of your browser.

The wiki itself does not enforce any structure, but rather resembles a stack of empty sheets of paper, where you can organize information and documentation as you see fit, and later reorganize if necessary. 
As contributing to a wiki is essentially building hypertext, 
general advice regarding HTML authoring apply here as well.
For example, the ''''[http://www.w3.org/Provider/Style Style Guide for online hypertext]'''' explains how to think about the
[http://www.w3.org/Provider/Style/Structure.html overall structure of a work] 
and how to organize information [http://www.w3.org/Provider/Style/WithinDocument.html within each document]. One of the most important tip is “make your HTML page such that you can read it even if you don''t follow any links.”

Learn more about:
 * WikiFormatting rules, including advanced topics like WikiMacros and WikiProcessors
 * How to use WikiPageNames and other forms of TracLinks which are used to refer in a precise way to any resource within Trac

If you want to practice editing, please use the SandBox. Note that not all Trac wikis are editable by anyone, this depends on the local policy; check with your Trac administrators.

Before saving your changes, you can ''''Preview'''' the page or ''''Review the Changes'''' you''ve made.
You can get an automatic preview of the formatting as you type when you activate the ''''Edit Side-by-side'''' mode (you have to Preview the page for the setting to take effect). '''' There is a [wiki:/TracIni#trac-section configurable delay] between when you make your edit and when the automatic preview will update.''''

Some more information about wikis on the web:
 * A definition of [http://wikipedia.org/wiki/Wiki Wiki], in a famous wiki encyclopedia
 * The [http://c2.com/cgi/wiki?WikiHistory History] of the original wiki
 * A wiki page explaining [http://www.usemod.com/cgi-bin/mb.pl?WhyWikiWorks why wiki works]

----
See also: TracGuide
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('TracWorkflow', 1, 1519728656661016, 'trac', '127.0.0.1', '= The Trac Ticket Workflow System =
[[TracGuideToc]]

The Trac issue database provides a configurable workflow.

== The Default Ticket Workflow ==
=== Environments upgraded from 0.10 ===
When you run `trac-admin <env> upgrade`, your `trac.ini` will be modified to include a `[ticket-workflow]` section.
The workflow configured in this case is the original workflow, so that ticket actions will behave like they did in 0.10.

Graphically, that looks like this:

{{{#!Workflow width=500 height=240
leave = * -> *
leave.operations = leave_status
leave.default = 1
accept = new -> assigned
accept.permissions = TICKET_MODIFY
accept.operations = set_owner_to_self
resolve = new,assigned,reopened -> closed
resolve.permissions = TICKET_MODIFY
resolve.operations = set_resolution
reassign = new,assigned,reopened -> new
reassign.permissions = TICKET_MODIFY
reassign.operations = set_owner
reopen = closed -> reopened
reopen.permissions = TICKET_CREATE
reopen.operations = del_resolution
}}}

There are some significant "warts" in this; such as accepting a ticket sets it to ''assigned'' state, and assigning a ticket sets it to ''new'' state.  Perfectly obvious, right?
So you will probably want to migrate to "basic" workflow; [trac:source:trunk/contrib/workflow/migrate_original_to_basic.py contrib/workflow/migrate_original_to_basic.py] may be helpful.

=== Environments created with 0.11 ===
When a new environment is created, a default workflow is configured in your trac.ini.  This workflow is the basic workflow (described in `basic-workflow.ini`), which is somewhat different from the workflow of the 0.10 releases.

Graphically, it looks like this:

{{{#!Workflow width=700 height=300
leave = * -> *
leave.operations = leave_status
leave.default = 1
accept = new,assigned,accepted,reopened -> accepted
accept.permissions = TICKET_MODIFY
accept.operations = set_owner_to_self
resolve = new,assigned,accepted,reopened -> closed
resolve.permissions = TICKET_MODIFY
resolve.operations = set_resolution
reassign = new,assigned,accepted,reopened -> assigned
reassign.permissions = TICKET_MODIFY
reassign.operations = set_owner
reopen = closed -> reopened
reopen.permissions = TICKET_CREATE
reopen.operations = del_resolution
}}}

== Additional Ticket Workflows ==

There are several example workflows provided in the Trac source tree; look in [trac:source:trunk/contrib/workflow contrib/workflow] for `.ini` config sections.  One of those may be a good match for what you want. They can be pasted into the `[ticket-workflow]` section of your `trac.ini` file. However if you have existing tickets then there may be issues if those tickets have states that are not in the new workflow. 

Here are some [http://trac.edgewall.org/wiki/WorkFlow/Examples diagrams] of the above examples.

== Basic Ticket Workflow Customization ==

Note: Ticket "statuses" or "states" are not separately defined. The states a ticket can be in are automatically generated by the transitions defined in a workflow. Therefore, creating a new ticket state simply requires defining a state transition in the workflow that starts or ends with that state.

Create a `[ticket-workflow]` section in `trac.ini`.
Within this section, each entry is an action that may be taken on a ticket. 
For example, consider the `accept` action from `simple-workflow.ini`:
{{{
accept = new,accepted -> accepted
accept.permissions = TICKET_MODIFY
accept.operations = set_owner_to_self
}}}
The first line in this example defines the `accept` action, along with the states the action is valid in (`new` and `accepted`), and the new state of the ticket when the action is taken (`accepted`).
The `accept.permissions` line specifies what permissions the user must have to use this action.
The `accept.operations` line specifies changes that will be made to the ticket in addition to the status change when this action is taken.  In this case, when a user clicks on `accept`, the ticket owner field is updated to the logged in user.  Multiple operations may be specified in a comma separated list.

The available operations are:
 - del_owner -- Clear the owner field.
 - set_owner -- Sets the owner to the selected or entered owner.
   - ''''actionname''''`.set_owner` may optionally be set to a comma delimited list or a single value.
 - set_owner_to_self -- Sets the owner to the logged in user.
 - del_resolution -- Clears the resolution field
 - set_resolution -- Sets the resolution to the selected value.
   - ''''actionname''''`.set_resolution` may optionally be set to a comma delimited list or a single value. Example:
     {{{
resolve_new = new -> closed
resolve_new.name = resolve
resolve_new.operations = set_resolution
resolve_new.permissions = TICKET_MODIFY
resolve_new.set_resolution = invalid,wontfix
     }}}
 - leave_status -- Displays "leave as <current status>" and makes no change to the ticket.
''''''Note:'''''' Specifying conflicting operations (such as `set_owner` and `del_owner`) has unspecified results.

{{{
resolve_accepted = accepted -> closed
resolve_accepted.name = resolve
resolve_accepted.permissions = TICKET_MODIFY
resolve_accepted.operations = set_resolution
}}}

In this example, we see the `.name` attribute used.  The action here is `resolve_accepted`, but it will be presented to the user as `resolve`.

For actions that should be available in all states, `*` may be used in place of the state.  The obvious example is the `leave` action:
{{{
leave = * -> *
leave.operations = leave_status
leave.default = 1
}}}
This also shows the use of the `.default` attribute.  This value is expected to be an integer, and the order in which the actions are displayed is determined by this value.  The action with the highest `.default` value is listed first, and is selected by default.  The rest of the actions are listed in order of decreasing `.default` values.
If not specified for an action, `.default` is 0.  The value may be negative.

There are a couple of hard-coded constraints to the workflow.  In particular, tickets are created with status `new`, and tickets are expected to have a `closed` state.  Further, the default reports/queries treat any state other than `closed` as an open state.

While creating or modifying a ticket workflow, `contrib/workflow/workflow_parser.py` may be useful.  It can create `.dot` files that [http://www.graphviz.org GraphViz] understands to provide a visual description of the workflow.

This can be done as follows (your install path may be different).
{{{
cd /var/local/trac_devel/contrib/workflow/
sudo ./showworkflow /srv/trac/PlannerSuite/conf/trac.ini
}}}
And then open up the resulting `trac.pdf` file created by the script (it will be in the same directory as the `trac.ini` file).

An online copy of the workflow parser is available at http://foss.wush.net/cgi-bin/visual-workflow.pl

After you have changed a workflow, you need to restart apache for the changes to take effect. This is important, because the changes will still show up when you run your script, but all the old workflow steps will still be there until the server is restarted.

== Example: Adding optional Testing with Workflow ==

By adding the following to your [ticket-workflow] section of trac.ini you get optional testing.  When the ticket is in new, accepted or needs_work status you can choose to submit it for testing.  When it''s in the testing status the user gets the option to reject it and send it back to needs_work, or pass the testing and send it along to closed.  If they accept it then it gets automatically marked as closed and the resolution is set to fixed.  Since all the old work flow remains, a ticket can skip this entire section.

{{{
testing = new,accepted,needs_work,assigned,reopened -> testing
testing.name = Submit to reporter for testing
testing.permissions = TICKET_MODIFY

reject = testing -> needs_work
reject.name = Failed testing, return to developer

pass = testing -> closed
pass.name = Passes Testing
pass.operations = set_resolution
pass.set_resolution = fixed
}}}

=== How to combine the `tracopt.ticket.commit_updater` with the testing workflow ===

The [[trac:source:trunk/tracopt/ticket/commit_updater.py|tracopt.ticket.commit_updater]] is the optional component that [[TracRepositoryAdmin#trac-post-commit-hook|replaces the old trac-post-commit-hook]], in Trac 0.12.

By default it reacts on some keywords found in changeset message logs like ''''close'''', ''''fix'''' etc. and performs the corresponding workflow action.

If you have a more complex workflow, like the testing stage described above and you want the ''''closes'''' keyword to move the ticket to the ''''testing'''' status instead of the ''''closed'''' status, you need to adapt the code a bit. 

Have a look at the [[trac:wiki:0.11/TracWorkflow#How-ToCombineSVNtrac-post-commit-hookWithTestWorkflow|Trac 0.11 recipe]] for the `trac-post-commit-hook`, this will give you some ideas about how to modify the component.

== Example: Add simple optional generic review state ==

Sometimes Trac is used in situations where "testing" can mean different things to different people so you may want to create an optional workflow state that is between the default workflow''s `assigned` and `closed` states, but does not impose implementation-specific details. The only new state you need to add for this is a `reviewing` state. A ticket may then be "submitted for review" from any state that it can be reassigned. If a review passes, you can re-use the `resolve` action to close the ticket, and if it fails you can re-use the `reassign` action to push it back into the normal workflow.

The new `reviewing` state along with its associated `review` action looks like this:

{{{
review = new,assigned,reopened -> reviewing
review.operations = set_owner
review.permissions = TICKET_MODIFY
}}}

Then, to integrate this with the default Trac 0.11 workflow, you also need to add the `reviewing` state to the `accept` and `resolve` actions, like so:

{{{
accept = new,reviewing -> assigned
[…]
resolve = new,assigned,reopened,reviewing -> closed
}}}

Optionally, you can also add a new action that allows you to change the ticket''s owner without moving the ticket out of the `reviewing` state. This enables you to reassign review work without pushing the ticket back to the `new` status.

{{{
reassign_reviewing = reviewing -> *
reassign_reviewing.name = reassign review
reassign_reviewing.operations = set_owner
reassign_reviewing.permissions = TICKET_MODIFY
}}}

The full `[ticket-workflow]` configuration will thus look like this:

{{{
[ticket-workflow]
accept = new,reviewing -> assigned
accept.operations = set_owner_to_self
accept.permissions = TICKET_MODIFY
leave = * -> *
leave.default = 1
leave.operations = leave_status
reassign = new,assigned,accepted,reopened -> assigned
reassign.operations = set_owner
reassign.permissions = TICKET_MODIFY
reopen = closed -> reopened
reopen.operations = del_resolution
reopen.permissions = TICKET_CREATE
resolve = new,assigned,reopened,reviewing -> closed
resolve.operations = set_resolution
resolve.permissions = TICKET_MODIFY
review = new,assigned,reopened -> reviewing
review.operations = set_owner
review.permissions = TICKET_MODIFY
reassign_reviewing = reviewing -> *
reassign_reviewing.operations = set_owner
reassign_reviewing.name = reassign review
reassign_reviewing.permissions = TICKET_MODIFY
}}}

== Example: Limit the resolution options for a new ticket ==

The above resolve_new operation allows you to set the possible resolutions for a new ticket.  By modifying the existing resolve action and removing the new status from before the `->` we then get two resolve actions.  One with limited resolutions for new tickets, and then the regular one once a ticket is accepted.

{{{
resolve_new = new -> closed
resolve_new.name = resolve
resolve_new.operations = set_resolution
resolve_new.permissions = TICKET_MODIFY
resolve_new.set_resolution = invalid,wontfix,duplicate

resolve = assigned,accepted,reopened -> closed
resolve.operations = set_resolution
resolve.permissions = TICKET_MODIFY
}}}

== Advanced Ticket Workflow Customization ==

If the customization above is not extensive enough for your needs, you can extend the workflow using plugins.  These plugins can provide additional operations for the workflow (like code_review), or implement side-effects for an action (such as triggering a build) that may not be merely simple state changes.  Look at [trac:source:trunk/sample-plugins/workflow sample-plugins/workflow] for a few simple examples to get started.

But if even that is not enough, you can disable the !ConfigurableTicketWorkflow component and create a plugin that completely replaces it.

== Adding Workflow States to Milestone Progress Bars ==

If you add additional states to your workflow, you may want to customize your milestone progress bars as well.  See [TracIni#milestone-groups-section TracIni].

== some ideas for next steps ==

New enhancement ideas for the workflow system should be filed as enhancement tickets against the `ticket system` component.  If desired, add a single-line link to that ticket here.  Also look at the [http://trac-hacks.org/wiki/AdvancedTicketWorkflowPlugin AdvancedTicketWorkflowPlugin] as it provides experimental operations.

If you have a response to the comments below, create an enhancement ticket, and replace the description below with a link to the ticket.

 * the "operation" could be on the nodes, possible operations are:
   * ''''''preops'''''': automatic, before entering the state/activity
   * ''''''postops'''''': automatic, when leaving the state/activity
   * ''''''actions'''''': can be chosen by the owner in the list at the bottom, and/or drop-down/pop-up together with the default actions of leaving the node on one of the arrows.
''''This appears to add complexity without adding functionality; please provide a detailed example where these additions allow something currently impossible to implement.''''

 * operations could be anything: sum up the time used for the activity, or just write some statistical fields like 
''''A workflow plugin can add an arbitrary workflow operation, so this is already possible.''''

 * set_actor should be an operation allowing to set the owner, e.g. as a "preop":
   * either to a role, a person
   * entered fix at define time, or at run time, e.g. out of a field, or select.
''''This is either duplicating the existing `set_owner` operation, or needs to be clarified.''''

 * Actions should be selectable based on the ticket type (different Workflows for different tickets)
''''Look into the [http://trac-hacks.org/wiki/AdvancedTicketWorkflowPlugin AdvancedTicketWorkflowPlugin]''s `triage` operation.''''

 * I''d wish to have an option to perform automatic status changes. In my case, I do not want to start with "new", but with "assigned". So tickets in state "new" should automatically go into state "assigned". Or is there already a way to do this and I just missed it?
''''Have a look at [http://trac-hacks.org/wiki/TicketCreationStatusPlugin TicketCreationStatusPlugin] and [http://trac-hacks.org/wiki/TicketConditionalCreationStatusPlugin TicketConditionalCreationStatusPlugin]''''

 * I added a ''testing'' state. A tester can close the ticket or reject it. I''d like the transition from testing to rejected to set the owner to the person that put the ticket in ''testing''. The [http://trac-hacks.org/wiki/AdvancedTicketWorkflowPlugin AdvancedTicketWorkflowPlugin] is close with set_owner_to_field, but we need something like set_field_to_owner.

 * I''d like to track the time a ticket is in each state, adding up ''disjoints'' intervals in the same state.
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiDeletePage', 1, 1519728656664634, 'trac', '127.0.0.1', '= Deleting a Wiki Page =

Existing wiki pages can be completely deleted using the ''''Delete Page'''' or the ''''Delete this Version'''' buttons at the bottom of the wiki page. These buttons are only visible for users with `WIKI_DELETE` permissions.

''''''Note:'''''' Deleting a wiki page is an irreversible operation.

If you want to delete a page because you actually re-created a new page with the same content but a different name, it is recommended to keep the page and use it as a redirection page instead of completely deleting it, as to not frustrate the visitor with broken links when coming to the site from a search engine. 

In this situation, chances are that you actually wanted to [[WikiNewPage#renaming|rename]] the page instead of doing a copy + delete. 
The ''''Rename'''' operation also offers you the possibility to create a redirection page.
A redirection page is a short page that  contains a link such as  “See !SomeOtherPage”. 

However, deleting specific versions or even complete pages can make sense to remove spam or other abusive submissions.

----
See also: TracWiki, TracPermissions
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiFormatting', 1, 1519728656667456, 'trac', '127.0.0.1', '= WikiFormatting =
[[TracGuideToc]]

Wiki markup is a core feature in Trac, tightly integrating all the other parts of Trac into a flexible and powerful whole.

Trac has a built in small and powerful wiki rendering engine. This wiki engine implements an ever growing subset of the commands from other popular Wikis,
especially [http://moinmo.in/ MoinMoin] and [trac:WikiCreole].


This page will give you an in-depth explanation of the wiki markup available anywhere WikiFormatting is allowed.

The ''''Cheat sheet'''' below gives you a quick overview for the most common syntax, each link in the ''''Category'''' column will lead you to the more detailed explanation later in this page.

A few other wiki pages present the advanced features of the Trac wiki markup in more depth: 
 - TracLinks covers all the possible ways to refer precisely to any Trac resource or parts thereof,
 - WikiPageNames talks about the various names a wiki page can take, CamelCase or not
 - WikiMacros lists the macros available for generating dynamic content,
 - WikiProcessors and WikiHtml details how parts of the wiki text can be processed in special ways


== Cheat sheet ==

||= ''''''Category'''''' =||= ''''''Wiki Markup'''''' =||= ''''''Display'''''' =||
|-----------------------------------------------------------
{{{#!th rowspan=3
[#FontStyles Font Styles]
}}}
|| `''''''bold''''''`, `''''italic''''`, `''''''''''Wikipedia style''''''''''` || \
|| ''''''bold'''''', ''''italic'''', ''''''''''Wikipedia style'''''''''' ||
|| {{{`monospaced (''''other markup ignored'''')`}}} || \
|| `monospaced (''''other markup ignored'''')` ||
|| `**bold**`, `//italic//`, `**//!WikiCreole style//**` || \
|| **bold**, //italic//, **//!WikiCreole style//** ||
|-----------------------------------------------------------
||= [#Headings Headings] =||\
{{{#!td 
 {{{
 == Level 2 ==
 === Level 3 ^([#hn note])^
 }}}
}}}
{{{#!td style="padding-left: 2em"
== Level 2 ==
=== Level 3 ^([#hn note])^
}}}
|-----------------------------------------------------------
||= [#Paragraphs Paragraphs]  =||\
{{{#!td
 {{{
 First paragraph
 on multiple lines.

 Second paragraph.
 }}}
}}}
{{{#!td
First paragraph
on multiple lines.

Second paragraph.
}}}
|-----------------------------------------------------------
||= [#Lists Lists] =||\
{{{#!td
 {{{
 * bullets list
   on multiple lines
   1. nested list
     a. different numbering 
        styles
 }}}
}}}
{{{#!td
* bullets list
  on multiple lines
  1. nested list
    a. different numbering
       styles
}}}
|-----------------------------------------------------------
{{{#!th
[#DefinitionLists Definition Lists]
}}}
{{{#!td
 {{{
  term:: definition on
         multiple lines
 }}}
}}}
{{{#!td
 term:: definition on
        multiple lines
}}}
|-----------------------------------------------------------
||= [#PreformattedText Preformatted Text] =||\
{{{#!td
 {{{
 {{{
 multiple lines, ''''no wiki''''
       white space respected
 }}}
 }}}
}}}
{{{#!td
 {{{
 multiple lines, ''''no wiki''''
       white space respected
 }}}
}}}
|-----------------------------------------------------------
||= [#Blockquotes Blockquotes] =||\
{{{#!td
 {{{
   if there''s some leading
   space the text is quoted
 }}}
}}}
{{{#!td
 if there''s some leading
 space the text is quoted
}}}
|-----------------------------------------------------------
||= [#DiscussionCitations Discussion Citations] =||\
{{{#!td
 {{{
 >> ... (I said)
 > (he replied)
 }}}
}}}
{{{#!td
>>... (I said)
> (he replied)
}}}
|-----------------------------------------------------------
||= [#Tables Tables] =||\
{{{#!td
 {{{
 ||= Table Header =|| Cell ||
 ||||  (details below)  ||
 }}}
}}}
{{{#!td
||= Table Header =|| Cell ||
||||  (details below)  ||
}}}
|-----------------------------------------------------------
{{{#!th rowspan=2
[#Links Links]
}}}
|| `http://trac.edgewall.org` ||\
|| http://trac.edgewall.org ||
|| `WikiFormatting (CamelCase)` ||\
|| WikiFormatting (CamelCase) ||
|-----------------------------------------------------------
{{{#!th rowspan=5
[#TracLinks TracLinks]
}}}
|| `wiki:WikiFormatting`, `wiki:"WikiFormatting"` ||\
|| wiki:WikiFormatting, wiki:"WikiFormatting" ||
|| `#1 (ticket)`, `[1] (changeset)`, `{1} (report)` ||\
|| #1 (ticket), [1] (changeset), {1} (report) ||
|| `ticket:1, ticket:1#comment:1` ||\
|| ticket:1, ticket:1#comment:1 ||
|| `Ticket [ticket:1]`, `[ticket:1 ticket one]` ||\
|| Ticket [ticket:1], [ticket:1 ticket one] ||
|| `Ticket [[ticket:1]]`, `[[ticket:1|ticket one]]` ||\
|| Ticket [[ticket:1]], [[ticket:1|ticket one]] ||
|-----------------------------------------------------------
{{{#!th rowspan=2 
[#SettingAnchors Setting Anchors]
}}}
|| `[=#point1 (1)] First...` ||\
|| [=#point1 (1)] First... ||
|| `see [#point1 (1)]` ||\
|| see [#point1 (1)] ||
|-----------------------------------------------------------
{{{#!th rowspan=3
[#Escaping Escaping Markup]
}}}
|| `!'''' doubled quotes` ||\
|| !'''' doubled quotes ||
|| `!wiki:WikiFormatting`, `!WikiFormatting` ||\
|| !wiki:WikiFormatting, !WikiFormatting ||
|| {{{`}}}`{{{-}}}`{{{`}}}` triple curly brackets` ||\
|| `{{{-}}}` triple curly brackets ||
|-----------------------------------------------------------
||= [#Images Images] =|| `[[Image(`''''link''''`)]]` || [[Image(htdocs:../common/trac_logo_mini.png)]] ||
|-----------------------------------------------------------
{{{#!th rowspan=2
[#Macros Macros]
}}}
|| `[[MacroList(*)]]` ||  ''''(short list of all available macros)''''  ||
|| `[[Image?]]` ||  ''''(help for the Image macro)''''  ||
|-----------------------------------------------------------
||= [#Processors Processors] =||\
{{{#!td
 {{{
 {{{
 #!div style="font-size: 80%"
 Code highlighting:
   {{{#!python
   hello = lambda: "world"
   }}}
 }}}
 }}}
}}}
{{{#!td style="padding-left: 2em"
 {{{
 #!div style="font-size: 80%"
 Code highlighting:
   {{{#!python 
   hello = lambda: "world"
   }}}
 }}}
}}}
|-----------------------------------------------------------
||= [#Comments Comments] =||\
{{{#!td
 {{{
 {{{#!comment
 Note to Editors: ...
 }}}
 }}}
}}}
{{{#!td style="padding-left: 2em"
 {{{#!comment
 Note to Editors: ...
 }}}
}}}
|-----------------------------------------------------------
||= [#Miscellaneous Miscellaneous] =||\
{{{#!td
 {{{
 Line [[br]] break 
 Line \\ break
 ----
 }}}
}}}
{{{#!td style="padding-left: 2em"
Line [[br]] break
Line \\ break
----
}}}


== Font Styles ==

The Trac wiki supports the following font styles:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   * ''''''bold'''''', 
     '''''' triple quotes !'''''' 
     can be bold too if prefixed by ! '''''', 
   * ''''italic''''
   * ''''''''''bold italic'''''''''' or ''''italic and
     '''''' italic bold '''''' ''''
   * __underline__
   * {{{monospace}}} or `monospace`
     (hence `{{{` or {{{`}}} quoting)
   * ~~strike-through~~
   * ^superscript^ 
   * ,,subscript,,
   * **also bold**, //italic as well//, 
     and **'''' bold italic **'''' //(since 0.12)//
  }}}
}}}
{{{#!td
 * ''''''bold'''''', 
   '''''' triple quotes !'''''' 
   can be bold too if prefixed by ! '''''', 
 * ''''italic''''
 * ''''''''''bold italic'''''''''' or ''''italic and
   '''''' italic bold '''''' ''''
 * __underline__
 * {{{monospace}}} or `monospace`
   (hence `{{{` or {{{`}}} quoting)
 * ~~strike-through~~
 * ^superscript^ 
 * ,,subscript,,
 * **also bold**, //italic as well//, 
   and **'''' bold italic **'''' //(since 0.12)//
}}}

Notes:
 * `{{{...}}}` and {{{`...`}}} commands not only select a monospace font, but also treat their content as verbatim text, meaning that no further wiki processing is done on this text.
 * {{{ ! }}} tells wiki parser to not take the following characters as wiki format, so pay attention to put a space after !, e.g. when ending bold.
 * all the font styles marks have to be used in opening/closing pairs, 
   and they must nest properly (in particular, an `''''` italic can''t be paired 
   with a `//` one, and `''''''` can''t be paired with `**`)


== Headings ==

You can create heading by starting a line with one up to six ''''equal'''' characters ("=")
followed by a single space and the headline text. 

[=#hn]
The headline text can be followed by the same number of "=" characters, but this is no longer mandatory.

Finally, the heading might optionally be followed by an explicit id. If not, an implicit but nevertheless readable id will be generated.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  = Heading =
  == Subheading
  === About ''''this'''' ===
  === Explicit id === #using-explicit-id-in-heading
  == Subheading #sub2
}}}
}}}
{{{#!td style="padding: 1em;"
  {{{
  #!div
  = Heading =
  == Subheading
  === About ''''this'''' ===
  === Explicit id === #using-explicit-id-in-heading
  == Subheading #sub2
  }}}
}}}

== Paragraphs ==

A new text paragraph is created whenever two blocks of text are separated by one or more empty lines.

A forced line break can also be inserted, using:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  Line 1[[BR]]Line 2
  }}}
  {{{
  Paragraph
  one

  Paragraph 
  two
  }}}
}}}
{{{#!td
  Line 1[[BR]]Line 2

  Paragraph 
  one

  Paragraph 
  two
}}}

== Lists ==

The wiki supports both ordered/numbered and unordered lists.

Example:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   * Item 1
     * Item 1.1
        * Item 1.1.1   
        * Item 1.1.2
        * Item 1.1.3
     * Item 1.2
   * Item 2
  - items can start at the beginning of a line
    and they can span multiple lines
    - be careful though to continue the line 
    with the appropriate indentation, otherwise
  that will start a new paragraph...
  
   1. Item 1
     a. Item 1.a
     a. Item 1.b
        i. Item 1.b.i
        i. Item 1.b.ii
   1. Item 2
  And numbered lists can also be restarted
  with an explicit number:
   3. Item 3
  }}}
}}}
{{{#!td
 * Item 1
   * Item 1.1
      * Item 1.1.1   
      * Item 1.1.2
      * Item 1.1.3
   * Item 1.2
 * Item 2
- items can start at the beginning of a line
  and they can span multiple lines
  - be careful though to continue the line 
  with the appropriate indentation, otherwise
that will start a new paragraph...

 1. Item 1
   a. Item 1.a
   a. Item 1.b
      i. Item 1.b.i
      i. Item 1.b.ii
 1. Item 2
And numbered lists can also be restarted with an explicit number:
 3. Item 3
}}}


== Definition Lists ==

The wiki also supports definition lists.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   llama::
     some kind of mammal, with hair
   ppython::
     some kind of reptile, without hair
     (can you spot the typo?)
  }}}
}}}
{{{#!td
 llama::
   some kind of mammal, with hair
 ppython::
   some kind of reptile, without hair
   (can you spot the typo?)
}}}

Note that you need a space in front of the defined term.


== Preformatted Text ==

Block containing preformatted text are suitable for source code snippets, notes and examples. Use three ''''curly braces'''' wrapped around the text to define a block quote. The curly braces need to be on a separate line.
  
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  {{{
  def HelloWorld():
      print ''''''Hello World''''''
  }}}
  }}}
}}}
{{{#!td
  {{{
  def HelloWorld():
      print ''''''Hello World''''''
  }}}
}}}

Note that this kind of block is also used for selecting lines that should be processed through WikiProcessors.

== Blockquotes ==

In order to mark a paragraph as blockquote, indent that paragraph with two spaces.

||= Wiki Markup =||= Display =||
{{{#!td
{{{
Paragraph
  This text is a quote from someone else.
}}}
}}}
{{{#!td
Paragraph
  This text is a quote from someone else.
}}}

== Discussion Citations ==

To delineate a citation in an ongoing discussion thread, such as the ticket comment area, e-mail-like citation marks (">", ">>", etc.) may be used.  

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  >> Someone''s original text
  > Someone else''s reply text
  >  - which can be any kind of Wiki markup
  My reply text
  }}}
}}}
{{{#!td
>> Someone''s original text
> Someone else''s reply text
>  - which can be any kind of Wiki markup
My reply text
}}}


== Tables ==
=== Simple Tables ===
Simple tables can be created like this:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  ||Cell 1||Cell 2||Cell 3||
  ||Cell 4||Cell 5||Cell 6||
  }}}
}}}
{{{#!td style="padding: 2em;"
||Cell 1||Cell 2||Cell 3||
||Cell 4||Cell 5||Cell 6||
}}}

Cell headings can be specified by wrapping the content in a pair of ''='' characters.
Note that the ''='' characters have to stick to the cell separators, like this:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  ||        ||= stable =||= latest =||
  ||= 0.10 =||  0.10.5  || 0.10.6dev||
  ||= 0.11 =||  0.11.6  || 0.11.7dev||
  }}}
}}}
{{{#!td style="padding: 2em;"
||        ||= stable =||= latest =||
||= 0.10 =||  0.10.5  || 0.10.6dev||
||= 0.11 =||  0.11.6  || 0.11.7dev||
}}}

Finally, specifying an empty cell means that the next non empty cell will span the empty cells. For example:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  || 1 || 2 || 3 ||
  |||| 1-2 || 3 ||
  || 1 |||| 2-3 ||
  |||||| 1-2-3 ||
  }}}
}}}
{{{#!td style="padding: 2em;"
|| 1 || 2 || 3 ||
|||| 1-2 || 3 ||
|| 1 |||| 2-3 ||
|||||| 1-2-3 ||
}}}

Note that if the content of a cell "sticks" to one side of the cell and only one, then the text will be aligned on that side. Example:
||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  ||=Text =||= Numbers =||
  ||left align    ||        1.0||
  ||  center      ||        4.5||
  ||      right align||     4.5||
  || default alignment ||   2.5||
  ||default||         2.5||
  ||  default ||      2.5||
  || default ||       2.5||
  }}}
}}}
{{{#!td style="padding: 2em;"
||=Text =||= Numbers =||
||left align    ||        1.0||
||  center      ||        4.5||
||      right align||     4.5||
|| default alignment ||   2.5||
||default||         2.5||
||  default ||      2.5||
|| default ||       2.5||
}}}

If contrary to the example above, the cells in your table contain more text, it might be convenient to spread a table row over multiple lines of markup. The `\` character placed at the end of a line after a cell separator tells Trac to not start a new row for the cells on the next line.

||= Wiki Markup =||
{{{#!td
  {{{
  || this is column 1 [http://trac.edgewall.org/newticket new ticket] || \
  || this is column 2 [http://trac.edgewall.org/roadmap the road ahead] || \
  || that''s column 3 and last one ||
  }}}
}}}
|-------------
||= Display =||
{{{#!td style="padding: 2em;"
|| this is column 1 [http://trac.edgewall.org/newticket new ticket] || \
|| this is column 2 [http://trac.edgewall.org/roadmap the road ahead] || \
|| that''s column 3 and last one ||
}}}

=== Complex Tables ===

If the possibilities offered by the simple "pipe"-based markup for tables described above are not enough for your needs, you can create more elaborated tables by using [#Processors-example-tables WikiProcessor based tables].


== Links ==

Hyperlinks are automatically created for WikiPageNames and URLs. !WikiPageLinks can be disabled by prepending an exclamation mark "!" character, such as {{{!WikiPageLink}}}.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  TitleIndex, http://www.edgewall.com/, !NotAlink
  }}}
}}}
{{{#!td
TitleIndex, http://www.edgewall.com/, !NotAlink
}}}

Links can be given a more descriptive title by writing the link followed by a space and a title and all this inside square brackets. 
If the descriptive title is omitted, then the explicit prefix is discarded, unless the link is an external link. This can be useful for wiki pages not adhering to the WikiPageNames convention.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   * [http://www.edgewall.com Edgewall Software]
   * [wiki:TitleIndex Title Index] 
   * [wiki:TitleIndex] 
   * [wiki:ISO9000]
  }}}
}}}
{{{#!td
   * [http://www.edgewall.com Edgewall Software]
   * [wiki:TitleIndex Title Index] 
   * [wiki:TitleIndex] 
   * [wiki:ISO9000]
}}}

Following the [trac:WikiCreole] trend, the descriptive title can also be specified by writing the link followed by a pipe (''|'') and a title and all this inside //double// square brackets. 

{{{#!td
  {{{
   * [[http://www.edgewall.com|Edgewall Software]]
   * [[wiki:TitleIndex|Title Index]]
     or even [[TitleIndex|Title Index]]
   * [[wiki:TitleIndex]]
     '''''' but not ![[TitleIndex]]! ''''''
   * [[ISO9000]]
  }}}
}}}
{{{#!td
   * [[http://www.edgewall.com|Edgewall Software]]
   * [[wiki:TitleIndex|Title Index]]
     or even [[TitleIndex|Title Index]]
   * [[wiki:TitleIndex]]
     '''''' but not ![[TitleIndex]]! ''''''
   * [[ISO9000]]
}}}

''''''Note'''''': the [trac:WikiCreole] style for links is quick to type and
certainly looks familiar as it''s the one used on Wikipedia and in many
other wikis. Unfortunately it conflicts with the syntax for [#Macros macros].
So in the rare case when you need to refer to a page which is named after
a macro (typical examples being TitleIndex, InterTrac and InterWiki), 
by writing `[[TitleIndex]]` you will actually call the macro instead of linking
to the page.

== Trac Links ==

Wiki pages can link directly to other parts of the Trac system. Pages can refer to tickets, reports, changesets, milestones, source files and other Wiki pages using the following notations:

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   * Tickets: #1 or ticket:1
   * Reports: {1} or report:1
   * Changesets: r1, [1] or changeset:1
   * ...
   * targeting other Trac instances, 
     so called InterTrac links:
     - Tickets: #Trac1 or Trac:ticket:1
     - Changesets: [Trac1] or Trac:changeset:1
  }}}
}}}
{{{#!td
 * Tickets: #1 or ticket:1
 * Reports: {1} or report:1
 * Changesets: r1, [1] or changeset:1
 * ... 
 * targeting other Trac instances, 
   so called InterTrac links:
   - Tickets: #Trac1 or Trac:ticket:1
   - Changesets: [Trac1] or Trac:changeset:1
}}}

There are many more flavors of Trac links, see TracLinks for more in-depth information and a reference for all the default link resolvers.


== Setting Anchors ==

An anchor, or more correctly speaking, an [http://www.w3.org/TR/REC-html40/struct/links.html#h-12.2.1 anchor name] can be added explicitly at any place in the Wiki page, in order to uniquely identify a position in the document:

{{{
[=#point1]
}}}

This syntax was chosen to match the format for explicitly naming the header id [#Headings documented above]. For example:
{{{
== Long title == #title
}}}

It''s also very close to the syntax for the corresponding link to that anchor:
{{{
[#point1]
}}}

Optionally, a label can be given to the anchor:
{{{
[[=#point1 ''''''Point 1'''''']]
}}}

||= Wiki Markup =||= Display =||
|----------------------------------
{{{#!td
  {{{
  [#point2 jump to the second point]

  ...

  Point2:  [=#point2] Jump here
  }}}
}}}
{{{#!td
  [#point2 jump to the second point]

  ...

  Point2:  [=#point2] Jump here
}}}

For more complex anchors (e.g. when a custom title is wanted), one can use the Span macro, e.g. `[[span(id=point2, class=wikianchor, title=Point 2, ^(2)^)]]`.


== Escaping Links, WikiPageNames and other Markup == #Escaping

You may avoid making hyperlinks out of TracLinks by preceding an expression with a single "!" (exclamation mark).

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
   !NoHyperLink
   !#42 is not a link
  }}}
  {{{
Various forms of escaping for list markup:
 `-` escaped minus sign \\
 ``1. escaped number  \\
 {{{*}}} escaped asterisk sign
  }}}
}}}
{{{#!td
 !NoHyperLink
 !#42 is not a link

Various forms of escaping for list markup:
 `-` escaped minus sign \\
 ``1. escaped number  \\
 {{{*}}} escaped asterisk sign
}}}

== Images ==

Urls ending with `.png`, `.gif` or `.jpg` are no longer automatically interpreted as image links, and converted to `<img>` tags.

You now have to use the ![[Image]] macro. The simplest way to include an image is to upload it as attachment to the current page, and put the filename in a macro call like `[[Image(picture.gif)]]`.

In addition to the current page, it is possible to refer to other resources:
 * `[[Image(wiki:WikiFormatting:picture.gif)]]` (referring to attachment on another page)
 * `[[Image(ticket:1:picture.gif)]]` (file attached to a ticket)
 * `[[Image(htdocs:picture.gif)]]` (referring to a file inside the [TracEnvironment environment] `htdocs` directory)
 * `[[Image(source:/trunk/trac/htdocs/trac_logo_mini.png)]]` (a file in repository)

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  [[Image(htdocs:../common/trac_logo_mini.png)]]
  }}}
}}}
{{{#!td
[[Image(htdocs:../common/trac_logo_mini.png)]]
}}}

See WikiMacros for further documentation on the `[[Image()]]` macro, which has several useful options (`title=`, `link=`, etc.)


== Macros ==

Macros are ''''custom functions'''' to insert dynamic content in a page.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  [[RecentChanges(Trac,3)]]
  }}}
}}}
{{{#!td style="padding-left: 2em"
[[RecentChanges(Trac,3)]]
}}}

See WikiMacros for more information, and a list of installed macros.

The detailed help for a specific macro can also be obtained more directly by appending a "?" to the macro name.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  [[MacroList?]]
  }}}
}}}
{{{#!td style="padding-left: 2em"
[[MacroList?]]
}}}


== Processors ==

Trac supports alternative markup formats using WikiProcessors. For example, processors are used to write pages in 
[wiki:WikiRestructuredText reStructuredText] or [wiki:WikiHtml HTML]. 

||= Wiki Markup =||= Display =||
|--------------------------------------------------------
{{{#!td align="center" colspan=2 style="border: 0px; font-size: 90%"

   [=#Processors-example-html Example 1:] HTML

}}}
|--------------------------------------------------------
{{{#!td style="border: 0px"
  {{{
  {{{
  #!html
  <h1 style="text-align: right; color: blue">
   HTML Test
  </h1>
  }}}
  }}}
}}}
{{{#!td valign="top"  style="border: 0px"

{{{
#!html
<h1 style="text-align: right; color: blue">HTML Test</h1>
}}}

}}}
|--------------------------------------------------------
{{{#!td align="center" colspan=2 style="border: 0px; font-size: 90%"

   [=#Processors-example-highlight Example 2:] Code Highlighting

}}}
|--------------------------------------------------------
{{{#!td style="border: 0px"
  {{{
  {{{
  #!python
  class Test:
  
      def __init__(self):
          print "Hello World"
  if __name__ == ''__main__'':
     Test()
  }}}
  }}}
}}}
{{{
#!td valign="top"  style="border: 0px"

{{{
#!python
class Test:
    def __init__(self):
        print "Hello World"
if __name__ == ''__main__'':
   Test()
}}}

}}}
|--------------------------------------------------------
{{{#!td align="center" colspan=2 style="border: 0px; font-size: 90%"

       [=#Processors-example-tables Example 3:] Complex Tables

}}}
|--------------------------------------------------------
{{{#!td style="border: 0px"
  {{{
  {{{#!th rowspan=4 align=justify
  With the `#td` and `#th` processors,
  table cells can contain any content:
  }}}
  |----------------
  {{{#!td
    - lists
    - embedded tables
    - simple multiline content
  }}}
  |----------------
  {{{#!td
  As processors can be easily nested, 
  so can be tables:
    {{{#!th
    Example:
    }}}
    {{{#!td style="background: #eef"
    || must be at the third level now... ||
    }}}
  }}}
  |----------------
  {{{#!td
  Even when you don''t have complex markup,
  this form of table cells can be convenient
  to write content on multiple lines.
  }}}
  }}}
}}}
{{{
#!td  valign="top"  style="border: 0px"

  {{{#!th rowspan=4 align=justify
  With the `#td` and `#th` processors,
  table cells can contain any content:
  }}}
  |----------------
  {{{#!td
    - lists
    - embedded tables
    - simple multiline content
  }}}
  |----------------
  {{{#!td
  As processors can be easily nested, 
  so can be tables:
    {{{#!th
    Example:
    }}}
    {{{#!td style="background: #eef"
    || must be at the third level now... ||
    }}}
  }}}
  |----------------
  {{{#!td
  Even when you don''t have complex markup,
  this form of table cells can be convenient
  to write content on multiple lines.
  }}}

}}}

See WikiProcessors for more information.


== Comments ==

Comments can be added to the plain text. These will not be rendered and will not display in any other format than plain text.

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  Nothing to
  {{{
  #!comment
  Your comment for editors here
  }}}
  see ;-)
  }}}
}}}
{{{#!td
  Nothing to
  {{{
  #!comment
  Your comment for editors here
  }}}
  see ;-)
}}}

== Miscellaneous ==

An horizontal line can be used to separated different parts of your page:

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  Four or more dashes will be replaced 
  by an horizontal line (<HR>)
  ----
  See?
  }}}
}}}
{{{#!td
Four or more dashes will be replaced
by an horizontal line (<HR>)
----
See?
}}}
|----------------------------------
{{{#!td
  {{{
  "macro" style [[br]] line break
  }}}
}}}
{{{#!td
"macro" style [[br]] line break
}}}
|----------------------------------
{{{#!td
  {{{
  !WikiCreole style \\ line\\break
  }}}
}}}
{{{#!td
!WikiCreole style \\ line\\break
}}}

', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiHtml', 1, 1519728656671416, 'trac', '127.0.0.1', '= Using HTML in Wiki Text =

Trac supports inserting HTML into any wiki context, accomplished using the `#!html` [wiki:WikiProcessors WikiProcessor]. 

However a constraint is that this HTML has to be well-formed.
In particular you can''t insert a start tag in an `#!html` block,
resume normal wiki text and insert the corresponding end tag in a 
second `#!html` block. 

Fortunately, for creating styled <div>s, <span>s  or even complex tables
containing arbitrary Wiki text, there''s a powerful alternative: use of
dedicated `#!div`, `#!span` and `#!table`, `#!tr`, `#!td` and `#!th` blocks.

Those Wiki processors are built-in, and does not require installing any additional packages.

== How to use `#!html` == #HowtoUseHTML
To inform the wiki engine that a block of text should be treated as HTML, use the ''''html'''' processor. 

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  {{{
  #!html
  <h1 style="text-align: right; color: blue">HTML Test</h1>
  }}}
  }}}
}}}
{{{#!td style="padding-left: 2em"
  {{{
  #!html
  <h1 style="text-align: right; color: blue">HTML Test</h1>
  }}}
}}}

Note that Trac sanitizes your HTML code before displaying it. That means that if you try to use potentially dangerous constructs such as Javascript event handlers, those will be removed from the output. 

Since 0.11, the filtering is done by Genshi, and as such, the produced output will be a well-formed fragment of HTML. As noted above in the introduction, this mean that you can no longer use two HTML blocks, one for opening a <div>, the second for closing it, in order to wrap arbitrary wiki text.
The new way to wrap any wiki content inside a <div> is to use the `#!div` Wiki  processor.

== How to use `#!div` and `#!span` == #HowtoUseDivSpan

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  {{{
  #!div class="important" 
  **important** is a predefined class.
  }}}
  }}}
  {{{
  {{{
  #!div style="border: 1pt dotted; margin: 1em"
  **wikipage** is another predefined class that will 
  be used when no class is specified.
  }}}
  }}}
  {{{
  {{{
  #!div class="compact" style="border: 1pt dotted; margin: 1em"
  **compact** is another predefined class reducing
  the padding within the `<div>` to a minimum.
  }}}
  }}}
  {{{
  {{{
  #!div class="wikipage compact" style="border: 1pt dotted"
  Classes can be combined (here **wikipage** and **compact**)
  which results in this case in reduced //vertical// 
  padding but there''s still some horizontal space for coping
  with headings.
  }}}
  }}}
  {{{
  {{{
  #!div class="" style="border: 1pt dotted; margin: 1em"
  Explicitly specifying no classes is //not// the same
  as specifying no class attribute, as this will remove
  the //wikipage// default class.
  }}}
  }}}
}}}
{{{#!td style="padding-left: 2em"

  {{{
  #!div class="important" 
  **important** is a predefined class.
  }}}

  {{{
  #!div style="border: 1pt dotted; margin: 1em"
  **wikipage** is another predefined class that will 
  be used when no class is specified.
  }}}

  {{{
  #!div class="compact" style="border: 1pt dotted; margin: 1em"
  **compact** is another predefined class reducing
  the padding within the `<div>` to a minimum.
  }}}

  {{{
  #!div class="wikipage compact" style="border: 1pt dotted"
  Classes can be combined (here **wikipage** and **compact**)
  which results in this case in reduced //vertical// 
  padding but there''s still some horizontal space for coping
  with headings.
  }}}

  {{{
  #!div class="" style="border: 1pt dotted; margin: 1em"
  Explicitly specifying no classes is //not// the same
  as specifying no class attribute, as this will remove
  the //wikipage// default class.
  }}}

}}}

Note that the contents of a `#!div` block are contained in one or more paragraphs, which have a non-zero top and bottom margin. This leads to the top and bottom padding in the example above. To remove the top and bottom margin of the contents, add the `compact` class to the `#!div`. Another predefined class besides `wikipage` and `compact` is `important`, which can be used to make a paragraph stand out. Extra CSS classes can be defined via the `site/style.css` file for example, see TracInterfaceCustomization#SiteAppearance.

For spans, you should rather use the Macro call syntax:
||= Wiki Markup =||
{{{#!td
  {{{
  Hello 
  [[span(''''WORLD'''' (click [#anchor here]), style=color: green; font-size: 120%, id=anchor)]]!
  }}}
}}}
|---------------------------------------------------------------------------------
||= Display =||
{{{#!td style="padding-left: 2em"
  Hello
  [[span(''''WORLD'''' (click [#anchor here]), style=color: green; font-size: 120%, id=anchor)]]!
}}}

== How to use `#!td` and other table related processors == #Tables

`#!td` or `#!th` processors are actually the main ones, for creating table data and header cells, respectively. The other processors `#!table` and `#!tr` are not required for introducing a table structure, as `#!td` and `#!th` will do this automatically. The `|-` row separator can be used to start a new row when needed, but some may prefer to use a `#!tr` block for that, as this introduces a more formal grouping and offers the possibility to use an extra level of indentation. The main purpose of the `#!table` and `#!tr` is to give the possibility to specify HTML attributes, like ''''style'''' or ''''valign'''' to these elements.

||= Wiki Markup =||= Display =||
{{{#!td
 {{{
 Simple 2x2 table with rich content:
 {{{#!th align=left
  - Left
  - Header
 }}}
 {{{#!th align=left
  - Right
  - Header
 }}}
 |----------------------------------
 {{{#!td style="background: #ffd"
  - Left
  - Content
 }}}
 {{{#!td style="vertical-align: top"
 !RightContent
 }}}
 |----------------------------------
 || ... and this can be mixed||\
 ||with pipe-based cells ||
 {{{#!td colspan=2
 Pick the style the more appropriate
 to your content
 
 See WikiFormatting#Tables for details
 on the pipe-based table syntax.
 }}}
 
 If one needs to add some 
 attributes to the table itself...
 
 {{{
 #!table style="border:none;text-align:center;margin:auto"
   {{{#!tr ====================================
     {{{#!th style="border: none"
     Left header
     }}}
     {{{#!th style="border: none"
     Right header
     }}}
   }}}
   {{{#!tr ==== style="border: 1px dotted grey"
     {{{#!td style="border: none"
     1.1
     }}}
     {{{#!td style="border: none"
     1.2
     }}}
   }}}
   {{{#!tr ====================================
     {{{#!td style="border: none"
     2.1
     }}}
     {{{#!td
     2.2
     }}}
   }}}
 }}}


 }}}
}}}
{{{#!td valign=top
Simple 2x2 table with rich content:
{{{#!th align=left
 - Left
 - Header
}}}
{{{#!th align=left
 - Right
 - Header
}}}
|----------------------------------
{{{#!td style="background: #ffd"
 - Left
 - Content
}}}
{{{#!td style="vertical-align: top"
!RightContent
}}}
|----------------------------------
|| ... and this can be mixed||\
||with pipe-based cells ||
{{{#!td colspan=2
Pick the style the more appropriate
to your content

See WikiFormatting#Tables for details
on the pipe-based table syntax.
}}}

If one needs to add some 
attributes to the table itself...

{{{
#!table style="border:none;text-align:center;margin:auto"
  {{{#!tr ====================================
    {{{#!th style="border: none"
    Left header
    }}}
    {{{#!th style="border: none"
    Right header
    }}}
  }}}
  {{{#!tr ==== style="border: 1px dotted grey"
    {{{#!td style="border: none"
    1.1
    }}}
    {{{#!td style="border: none"
    1.2
    }}}
  }}}
  {{{#!tr ====================================
    {{{#!td style="border: none"
    2.1
    }}}
    {{{#!td
    2.2
    }}}
  }}}
}}}
}}}

Note that by default tables are assigned the "wiki" CSS class, which gives a distinctive look to the header cells and a default border to the table and cells (as can be seen for the tables on this page). By removing this class (`#!table class=""`), one regains complete control on the table presentation. In particular, neither the table, the rows nor the cells will have a border, so this is a more effective way to get such an effect than having to specify a `style="border: no"` parameter everywhere. 

{{{#!table class=""
||= Wiki Markup =||= Display =||
 {{{#!td
  {{{
  {{{#!table class=""
  ||  0||  1||  2||
  || 10|| 20|| 30||
  || 11|| 22|| 33||
  ||||||=  numbers  =||
  }}}
  }}}
 }}}
 {{{#!td
  {{{#!table class=""
  ||  0||  1||  2||
  || 10|| 20|| 30||
  || 11|| 22|| 33||
  ||||||=  numbers  =||
  }}}
 }}}
}}}

Other classes can be specified as alternatives (remember that you can define your own in [TracInterfaceCustomization#SiteAppearance site/style.css]).

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  {{{#!table class="listing"
  ||  0||  1||  2||
  || 10|| 20|| 30||
  || 11|| 22|| 33||
  ||||||=  numbers  =||
  }}}
  }}}
}}}
{{{#!td
  {{{#!table class="listing"
  ||  0||  1||  2||
  || 10|| 20|| 30||
  || 11|| 22|| 33||
  ||||||=  numbers  =||
  }}}
}}}


== HTML comments ==
HTML comments are stripped from the output of the `html` processor. To add an HTML comment to a wiki page, use the `htmlcomment` processor (available since 0.12). For example, the following code block:
||= Wiki Markup =||
{{{#!td
  {{{
  {{{
  #!htmlcomment
  This block is translated to an HTML comment.
  It can contain <tags> and &entities; that will not be escaped in the output.
  }}}
  }}}
}}}
|---------------------------------------------------------------------------------
||= Display =||
{{{#!td
  {{{
  <!--
  This block is translated to an HTML comment.
  It can contain <tags> and &entities; that will not be escaped in the output.
  -->
  }}}
}}}

Please note that the character sequence "`--`" is not allowed in HTML comments, and will generate a rendering error.


== More Information ==

 * http://www.w3.org/ -- World Wide Web Consortium
 * http://www.w3.org/MarkUp/ -- HTML Markup Home Page

----
See also:  WikiProcessors, WikiFormatting, WikiRestructuredText
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiMacros', 1, 1519728656675002, 'trac', '127.0.0.1', '= Trac Macros =

[[PageOutline]]

Trac macros are plugins to extend the Trac engine with custom ''functions'' written in Python. A macro inserts dynamic HTML data in any context supporting WikiFormatting. Its syntax is `[[macro-name(optional-arguments)]]`.

The WikiProcessors are another kind of macros. They typically deal with alternate markup formats and transformation of larger "blocks" of information (like source code highlighting). They are used for processing the multiline `{{{#!wiki-processor-name ... }}}` blocks.

== Using Macros ==

Macro calls are enclosed in two ''''square brackets''''. Like Python functions, macros can also have arguments, a comma separated list within parentheses.

=== Getting Detailed Help ===
The list of available macros and the full help can be obtained using the !MacroList macro, as seen [#AvailableMacros below].

A brief list can be obtained via `[[MacroList(*)]]` or `[[?]]`.

Detailed help on a specific macro can be obtained by passing it as an argument to !MacroList, e.g. `[[MacroList(MacroList)]]`, or, more conveniently, by appending a question mark (`?`) to the macro''s name, like in `[[MacroList?]]`.



=== Example ===

A list of 3 most recently changed wiki pages starting with ''Trac'':

||= Wiki Markup =||= Display =||
{{{#!td
  {{{
  [[RecentChanges(Trac,3)]]
  }}}
}}}
{{{#!td style="padding-left: 2em;"
[[RecentChanges(Trac,3)]]
}}}
|-----------------------------------
{{{#!td
  {{{
  [[RecentChanges?(Trac,3)]]
  }}}
}}}
{{{#!td style="padding-left: 2em;"
[[RecentChanges?(Trac,3)]]
}}}
|-----------------------------------
{{{#!td
  {{{
  [[?]]
  }}}
}}}
{{{#!td style="padding-left: 2em"
{{{#!html 
<div style="font-size: 80%" class="trac-macrolist">
<h3><code>[[Image]]</code></h3>Embed an image in wiki-formatted text.

The first argument is the file …
<h3><code>[[InterTrac]]</code></h3>Provide a list of known <a class="wiki" href="/wiki/InterTrac">InterTrac</a> prefixes.
<h3><code>[[InterWiki]]</code></h3>Provide a description list for the known <a class="wiki" href="/wiki/InterWiki">InterWiki</a> prefixes.
<h3><code>[[KnownMimeTypes]]</code></h3>List all known mime-types which can be used as <a class="wiki" href="/wiki/WikiProcessors">WikiProcessors</a>.
Can be …</div>
}}}
etc.
}}}

== Available Macros ==

''''Note that the following list will only contain the macro documentation if you''ve not enabled `-OO` optimizations, or not set the `PythonOptimize` option for [wiki:TracModPython mod_python].''''

[[MacroList]]

== Macros from around the world ==

The [http://trac-hacks.org/ Trac Hacks] site provides a wide collection of macros and other Trac [TracPlugins plugins] contributed by the Trac community. If you''re looking for new macros, or have written one that you''d like to share with the world, please don''t hesitate to visit that site.

== Developing Custom Macros ==
Macros, like Trac itself, are written in the [http://python.org/ Python programming language] and are developed as part of TracPlugins.

For more information about developing macros, see the [trac:TracDev development resources] on the main project site.


Here are 2 simple examples showing how to create a Macro with Trac 0.11. 

Also, have a look at [trac:source:tags/trac-0.11/sample-plugins/Timestamp.py Timestamp.py] for an example that shows the difference between old style and new style macros and at the [trac:source:tags/trac-0.11/wiki-macros/README macros/README] which provides a little more insight about the transition.

=== Macro without arguments ===
To test the following code, you should saved it in a `timestamp_sample.py` file located in the TracEnvironment''s `plugins/` directory.
{{{
#!python
from datetime import datetime
# Note: since Trac 0.11, datetime objects are used internally

from genshi.builder import tag

from trac.util.datefmt import format_datetime, utc
from trac.wiki.macros import WikiMacroBase

class TimeStampMacro(WikiMacroBase):
    """Inserts the current time (in seconds) into the wiki page."""

    revision = "$Rev$"
    url = "$URL$"

    def expand_macro(self, formatter, name, text):
        t = datetime.now(utc)
        return tag.b(format_datetime(t, ''%c''))
}}}

=== Macro with arguments ===
To test the following code, you should saved it in a `helloworld_sample.py` file located in the TracEnvironment''s `plugins/` directory.
{{{
#!python
from genshi.core import Markup

from trac.wiki.macros import WikiMacroBase

class HelloWorldMacro(WikiMacroBase):
    """Simple HelloWorld macro.

    Note that the name of the class is meaningful:
     - it must end with "Macro"
     - what comes before "Macro" ends up being the macro name

    The documentation of the class (i.e. what you''re reading)
    will become the documentation of the macro, as shown by
    the !MacroList macro (usually used in the WikiMacros page).
    """

    revision = "$Rev$"
    url = "$URL$"

    def expand_macro(self, formatter, name, text, args):
        """Return some output that will be displayed in the Wiki content.

        `name` is the actual name of the macro (no surprise, here it''ll be
        `''HelloWorld''`),
        `text` is the text enclosed in parenthesis at the call of the macro.
          Note that if there are ''''no'''' parenthesis (like in, e.g.
          [[HelloWorld]]), then `text` is `None`.
        `args` are the arguments passed when HelloWorld is called using a
        `#!HelloWorld` code block.
        """
        return ''Hello World, text = %s, args = %s'' % \
            (Markup.escape(text), Markup.escape(repr(args)))

}}}

Note that `expand_macro` optionally takes a 4^th^ parameter ''''`args`''''. When the macro is called as a [WikiProcessors WikiProcessor], it''s also possible to pass `key=value` [WikiProcessors#UsingProcessors processor parameters]. If given, those are stored in a dictionary and passed in this extra `args` parameter. On the contrary, when called as a macro, `args` is  `None`. (''''since 0.12'''').

For example, when writing:
{{{
{{{#!HelloWorld style="polite" -silent verbose
<Hello World!>
}}}

{{{#!HelloWorld
<Hello World!>
}}}

[[HelloWorld(<Hello World!>)]]
}}}
One should get:
{{{
Hello World, text = <Hello World!> , args = {''style'': u''polite'', ''silent'': False, ''verbose'': True}
Hello World, text = <Hello World!> , args = {}
Hello World, text = <Hello World!> , args = None
}}}

Note that the return value of `expand_macro` is ''''''not'''''' HTML escaped. Depending on the expected result, you should escape it by yourself (using `return Markup.escape(result)`) or, if this is indeed HTML, wrap it in a Markup object (`return Markup(result)`) with `Markup` coming from Genshi, (`from genshi.core import Markup`).  

You can also recursively use a wiki Formatter (`from trac.wiki import Formatter`) to process the `text` as wiki markup, for example by doing:

{{{
#!python
from genshi.core import Markup
from trac.wiki.macros import WikiMacroBase
from trac.wiki import Formatter
import StringIO

class HelloWorldMacro(WikiMacroBase):
	def expand_macro(self, formatter, name, text, args):
		text = "whatever ''''''wiki'''''' markup you want, even containing other macros"
		# Convert Wiki markup to HTML, new style
		out = StringIO.StringIO()
		Formatter(self.env, formatter.context).format(text, out)
		return Markup(out.getvalue())
}}}
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiNewPage', 1, 1519728656678162, 'trac', '127.0.0.1', '= Steps to Add a New Wiki Page =
[[TracGuideToc]]

Note: make sure you actually have the rights to edit wiki pages. If you don''t see the **Edit this page** button, read the information relative to the editing policy for your Trac installation (usually on the front page WikiStart), or contact your local Trac administrator.

 1. Choose a name for your new page. See WikiPageNames for naming conventions.
 2. Edit an existing page (or any other resources that support WikiFormatting and add a [TracLinks link] to your new page. Save your changes.
 3. Follow the link you created to take you to the new page. Trac will display a "describe !PageName here" message.
 4. Click the "Edit this page" button to edit and add content to your new page. Save your changes.
 5. All done. Your new page is published.

You can skip the second step by entering the CamelCase name of the page in the quick-search field at the top of the page. But note that the page will effectively be "orphaned" unless you link to it from somewhere else.

== Rename a page #renaming

While picking up good WikiPageNames is important, you can always change your mind
and rename the page later.

You''ll need to ask for the WIKI_RENAME permission in order to be allowed to do this.
When renaming a page, you''ll be offered the possibility to create a redirection page, so that links pointing to the old location will not be left dangling.

----
See also: TracWiki, PageTemplates, WikiFormatting, TracLinks, WikiDeletePage
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiPageNames', 1, 1519728656680979, 'trac', '127.0.0.1', '= Wiki Page Names =
[[TracGuideToc]]

Wiki page names commonly use the CamelCase convention. Within wiki text, any word in CamelCase automatically becomes a hyperlink to the wiki page with that name.

CamelCase page names must follow these rules:

 1. The name must consist of ''''''alphabetic characters only''''''. No digits, spaces, punctuation, or underscores are allowed.
 2. A name must have at least two capital letters.
 3. The first character must be capitalized.
 4. Every capital letter must be followed by one or more lower-case letters. 
 5. The use of slash ( / ) is permitted in page names (possibly representing a hierarchy).

If you want to create a wiki page that doesn''t follow CamelCase rules you can use the following syntax:
{{{
 * [wiki:Wiki_page], [wiki:ISO9000],
   and with a label: [wiki:ISO9000 ISO 9000 standard]
 * [wiki:"Space Matters"]
   and with a label: [wiki:"Space Matters" all about white space]
 * or simply: ["WikiPageName"]s
 * even better, the new [[WikiCreole link style]]
   and with a label: [[WikiCreole link style|WikiCreole style links]]
}}}

This will be rendered as:
 * [wiki:Wiki_page], [wiki:ISO9000],
   and with a label: [wiki:ISO9000 ISO 9000 standard]
 * [wiki:"Space Matters"] ''''(that page name embeds space characters)''''
   and with a label: [wiki:"Space Matters" all about white space]
 * or simply: ["WikiPageName"]s ''''(old !MoinMoin''s internal free links style)''''
 * even better, the new [[WikiCreole link style]]
   and with a label: [[WikiCreole link style|WikiCreole style links]]
   ''''(since 0.12, also now adopted by !MoinMoin)''''


Starting with Trac 0.11, it''s also possible to link to a specific ''''version'''' of a Wiki page, as you would do for a specific version of a file, for example: WikiStart@1.

You can also prevent a CamelCase name to be interpreted as a TracLinks, by quoting it. See TracLinks#EscapingLinks.

As visible in the example above, one can also append an anchor to a Wiki page name, in order to link to a specific section within that page. The anchor can easily be seen by hovering the mouse over a section heading, then clicking on the [[html(&para;)]] sign that appears at its end. The anchor is usually generated automatically, but it''s also possible to specify it explicitly: see WikiFormatting#using-explicit-id-in-heading.
----
See also: WikiNewPage, WikiFormatting, TracWiki, TracLinks
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiProcessors', 1, 1519728656683926, 'trac', '127.0.0.1', '= Wiki Processors =

Processors are WikiMacros designed to provide alternative markup formats for the [TracWiki Wiki engine]. Processors can be thought of as ''''macro functions to process user-edited text''''. 

Wiki processors can be used in any Wiki text throughout Trac,
for various different purposes, like:
 - [#CodeHighlightingSupport syntax highlighting] or for rendering text verbatim,
 - rendering [#HTMLrelated Wiki markup inside a context], 
   like inside <div> blocks or <span> or within <td> or <th> table cells,
 - using an alternative markup syntax, like [wiki:WikiHtml raw HTML] and
   [wiki:WikiRestructuredText Restructured Text],
   or [http://www.textism.com/tools/textile/ textile]


== Using Processors ==

To use a processor on a block of text, first delimit the lines using
a Wiki ''''code block'''':
{{{
{{{
The lines
that should be processed...
}}}
}}}

Immediately after the `{{{` or on the line just below, 
add `#!` followed by the ''''processor name''''.

{{{
{{{
#!processorname
The lines
that should be processed...
}}}
}}}

This is the "shebang" notation, familiar to most UNIX users.

Besides their content, some Wiki processors can also accept ''''parameters'''',
which are then given as `key=value` pairs after the processor name, 
on the same line. If `value` has to contain space, as it''s often the case for
the style parameter, a quoted string can be used (`key="value with space"`).

As some processors are meant to process Wiki markup, it''s quite possible to
''''nest'''' processor blocks.
You may want to indent the content of nested blocks for increased clarity,
this extra indentation will be ignored when processing the content.


== Examples ==

||= Wiki Markup =||= Display =||
{{{#!td colspan=2 align=center style="border: none"

                __Example 1__: Inserting raw HTML
}}}
|-----------------------------------------------------------------
{{{#!td style="border: none"
{{{
{{{
#!html
<h1 style="color: grey">This is raw HTML</h1>
}}}
}}}
}}}
{{{#!td valign=top style="border: none; padding-left: 2em"
{{{
#!html
<h1 style="color: grey">This is raw HTML</h1>
}}}
}}}
|-----------------------------------------------------------------
{{{#!td colspan=2 align=center style="border: none"

     __Example 2__: Highlighted Python code in a <div> block with custom style
}}}
|-----------------------------------------------------------------
{{{#!td style="border: none"
  {{{
  {{{#!div style="background: #ffd; border: 3px ridge"

  This is an example of embedded "code" block:

    {{{
    #!python
    def hello():
        return "world"
    }}}

  }}}
  }}}
}}}
{{{#!td valign=top style="border: none; padding: 1em"
  {{{#!div style="background: #ffd; border: 3px ridge"

  This is an example of embedded "code" block:

    {{{
    #!python
    def hello():
        return "world"
    }}}

  }}}
}}}
|-----------------------------------------------------------------
{{{#!td colspan=2 align=center style="border: none"

     __Example 3__: Searching tickets from a wiki page, by keywords.
}}}
|-----------------------------------------------------------------
{{{#!td style="border: none"
  {{{
  {{{
  #!html
  <form action="/query" method="get"><div>
  <input type="text" name="keywords" value="~" size="30"/>
  <input type="submit" value="Search by Keywords"/>
  <!-- To control what fields show up use hidden fields
  <input type="hidden" name="col" value="id"/>
  <input type="hidden" name="col" value="summary"/>
  <input type="hidden" name="col" value="status"/>
  <input type="hidden" name="col" value="milestone"/>
  <input type="hidden" name="col" value="version"/>
  <input type="hidden" name="col" value="owner"/>
  <input type="hidden" name="col" value="priority"/>
  <input type="hidden" name="col" value="component"/>
  -->
  </div></form>
  }}}
  }}}
}}}
{{{#!td valign=top style="border: none; padding: 1em"
  {{{
  #!html
  <form action="/query" method="get"><div>
  <input type="text" name="keywords" value="~" size="30"/>
  <input type="submit" value="Search by Keywords"/>
  <!-- To control what fields show up use hidden fields
  <input type="hidden" name="col" value="id"/>
  <input type="hidden" name="col" value="summary"/>
  <input type="hidden" name="col" value="status"/>
  <input type="hidden" name="col" value="milestone"/>
  <input type="hidden" name="col" value="version"/>
  <input type="hidden" name="col" value="owner"/>
  <input type="hidden" name="col" value="priority"/>
  <input type="hidden" name="col" value="component"/>
  -->
  </div></form>
  }}}
}}}
== Available Processors ==

The following processors are included in the Trac distribution:

|| ''''''`#!default`'''''' || Present the text verbatim in a preformatted text block. This is the same as specifying ''''no'''' processor name (and no `#!`) ||
|| ''''''`#!comment`'''''' || Do not process the text in this section (i.e. contents exist only in the plain text - not in the rendered page). ||
|||| ||
||||= ''''''HTML related'''''' =||
|| ''''''`#!html`'''''' || Insert custom HTML in a wiki page. ||
|| ''''''`#!htmlcomment`'''''' || Insert an HTML comment in a wiki page (''''since 0.12''''). ||
|| || Note that `#!html` blocks have to be ''''self-contained'''', i.e. you can''t start an HTML element in one block and close it later in a second block. Use the following processors for achieving a similar effect.  ||
|| ''''''`#!div`'''''' || Wrap an arbitrary Wiki content inside a <div> element (''''since 0.11''''). ||
|| ''''''`#!span`'''''' || Wrap an arbitrary Wiki content inside a <span> element (''''since 0.11''''). ||
|| ''''''`#!td`'''''' || Wrap an arbitrary Wiki content inside a <td> element (''''since 0.12'''') ||
|| ''''''`#!th`'''''' || Wrap an arbitrary Wiki content inside a <th> element (''''since 0.12'''') ||
|| ''''''`#!tr`'''''' || Can optionally be used for wrapping `#!td` and `#!th` blocks, either for specifying row attributes of better visual grouping (''''since 0.12'''') ||
|| || See WikiHtml for example usage and more details about these processors. ||
|||| ||
||||= ''''''Other Markups'''''' =||
|| ''''''`#!rst`'''''' || Trac support for Restructured Text. See WikiRestructuredText. ||
|| ''''''`#!textile`'''''' || Supported if [http://cheeseshop.python.org/pypi/textile Textile] is installed. See [http://www.textism.com/tools/textile/ a Textile reference]. ||
|||| ||
||||= ''''''Code Highlighting Support'''''' =||
|| ''''''`#!c`'''''' [[BR]] ''''''`#!cpp`'''''' (C++) [[BR]] ''''''`#!python`'''''' [[BR]] ''''''`#!perl`'''''' [[BR]] ''''''`#!ruby`'''''' [[BR]] ''''''`#!php`'''''' [[BR]] ''''''`#!asp`'''''' [[BR]] ''''''`#!java`'''''' [[BR]] ''''''`#!js`'''''' (Javascript) [[BR]] ''''''`#!sql`'''''' [[BR]] ''''''`#!xml`'''''' (XML or HTML) [[BR]] ''''''`#!sh`'''''' (!Bourne/Bash shell) [[BR]] ''''''etc.'''''' [[BR]] || Trac includes processors to provide inline syntax highlighting for source code in various languages. [[BR]] [[BR]] Trac relies on external software packages for syntax coloring, like [http://pygments.org Pygments]. [[BR]] [[BR]] See TracSyntaxColoring for information about which languages are supported and how to enable support for more languages. ||
|||| ||

Using the MIME type as processor, it is possible to syntax-highlight the same languages that are supported when browsing source code.

||||= ''''''MIME Type Processors'''''' =||
{{{#!tr
{{{#!td
Some examples:
 {{{
{{{
#!text/html
<h1>text</h1>
}}}
 }}}
}}}
{{{#!td
The result will be syntax highlighted HTML code:
 {{{
#!text/html
<h1>text</h1>
 }}}

The same is valid for all other [TracSyntaxColoring#SyntaxColoringSupport mime types supported].
}}}
}}}
{{{#!td
 {{{
{{{
#!diff
--- Version 55
+++ Version 56
@@ -115,8 +115,9 @@
     name=''TracHelloWorld'', version=''1.0'',
     packages=find_packages(exclude=[''*.tests*'']),
-    entry_points = """
-        [trac.plugins]
-        helloworld = myplugs.helloworld
-    """,
+    entry_points = {
+        ''trac.plugins'': [
+            ''helloworld = myplugs.helloworld'',
+        ],
+    },
 )
}}}
 }}}
}}}
{{{#!td
''''''`#!diff`'''''' has a particularly nice renderer:
 {{{
#!diff
--- Version 55
+++ Version 56
@@ -115,8 +115,9 @@
     name=''TracHelloWorld'', version=''1.0'',
     packages=find_packages(exclude=[''*.tests*'']),
-    entry_points = """
-        [trac.plugins]
-        helloworld = myplugs.helloworld
-    """,
+    entry_points = {
+        ''trac.plugins'': [
+            ''helloworld = myplugs.helloworld'',
+        ],
+    },
 )
 }}}
}}}

For more processor macros developed and/or contributed by users, visit: 
 * [trac:ProcessorBazaar]
 * [trac:MacroBazaar]
 * [http://trac-hacks.org Trac Hacks] community site

Developing processors is no different from Wiki macros. 
In fact they work the same way, only the usage syntax differs. 
See WikiMacros#DevelopingCustomMacros for more information.


----
See also: WikiMacros, WikiHtml, WikiRestructuredText, TracSyntaxColoring, WikiFormatting, TracGuide', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiRestructuredText', 1, 1519728656687101, 'trac', '127.0.0.1', '= reStructuredText Support in Trac =

Trac supports using ''''reStructuredText'''' (RST) as an alternative to wiki markup in any context WikiFormatting is used.

From the reStucturedText webpage:
 "''''reStructuredText is an easy-to-read, what-you-see-is-what-you-get plaintext markup syntax and parser   system. It is useful for in-line program documentation (such as Python docstrings), for quickly creating  simple web pages, and for standalone documents. reStructuredText is designed for extensibility for  specific application domains. ''''"

If you want a file from your Subversion repository be displayed as reStructuredText in Trac''s source browser, set `text/x-rst` as value for the Subversion property `svn:mime-type`. See [trac:source:/trunk/INSTALL this example].

=== Requirements ===
Note that to activate RST support in Trac, the python docutils package must be installed. 
If not already available on your operating system, you can download it at the [http://docutils.sourceforge.net/rst.html RST Website].

Install docutils using `easy_install docutils`. Do not use the package manager of your OS (e.g. `apt-get install python-docutils`), because Trac will not find docutils then.

=== More information on RST ===

 * reStructuredText Website -- http://docutils.sourceforge.net/rst.html
 * RST Quick Reference -- http://docutils.sourceforge.net/docs/rst/quickref.html

----

== Using RST in Trac ==
To specify that a block of text should be parsed using RST, use the ''''rst'''' processor. 

=== TracLinks in reStructuredText ===

 * Trac provides a custom RST directive `trac::` to allow TracLinks from within RST text.
   ||= Wiki Markup ||= Display ||
   {{{#!td
     {{{
     {{{
     #!rst
     This is a reference to |a ticket|

     .. |a ticket| trac:: #42
     }}}
     }}}
   }}}
   {{{#!td
     {{{
     #!rst
     This is a reference to |a ticket|

     .. |a ticket| trac:: #42
     }}}
   }}}

 * Trac allows an even easier way of creating TracLinks in RST, using the custom `:trac:` role.
   ||= Wiki Markup ||= Display ||
   {{{#!td
     {{{
     {{{
     #!rst
     This is a reference to ticket `#12`:trac:

     To learn how to use Trac, see `TracGuide`:trac:
     }}}
     }}}
   }}}
   {{{#!td
     {{{
     #!rst
     This is a reference to ticket `#12`:trac:

     To learn how to use Trac, see `TracGuide`:trac:
     }}}
   }}}

 For a complete example of all uses of the `:trac:` role, please see WikiRestructuredTextLinks. 


=== Syntax highlighting in reStructuredText ===

There is a directive for doing TracSyntaxColoring in RST as well. The directive is called
code-block

||= Wiki Markup ||= Display ||
{{{#!td
  {{{
  {{{
  #!rst

  .. code-block:: python

     class Test:

         def TestFunction(self):
             pass
  
  }}}
  }}}
}}}
{{{#!td
  {{{
  #!rst

  .. code-block:: python

     class Test:

         def TestFunction(self):
             pass

  }}}
}}}
Note the need to indent the code at least one character after the `.. code-block` directive.

=== Wiki Macros in reStructuredText ===

For doing [WikiMacros Wiki Macros] in RST you use the same directive as for syntax highlighting i.e code-block.

||= Wiki Markup ||= Display ||
{{{#!td
  {{{
  {{{
  #!rst

  .. code-block:: RecentChanges

     Trac,3

  }}}
  }}}
}}}
{{{#!td
  {{{
  #!rst

  .. code-block:: RecentChanges

     Trac,3

  }}}
}}}

Or a more concise Wiki Macro like syntax is also available, using the `:code-block:` role:

||= Wiki Markup ||= Display ||
{{{#!td
  {{{
  {{{
  #!rst

  :code-block:`RecentChanges:Trac,3`
  }}}
  }}}
}}}
{{{#!td
  {{{
  #!rst

  :code-block:`RecentChanges:Trac,3`
  }}}
}}}

=== Bigger RST Example ===
The example below should be mostly self-explanatory:

||= Wiki Markup ||= Display ||
{{{#!td
{{{
#!html
<pre class="wiki">{{{
#!rst
FooBar Header
=============
reStructuredText is **nice**. It has its own webpage_.

A table:

=====  =====  ======
   Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======

RST TracLinks
-------------

See also ticket `#42`:trac:.

.. _webpage: http://docutils.sourceforge.net/rst.html
}}}</pre>
}}}
}}}
{{{#!td
{{{
#!rst
FooBar Header
=============
reStructuredText is **nice**. It has its own webpage_.

A table:

=====  =====  ======
   Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======

RST TracLinks
-------------

See also ticket `#42`:trac:.

.. _webpage: http://docutils.sourceforge.net/rst.html
}}}
}}}

----
See also: WikiRestructuredTextLinks, WikiProcessors, WikiFormatting
', NULL, NULL, '');
INSERT INTO wiki (name, version, "time", author, ipnr, text, comment, readonly, product) VALUES ('WikiRestructuredTextLinks', 1, 1519728656690159, 'trac', '127.0.0.1', '= TracLinks in reStructuredText =

This document illustrates how to use the `:trac:` role in reStructuredText. The page is written like:

{{{
{{{
#!rst 
Examples:

 * Tickets: :trac:`#1` or :trac:`ticket:1`
 * Ticket comments: :trac:`comment:ticket:1:2`
 * Reports: :trac:`{1}` or :trac:`report:1`
 * Changesets: :trac:`r1`, :trac:`[1]` or :trac:`changeset:1`
 * Revision log: :trac:`r1:3`, :trac:`[1:3]` or :trac:`log:@1:3`, :trac:`log:trunk@1:3`
 * Diffs (since version 0.10): :trac:`diff:@20:30`, :trac:`diff:tags/trac-0.9.2/wiki-default//tags/trac-0.9.3/wiki-default` or :trac:`diff:trunk/trac@3538//sandbox/vc-refactoring/trac@3539`
 * Wiki pages: :trac:`CamelCase` or :trac:`wiki:CamelCase`
 * Milestones: :trac:`milestone:1.0`
 * Attachment: :trac:`attachment:ticket:944:attachment.1073.diff`
 * Files: :trac:`source:trunk/COPYING`
 * A specific file revision: :trac:`source:/trunk/COPYING@200`
 * A particular line of a specific file revision: :trac:`source:/trunk/COPYING@200#L25`

An explicit label can be specified, separated from the link by a space:

 * See :trac:`#1 ticket 1` and the :trac:`source:trunk/COPYING license`.
}}}
}}}

Provided you have docutils installed, the above block will render as:
----
{{{
#!rst 
Examples:

 * Tickets: :trac:`#1` or :trac:`ticket:1`
 * Ticket comments: :trac:`comment:ticket:1:2`
 * Reports: :trac:`{1}` or :trac:`report:1`
 * Changesets: :trac:`r1`, :trac:`[1]` or :trac:`changeset:1`
 * Revision log: :trac:`r1:3`, :trac:`[1:3]` or :trac:`log:@1:3`, :trac:`log:trunk@1:3`
 * Diffs (since version 0.10): :trac:`diff:@20:30`, :trac:`diff:tags/trac-0.9.2/wiki-default//tags/trac-0.9.3/wiki-default` or :trac:`diff:trunk/trac@3538//sandbox/vc-refactoring/trac@3539`
 * Wiki pages: :trac:`CamelCase` or :trac:`wiki:CamelCase`
 * Milestones: :trac:`milestone:1.0`
 * Attachment: :trac:`attachment:ticket:944:attachment.1073.diff`
 * Files: :trac:`source:trunk/COPYING`
 * A specific file revision: :trac:`source:/trunk/COPYING@200`
 * A particular line of a specific file revision: :trac:`source:/trunk/COPYING@200#L25`

An explicit label can be specified, separated from the link by a space:

 * See :trac:`#1 ticket 1` and the :trac:`source:trunk/COPYING license`.
}}}
----

Note also that any of the above could have been written using substitution references and the `trac::` directive:
{{{
{{{
#!rst
See |ticket123|.

 .. |ticket123| trac:: ticket:123 this ticket
}}}
}}}

This renders as:
----

{{{
#!rst
See |ticket123|.

 .. |ticket123| trac:: ticket:123 this ticket
}}}

----
See also: WikiRestructuredText, TracLinks', NULL, NULL, '');


--
-- TOC entry 2418 (class 2606 OID 49403)
-- Name: Dpiaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY "Dpiaudit"
    ADD CONSTRAINT "Dpiaudit_pkey" PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 49440)
-- Name: action_note_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY action_note
    ADD CONSTRAINT action_note_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 42084)
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 42360)
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2424 (class 2606 OID 49456)
-- Name: answer_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 49355)
-- Name: assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY assessment
    ADD CONSTRAINT assessment_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 49325)
-- Name: assessmentassigned_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY assessmentassigned
    ADD CONSTRAINT assessmentassigned_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 41773)
-- Name: attachment_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY attachment
    ADD CONSTRAINT attachment_pk PRIMARY KEY (type, id, filename, product);


--
-- TOC entry 2420 (class 2606 OID 49424)
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 41976)
-- Name: audit_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY audit
    ADD CONSTRAINT audit_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 41567)
-- Name: auth_cookie_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY auth_cookie
    ADD CONSTRAINT auth_cookie_pk PRIMARY KEY (cookie, ipnr, name);


--
-- TOC entry 2332 (class 2606 OID 41718)
-- Name: bloodhound_product_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY bloodhound_product
    ADD CONSTRAINT bloodhound_product_pk PRIMARY KEY (prefix, name);


--
-- TOC entry 2361 (class 2606 OID 41897)
-- Name: bloodhound_productconfig_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY bloodhound_productconfig
    ADD CONSTRAINT bloodhound_productconfig_pk PRIMARY KEY (product, section, option);


--
-- TOC entry 2334 (class 2606 OID 41729)
-- Name: bloodhound_productresourcemap_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY bloodhound_productresourcemap
    ADD CONSTRAINT bloodhound_productresourcemap_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 41928)
-- Name: bloodhound_relations_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY bloodhound_relations
    ADD CONSTRAINT bloodhound_relations_pk PRIMARY KEY (source, destination, type);


--
-- TOC entry 2322 (class 2606 OID 41593)
-- Name: cache_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 41802)
-- Name: component_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY component
    ADD CONSTRAINT component_pk PRIMARY KEY (name, product);


--
-- TOC entry 2382 (class 2606 OID 42030)
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 41844)
-- Name: enum_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY enum
    ADD CONSTRAINT enum_pk PRIMARY KEY (type, name, product);


--
-- TOC entry 2384 (class 2606 OID 42041)
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 42068)
-- Name: license_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY license
    ADD CONSTRAINT license_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 42000)
-- Name: mail_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY mail_audit
    ADD CONSTRAINT mail_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 41816)
-- Name: milestone_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY milestone
    ADD CONSTRAINT milestone_pk PRIMARY KEY (name, product);


--
-- TOC entry 2329 (class 2606 OID 41635)
-- Name: node_change_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY node_change
    ADD CONSTRAINT node_change_pk PRIMARY KEY (repos, rev, path, change_type);


--
-- TOC entry 2386 (class 2606 OID 42052)
-- Name: organization_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 42008)
-- Name: payment_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY payment_plans
    ADD CONSTRAINT payment_plans_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 41858)
-- Name: permission_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pk PRIMARY KEY (username, action, product);


--
-- TOC entry 2410 (class 2606 OID 49344)
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 49387)
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 49317)
-- Name: questionassigned_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY questionassigned
    ADD CONSTRAINT questionassigned_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 41875)
-- Name: report_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pk PRIMARY KEY (id, product);


--
-- TOC entry 2324 (class 2606 OID 41618)
-- Name: repository_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY repository
    ADD CONSTRAINT repository_pk PRIMARY KEY (id, name);


--
-- TOC entry 2326 (class 2606 OID 41626)
-- Name: revision_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY revision
    ADD CONSTRAINT revision_pk PRIMARY KEY (repos, rev);


--
-- TOC entry 2400 (class 2606 OID 42176)
-- Name: sar_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_attachment
    ADD CONSTRAINT sar_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 42160)
-- Name: sar_escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_escalation
    ADD CONSTRAINT sar_escalation_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 42100)
-- Name: sar_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar
    ADD CONSTRAINT sar_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 42144)
-- Name: sar_response_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_response
    ADD CONSTRAINT sar_response_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 49371)
-- Name: section_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 49333)
-- Name: sectionassigned_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sectionassigned
    ADD CONSTRAINT sectionassigned_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 41585)
-- Name: session_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY session_attribute
    ADD CONSTRAINT session_attribute_pk PRIMARY KEY (sid, authenticated, name);


--
-- TOC entry 2318 (class 2606 OID 41575)
-- Name: session_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pk PRIMARY KEY (sid, authenticated);


--
-- TOC entry 2359 (class 2606 OID 41889)
-- Name: system_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY system
    ADD CONSTRAINT system_pk PRIMARY KEY (name, product);


--
-- TOC entry 2336 (class 2606 OID 41743)
-- Name: ticket_change_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_change
    ADD CONSTRAINT ticket_change_pk PRIMARY KEY (ticket, "time", field, product);


--
-- TOC entry 2340 (class 2606 OID 41759)
-- Name: ticket_custom_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_custom
    ADD CONSTRAINT ticket_custom_pk PRIMARY KEY (ticket, name, product);


--
-- TOC entry 2394 (class 2606 OID 42118)
-- Name: ticket_info_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_info
    ADD CONSTRAINT ticket_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 41917)
-- Name: ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (uid);


--
-- TOC entry 2380 (class 2606 OID 42019)
-- Name: user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 41989)
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2374 (class 2606 OID 41987)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 41830)
-- Name: version_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pk PRIMARY KEY (name, product);


--
-- TOC entry 2344 (class 2606 OID 41787)
-- Name: wiki_pk; Type: CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY wiki
    ADD CONSTRAINT wiki_pk PRIMARY KEY (name, version, product);


--
-- TOC entry 2330 (class 1259 OID 41636)
-- Name: node_change_repos_rev_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX node_change_repos_rev_idx ON node_change USING btree (repos, rev);


--
-- TOC entry 2327 (class 1259 OID 41627)
-- Name: revision_repos_time_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX revision_repos_time_idx ON revision USING btree (repos, "time");


--
-- TOC entry 2315 (class 1259 OID 41577)
-- Name: session_authenticated_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX session_authenticated_idx ON session USING btree (authenticated);


--
-- TOC entry 2316 (class 1259 OID 41576)
-- Name: session_last_visit_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX session_last_visit_idx ON session USING btree (last_visit);


--
-- TOC entry 2337 (class 1259 OID 41744)
-- Name: ticket_change_ticket_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX ticket_change_ticket_idx ON ticket_change USING btree (ticket);


--
-- TOC entry 2338 (class 1259 OID 41745)
-- Name: ticket_change_time_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX ticket_change_time_idx ON ticket_change USING btree ("time");


--
-- TOC entry 2364 (class 1259 OID 41920)
-- Name: ticket_product_id_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE UNIQUE INDEX ticket_product_id_idx ON ticket USING btree (product, id);


--
-- TOC entry 2365 (class 1259 OID 41919)
-- Name: ticket_status_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX ticket_status_idx ON ticket USING btree (status);


--
-- TOC entry 2366 (class 1259 OID 41918)
-- Name: ticket_time_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX ticket_time_idx ON ticket USING btree ("time");


--
-- TOC entry 2345 (class 1259 OID 41788)
-- Name: wiki_time_idx; Type: INDEX; Schema: public; Owner: bloodhound
--

CREATE INDEX wiki_time_idx ON wiki USING btree ("time");


--
-- TOC entry 2439 (class 2606 OID 49404)
-- Name: Dpiaudit_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY "Dpiaudit"
    ADD CONSTRAINT "Dpiaudit_question_id_fkey" FOREIGN KEY (question_id) REFERENCES question(id);


--
-- TOC entry 2440 (class 2606 OID 49409)
-- Name: Dpiaudit_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY "Dpiaudit"
    ADD CONSTRAINT "Dpiaudit_section_id_fkey" FOREIGN KEY (section_id) REFERENCES section(id);


--
-- TOC entry 2442 (class 2606 OID 49441)
-- Name: action_note_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY action_note
    ADD CONSTRAINT action_note_question_id_fkey FOREIGN KEY (question_id) REFERENCES question(id);


--
-- TOC entry 2427 (class 2606 OID 42085)
-- Name: address_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2443 (class 2606 OID 49457)
-- Name: answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES question(id);


--
-- TOC entry 2444 (class 2606 OID 49462)
-- Name: answer_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_section_id_fkey FOREIGN KEY (section_id) REFERENCES section(id);


--
-- TOC entry 2436 (class 2606 OID 49356)
-- Name: assessment_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY assessment
    ADD CONSTRAINT assessment_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- TOC entry 2441 (class 2606 OID 49425)
-- Name: attachments_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_question_id_fkey FOREIGN KEY (question_id) REFERENCES question(id);


--
-- TOC entry 2426 (class 2606 OID 42069)
-- Name: license_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY license
    ADD CONSTRAINT license_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES users(id);


--
-- TOC entry 2425 (class 2606 OID 42053)
-- Name: organization_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2438 (class 2606 OID 49388)
-- Name: question_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_section_id_fkey FOREIGN KEY (section_id) REFERENCES section(id);


--
-- TOC entry 2428 (class 2606 OID 42101)
-- Name: sar_assignedTo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar
    ADD CONSTRAINT "sar_assignedTo_fkey" FOREIGN KEY ("assignedTo") REFERENCES users(id);


--
-- TOC entry 2435 (class 2606 OID 42177)
-- Name: sar_attachment_sarresponse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_attachment
    ADD CONSTRAINT sar_attachment_sarresponse_id_fkey FOREIGN KEY (sarresponse_id) REFERENCES sar_response(id);


--
-- TOC entry 2434 (class 2606 OID 42161)
-- Name: sar_escalation_sar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_escalation
    ADD CONSTRAINT sar_escalation_sar_id_fkey FOREIGN KEY (sar_id) REFERENCES sar(id);


--
-- TOC entry 2433 (class 2606 OID 42145)
-- Name: sar_response_sar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar_response
    ADD CONSTRAINT sar_response_sar_id_fkey FOREIGN KEY (sar_id) REFERENCES sar(id);


--
-- TOC entry 2429 (class 2606 OID 42106)
-- Name: sar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY sar
    ADD CONSTRAINT sar_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2437 (class 2606 OID 49372)
-- Name: section_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES assessment(id);


--
-- TOC entry 2431 (class 2606 OID 42124)
-- Name: ticket_info_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_info
    ADD CONSTRAINT ticket_info_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2432 (class 2606 OID 42129)
-- Name: ticket_info_sar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_info
    ADD CONSTRAINT ticket_info_sar_id_fkey FOREIGN KEY (sar_id) REFERENCES sar(id);


--
-- TOC entry 2430 (class 2606 OID 42119)
-- Name: ticket_info_ticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bloodhound
--

ALTER TABLE ONLY ticket_info
    ADD CONSTRAINT ticket_info_ticket_fkey FOREIGN KEY (ticket) REFERENCES ticket(uid);


--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-03-02 21:42:51 IST

--
-- PostgreSQL database dump complete
--

