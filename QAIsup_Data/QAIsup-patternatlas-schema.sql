--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-10-24 20:46:20

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
-- TOC entry 218 (class 1259 OID 18190)
-- Name: candidate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    content jsonb,
    icon_url character varying(255),
    rating integer NOT NULL,
    version character varying(255),
    pattern_language_id uuid
);


ALTER TABLE public.candidate OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18243)
-- Name: candidate_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_author (
    role character varying(255),
    candidate_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.candidate_author OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18246)
-- Name: candidate_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_comment (
    id uuid NOT NULL,
    rating integer NOT NULL,
    text character varying(255),
    candidate_id uuid,
    user_id uuid
);


ALTER TABLE public.candidate_comment OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18249)
-- Name: candidate_comment_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_comment_rating (
    rating integer NOT NULL,
    candidate_comment_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.candidate_comment_rating OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18252)
-- Name: candidate_evidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_evidence (
    id uuid NOT NULL,
    context character varying(255),
    source character varying(255),
    supporting boolean,
    title character varying(255),
    type character varying(255),
    candidate_id uuid,
    user_id uuid
);


ALTER TABLE public.candidate_evidence OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18257)
-- Name: candidate_evidence_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_evidence_rating (
    rating integer NOT NULL,
    candidate_evidence_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.candidate_evidence_rating OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18260)
-- Name: candidate_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_rating (
    rating integer NOT NULL,
    candidate_id uuid NOT NULL,
    user_id uuid NOT NULL,
    appropriateness integer NOT NULL,
    readability integer NOT NULL,
    understandability integer NOT NULL
);


ALTER TABLE public.candidate_rating OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18263)
-- Name: concrete_solution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concrete_solution (
    id uuid NOT NULL,
    aggregator_type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    pattern_uri character varying(255) NOT NULL,
    template_uri character varying(255) NOT NULL
);


ALTER TABLE public.concrete_solution OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18175)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18170)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18219)
-- Name: design_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_model (
    id uuid NOT NULL,
    name character varying(255),
    uri character varying(255),
    logo character varying(255)
);


ALTER TABLE public.design_model OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18268)
-- Name: design_model_edge_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_model_edge_type (
    name character varying(255) NOT NULL,
    swap boolean NOT NULL
);


ALTER TABLE public.design_model_edge_type OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18271)
-- Name: design_model_pattern_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_model_pattern_edge (
    pattern_instance1_pattern_instance_id uuid NOT NULL,
    pattern_instance2_pattern_instance_id uuid NOT NULL,
    design_model_id uuid,
    type character varying(255),
    description character varying(255),
    is_directed_edge boolean
);


ALTER TABLE public.design_model_pattern_edge OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18276)
-- Name: design_model_pattern_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_model_pattern_instance (
    pattern_instance_id uuid NOT NULL,
    pattern_id uuid,
    design_model_id uuid,
    type character varying(255),
    index integer,
    x double precision,
    y double precision,
    vx double precision,
    vy double precision
);


ALTER TABLE public.design_model_pattern_instance OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18279)
-- Name: design_model_undirected_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_model_undirected_edge (
    design_model_id uuid NOT NULL,
    undirected_edge_id uuid NOT NULL
);


ALTER TABLE public.design_model_undirected_edge OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18185)
-- Name: directed_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directed_edge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    pattern_language_id uuid,
    source_id uuid NOT NULL,
    target_id uuid NOT NULL
);


ALTER TABLE public.directed_edge OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18282)
-- Name: directed_hyperedge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directed_hyperedge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    label character varying(255)
);


ALTER TABLE public.directed_hyperedge OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18216)
-- Name: directed_hyperedge_source_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directed_hyperedge_source_set (
    directed_hyperedge_id uuid NOT NULL,
    source_set_id uuid NOT NULL
);


ALTER TABLE public.directed_hyperedge_source_set OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18235)
-- Name: directed_hyperedge_target_set; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directed_hyperedge_target_set (
    directed_hyperedge_id uuid NOT NULL,
    target_set_id uuid NOT NULL
);


ALTER TABLE public.directed_hyperedge_target_set OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18287)
-- Name: discussion_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discussion_comment (
    id uuid NOT NULL,
    date timestamp without time zone,
    reply_to uuid,
    text character varying(255),
    discussion_topic_id uuid
);


ALTER TABLE public.discussion_comment OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18290)
-- Name: discussion_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discussion_topic (
    id uuid NOT NULL,
    date timestamp without time zone,
    description character varying(255),
    fill character varying(255),
    height double precision,
    image_id uuid,
    status integer,
    title character varying(255),
    width double precision,
    x double precision,
    y double precision
);


ALTER TABLE public.discussion_topic OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18891)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18295)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id uuid NOT NULL,
    data oid,
    file_name character varying(255),
    file_type character varying(255)
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18205)
-- Name: issue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    description character varying(255),
    rating integer NOT NULL,
    version character varying(255)
);


ALTER TABLE public.issue OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18300)
-- Name: issue_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_author (
    role character varying(255),
    issue_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_author OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18303)
-- Name: issue_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_comment (
    id uuid NOT NULL,
    rating integer NOT NULL,
    text character varying(255),
    issue_id uuid,
    user_id uuid
);


ALTER TABLE public.issue_comment OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18306)
-- Name: issue_comment_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_comment_rating (
    rating integer NOT NULL,
    issue_comment_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_comment_rating OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18309)
-- Name: issue_evidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_evidence (
    id uuid NOT NULL,
    context character varying(255),
    source character varying(255),
    supporting boolean,
    title character varying(255),
    type character varying(255),
    issue_id uuid,
    user_id uuid
);


ALTER TABLE public.issue_evidence OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18314)
-- Name: issue_evidence_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_evidence_rating (
    rating integer NOT NULL,
    issue_evidence_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_evidence_rating OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18317)
-- Name: issue_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_rating (
    rating integer NOT NULL,
    issue_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.issue_rating OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18200)
-- Name: pattern; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    content jsonb NOT NULL,
    icon_url character varying(255),
    rendered_content jsonb,
    pattern_language_id uuid,
    paper_ref character varying(255),
    deployment_modeling_behavior_pattern boolean DEFAULT false,
    deployment_modeling_structure_pattern boolean DEFAULT false
);


ALTER TABLE public.pattern OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 26361)
-- Name: pattern_for_algorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_for_algorithm (
    id uuid NOT NULL,
    algodata jsonb
);


ALTER TABLE public.pattern_for_algorithm OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18238)
-- Name: pattern_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_language (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    graph jsonb,
    creative_commons_reference character varying(255),
    logo character varying(255)
);


ALTER TABLE public.pattern_language OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18320)
-- Name: pattern_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_schema (
    pattern_language_id uuid NOT NULL
);


ALTER TABLE public.pattern_schema OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18323)
-- Name: pattern_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_section (
    id bigint NOT NULL,
    value text,
    pattern_section_schema_id uuid
);


ALTER TABLE public.pattern_section OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18328)
-- Name: pattern_section_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_section_schema (
    id uuid NOT NULL,
    label character varying(255),
    name character varying(255),
    "position" integer,
    type character varying(255),
    pattern_schema_pattern_language_id uuid
);


ALTER TABLE public.pattern_section_schema OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18213)
-- Name: pattern_section_schema_pattern_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_section_schema_pattern_sections (
    pattern_section_schema_id uuid NOT NULL,
    pattern_sections_id bigint NOT NULL
);


ALTER TABLE public.pattern_section_schema_pattern_sections OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18227)
-- Name: pattern_view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_view (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    uri character varying(255) NOT NULL,
    graph jsonb,
    logo character varying(255)
);


ALTER TABLE public.pattern_view OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18333)
-- Name: pattern_view_directed_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_view_directed_edge (
    directed_edge_id uuid NOT NULL,
    pattern_view_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_directed_edge OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18336)
-- Name: pattern_view_pattern; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_view_pattern (
    pattern_id uuid NOT NULL,
    pattern_view_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_pattern OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18339)
-- Name: pattern_view_undirected_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pattern_view_undirected_edge (
    pattern_view_id uuid NOT NULL,
    undirected_edge_id uuid NOT NULL
);


ALTER TABLE public.pattern_view_undirected_edge OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18232)
-- Name: privilege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilege (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.privilege OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18210)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18342)
-- Name: role_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_privileges (
    roles_id uuid NOT NULL,
    privileges_id uuid NOT NULL
);


ALTER TABLE public.role_privileges OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18180)
-- Name: undirected_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.undirected_edge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    p1_id uuid NOT NULL,
    p2_id uuid NOT NULL,
    pattern_language_id uuid
);


ALTER TABLE public.undirected_edge OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18345)
-- Name: undirected_hyperedge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.undirected_hyperedge (
    id uuid NOT NULL,
    description jsonb,
    type character varying(255),
    label character varying(255)
);


ALTER TABLE public.undirected_hyperedge OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18224)
-- Name: undirected_hyperedge_patterns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.undirected_hyperedge_patterns (
    undirected_hyperedge_id uuid NOT NULL,
    patterns_id uuid NOT NULL
);


ALTER TABLE public.undirected_hyperedge_patterns OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18195)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id uuid NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    password character varying(255)
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 18350)
-- Name: user_entity_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity_roles (
    users_id uuid NOT NULL,
    roles_id uuid NOT NULL
);


ALTER TABLE public.user_entity_roles OWNER TO postgres;

--
-- TOC entry 3430 (class 2606 OID 18436)
-- Name: candidate_author candidate_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_author
    ADD CONSTRAINT candidate_author_pkey PRIMARY KEY (candidate_id, user_id);


--
-- TOC entry 3432 (class 2606 OID 18438)
-- Name: candidate_comment candidate_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT candidate_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3434 (class 2606 OID 18440)
-- Name: candidate_comment_rating candidate_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT candidate_comment_rating_pkey PRIMARY KEY (candidate_comment_id, user_id);


--
-- TOC entry 3436 (class 2606 OID 18442)
-- Name: candidate_evidence candidate_evidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence
    ADD CONSTRAINT candidate_evidence_pkey PRIMARY KEY (id);


--
-- TOC entry 3438 (class 2606 OID 18444)
-- Name: candidate_evidence_rating candidate_evidence_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence_rating
    ADD CONSTRAINT candidate_evidence_rating_pkey PRIMARY KEY (candidate_evidence_id, user_id);


--
-- TOC entry 3374 (class 2606 OID 18446)
-- Name: candidate candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 18448)
-- Name: candidate_rating candidate_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT candidate_rating_pkey PRIMARY KEY (candidate_id, user_id);


--
-- TOC entry 3442 (class 2606 OID 18450)
-- Name: concrete_solution concrete_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_solution
    ADD CONSTRAINT concrete_solution_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 18174)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 18452)
-- Name: design_model_edge_type design_model_edge_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_edge_type
    ADD CONSTRAINT design_model_edge_type_pkey PRIMARY KEY (name);


--
-- TOC entry 3446 (class 2606 OID 18454)
-- Name: design_model_pattern_edge design_model_pattern_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT design_model_pattern_edge_pkey PRIMARY KEY (pattern_instance1_pattern_instance_id, pattern_instance2_pattern_instance_id);


--
-- TOC entry 3448 (class 2606 OID 18456)
-- Name: design_model_pattern_instance design_model_pattern_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT design_model_pattern_instance_pkey PRIMARY KEY (pattern_instance_id);


--
-- TOC entry 3406 (class 2606 OID 18458)
-- Name: design_model design_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model
    ADD CONSTRAINT design_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3450 (class 2606 OID 18460)
-- Name: design_model_undirected_edge design_model_undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT design_model_undirected_edge_pkey PRIMARY KEY (design_model_id, undirected_edge_id);


--
-- TOC entry 3370 (class 2606 OID 18462)
-- Name: directed_edge directed_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT directed_edge_pkey PRIMARY KEY (id);


--
-- TOC entry 3452 (class 2606 OID 18464)
-- Name: directed_hyperedge directed_hyperedge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge
    ADD CONSTRAINT directed_hyperedge_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 18466)
-- Name: directed_hyperedge_source_set directed_hyperedge_source_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT directed_hyperedge_source_set_pkey PRIMARY KEY (directed_hyperedge_id, source_set_id);


--
-- TOC entry 3422 (class 2606 OID 18468)
-- Name: directed_hyperedge_target_set directed_hyperedge_target_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT directed_hyperedge_target_set_pkey PRIMARY KEY (directed_hyperedge_id, target_set_id);


--
-- TOC entry 3454 (class 2606 OID 18470)
-- Name: discussion_comment discussion_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discussion_comment
    ADD CONSTRAINT discussion_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 18472)
-- Name: discussion_topic discussion_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discussion_topic
    ADD CONSTRAINT discussion_topic_pkey PRIMARY KEY (id);


--
-- TOC entry 3458 (class 2606 OID 18474)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3460 (class 2606 OID 18476)
-- Name: issue_author issue_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_author
    ADD CONSTRAINT issue_author_pkey PRIMARY KEY (issue_id, user_id);


--
-- TOC entry 3462 (class 2606 OID 18478)
-- Name: issue_comment issue_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT issue_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3464 (class 2606 OID 18480)
-- Name: issue_comment_rating issue_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT issue_comment_rating_pkey PRIMARY KEY (issue_comment_id, user_id);


--
-- TOC entry 3466 (class 2606 OID 18482)
-- Name: issue_evidence issue_evidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence
    ADD CONSTRAINT issue_evidence_pkey PRIMARY KEY (id);


--
-- TOC entry 3468 (class 2606 OID 18484)
-- Name: issue_evidence_rating issue_evidence_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence_rating
    ADD CONSTRAINT issue_evidence_rating_pkey PRIMARY KEY (issue_evidence_id, user_id);


--
-- TOC entry 3390 (class 2606 OID 18486)
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- TOC entry 3470 (class 2606 OID 18488)
-- Name: issue_rating issue_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT issue_rating_pkey PRIMARY KEY (issue_id, user_id);


--
-- TOC entry 3486 (class 2606 OID 26367)
-- Name: pattern_for_algorithm pattern_for_algorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_for_algorithm
    ADD CONSTRAINT pattern_for_algorithm_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 18490)
-- Name: pattern_language pattern_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_language
    ADD CONSTRAINT pattern_language_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 18492)
-- Name: pattern pattern_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT pattern_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 18494)
-- Name: pattern_schema pattern_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_schema
    ADD CONSTRAINT pattern_schema_pkey PRIMARY KEY (pattern_language_id);


--
-- TOC entry 3474 (class 2606 OID 18496)
-- Name: pattern_section pattern_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section
    ADD CONSTRAINT pattern_section_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 18498)
-- Name: pattern_section_schema pattern_section_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section_schema
    ADD CONSTRAINT pattern_section_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 18500)
-- Name: pattern_view_directed_edge pattern_view_directed_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT pattern_view_directed_edge_pkey PRIMARY KEY (directed_edge_id, pattern_view_id);


--
-- TOC entry 3480 (class 2606 OID 18502)
-- Name: pattern_view_pattern pattern_view_pattern_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT pattern_view_pattern_pkey PRIMARY KEY (pattern_id, pattern_view_id);


--
-- TOC entry 3414 (class 2606 OID 18504)
-- Name: pattern_view pattern_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view
    ADD CONSTRAINT pattern_view_pkey PRIMARY KEY (id);


--
-- TOC entry 3482 (class 2606 OID 18506)
-- Name: pattern_view_undirected_edge pattern_view_undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT pattern_view_undirected_edge_pkey PRIMARY KEY (pattern_view_id, undirected_edge_id);


--
-- TOC entry 3418 (class 2606 OID 18508)
-- Name: privilege privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 18510)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 18404)
-- Name: candidate uk_2nnar9yvwxvggs1ymw99br8fq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT uk_2nnar9yvwxvggs1ymw99br8fq UNIQUE (uri);


--
-- TOC entry 3378 (class 2606 OID 18406)
-- Name: candidate uk_3y29gxrn8rruyc1gmq6jj6uqs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT uk_3y29gxrn8rruyc1gmq6jj6uqs UNIQUE (uri);


--
-- TOC entry 3386 (class 2606 OID 18410)
-- Name: pattern uk_6vocvcw50hujfwn66kt7s5fly; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT uk_6vocvcw50hujfwn66kt7s5fly UNIQUE (uri);


--
-- TOC entry 3392 (class 2606 OID 18414)
-- Name: issue uk_8063id79236r47vy0x6k3ek9n; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT uk_8063id79236r47vy0x6k3ek9n UNIQUE (uri);


--
-- TOC entry 3398 (class 2606 OID 18418)
-- Name: role uk_8sewwnpamngi6b1dwaa88askk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_8sewwnpamngi6b1dwaa88askk UNIQUE (name);


--
-- TOC entry 3400 (class 2606 OID 18420)
-- Name: pattern_section_schema_pattern_sections uk_a5dhcqp5e8908x217tkb3ic31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT uk_a5dhcqp5e8908x217tkb3ic31 UNIQUE (pattern_sections_id);


--
-- TOC entry 3404 (class 2606 OID 18422)
-- Name: directed_hyperedge_source_set uk_bevke13de29vkx6hixr9h9vei; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT uk_bevke13de29vkx6hixr9h9vei UNIQUE (source_set_id);


--
-- TOC entry 3408 (class 2606 OID 18424)
-- Name: design_model uk_bry9ub9e5d26eq397ax24ra8c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model
    ADD CONSTRAINT uk_bry9ub9e5d26eq397ax24ra8c UNIQUE (uri);


--
-- TOC entry 3394 (class 2606 OID 18416)
-- Name: issue uk_c56ot98f5n1mpxjncwej48s8h; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT uk_c56ot98f5n1mpxjncwej48s8h UNIQUE (uri);


--
-- TOC entry 3410 (class 2606 OID 18426)
-- Name: undirected_hyperedge_patterns uk_e61v2oikejer2v1dtcqbbc02l; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT uk_e61v2oikejer2v1dtcqbbc02l UNIQUE (patterns_id);


--
-- TOC entry 3416 (class 2606 OID 18428)
-- Name: pattern_view uk_gcd5mwq1kb8jn6jvwg192u3cd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view
    ADD CONSTRAINT uk_gcd5mwq1kb8jn6jvwg192u3cd UNIQUE (uri);


--
-- TOC entry 3420 (class 2606 OID 18430)
-- Name: privilege uk_h7iwbdg4ev8mgvmij76881tx8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT uk_h7iwbdg4ev8mgvmij76881tx8 UNIQUE (name);


--
-- TOC entry 3424 (class 2606 OID 18432)
-- Name: directed_hyperedge_target_set uk_i7fjt85n23bduccj52sy5m7kl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT uk_i7fjt85n23bduccj52sy5m7kl UNIQUE (target_set_id);


--
-- TOC entry 3380 (class 2606 OID 18408)
-- Name: user_entity uk_l6ltic8jtbw6kty72cqdqxs00; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_l6ltic8jtbw6kty72cqdqxs00 UNIQUE (email, name);


--
-- TOC entry 3388 (class 2606 OID 18412)
-- Name: pattern uk_plmwg77e7f62fbvydxohxn4v9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT uk_plmwg77e7f62fbvydxohxn4v9 UNIQUE (uri);


--
-- TOC entry 3428 (class 2606 OID 18434)
-- Name: pattern_language uk_qd35crdvw857tcrg5topnhslc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_language
    ADD CONSTRAINT uk_qd35crdvw857tcrg5topnhslc UNIQUE (uri);


--
-- TOC entry 3368 (class 2606 OID 18512)
-- Name: undirected_edge undirected_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT undirected_edge_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 18514)
-- Name: undirected_hyperedge_patterns undirected_hyperedge_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT undirected_hyperedge_patterns_pkey PRIMARY KEY (undirected_hyperedge_id, patterns_id);


--
-- TOC entry 3484 (class 2606 OID 18516)
-- Name: undirected_hyperedge undirected_hyperedge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_hyperedge
    ADD CONSTRAINT undirected_hyperedge_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 18518)
-- Name: user_entity user_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT user_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 1259 OID 18399)
-- Name: p1patternidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX p1patternidx ON public.undirected_edge USING btree (p1_id);


--
-- TOC entry 3366 (class 1259 OID 18400)
-- Name: p2patternidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX p2patternidx ON public.undirected_edge USING btree (p2_id);


--
-- TOC entry 3371 (class 1259 OID 18401)
-- Name: sourcepatternidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sourcepatternidx ON public.directed_edge USING btree (source_id);


--
-- TOC entry 3372 (class 1259 OID 18402)
-- Name: targetpatternidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX targetpatternidx ON public.directed_edge USING btree (target_id);


--
-- TOC entry 3538 (class 2606 OID 18519)
-- Name: pattern_view_directed_edge fk3b7r2oi11ur1t7ugi1477imrp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT fk3b7r2oi11ur1t7ugi1477imrp FOREIGN KEY (directed_edge_id) REFERENCES public.directed_edge(id);


--
-- TOC entry 3520 (class 2606 OID 18524)
-- Name: design_model_undirected_edge fk3c78hgbc42y1nag5hbiec4mf8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT fk3c78hgbc42y1nag5hbiec4mf8 FOREIGN KEY (undirected_edge_id) REFERENCES public.undirected_edge(id);


--
-- TOC entry 3536 (class 2606 OID 18529)
-- Name: pattern_section fk3cvo9f0idatua01yg1n112wkq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section
    ADD CONSTRAINT fk3cvo9f0idatua01yg1n112wkq FOREIGN KEY (pattern_section_schema_id) REFERENCES public.pattern_section_schema(id);


--
-- TOC entry 3518 (class 2606 OID 18534)
-- Name: design_model_pattern_instance fk3n041q3n5smuaq4brv9fhf7br; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT fk3n041q3n5smuaq4brv9fhf7br FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


--
-- TOC entry 3527 (class 2606 OID 18539)
-- Name: issue_comment_rating fk3o0axm0t08m1p1fb94ucksys1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT fk3o0axm0t08m1p1fb94ucksys1 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3525 (class 2606 OID 18544)
-- Name: issue_comment fk3qe8erpdobc1yb6dk26nbhojp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT fk3qe8erpdobc1yb6dk26nbhojp FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3533 (class 2606 OID 18549)
-- Name: issue_rating fk3qnwbh69l8ihd5ms33nvo0n83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT fk3qnwbh69l8ihd5ms33nvo0n83 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3511 (class 2606 OID 18554)
-- Name: candidate_evidence_rating fk4erjjf0c3g5691pdu251ycya0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence_rating
    ADD CONSTRAINT fk4erjjf0c3g5691pdu251ycya0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3523 (class 2606 OID 18559)
-- Name: issue_author fk54ek3qt42c6okrhfyn363haxo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_author
    ADD CONSTRAINT fk54ek3qt42c6okrhfyn363haxo FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3494 (class 2606 OID 18564)
-- Name: pattern fk77ttqbiemowpyaxy1cc5k9is5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern
    ADD CONSTRAINT fk77ttqbiemowpyaxy1cc5k9is5 FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3540 (class 2606 OID 18569)
-- Name: pattern_view_pattern fk7gjr0y7vsqmnnsgohqgb5l7ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT fk7gjr0y7vsqmnnsgohqgb5l7ac FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3519 (class 2606 OID 18574)
-- Name: design_model_pattern_instance fk7rdcjjev6awr8jfvwoyi3cvml; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_instance
    ADD CONSTRAINT fk7rdcjjev6awr8jfvwoyi3cvml FOREIGN KEY (pattern_id) REFERENCES public.pattern(id);


--
-- TOC entry 3522 (class 2606 OID 18579)
-- Name: discussion_comment fk7st41tqwtxhelg9euc4y4qqm4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discussion_comment
    ADD CONSTRAINT fk7st41tqwtxhelg9euc4y4qqm4 FOREIGN KEY (discussion_topic_id) REFERENCES public.discussion_topic(id);


--
-- TOC entry 3531 (class 2606 OID 18584)
-- Name: issue_evidence_rating fk8g8u3v97wivak121r5oya1yge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence_rating
    ADD CONSTRAINT fk8g8u3v97wivak121r5oya1yge FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3497 (class 2606 OID 18589)
-- Name: directed_hyperedge_source_set fk8guwfrj62or1u8rwdwtf7y5yn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT fk8guwfrj62or1u8rwdwtf7y5yn FOREIGN KEY (source_set_id) REFERENCES public.pattern(id);


--
-- TOC entry 3493 (class 2606 OID 18594)
-- Name: candidate fk8s7x8de0d0upup60hkuggb86q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT fk8s7x8de0d0upup60hkuggb86q FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3487 (class 2606 OID 18599)
-- Name: undirected_edge fk8sqyicdi1e8n3neu2kueocol3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fk8sqyicdi1e8n3neu2kueocol3 FOREIGN KEY (p1_id) REFERENCES public.pattern(id);


--
-- TOC entry 3526 (class 2606 OID 18604)
-- Name: issue_comment fk8wy5rxggrte2ntcq80g7o7210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment
    ADD CONSTRAINT fk8wy5rxggrte2ntcq80g7o7210 FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3544 (class 2606 OID 18609)
-- Name: role_privileges fk9n2w8s3aw0yk00s4nmqvucw6b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk9n2w8s3aw0yk00s4nmqvucw6b FOREIGN KEY (roles_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- TOC entry 3545 (class 2606 OID 18614)
-- Name: role_privileges fkas5s9i1itvr8tgocse4xmtwox; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fkas5s9i1itvr8tgocse4xmtwox FOREIGN KEY (privileges_id) REFERENCES public.privilege(id) ON DELETE CASCADE;


--
-- TOC entry 3503 (class 2606 OID 18619)
-- Name: candidate_author fkbfl3nsrdehhb6w8j80hl4ut9n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_author
    ADD CONSTRAINT fkbfl3nsrdehhb6w8j80hl4ut9n FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3521 (class 2606 OID 18624)
-- Name: design_model_undirected_edge fkbu6vgj31dog8bhcfbhyw3dydq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_undirected_edge
    ADD CONSTRAINT fkbu6vgj31dog8bhcfbhyw3dydq FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


--
-- TOC entry 3529 (class 2606 OID 18629)
-- Name: issue_evidence fkcfioos21i8bvst7iu09ah1tw0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence
    ADD CONSTRAINT fkcfioos21i8bvst7iu09ah1tw0 FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3542 (class 2606 OID 18634)
-- Name: pattern_view_undirected_edge fkd1qjwyn88gn4jtpygu1kna7ht; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT fkd1qjwyn88gn4jtpygu1kna7ht FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3528 (class 2606 OID 18639)
-- Name: issue_comment_rating fkdpod2iog9jj6y5mitrw318sqj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_comment_rating
    ADD CONSTRAINT fkdpod2iog9jj6y5mitrw318sqj FOREIGN KEY (issue_comment_id) REFERENCES public.issue_comment(id);


--
-- TOC entry 3490 (class 2606 OID 18644)
-- Name: directed_edge fkdvt319vj8sqqs5q8cxa2mqam2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fkdvt319vj8sqqs5q8cxa2mqam2 FOREIGN KEY (source_id) REFERENCES public.pattern(id);


--
-- TOC entry 3541 (class 2606 OID 18649)
-- Name: pattern_view_pattern fke118qe89rm1swbs0f6ffs3wo8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_pattern
    ADD CONSTRAINT fke118qe89rm1swbs0f6ffs3wo8 FOREIGN KEY (pattern_id) REFERENCES public.pattern(id);


--
-- TOC entry 3530 (class 2606 OID 18654)
-- Name: issue_evidence fkecntesg5pf5cfhkg1ceyjprfn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence
    ADD CONSTRAINT fkecntesg5pf5cfhkg1ceyjprfn FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3495 (class 2606 OID 18659)
-- Name: pattern_section_schema_pattern_sections fkegwj4doqcp1wipgwb2l3komdn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT fkegwj4doqcp1wipgwb2l3komdn FOREIGN KEY (pattern_sections_id) REFERENCES public.pattern_section(id);


--
-- TOC entry 3546 (class 2606 OID 18664)
-- Name: user_entity_roles fkejo1ln9l1vbw4nhk416jjfc0d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity_roles
    ADD CONSTRAINT fkejo1ln9l1vbw4nhk416jjfc0d FOREIGN KEY (roles_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- TOC entry 3491 (class 2606 OID 18669)
-- Name: directed_edge fken29l6v8wmkqxaiaks7pe8rwu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fken29l6v8wmkqxaiaks7pe8rwu FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3496 (class 2606 OID 18674)
-- Name: pattern_section_schema_pattern_sections fkfafffrkwjwkpm4rus99ao5gvm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section_schema_pattern_sections
    ADD CONSTRAINT fkfafffrkwjwkpm4rus99ao5gvm FOREIGN KEY (pattern_section_schema_id) REFERENCES public.pattern_section_schema(id);


--
-- TOC entry 3535 (class 2606 OID 18679)
-- Name: pattern_schema fkfuru8632bnda9yj6he9aqffme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_schema
    ADD CONSTRAINT fkfuru8632bnda9yj6he9aqffme FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3507 (class 2606 OID 18684)
-- Name: candidate_comment_rating fkg7qo3nvneqg1ivvlt50123ss2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT fkg7qo3nvneqg1ivvlt50123ss2 FOREIGN KEY (candidate_comment_id) REFERENCES public.candidate_comment(id);


--
-- TOC entry 3508 (class 2606 OID 18689)
-- Name: candidate_comment_rating fkg8j63smj6n8rh6kr8tp3nfdix; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment_rating
    ADD CONSTRAINT fkg8j63smj6n8rh6kr8tp3nfdix FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3505 (class 2606 OID 18694)
-- Name: candidate_comment fkgl0y3i6y5dd9c8psdu7mp7xqy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT fkgl0y3i6y5dd9c8psdu7mp7xqy FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3501 (class 2606 OID 18699)
-- Name: directed_hyperedge_target_set fkhl9yorn5wev3m5ooqrlq3ufxg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT fkhl9yorn5wev3m5ooqrlq3ufxg FOREIGN KEY (target_set_id) REFERENCES public.pattern(id);


--
-- TOC entry 3515 (class 2606 OID 18704)
-- Name: design_model_pattern_edge fkhx1ynl2ovjddccjvxnjytl2n9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fkhx1ynl2ovjddccjvxnjytl2n9 FOREIGN KEY (pattern_instance1_pattern_instance_id) REFERENCES public.design_model_pattern_instance(pattern_instance_id);


--
-- TOC entry 3543 (class 2606 OID 18709)
-- Name: pattern_view_undirected_edge fki4vnsjoalbiwx4yr4thn4ya87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_undirected_edge
    ADD CONSTRAINT fki4vnsjoalbiwx4yr4thn4ya87 FOREIGN KEY (undirected_edge_id) REFERENCES public.undirected_edge(id);


--
-- TOC entry 3509 (class 2606 OID 18714)
-- Name: candidate_evidence fkis7bj3j03jdbb39017ecvgm7x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence
    ADD CONSTRAINT fkis7bj3j03jdbb39017ecvgm7x FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3532 (class 2606 OID 18719)
-- Name: issue_evidence_rating fkisufpmc8wbnifd1vbawqsqnqk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_evidence_rating
    ADD CONSTRAINT fkisufpmc8wbnifd1vbawqsqnqk FOREIGN KEY (issue_evidence_id) REFERENCES public.issue_evidence(id);


--
-- TOC entry 3502 (class 2606 OID 18724)
-- Name: directed_hyperedge_target_set fkjoimrxph588139toilxf57uy2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_target_set
    ADD CONSTRAINT fkjoimrxph588139toilxf57uy2 FOREIGN KEY (directed_hyperedge_id) REFERENCES public.directed_hyperedge(id);


--
-- TOC entry 3488 (class 2606 OID 18729)
-- Name: undirected_edge fkjos3a1eebvu6hbrbls6wpoygt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fkjos3a1eebvu6hbrbls6wpoygt FOREIGN KEY (p2_id) REFERENCES public.pattern(id);


--
-- TOC entry 3547 (class 2606 OID 18734)
-- Name: user_entity_roles fkjvvinok3stf32dvgie3vr73s0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity_roles
    ADD CONSTRAINT fkjvvinok3stf32dvgie3vr73s0 FOREIGN KEY (users_id) REFERENCES public.user_entity(id) ON DELETE CASCADE;


--
-- TOC entry 3506 (class 2606 OID 18739)
-- Name: candidate_comment fkjwq8pmpyru6a87cukgmvo0q93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_comment
    ADD CONSTRAINT fkjwq8pmpyru6a87cukgmvo0q93 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3534 (class 2606 OID 18744)
-- Name: issue_rating fkky82wgp632e04u03hksxeg1ww; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_rating
    ADD CONSTRAINT fkky82wgp632e04u03hksxeg1ww FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3539 (class 2606 OID 18749)
-- Name: pattern_view_directed_edge fkl97vn4so04u3ab22i5nv72q6e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_view_directed_edge
    ADD CONSTRAINT fkl97vn4so04u3ab22i5nv72q6e FOREIGN KEY (pattern_view_id) REFERENCES public.pattern_view(id);


--
-- TOC entry 3510 (class 2606 OID 18754)
-- Name: candidate_evidence fkmmqb3cbkh76kkqagse54w8pjg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence
    ADD CONSTRAINT fkmmqb3cbkh76kkqagse54w8pjg FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3504 (class 2606 OID 18759)
-- Name: candidate_author fkomnh9dj5oi403hegu6aoh4l09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_author
    ADD CONSTRAINT fkomnh9dj5oi403hegu6aoh4l09 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3516 (class 2606 OID 18764)
-- Name: design_model_pattern_edge fkoy98b1qvknikypxgc0jcj0xtc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fkoy98b1qvknikypxgc0jcj0xtc FOREIGN KEY (pattern_instance2_pattern_instance_id) REFERENCES public.design_model_pattern_instance(pattern_instance_id);


--
-- TOC entry 3513 (class 2606 OID 18769)
-- Name: candidate_rating fkp3b3ukrra2u0sysqcwlv4klkn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT fkp3b3ukrra2u0sysqcwlv4klkn FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3492 (class 2606 OID 18774)
-- Name: directed_edge fkq14jnn8mw3w8t1qo9lgtcpk9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_edge
    ADD CONSTRAINT fkq14jnn8mw3w8t1qo9lgtcpk9e FOREIGN KEY (target_id) REFERENCES public.pattern(id);


--
-- TOC entry 3514 (class 2606 OID 18779)
-- Name: candidate_rating fkqbpga562vdylosfny7pjviddq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_rating
    ADD CONSTRAINT fkqbpga562vdylosfny7pjviddq FOREIGN KEY (candidate_id) REFERENCES public.candidate(id);


--
-- TOC entry 3512 (class 2606 OID 18784)
-- Name: candidate_evidence_rating fkreuu2xhi0twx00r3umc2ydem0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_evidence_rating
    ADD CONSTRAINT fkreuu2xhi0twx00r3umc2ydem0 FOREIGN KEY (candidate_evidence_id) REFERENCES public.candidate_evidence(id);


--
-- TOC entry 3537 (class 2606 OID 18789)
-- Name: pattern_section_schema fkrie76ldgkhkbs3cug3kkvmkcd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pattern_section_schema
    ADD CONSTRAINT fkrie76ldgkhkbs3cug3kkvmkcd FOREIGN KEY (pattern_schema_pattern_language_id) REFERENCES public.pattern_schema(pattern_language_id);


--
-- TOC entry 3524 (class 2606 OID 18794)
-- Name: issue_author fksb3voy79n2pxtey1bx4jw64bt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_author
    ADD CONSTRAINT fksb3voy79n2pxtey1bx4jw64bt FOREIGN KEY (issue_id) REFERENCES public.issue(id);


--
-- TOC entry 3499 (class 2606 OID 18799)
-- Name: undirected_hyperedge_patterns fksv0r49fdkcsiv4gg4qgg5t6w0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT fksv0r49fdkcsiv4gg4qgg5t6w0 FOREIGN KEY (undirected_hyperedge_id) REFERENCES public.undirected_hyperedge(id);


--
-- TOC entry 3498 (class 2606 OID 18804)
-- Name: directed_hyperedge_source_set fksyqyvo4dr6pj2mdofd5drosdm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directed_hyperedge_source_set
    ADD CONSTRAINT fksyqyvo4dr6pj2mdofd5drosdm FOREIGN KEY (directed_hyperedge_id) REFERENCES public.directed_hyperedge(id);


--
-- TOC entry 3500 (class 2606 OID 18809)
-- Name: undirected_hyperedge_patterns fkt25wk8gkit4hr7oyee2prm48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_hyperedge_patterns
    ADD CONSTRAINT fkt25wk8gkit4hr7oyee2prm48 FOREIGN KEY (patterns_id) REFERENCES public.pattern(id);


--
-- TOC entry 3489 (class 2606 OID 18814)
-- Name: undirected_edge fkt73wgqcqh5u6ro109oq15dh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.undirected_edge
    ADD CONSTRAINT fkt73wgqcqh5u6ro109oq15dh9v FOREIGN KEY (pattern_language_id) REFERENCES public.pattern_language(id);


--
-- TOC entry 3517 (class 2606 OID 18819)
-- Name: design_model_pattern_edge fktmrf8lhrt4fpnh9jwdlpk1iae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_model_pattern_edge
    ADD CONSTRAINT fktmrf8lhrt4fpnh9jwdlpk1iae FOREIGN KEY (design_model_id) REFERENCES public.design_model(id);


-- Completed on 2023-10-24 20:46:20

--
-- PostgreSQL database dump complete
--

