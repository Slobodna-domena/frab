--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Ubuntu 15.13-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.13 (Ubuntu 15.13-1.pgdg20.04+1)

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

ALTER TABLE IF EXISTS ONLY public.average_review_scores DROP CONSTRAINT IF EXISTS fk_rails_cc0342dd94;
ALTER TABLE IF EXISTS ONLY public.review_scores DROP CONSTRAINT IF EXISTS fk_rails_ca46ca83a6;
ALTER TABLE IF EXISTS ONLY public.average_review_scores DROP CONSTRAINT IF EXISTS fk_rails_c64b4110e5;
ALTER TABLE IF EXISTS ONLY public.event_translations DROP CONSTRAINT IF EXISTS fk_rails_701fae2cdc;
ALTER TABLE IF EXISTS ONLY public.event_classifiers DROP CONSTRAINT IF EXISTS fk_rails_4f07c18996;
ALTER TABLE IF EXISTS ONLY public.classifiers DROP CONSTRAINT IF EXISTS fk_rails_46d7301c65;
ALTER TABLE IF EXISTS ONLY public.track_translations DROP CONSTRAINT IF EXISTS fk_rails_2b6e3a02c0;
ALTER TABLE IF EXISTS ONLY public.person_translations DROP CONSTRAINT IF EXISTS fk_rails_1e25922b3b;
ALTER TABLE IF EXISTS ONLY public.event_classifiers DROP CONSTRAINT IF EXISTS fk_rails_09a512c9c4;
ALTER TABLE IF EXISTS ONLY public.review_metrics DROP CONSTRAINT IF EXISTS fk_rails_07d5b7fd35;
ALTER TABLE IF EXISTS ONLY public.review_scores DROP CONSTRAINT IF EXISTS fk_rails_00219acb6b;
DROP INDEX IF EXISTS public.index_versions_on_item_type_and_item_id;
DROP INDEX IF EXISTS public.index_users_on_unlock_token;
DROP INDEX IF EXISTS public.index_users_on_reset_password_token;
DROP INDEX IF EXISTS public.index_users_on_email;
DROP INDEX IF EXISTS public.index_users_on_confirmation_token;
DROP INDEX IF EXISTS public.index_transport_needs_on_person_id;
DROP INDEX IF EXISTS public.index_transport_needs_on_conference_id;
DROP INDEX IF EXISTS public.index_tracks_on_conference_id;
DROP INDEX IF EXISTS public.index_track_translations_on_track_id_and_locale;
DROP INDEX IF EXISTS public.index_track_translations_on_locale;
DROP INDEX IF EXISTS public.index_tickets_on_object_id;
DROP INDEX IF EXISTS public.index_sessions_on_updated_at;
DROP INDEX IF EXISTS public.index_sessions_on_session_id;
DROP INDEX IF EXISTS public.index_rooms_on_conference_id;
DROP INDEX IF EXISTS public.index_review_scores_on_review_metric_id;
DROP INDEX IF EXISTS public.index_review_scores_on_event_rating_id;
DROP INDEX IF EXISTS public.index_review_metrics_on_name_and_conference_id;
DROP INDEX IF EXISTS public.index_review_metrics_on_conference_id;
DROP INDEX IF EXISTS public.index_phone_numbers_on_person_id;
DROP INDEX IF EXISTS public.index_person_translations_on_person_id_and_locale;
DROP INDEX IF EXISTS public.index_person_translations_on_locale;
DROP INDEX IF EXISTS public.index_people_on_user_id;
DROP INDEX IF EXISTS public.index_people_on_email;
DROP INDEX IF EXISTS public.index_mail_templates_on_conference_id;
DROP INDEX IF EXISTS public.index_links_on_linkable_id;
DROP INDEX IF EXISTS public.index_languages_on_attachable_id;
DROP INDEX IF EXISTS public.index_im_accounts_on_person_id;
DROP INDEX IF EXISTS public.index_expenses_on_person_id;
DROP INDEX IF EXISTS public.index_expenses_on_conference_id;
DROP INDEX IF EXISTS public.index_events_on_type;
DROP INDEX IF EXISTS public.index_events_on_state;
DROP INDEX IF EXISTS public.index_events_on_invite_token;
DROP INDEX IF EXISTS public.index_events_on_guid;
DROP INDEX IF EXISTS public.index_events_on_conference_id;
DROP INDEX IF EXISTS public.index_event_translations_on_locale;
DROP INDEX IF EXISTS public.index_event_translations_on_event_id_and_locale;
DROP INDEX IF EXISTS public.index_event_ratings_on_person_id;
DROP INDEX IF EXISTS public.index_event_ratings_on_event_id;
DROP INDEX IF EXISTS public.index_event_people_on_person_id;
DROP INDEX IF EXISTS public.index_event_people_on_event_id;
DROP INDEX IF EXISTS public.index_event_feedbacks_on_event_id;
DROP INDEX IF EXISTS public.index_event_classifiers_on_event_id;
DROP INDEX IF EXISTS public.index_event_classifiers_on_classifier_id;
DROP INDEX IF EXISTS public.index_event_attachments_on_event_id;
DROP INDEX IF EXISTS public.index_days_on_conference;
DROP INDEX IF EXISTS public.index_conflicts_on_person_id;
DROP INDEX IF EXISTS public.index_conflicts_on_event_id;
DROP INDEX IF EXISTS public.index_conferences_on_parent_id;
DROP INDEX IF EXISTS public.index_conferences_on_acronym;
DROP INDEX IF EXISTS public.index_conference_users_on_user_id;
DROP INDEX IF EXISTS public.index_conference_users_on_conference_id;
DROP INDEX IF EXISTS public.index_conference_exports_on_conference_id;
DROP INDEX IF EXISTS public.index_classifiers_on_conference_id;
DROP INDEX IF EXISTS public.index_call_for_papers_on_dates;
DROP INDEX IF EXISTS public.index_average_review_scores_on_review_metric_id;
DROP INDEX IF EXISTS public.index_average_review_scores_on_event_id_and_review_metric_id;
DROP INDEX IF EXISTS public.index_average_review_scores_on_event_id;
DROP INDEX IF EXISTS public.index_availabilities_on_person_id;
DROP INDEX IF EXISTS public.index_availabilities_on_conference_id;
ALTER TABLE IF EXISTS ONLY public.versions DROP CONSTRAINT IF EXISTS versions_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_adapters DROP CONSTRAINT IF EXISTS user_adapters_pkey;
ALTER TABLE IF EXISTS ONLY public.user_adapter DROP CONSTRAINT IF EXISTS user_adapter_pkey;
ALTER TABLE IF EXISTS ONLY public.transport_needs DROP CONSTRAINT IF EXISTS transport_needs_pkey;
ALTER TABLE IF EXISTS ONLY public.tracks DROP CONSTRAINT IF EXISTS tracks_pkey;
ALTER TABLE IF EXISTS ONLY public.track_translations DROP CONSTRAINT IF EXISTS track_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.tickets DROP CONSTRAINT IF EXISTS tickets_pkey;
ALTER TABLE IF EXISTS ONLY public.ticket_servers DROP CONSTRAINT IF EXISTS ticket_servers_pkey;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.rooms DROP CONSTRAINT IF EXISTS rooms_pkey;
ALTER TABLE IF EXISTS ONLY public.review_scores DROP CONSTRAINT IF EXISTS review_scores_pkey;
ALTER TABLE IF EXISTS ONLY public.review_metrics DROP CONSTRAINT IF EXISTS review_metrics_pkey;
ALTER TABLE IF EXISTS ONLY public.phone_numbers DROP CONSTRAINT IF EXISTS phone_numbers_pkey;
ALTER TABLE IF EXISTS ONLY public.person_translations DROP CONSTRAINT IF EXISTS person_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.people DROP CONSTRAINT IF EXISTS people_pkey;
ALTER TABLE IF EXISTS ONLY public.papers DROP CONSTRAINT IF EXISTS papers_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.mail_templates DROP CONSTRAINT IF EXISTS mail_templates_pkey;
ALTER TABLE IF EXISTS ONLY public.links DROP CONSTRAINT IF EXISTS links_pkey;
ALTER TABLE IF EXISTS ONLY public.languages DROP CONSTRAINT IF EXISTS languages_pkey;
ALTER TABLE IF EXISTS ONLY public.im_accounts DROP CONSTRAINT IF EXISTS im_accounts_pkey;
ALTER TABLE IF EXISTS ONLY public.grades DROP CONSTRAINT IF EXISTS grades_pkey;
ALTER TABLE IF EXISTS ONLY public.expenses DROP CONSTRAINT IF EXISTS expenses_pkey;
ALTER TABLE IF EXISTS ONLY public.events DROP CONSTRAINT IF EXISTS events_pkey;
ALTER TABLE IF EXISTS ONLY public.event_translations DROP CONSTRAINT IF EXISTS event_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.event_ratings DROP CONSTRAINT IF EXISTS event_ratings_pkey;
ALTER TABLE IF EXISTS ONLY public.event_people DROP CONSTRAINT IF EXISTS event_people_pkey;
ALTER TABLE IF EXISTS ONLY public.event_feedbacks DROP CONSTRAINT IF EXISTS event_feedbacks_pkey;
ALTER TABLE IF EXISTS ONLY public.event_classifiers DROP CONSTRAINT IF EXISTS event_classifiers_pkey;
ALTER TABLE IF EXISTS ONLY public.event_attachments DROP CONSTRAINT IF EXISTS event_attachments_pkey;
ALTER TABLE IF EXISTS ONLY public.days DROP CONSTRAINT IF EXISTS days_pkey;
ALTER TABLE IF EXISTS ONLY public.conflicts DROP CONSTRAINT IF EXISTS conflicts_pkey;
ALTER TABLE IF EXISTS ONLY public.conferences DROP CONSTRAINT IF EXISTS conferences_pkey;
ALTER TABLE IF EXISTS ONLY public.conference_users DROP CONSTRAINT IF EXISTS conference_users_pkey;
ALTER TABLE IF EXISTS ONLY public.conference_exports DROP CONSTRAINT IF EXISTS conference_exports_pkey;
ALTER TABLE IF EXISTS ONLY public.classifiers DROP CONSTRAINT IF EXISTS classifiers_pkey;
ALTER TABLE IF EXISTS ONLY public.call_for_participations DROP CONSTRAINT IF EXISTS call_for_participations_pkey;
ALTER TABLE IF EXISTS ONLY public.average_review_scores DROP CONSTRAINT IF EXISTS average_review_scores_pkey;
ALTER TABLE IF EXISTS ONLY public.availabilities DROP CONSTRAINT IF EXISTS availabilities_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
ALTER TABLE IF EXISTS public.versions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_adapters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_adapter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.transport_needs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tracks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.track_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tickets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ticket_servers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.review_scores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.review_metrics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.phone_numbers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.person_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.people ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.papers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mail_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.links ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.languages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.im_accounts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.grades ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.expenses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_ratings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_people ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_feedbacks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_classifiers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.event_attachments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.days ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conflicts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conferences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conference_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conference_exports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.classifiers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.call_for_participations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.average_review_scores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.availabilities ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.versions_id_seq;
DROP TABLE IF EXISTS public.versions;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.user_adapters_id_seq;
DROP TABLE IF EXISTS public.user_adapters;
DROP SEQUENCE IF EXISTS public.user_adapter_id_seq;
DROP TABLE IF EXISTS public.user_adapter;
DROP SEQUENCE IF EXISTS public.transport_needs_id_seq;
DROP TABLE IF EXISTS public.transport_needs;
DROP SEQUENCE IF EXISTS public.tracks_id_seq;
DROP TABLE IF EXISTS public.tracks;
DROP SEQUENCE IF EXISTS public.track_translations_id_seq;
DROP TABLE IF EXISTS public.track_translations;
DROP SEQUENCE IF EXISTS public.tickets_id_seq;
DROP TABLE IF EXISTS public.tickets;
DROP SEQUENCE IF EXISTS public.ticket_servers_id_seq;
DROP TABLE IF EXISTS public.ticket_servers;
DROP SEQUENCE IF EXISTS public.sessions_id_seq;
DROP TABLE IF EXISTS public.sessions;
DROP TABLE IF EXISTS public.schema_migrations;
DROP SEQUENCE IF EXISTS public.rooms_id_seq;
DROP TABLE IF EXISTS public.rooms;
DROP SEQUENCE IF EXISTS public.review_scores_id_seq;
DROP TABLE IF EXISTS public.review_scores;
DROP SEQUENCE IF EXISTS public.review_metrics_id_seq;
DROP TABLE IF EXISTS public.review_metrics;
DROP SEQUENCE IF EXISTS public.phone_numbers_id_seq;
DROP TABLE IF EXISTS public.phone_numbers;
DROP SEQUENCE IF EXISTS public.person_translations_id_seq;
DROP TABLE IF EXISTS public.person_translations;
DROP SEQUENCE IF EXISTS public.people_id_seq;
DROP TABLE IF EXISTS public.people;
DROP SEQUENCE IF EXISTS public.papers_id_seq;
DROP TABLE IF EXISTS public.papers;
DROP SEQUENCE IF EXISTS public.notifications_id_seq;
DROP TABLE IF EXISTS public.notifications;
DROP SEQUENCE IF EXISTS public.mail_templates_id_seq;
DROP TABLE IF EXISTS public.mail_templates;
DROP SEQUENCE IF EXISTS public.links_id_seq;
DROP TABLE IF EXISTS public.links;
DROP SEQUENCE IF EXISTS public.languages_id_seq;
DROP TABLE IF EXISTS public.languages;
DROP SEQUENCE IF EXISTS public.im_accounts_id_seq;
DROP TABLE IF EXISTS public.im_accounts;
DROP SEQUENCE IF EXISTS public.grades_id_seq;
DROP TABLE IF EXISTS public.grades;
DROP SEQUENCE IF EXISTS public.expenses_id_seq;
DROP TABLE IF EXISTS public.expenses;
DROP SEQUENCE IF EXISTS public.events_id_seq;
DROP TABLE IF EXISTS public.events;
DROP SEQUENCE IF EXISTS public.event_translations_id_seq;
DROP TABLE IF EXISTS public.event_translations;
DROP SEQUENCE IF EXISTS public.event_ratings_id_seq;
DROP TABLE IF EXISTS public.event_ratings;
DROP SEQUENCE IF EXISTS public.event_people_id_seq;
DROP TABLE IF EXISTS public.event_people;
DROP SEQUENCE IF EXISTS public.event_feedbacks_id_seq;
DROP TABLE IF EXISTS public.event_feedbacks;
DROP SEQUENCE IF EXISTS public.event_classifiers_id_seq;
DROP TABLE IF EXISTS public.event_classifiers;
DROP SEQUENCE IF EXISTS public.event_attachments_id_seq;
DROP TABLE IF EXISTS public.event_attachments;
DROP SEQUENCE IF EXISTS public.days_id_seq;
DROP TABLE IF EXISTS public.days;
DROP SEQUENCE IF EXISTS public.conflicts_id_seq;
DROP TABLE IF EXISTS public.conflicts;
DROP SEQUENCE IF EXISTS public.conferences_id_seq;
DROP TABLE IF EXISTS public.conferences;
DROP SEQUENCE IF EXISTS public.conference_users_id_seq;
DROP TABLE IF EXISTS public.conference_users;
DROP SEQUENCE IF EXISTS public.conference_exports_id_seq;
DROP TABLE IF EXISTS public.conference_exports;
DROP SEQUENCE IF EXISTS public.classifiers_id_seq;
DROP TABLE IF EXISTS public.classifiers;
DROP SEQUENCE IF EXISTS public.call_for_participations_id_seq;
DROP TABLE IF EXISTS public.call_for_participations;
DROP SEQUENCE IF EXISTS public.average_review_scores_id_seq;
DROP TABLE IF EXISTS public.average_review_scores;
DROP SEQUENCE IF EXISTS public.availabilities_id_seq;
DROP TABLE IF EXISTS public.availabilities;
DROP TABLE IF EXISTS public.ar_internal_metadata;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.availabilities (
    id bigint NOT NULL,
    person_id integer,
    conference_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    day_id integer
);


--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.availabilities_id_seq OWNED BY public.availabilities.id;


--
-- Name: average_review_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.average_review_scores (
    id bigint NOT NULL,
    event_id bigint,
    review_metric_id bigint,
    score double precision
);


--
-- Name: average_review_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.average_review_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: average_review_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.average_review_scores_id_seq OWNED BY public.average_review_scores.id;


--
-- Name: call_for_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.call_for_participations (
    id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    hard_deadline date,
    welcome_text text,
    conference_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    info_url character varying,
    contact_email character varying
);


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.call_for_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.call_for_participations_id_seq OWNED BY public.call_for_participations.id;


--
-- Name: classifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classifiers (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    conference_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: classifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classifiers_id_seq OWNED BY public.classifiers.id;


--
-- Name: conference_exports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conference_exports (
    id bigint NOT NULL,
    locale character varying,
    conference_id bigint,
    tarball_file_name character varying,
    tarball_content_type character varying,
    tarball_file_size integer,
    tarball_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: conference_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conference_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conference_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conference_exports_id_seq OWNED BY public.conference_exports.id;


--
-- Name: conference_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conference_users (
    id bigint NOT NULL,
    role character varying,
    user_id bigint,
    conference_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: conference_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conference_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conference_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conference_users_id_seq OWNED BY public.conference_users.id;


--
-- Name: conferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conferences (
    id bigint NOT NULL,
    acronym character varying NOT NULL,
    title character varying NOT NULL,
    timezone character varying DEFAULT 'Berlin'::character varying NOT NULL,
    timeslot_duration integer DEFAULT 15 NOT NULL,
    default_timeslots integer DEFAULT 3 NOT NULL,
    max_timeslots integer DEFAULT 20 NOT NULL,
    feedback_enabled boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    program_export_base_url character varying,
    schedule_version character varying,
    schedule_public boolean DEFAULT false NOT NULL,
    color character varying,
    ticket_type character varying DEFAULT 'integrated'::character varying,
    event_state_visible boolean DEFAULT true,
    schedule_custom_css text,
    schedule_html_intro text,
    default_recording_license character varying,
    expenses_enabled boolean DEFAULT false NOT NULL,
    transport_needs_enabled boolean DEFAULT false NOT NULL,
    parent_id bigint,
    bulk_notification_enabled boolean DEFAULT false NOT NULL,
    logo_file_name character varying,
    logo_content_type character varying,
    logo_file_size bigint,
    logo_updated_at timestamp without time zone,
    schedule_open boolean DEFAULT false NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    attachment_title_is_freeform boolean DEFAULT true,
    allowed_event_types character varying DEFAULT 'lecture;workshop;podium;lightning_talk;meeting;film;concert;djset;performance;other'::character varying,
    allowed_event_timeslots_csv character varying(400),
    bcc_address character varying(255),
    mail_sent integer[] DEFAULT '{}'::integer[]
);


--
-- Name: conferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conferences_id_seq OWNED BY public.conferences.id;


--
-- Name: conflicts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conflicts (
    id bigint NOT NULL,
    event_id integer,
    conflicting_event_id integer,
    person_id integer,
    conflict_type character varying,
    severity character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: conflicts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conflicts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conflicts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conflicts_id_seq OWNED BY public.conflicts.id;


--
-- Name: days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.days (
    id bigint NOT NULL,
    conference_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


--
-- Name: days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.days_id_seq OWNED BY public.days.id;


--
-- Name: event_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_attachments (
    id bigint NOT NULL,
    event_id integer NOT NULL,
    title character varying NOT NULL,
    attachment_file_name character varying,
    attachment_content_type character varying,
    attachment_file_size integer,
    attachment_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    public boolean DEFAULT true
);


--
-- Name: event_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_attachments_id_seq OWNED BY public.event_attachments.id;


--
-- Name: event_classifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_classifiers (
    id bigint NOT NULL,
    value integer DEFAULT 0,
    classifier_id bigint,
    event_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_classifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_classifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_classifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_classifiers_id_seq OWNED BY public.event_classifiers.id;


--
-- Name: event_feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_feedbacks (
    id bigint NOT NULL,
    event_id integer,
    rating double precision,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_feedbacks_id_seq OWNED BY public.event_feedbacks.id;


--
-- Name: event_people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_people (
    id bigint NOT NULL,
    event_id integer NOT NULL,
    person_id integer NOT NULL,
    event_role character varying DEFAULT 'submitter'::character varying NOT NULL,
    role_state character varying,
    comment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmation_token character varying,
    notification_subject character varying(255),
    notification_body text
);


--
-- Name: event_people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_people_id_seq OWNED BY public.event_people.id;


--
-- Name: event_ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_ratings (
    id bigint NOT NULL,
    event_id integer,
    person_id integer,
    rating double precision,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    peer boolean DEFAULT false
);


--
-- Name: event_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_ratings_id_seq OWNED BY public.event_ratings.id;


--
-- Name: event_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_translations (
    id bigint NOT NULL,
    title character varying,
    subtitle character varying,
    abstract text,
    description text,
    locale character varying NOT NULL,
    event_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_translations_id_seq OWNED BY public.event_translations.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    conference_id integer NOT NULL,
    title character varying,
    subtitle character varying,
    event_type character varying DEFAULT 'talk'::character varying,
    time_slots integer DEFAULT 3,
    state character varying DEFAULT 'new'::character varying NOT NULL,
    language character varying,
    start_time timestamp without time zone,
    abstract text,
    description text,
    public boolean DEFAULT true,
    logo_file_name character varying,
    logo_content_type character varying,
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    track_id integer,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    average_rating double precision,
    event_ratings_count integer DEFAULT 0,
    note text,
    submission_note text,
    speaker_count integer DEFAULT 0,
    event_feedbacks_count integer DEFAULT 0,
    average_feedback double precision,
    guid character varying,
    do_not_record boolean DEFAULT false,
    recording_license character varying,
    tech_rider text,
    invite_token character varying,
    video_url character varying(255),
    coauthors text,
    coauthor_1 character varying,
    coauthor_2 character varying,
    coauthor_3 character varying,
    coauthor_4 character varying,
    coauthor_5 character varying,
    coauthor_1_name character varying,
    coauthor_1_last_name character varying,
    coauthor_2_name character varying,
    coauthor_2_last_name character varying,
    coauthor_3_name character varying,
    coauthor_3_last_name character varying,
    coauthor_4_name character varying,
    coauthor_4_last_name character varying,
    coauthor_5_name character varying,
    coauthor_5_last_name character varying
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expenses (
    id bigint NOT NULL,
    name character varying,
    value numeric(9,4),
    reimbursed boolean,
    person_id bigint,
    conference_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grades (
    id bigint NOT NULL,
    user_id integer,
    paper_id integer,
    value integer,
    note text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: im_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.im_accounts (
    id bigint NOT NULL,
    person_id integer,
    im_type character varying,
    im_address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: im_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.im_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: im_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.im_accounts_id_seq OWNED BY public.im_accounts.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    code character varying,
    attachable_id integer,
    attachable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    title character varying NOT NULL,
    url character varying NOT NULL,
    linkable_id integer NOT NULL,
    linkable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: mail_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mail_templates (
    id bigint NOT NULL,
    conference_id bigint,
    name character varying,
    subject character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mail_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mail_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mail_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mail_templates_id_seq OWNED BY public.mail_templates.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    locale character varying,
    accept_subject character varying,
    reject_subject character varying,
    accept_body text,
    reject_body text,
    conference_id integer,
    schedule_subject character varying(255),
    schedule_body text
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: papers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.papers (
    id bigint NOT NULL,
    event_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: papers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.papers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: papers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.papers_id_seq OWNED BY public.papers.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people (
    id bigint NOT NULL,
    first_name character varying DEFAULT ''::character varying,
    last_name character varying DEFAULT ''::character varying,
    public_name character varying NOT NULL,
    email character varying NOT NULL,
    email_public boolean DEFAULT true,
    gender character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    abstract text,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    note text,
    include_in_mailings boolean DEFAULT false NOT NULL,
    use_gravatar boolean DEFAULT false NOT NULL
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: person_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person_translations (
    id bigint NOT NULL,
    abstract text,
    description text,
    locale character varying NOT NULL,
    person_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: person_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.person_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.person_translations_id_seq OWNED BY public.person_translations.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phone_numbers (
    id bigint NOT NULL,
    person_id integer,
    phone_type character varying,
    phone_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phone_numbers_id_seq OWNED BY public.phone_numbers.id;


--
-- Name: review_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.review_metrics (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    conference_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: review_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.review_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: review_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.review_metrics_id_seq OWNED BY public.review_metrics.id;


--
-- Name: review_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.review_scores (
    id bigint NOT NULL,
    event_rating_id bigint,
    review_metric_id bigint,
    score integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: review_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.review_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: review_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.review_scores_id_seq OWNED BY public.review_scores.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    conference_id integer NOT NULL,
    name character varying NOT NULL,
    size integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rank integer
);


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    session_id character varying NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: ticket_servers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_servers (
    id bigint NOT NULL,
    conference_id integer NOT NULL,
    url character varying,
    "user" character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    queue character varying
);


--
-- Name: ticket_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_servers_id_seq OWNED BY public.ticket_servers.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    object_id integer NOT NULL,
    remote_ticket_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    object_type character varying
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: track_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.track_translations (
    id bigint NOT NULL,
    name character varying,
    locale character varying NOT NULL,
    track_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: track_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.track_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: track_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.track_translations_id_seq OWNED BY public.track_translations.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tracks (
    id bigint NOT NULL,
    conference_id integer,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying DEFAULT 'fefd7f'::character varying
);


--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- Name: transport_needs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_needs (
    id bigint NOT NULL,
    person_id bigint,
    conference_id bigint,
    at timestamp without time zone,
    transport_type character varying,
    seats integer,
    booked boolean,
    note text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transport_needs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_needs_id_seq OWNED BY public.transport_needs.id;


--
-- Name: user_adapter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_adapter (
    id bigint NOT NULL,
    number_of_papers_evaluated integer DEFAULT 0 NOT NULL,
    papers_evaluated integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    papers_array integer[] DEFAULT '{}'::integer[]
);


--
-- Name: user_adapter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_adapter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_adapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_adapter_id_seq OWNED BY public.user_adapter.id;


--
-- Name: user_adapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_adapters (
    id bigint NOT NULL,
    number_of_papers_evaluated integer DEFAULT 0 NOT NULL,
    papers_evaluated integer[] DEFAULT '{}'::integer[] NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    skipped integer[] DEFAULT '{}'::integer[],
    accepted integer[] DEFAULT '{}'::integer[],
    paid boolean DEFAULT false
);


--
-- Name: user_adapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_adapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_adapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_adapters_id_seq OWNED BY public.user_adapters.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    remember_created_at timestamp without time zone,
    remember_token character varying,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role character varying DEFAULT 'submitter'::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    provider character varying,
    uid character varying,
    gdpr boolean
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone,
    conference_id integer,
    associated_id integer,
    associated_type character varying,
    object_changes text
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.availabilities ALTER COLUMN id SET DEFAULT nextval('public.availabilities_id_seq'::regclass);


--
-- Name: average_review_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.average_review_scores ALTER COLUMN id SET DEFAULT nextval('public.average_review_scores_id_seq'::regclass);


--
-- Name: call_for_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_for_participations ALTER COLUMN id SET DEFAULT nextval('public.call_for_participations_id_seq'::regclass);


--
-- Name: classifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classifiers ALTER COLUMN id SET DEFAULT nextval('public.classifiers_id_seq'::regclass);


--
-- Name: conference_exports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_exports ALTER COLUMN id SET DEFAULT nextval('public.conference_exports_id_seq'::regclass);


--
-- Name: conference_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_users ALTER COLUMN id SET DEFAULT nextval('public.conference_users_id_seq'::regclass);


--
-- Name: conferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conferences ALTER COLUMN id SET DEFAULT nextval('public.conferences_id_seq'::regclass);


--
-- Name: conflicts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflicts ALTER COLUMN id SET DEFAULT nextval('public.conflicts_id_seq'::regclass);


--
-- Name: days id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days ALTER COLUMN id SET DEFAULT nextval('public.days_id_seq'::regclass);


--
-- Name: event_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_attachments ALTER COLUMN id SET DEFAULT nextval('public.event_attachments_id_seq'::regclass);


--
-- Name: event_classifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_classifiers ALTER COLUMN id SET DEFAULT nextval('public.event_classifiers_id_seq'::regclass);


--
-- Name: event_feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_feedbacks ALTER COLUMN id SET DEFAULT nextval('public.event_feedbacks_id_seq'::regclass);


--
-- Name: event_people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_people ALTER COLUMN id SET DEFAULT nextval('public.event_people_id_seq'::regclass);


--
-- Name: event_ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_ratings ALTER COLUMN id SET DEFAULT nextval('public.event_ratings_id_seq'::regclass);


--
-- Name: event_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_translations ALTER COLUMN id SET DEFAULT nextval('public.event_translations_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Name: im_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.im_accounts ALTER COLUMN id SET DEFAULT nextval('public.im_accounts_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: mail_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mail_templates ALTER COLUMN id SET DEFAULT nextval('public.mail_templates_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: papers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.papers ALTER COLUMN id SET DEFAULT nextval('public.papers_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: person_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_translations ALTER COLUMN id SET DEFAULT nextval('public.person_translations_id_seq'::regclass);


--
-- Name: phone_numbers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers ALTER COLUMN id SET DEFAULT nextval('public.phone_numbers_id_seq'::regclass);


--
-- Name: review_metrics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_metrics ALTER COLUMN id SET DEFAULT nextval('public.review_metrics_id_seq'::regclass);


--
-- Name: review_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_scores ALTER COLUMN id SET DEFAULT nextval('public.review_scores_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: ticket_servers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_servers ALTER COLUMN id SET DEFAULT nextval('public.ticket_servers_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: track_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations ALTER COLUMN id SET DEFAULT nextval('public.track_translations_id_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- Name: transport_needs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_needs ALTER COLUMN id SET DEFAULT nextval('public.transport_needs_id_seq'::regclass);


--
-- Name: user_adapter id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_adapter ALTER COLUMN id SET DEFAULT nextval('public.user_adapter_id_seq'::regclass);


--
-- Name: user_adapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_adapters ALTER COLUMN id SET DEFAULT nextval('public.user_adapters_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2026-07-30 08:00:58.365053	2026-07-30 08:00:58.365053
schema_sha1	1ef96aa51685c4941de46ee3043a9f931dd92cd2	2026-07-30 08:00:58.371727	2026-07-30 08:00:58.371727
\.


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.availabilities (id, person_id, conference_id, created_at, updated_at, start_date, end_date, day_id) FROM stdin;
1064	334	40	2026-08-03 10:07:48.879182	2026-08-03 10:07:48.879182	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1065	334	40	2026-08-03 10:07:48.928714	2026-08-03 10:07:48.928714	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1066	334	40	2026-08-03 10:07:48.935487	2026-08-03 10:07:48.935487	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1067	331	40	2026-08-03 10:07:48.947369	2026-08-03 10:07:48.947369	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1068	331	40	2026-08-03 10:07:49.011997	2026-08-03 10:07:49.011997	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1069	331	40	2026-08-03 10:07:49.083538	2026-08-03 10:07:49.083538	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1070	335	40	2026-08-03 10:07:49.163081	2026-08-03 10:07:49.163081	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1071	335	40	2026-08-03 10:07:49.167802	2026-08-03 10:07:49.167802	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1072	335	40	2026-08-03 10:07:49.191565	2026-08-03 10:07:49.191565	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1073	341	40	2026-08-03 10:07:49.20291	2026-08-03 10:07:49.20291	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1074	341	40	2026-08-03 10:07:49.208993	2026-08-03 10:07:49.208993	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1075	341	40	2026-08-03 10:07:49.239064	2026-08-03 10:07:49.239064	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1076	336	40	2026-08-03 10:07:49.276611	2026-08-03 10:07:49.276611	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1077	336	40	2026-08-03 10:07:49.281299	2026-08-03 10:07:49.281299	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1078	336	40	2026-08-03 10:07:49.285063	2026-08-03 10:07:49.285063	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1079	337	40	2026-08-03 10:07:49.332235	2026-08-03 10:07:49.332235	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1080	337	40	2026-08-03 10:07:49.353998	2026-08-03 10:07:49.353998	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1081	337	40	2026-08-03 10:07:49.358764	2026-08-03 10:07:49.358764	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1082	338	40	2026-08-03 10:07:49.368862	2026-08-03 10:07:49.368862	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1083	338	40	2026-08-03 10:07:49.374021	2026-08-03 10:07:49.374021	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1084	338	40	2026-08-03 10:07:49.398127	2026-08-03 10:07:49.398127	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1085	339	40	2026-08-03 10:07:49.408696	2026-08-03 10:07:49.408696	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1086	339	40	2026-08-03 10:07:49.413149	2026-08-03 10:07:49.413149	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1087	339	40	2026-08-03 10:07:49.416916	2026-08-03 10:07:49.416916	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1088	344	40	2026-08-03 10:07:49.450001	2026-08-03 10:07:49.450001	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1089	344	40	2026-08-03 10:07:49.454488	2026-08-03 10:07:49.454488	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1090	344	40	2026-08-03 10:07:49.459	2026-08-03 10:07:49.459	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1091	340	40	2026-08-03 10:07:49.501515	2026-08-03 10:07:49.501515	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1092	340	40	2026-08-03 10:07:49.523332	2026-08-03 10:07:49.523332	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1093	340	40	2026-08-03 10:07:49.52716	2026-08-03 10:07:49.52716	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1094	342	40	2026-08-03 10:07:49.542129	2026-08-03 10:07:49.542129	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1095	342	40	2026-08-03 10:07:49.546615	2026-08-03 10:07:49.546615	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1096	342	40	2026-08-03 10:07:49.550565	2026-08-03 10:07:49.550565	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1097	347	40	2026-08-03 10:07:49.582624	2026-08-03 10:07:49.582624	2026-08-24 07:00:00	2026-08-24 18:00:00	78
1098	347	40	2026-08-03 10:07:49.587431	2026-08-03 10:07:49.587431	2026-08-25 07:00:00	2026-08-25 18:00:00	79
1099	347	40	2026-08-03 10:07:49.592007	2026-08-03 10:07:49.592007	2026-08-26 07:00:00	2026-08-26 18:00:00	80
1100	337	42	2026-08-03 10:08:33.142704	2026-08-03 10:08:33.142704	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1101	337	42	2026-08-03 10:08:33.201163	2026-08-03 10:08:33.201163	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1102	337	42	2026-08-03 10:08:33.212917	2026-08-03 10:08:33.212917	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1103	338	42	2026-08-03 10:08:33.251903	2026-08-03 10:08:33.251903	2026-08-02 08:00:00	2026-08-02 13:00:00	81
1104	338	42	2026-08-03 10:08:33.294375	2026-08-03 10:08:33.294375	2026-08-03 08:00:00	2026-08-03 13:00:00	82
1105	338	42	2026-08-03 10:08:33.343032	2026-08-03 10:08:33.343032	2026-08-04 08:00:00	2026-08-04 13:00:00	83
1106	334	42	2026-08-03 10:08:33.403122	2026-08-03 10:08:33.403122	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1107	334	42	2026-08-03 10:08:33.437008	2026-08-03 10:08:33.437008	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1108	334	42	2026-08-03 10:08:33.530428	2026-08-03 10:08:33.530428	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1109	335	42	2026-08-03 10:08:33.537283	2026-08-03 10:08:33.537283	2026-08-02 07:00:00	2026-08-02 12:00:00	81
1110	335	42	2026-08-03 10:08:33.611305	2026-08-03 10:08:33.611305	2026-08-03 07:00:00	2026-08-03 12:00:00	82
1111	335	42	2026-08-03 10:08:33.667314	2026-08-03 10:08:33.667314	2026-08-04 07:00:00	2026-08-04 12:00:00	83
1112	342	42	2026-08-03 10:08:33.675875	2026-08-03 10:08:33.675875	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1113	342	42	2026-08-03 10:08:33.759324	2026-08-03 10:08:33.759324	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1114	342	42	2026-08-03 10:08:33.76515	2026-08-03 10:08:33.76515	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1115	336	42	2026-08-03 10:08:33.805671	2026-08-03 10:08:33.805671	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1116	336	42	2026-08-03 10:08:33.83043	2026-08-03 10:08:33.83043	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1117	339	42	2026-08-03 10:08:33.858863	2026-08-03 10:08:33.858863	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1118	339	42	2026-08-03 10:08:33.88359	2026-08-03 10:08:33.88359	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1119	339	42	2026-08-03 10:08:33.889367	2026-08-03 10:08:33.889367	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1120	340	42	2026-08-03 10:08:33.927618	2026-08-03 10:08:33.927618	2026-08-02 08:00:00	2026-08-02 13:00:00	81
1121	340	42	2026-08-03 10:08:33.991731	2026-08-03 10:08:33.991731	2026-08-03 08:00:00	2026-08-03 13:00:00	82
1122	340	42	2026-08-03 10:08:33.997859	2026-08-03 10:08:33.997859	2026-08-04 08:00:00	2026-08-04 13:00:00	83
1123	347	42	2026-08-03 10:08:34.037612	2026-08-03 10:08:34.037612	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1124	347	42	2026-08-03 10:08:34.153235	2026-08-03 10:08:34.153235	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1125	347	42	2026-08-03 10:08:34.168082	2026-08-03 10:08:34.168082	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1126	341	42	2026-08-03 10:08:34.234666	2026-08-03 10:08:34.234666	2026-08-02 07:00:00	2026-08-02 12:00:00	81
1127	341	42	2026-08-03 10:08:34.277009	2026-08-03 10:08:34.277009	2026-08-03 07:00:00	2026-08-03 12:00:00	82
1128	341	42	2026-08-03 10:08:34.334504	2026-08-03 10:08:34.334504	2026-08-04 07:00:00	2026-08-04 12:00:00	83
1129	343	42	2026-08-03 10:08:34.369665	2026-08-03 10:08:34.369665	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1130	343	42	2026-08-03 10:08:34.404033	2026-08-03 10:08:34.404033	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1131	343	42	2026-08-03 10:08:34.412421	2026-08-03 10:08:34.412421	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1132	344	42	2026-08-03 10:08:34.450423	2026-08-03 10:08:34.450423	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1133	344	42	2026-08-03 10:08:34.492944	2026-08-03 10:08:34.492944	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1134	351	42	2026-08-03 10:08:34.506485	2026-08-03 10:08:34.506485	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1135	351	42	2026-08-03 10:08:34.593886	2026-08-03 10:08:34.593886	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1136	351	42	2026-08-03 10:08:34.628356	2026-08-03 10:08:34.628356	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1137	345	42	2026-08-03 10:08:34.634162	2026-08-03 10:08:34.634162	2026-08-02 08:00:00	2026-08-02 13:00:00	81
1138	345	42	2026-08-03 10:08:34.661107	2026-08-03 10:08:34.661107	2026-08-03 08:00:00	2026-08-03 13:00:00	82
1139	345	42	2026-08-03 10:08:34.703579	2026-08-03 10:08:34.703579	2026-08-04 08:00:00	2026-08-04 13:00:00	83
1140	346	42	2026-08-03 10:08:34.732842	2026-08-03 10:08:34.732842	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1141	346	42	2026-08-03 10:08:34.76054	2026-08-03 10:08:34.76054	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1142	346	42	2026-08-03 10:08:34.766083	2026-08-03 10:08:34.766083	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1143	348	42	2026-08-03 10:08:34.796247	2026-08-03 10:08:34.796247	2026-08-02 07:00:00	2026-08-02 12:00:00	81
1144	348	42	2026-08-03 10:08:34.801534	2026-08-03 10:08:34.801534	2026-08-03 07:00:00	2026-08-03 12:00:00	82
1145	348	42	2026-08-03 10:08:34.829287	2026-08-03 10:08:34.829287	2026-08-04 07:00:00	2026-08-04 12:00:00	83
1146	349	42	2026-08-03 10:08:34.860795	2026-08-03 10:08:34.860795	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1147	349	42	2026-08-03 10:08:34.86918	2026-08-03 10:08:34.86918	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1148	349	42	2026-08-03 10:08:34.962156	2026-08-03 10:08:34.962156	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1149	350	42	2026-08-03 10:08:35.133161	2026-08-03 10:08:35.133161	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1150	350	42	2026-08-03 10:08:35.142784	2026-08-03 10:08:35.142784	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1151	352	42	2026-08-03 10:08:35.203049	2026-08-03 10:08:35.203049	2026-08-02 07:00:00	2026-08-02 13:00:00	81
1152	352	42	2026-08-03 10:08:35.216999	2026-08-03 10:08:35.216999	2026-08-03 07:00:00	2026-08-03 13:00:00	82
1153	352	42	2026-08-03 10:08:35.319797	2026-08-03 10:08:35.319797	2026-08-04 07:00:00	2026-08-04 13:00:00	83
1154	353	42	2026-08-03 10:08:35.330581	2026-08-03 10:08:35.330581	2026-08-02 08:00:00	2026-08-02 13:00:00	81
1155	353	42	2026-08-03 10:08:35.343914	2026-08-03 10:08:35.343914	2026-08-03 08:00:00	2026-08-03 13:00:00	82
1156	353	42	2026-08-03 10:08:35.519522	2026-08-03 10:08:35.519522	2026-08-04 08:00:00	2026-08-04 13:00:00	83
\.


--
-- Data for Name: average_review_scores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.average_review_scores (id, event_id, review_metric_id, score) FROM stdin;
2781	975	89	4.5
2782	975	90	3
2783	975	91	1.5
2745	963	89	2.5
2746	963	90	3.5
2747	963	91	4.5
2748	964	89	2.5
2749	964	90	3.5
2750	964	91	4.5
2751	965	89	4
2752	965	90	2.5
2753	965	91	3.5
2754	966	89	3
2755	966	90	1.5
2756	966	91	2.5
2757	967	89	3
2758	967	90	1.5
2759	967	91	2.5
2760	968	89	2
2761	968	90	3
2762	968	91	4
2763	969	89	3.5
2764	969	90	4.5
2765	969	91	3
2766	970	89	3.5
2767	970	90	4.5
2768	970	91	3
2769	971	89	2.5
2770	971	90	3.5
2771	971	91	2
2772	972	89	1.5
2773	972	90	2.5
2774	972	91	3.5
2775	973	89	1.5
2776	973	90	2.5
2777	973	91	3.5
2778	974	89	3
2779	974	90	4
2780	974	91	2.5
2784	976	89	4.5
2785	976	90	3
2786	976	91	1.5
2787	977	89	3.5
2788	977	90	2
2789	977	91	3
2800	989	92	3
2801	989	93	4
2802	989	94	3.3333333333333335
2790	980	89	4
2791	980	90	2.5
2792	980	91	3.5
2803	989	95	2.6666666666666665
2793	982	89	3
2794	982	90	1.5
2795	982	91	2.5
2796	988	92	3
2797	988	93	4
2798	988	94	3.3333333333333335
2799	988	95	2.6666666666666665
2806	990	94	3
2804	990	92	2.6666666666666665
2805	990	93	3.6666666666666665
2807	990	95	2.3333333333333335
2808	991	92	2.3333333333333335
2809	991	93	3.3333333333333335
2810	991	94	2.6666666666666665
2811	991	95	3.6666666666666665
2812	992	92	2
2813	992	93	3
2814	992	94	4
2815	992	95	3.3333333333333335
2816	993	92	2
2817	993	93	3
2818	993	94	4
2819	993	95	3.3333333333333335
2823	994	95	3
2820	994	92	3.3333333333333335
2821	994	93	2.6666666666666665
2822	994	94	3.6666666666666665
2824	995	92	3
2825	995	93	2.3333333333333335
2826	995	94	3.3333333333333335
2827	995	95	2.6666666666666665
2828	996	92	2.6666666666666665
2829	996	93	2
2830	996	94	3
2831	996	95	4
2832	997	92	2.6666666666666665
2833	997	93	2
2834	997	94	3
2835	997	95	4
2836	998	92	2.3333333333333335
2837	998	93	3.3333333333333335
2838	998	94	2.6666666666666665
2839	998	95	3.6666666666666665
2840	999	92	3.6666666666666665
2841	999	93	3
2842	999	94	2.3333333333333335
2843	999	95	3.3333333333333335
2844	1000	92	3.3333333333333335
2845	1000	93	2.6666666666666665
2846	1000	94	2
2847	1000	95	3
3060	1060	92	3.3333333333333335
3061	1060	93	2.6666666666666665
3062	1060	94	2
3063	1060	95	3
3064	1061	92	3.3333333333333335
3065	1061	93	2.6666666666666665
3066	1061	94	2
3067	1061	95	3
2896	1013	92	3
2897	1013	93	3
2898	1013	94	3
2899	1013	95	3
2848	1001	92	3.3333333333333335
2849	1001	93	2.6666666666666665
2850	1001	94	2
2851	1001	95	3
2852	1002	92	3
2853	1002	93	2.3333333333333335
2854	1002	94	3.3333333333333335
2855	1002	95	2.6666666666666665
2856	1003	92	2.6666666666666665
2857	1003	93	3.6666666666666665
2858	1003	94	3
2859	1003	95	2.3333333333333335
2860	1004	92	4
2861	1004	93	3.3333333333333335
2862	1004	94	2.6666666666666665
2863	1004	95	2
2864	1005	92	4
2865	1005	93	3.3333333333333335
2866	1005	94	2.6666666666666665
2867	1005	95	2
2869	1006	93	3
2868	1006	92	3.6666666666666665
2870	1006	94	2.3333333333333335
2871	1006	95	3.3333333333333335
2872	1007	92	3.3333333333333335
2873	1007	93	2.6666666666666665
2874	1007	94	3.6666666666666665
2875	1007	95	3
2876	1008	92	3
2877	1008	93	4
2878	1008	94	3.3333333333333335
2879	1008	95	2.6666666666666665
2880	1009	92	3
2881	1009	93	4
2882	1009	94	3.3333333333333335
2883	1009	95	2.6666666666666665
2886	1010	94	3
2884	1010	92	2.6666666666666665
2885	1010	93	3.6666666666666665
2887	1010	95	2.3333333333333335
2888	1011	92	2.3333333333333335
2889	1011	93	3.3333333333333335
2890	1011	94	2.6666666666666665
2891	1011	95	3.6666666666666665
2892	1012	92	2
2893	1012	93	3
2894	1012	94	4
2895	1012	95	3.3333333333333335
2903	1014	95	3
2900	1014	92	3.3333333333333335
2901	1014	93	2.6666666666666665
2902	1014	94	3.6666666666666665
2904	1015	92	3
2905	1015	93	2.3333333333333335
2906	1015	94	3.3333333333333335
2907	1015	95	2.6666666666666665
2908	1016	92	2.6666666666666665
2909	1016	93	2
2910	1016	94	3
2911	1016	95	4
2912	1017	92	2.6666666666666665
2913	1017	93	2
2914	1017	94	3
2915	1017	95	4
2916	1022	92	3
2917	1022	93	2.3333333333333335
2918	1022	94	3.3333333333333335
2919	1022	95	2.6666666666666665
2920	1023	92	2.6666666666666665
2921	1023	93	3.6666666666666665
2922	1023	94	3
2923	1023	95	2.3333333333333335
2924	1024	92	4
2925	1024	93	3.3333333333333335
2926	1024	94	2.6666666666666665
2927	1024	95	2
2928	1025	92	4
2929	1025	93	3.3333333333333335
2930	1025	94	2.6666666666666665
2931	1025	95	2
2933	1026	93	3
2932	1026	92	3.6666666666666665
2934	1026	94	2.3333333333333335
2935	1026	95	3.3333333333333335
2936	1027	92	3.3333333333333335
2937	1027	93	2.6666666666666665
2938	1027	94	3.6666666666666665
2939	1027	95	3
2940	1028	92	3
2941	1028	93	4
2942	1028	94	3.3333333333333335
2943	1028	95	2.6666666666666665
2944	1029	92	3
2945	1029	93	4
2946	1029	94	3.3333333333333335
2947	1029	95	2.6666666666666665
2950	1030	94	3
2948	1030	92	2.6666666666666665
2949	1030	93	3.6666666666666665
2951	1030	95	2.3333333333333335
2952	1031	92	2.3333333333333335
2953	1031	93	3.3333333333333335
2954	1031	94	2.6666666666666665
2955	1031	95	3.6666666666666665
2956	1032	92	2
2957	1032	93	3
2958	1032	94	4
2959	1032	95	3.3333333333333335
2960	1033	92	2
2961	1033	93	3
2962	1033	94	4
2963	1033	95	3.3333333333333335
2967	1034	95	3
2964	1034	92	3.3333333333333335
2965	1034	93	2.6666666666666665
2966	1034	94	3.6666666666666665
2968	1035	92	3
2969	1035	93	2.3333333333333335
2970	1035	94	3.3333333333333335
2971	1035	95	2.6666666666666665
2972	1036	92	2.6666666666666665
2973	1036	93	2
2974	1036	94	3
2975	1036	95	4
2976	1037	92	2.6666666666666665
2977	1037	93	2
2978	1037	94	3
2979	1037	95	4
2980	1038	92	2.3333333333333335
2981	1038	93	3.3333333333333335
2982	1038	94	2.6666666666666665
2983	1038	95	3.6666666666666665
2984	1039	92	3.6666666666666665
2985	1039	93	3
2986	1039	94	2.3333333333333335
2987	1039	95	3.3333333333333335
2988	1040	92	3.3333333333333335
2989	1040	93	2.6666666666666665
2990	1040	94	2
2991	1040	95	3
2992	1041	92	3.3333333333333335
2993	1041	93	2.6666666666666665
2994	1041	94	2
2995	1041	95	3
2996	1042	92	3
2997	1042	93	2.3333333333333335
2998	1042	94	3.3333333333333335
2999	1042	95	2.6666666666666665
3000	1043	92	2.6666666666666665
3001	1043	93	3.6666666666666665
3002	1043	94	3
3003	1043	95	2.3333333333333335
3004	1044	92	4
3005	1044	93	3.3333333333333335
3006	1044	94	2.6666666666666665
3007	1044	95	2
3008	1045	92	4
3009	1045	93	3.3333333333333335
3010	1045	94	2.6666666666666665
3011	1045	95	2
3013	1046	93	3
3012	1046	92	3.6666666666666665
3014	1046	94	2.3333333333333335
3015	1046	95	3.3333333333333335
3016	1047	92	3.3333333333333335
3017	1047	93	2.6666666666666665
3018	1047	94	3.6666666666666665
3019	1047	95	3
3020	1048	92	3
3021	1048	93	4
3022	1048	94	3.3333333333333335
3023	1048	95	2.6666666666666665
3024	1049	92	3
3025	1049	93	4
3026	1049	94	3.3333333333333335
3027	1049	95	2.6666666666666665
3030	1050	94	3
3028	1050	92	2.6666666666666665
3029	1050	93	3.6666666666666665
3031	1050	95	2.3333333333333335
3032	1051	92	2.3333333333333335
3033	1051	93	3.3333333333333335
3034	1051	94	2.6666666666666665
3035	1051	95	3.6666666666666665
3036	1052	92	2
3037	1052	93	3
3038	1052	94	4
3039	1052	95	3.3333333333333335
3040	1053	92	2
3041	1053	93	3
3042	1053	94	4
3043	1053	95	3.3333333333333335
3047	1054	95	3
3044	1054	92	3.3333333333333335
3045	1054	93	2.6666666666666665
3046	1054	94	3.6666666666666665
3048	1055	92	3
3049	1055	93	2.3333333333333335
3050	1055	94	3.3333333333333335
3051	1055	95	2.6666666666666665
3052	1056	92	2.6666666666666665
3053	1056	93	2
3054	1056	94	3
3055	1056	95	4
3056	1059	92	3.6666666666666665
3057	1059	93	3
3058	1059	94	2.3333333333333335
3059	1059	95	3.3333333333333335
\.


--
-- Data for Name: call_for_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.call_for_participations (id, start_date, end_date, hard_deadline, welcome_text, conference_id, created_at, updated_at, info_url, contact_email) FROM stdin;
40	2026-07-04	2026-08-13	2026-08-17	Welcome to the DemoConf 2026 Call for Participation!\n\nSubmit a talk, a workshop or a lightning talk. Everything you see here is demo data.	40	2026-08-03 10:07:43.519437	2026-08-03 10:07:43.519437	https://democonf.example.org/cfp	cfp@democonf.example.org
41	2026-07-14	2026-08-13	\N	The Ruby devroom is looking for short talks.	41	2026-08-03 10:07:49.666924	2026-08-03 10:07:49.666924	\N	\N
42	2026-06-04	2026-08-17	2026-08-24	Welcome to the DemoConf 2025 Call for Participation!\n\nWe are looking for lectures, workshops and lightning talks. Tell us what you want to talk about, how long you need and when you are available - the rest is up to the review team.\n\nEverything you see here is demo data.	42	2026-08-03 10:07:49.981106	2026-08-03 10:07:49.981106	https://democonf.example.org/cfp	cfp@democonf.example.org
\.


--
-- Data for Name: classifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.classifiers (id, name, description, conference_id, created_at, updated_at) FROM stdin;
63	Needs translation	Talk requires live translation	40	2026-08-03 10:07:43.539877	2026-08-03 10:07:43.539877
64	Streaming ok	Speaker agreed to live streaming	40	2026-08-03 10:07:43.542841	2026-08-03 10:07:43.542841
65	Needs translation	Talk requires live translation	42	2026-08-03 10:07:49.996386	2026-08-03 10:07:49.996386
66	Streaming ok	Speaker agreed to live streaming	42	2026-08-03 10:07:49.998515	2026-08-03 10:07:49.998515
67	Beginner friendly	No prior knowledge required	42	2026-08-03 10:07:50.000399	2026-08-03 10:07:50.000399
\.


--
-- Data for Name: conference_exports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conference_exports (id, locale, conference_id, tarball_file_name, tarball_content_type, tarball_file_size, tarball_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: conference_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conference_users (id, role, user_id, conference_id, created_at, updated_at) FROM stdin;
128	orga	330	40	2026-08-03 10:07:43.560299	2026-08-03 10:07:43.560299
129	coordinator	331	40	2026-08-03 10:07:43.563213	2026-08-03 10:07:43.563213
130	reviewer	332	40	2026-08-03 10:07:43.565488	2026-08-03 10:07:43.565488
131	reviewer	333	40	2026-08-03 10:07:43.567297	2026-08-03 10:07:43.567297
132	orga	330	41	2026-08-03 10:07:49.668233	2026-08-03 10:07:49.668233
133	reviewer	332	41	2026-08-03 10:07:49.6694	2026-08-03 10:07:49.6694
134	orga	330	42	2026-08-03 10:07:50.02074	2026-08-03 10:07:50.02074
135	coordinator	331	42	2026-08-03 10:07:50.022421	2026-08-03 10:07:50.022421
136	reviewer	332	42	2026-08-03 10:07:50.023791	2026-08-03 10:07:50.023791
137	reviewer	333	42	2026-08-03 10:07:50.025139	2026-08-03 10:07:50.025139
\.


--
-- Data for Name: conferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conferences (id, acronym, title, timezone, timeslot_duration, default_timeslots, max_timeslots, feedback_enabled, created_at, updated_at, email, program_export_base_url, schedule_version, schedule_public, color, ticket_type, event_state_visible, schedule_custom_css, schedule_html_intro, default_recording_license, expenses_enabled, transport_needs_enabled, parent_id, bulk_notification_enabled, logo_file_name, logo_content_type, logo_file_size, logo_updated_at, schedule_open, start_date, end_date, attachment_title_is_freeform, allowed_event_types, allowed_event_timeslots_csv, bcc_address, mail_sent) FROM stdin;
40	demo2026	DemoConf 2026	Berlin	15	4	16	t	2026-08-03 10:07:43.46398	2026-08-03 10:08:42.294939	info@democonf.example.org	\N	1.0	t	4a90d9	integrated	t	\N	<p>Welcome to the DemoConf 2026 schedule. This data was generated by <code>rails demo:seed</code>.</p>	CC BY-SA 4.0	t	t	\N	f	\N	\N	\N	\N	f	2026-08-24 07:00:00	2026-08-26 18:00:00	t	lecture;workshop;lightning_talk;podium;other	2,4,8	\N	{}
41	rubyroom	Ruby Devroom @ DemoConf 2026	Berlin	15	2	8	t	2026-08-03 10:07:49.654558	2026-08-03 10:07:49.654558	ruby@democonf.example.org	\N	\N	t	d0021b	integrated	t	\N	\N	\N	f	f	40	t	\N	\N	\N	\N	f	2026-08-24 07:00:00	2026-08-26 18:00:00	t	lecture;lightning_talk	2,4	\N	{}
42	demo2025	DemoConf 2025	Berlin	15	4	16	t	2026-08-03 10:07:49.94076	2026-08-03 10:08:42.358817	info@democonf.example.org	\N	1.4	t	7ed321	integrated	t	\N	<p>Welcome to the DemoConf 2025 schedule. All of this is demo data generated by <code>rails demo:seed</code>.</p>	CC BY-SA 4.0	t	t	\N	f	\N	\N	\N	\N	f	2026-08-02 07:00:00	2026-08-04 13:00:00	f	lecture;workshop;lightning_talk;podium;meeting;other	2,4,6,8,12	archive@democonf.example.org	{}
\.


--
-- Data for Name: conflicts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conflicts (id, event_id, conflicting_event_id, person_id, conflict_type, severity, created_at, updated_at) FROM stdin;
2607	1042	\N	344	person_unavailable	warning	2026-08-03 10:08:32.676941	2026-08-03 10:08:32.676941
2615	1036	\N	338	person_unavailable	warning	2026-08-03 10:08:33.389138	2026-08-03 10:08:33.389138
2622	1038	\N	340	person_unavailable	warning	2026-08-03 10:08:34.023925	2026-08-03 10:08:34.023925
2649	1008	\N	354	person_has_no_availability	warning	2026-08-03 10:08:41.000514	2026-08-03 10:08:41.000514
2660	1007	1029	353	person_already_speaking	warning	2026-08-03 10:08:41.38639	2026-08-03 10:08:41.38639
2661	1029	1007	353	person_already_speaking	warning	2026-08-03 10:08:41.388421	2026-08-03 10:08:41.388421
2662	1030	\N	354	person_has_no_availability	warning	2026-08-03 10:08:41.496329	2026-08-03 10:08:41.496329
2663	1031	\N	355	person_has_no_availability	warning	2026-08-03 10:08:41.57163	2026-08-03 10:08:41.57163
2664	1033	\N	335	person_unavailable	warning	2026-08-03 10:08:41.770074	2026-08-03 10:08:41.770074
\.


--
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.days (id, conference_id, start_date, end_date) FROM stdin;
78	40	2026-08-24 07:00:00	2026-08-24 18:00:00
79	40	2026-08-25 07:00:00	2026-08-25 18:00:00
80	40	2026-08-26 07:00:00	2026-08-26 18:00:00
81	42	2026-08-02 07:00:00	2026-08-02 13:00:00
82	42	2026-08-03 07:00:00	2026-08-03 13:00:00
83	42	2026-08-04 07:00:00	2026-08-04 13:00:00
\.


--
-- Data for Name: event_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_attachments (id, event_id, title, attachment_file_name, attachment_content_type, attachment_file_size, attachment_updated_at, created_at, updated_at, public) FROM stdin;
162	988	proposal	demo_proposal.txt	text/plain	87	2026-08-03 10:07:50.095148	2026-08-03 10:07:50.107999	2026-08-03 10:07:50.107999	t
163	992	media	demo_media.txt	text/plain	86	2026-08-03 10:07:50.556486	2026-08-03 10:07:50.579424	2026-08-03 10:07:50.579424	t
164	996	poster	demo_poster.txt	text/plain	82	2026-08-03 10:07:50.949166	2026-08-03 10:07:50.96137	2026-08-03 10:07:50.96137	t
165	1000	video	demo_video.txt	text/plain	80	2026-08-03 10:07:51.480576	2026-08-03 10:07:51.492907	2026-08-03 10:07:51.492907	t
166	1004	slides	demo_slides.txt	text/plain	85	2026-08-03 10:07:51.87098	2026-08-03 10:07:51.881253	2026-08-03 10:07:51.881253	t
167	1008	other	demo_other.txt	text/plain	85	2026-08-03 10:07:52.365356	2026-08-03 10:07:52.377275	2026-08-03 10:07:52.377275	t
168	1012	handouts	demo_handouts.txt	text/plain	75	2026-08-03 10:07:52.759371	2026-08-03 10:07:52.769409	2026-08-03 10:07:52.769409	t
169	1016	proposal	demo_proposal.txt	text/plain	79	2026-08-03 10:07:53.024245	2026-08-03 10:07:53.035982	2026-08-03 10:07:53.035982	t
170	1020	media	demo_media.txt	text/plain	75	2026-08-03 10:07:53.255479	2026-08-03 10:07:53.267119	2026-08-03 10:07:53.267119	t
171	1024	poster	demo_poster.txt	text/plain	90	2026-08-03 10:07:53.574103	2026-08-03 10:07:53.585905	2026-08-03 10:07:53.585905	t
172	1028	video	demo_video.txt	text/plain	89	2026-08-03 10:07:53.916596	2026-08-03 10:07:53.934481	2026-08-03 10:07:53.934481	t
173	1032	slides	demo_slides.txt	text/plain	75	2026-08-03 10:07:54.478798	2026-08-03 10:07:54.491347	2026-08-03 10:07:54.491347	t
174	1036	other	demo_other.txt	text/plain	83	2026-08-03 10:07:54.919088	2026-08-03 10:07:54.941158	2026-08-03 10:07:54.941158	t
175	1040	handouts	demo_handouts.txt	text/plain	76	2026-08-03 10:07:55.457048	2026-08-03 10:07:55.469931	2026-08-03 10:07:55.469931	t
176	1044	proposal	demo_proposal.txt	text/plain	79	2026-08-03 10:07:55.913552	2026-08-03 10:07:55.930959	2026-08-03 10:07:55.930959	t
177	1048	media	demo_media.txt	text/plain	80	2026-08-03 10:07:56.587713	2026-08-03 10:07:56.60013	2026-08-03 10:07:56.60013	t
178	1052	poster	demo_poster.txt	text/plain	73	2026-08-03 10:07:57.122283	2026-08-03 10:07:57.147283	2026-08-03 10:07:57.147283	t
179	1056	video	demo_video.txt	text/plain	75	2026-08-03 10:07:57.614708	2026-08-03 10:07:57.627571	2026-08-03 10:07:57.627571	t
180	1060	slides	demo_slides.txt	text/plain	78	2026-08-03 10:07:57.882496	2026-08-03 10:07:57.893478	2026-08-03 10:07:57.893478	t
\.


--
-- Data for Name: event_classifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_classifiers (id, value, classifier_id, event_id, created_at, updated_at) FROM stdin;
2448	0	65	988	2026-08-03 10:07:50.074128	2026-08-03 10:07:50.074128
2449	1	66	988	2026-08-03 10:07:50.078026	2026-08-03 10:07:50.078026
2450	2	67	988	2026-08-03 10:07:50.082016	2026-08-03 10:07:50.082016
2451	1	65	989	2026-08-03 10:07:50.214156	2026-08-03 10:07:50.214156
2452	2	66	989	2026-08-03 10:07:50.217318	2026-08-03 10:07:50.217318
2453	0	67	989	2026-08-03 10:07:50.220602	2026-08-03 10:07:50.220602
2454	2	65	990	2026-08-03 10:07:50.32667	2026-08-03 10:07:50.32667
2455	0	66	990	2026-08-03 10:07:50.331082	2026-08-03 10:07:50.331082
2456	1	67	990	2026-08-03 10:07:50.334942	2026-08-03 10:07:50.334942
2457	0	65	991	2026-08-03 10:07:50.424386	2026-08-03 10:07:50.424386
2458	1	66	991	2026-08-03 10:07:50.428083	2026-08-03 10:07:50.428083
2459	2	67	991	2026-08-03 10:07:50.431404	2026-08-03 10:07:50.431404
2460	1	65	992	2026-08-03 10:07:50.523923	2026-08-03 10:07:50.523923
2461	2	66	992	2026-08-03 10:07:50.529468	2026-08-03 10:07:50.529468
2462	0	67	992	2026-08-03 10:07:50.534675	2026-08-03 10:07:50.534675
2463	2	65	993	2026-08-03 10:07:50.692239	2026-08-03 10:07:50.692239
2464	0	66	993	2026-08-03 10:07:50.694937	2026-08-03 10:07:50.694937
2465	1	67	993	2026-08-03 10:07:50.697604	2026-08-03 10:07:50.697604
2466	0	65	994	2026-08-03 10:07:50.774171	2026-08-03 10:07:50.774171
2467	1	66	994	2026-08-03 10:07:50.776624	2026-08-03 10:07:50.776624
2468	2	67	994	2026-08-03 10:07:50.779231	2026-08-03 10:07:50.779231
2469	1	65	995	2026-08-03 10:07:50.85284	2026-08-03 10:07:50.85284
2470	2	66	995	2026-08-03 10:07:50.855379	2026-08-03 10:07:50.855379
2471	0	67	995	2026-08-03 10:07:50.857969	2026-08-03 10:07:50.857969
2472	2	65	996	2026-08-03 10:07:50.931884	2026-08-03 10:07:50.931884
2473	0	66	996	2026-08-03 10:07:50.935444	2026-08-03 10:07:50.935444
2474	1	67	996	2026-08-03 10:07:50.939119	2026-08-03 10:07:50.939119
2475	0	65	997	2026-08-03 10:07:51.076244	2026-08-03 10:07:51.076244
2476	1	66	997	2026-08-03 10:07:51.081862	2026-08-03 10:07:51.081862
2477	2	67	997	2026-08-03 10:07:51.086965	2026-08-03 10:07:51.086965
2478	1	65	998	2026-08-03 10:07:51.210856	2026-08-03 10:07:51.210856
2479	2	66	998	2026-08-03 10:07:51.214001	2026-08-03 10:07:51.214001
2480	0	67	998	2026-08-03 10:07:51.216989	2026-08-03 10:07:51.216989
2481	2	65	999	2026-08-03 10:07:51.338243	2026-08-03 10:07:51.338243
2482	0	66	999	2026-08-03 10:07:51.343866	2026-08-03 10:07:51.343866
2483	1	67	999	2026-08-03 10:07:51.34851	2026-08-03 10:07:51.34851
2484	0	65	1000	2026-08-03 10:07:51.46362	2026-08-03 10:07:51.46362
2485	1	66	1000	2026-08-03 10:07:51.466898	2026-08-03 10:07:51.466898
2486	2	67	1000	2026-08-03 10:07:51.469719	2026-08-03 10:07:51.469719
2487	1	65	1001	2026-08-03 10:07:51.604519	2026-08-03 10:07:51.604519
2488	2	66	1001	2026-08-03 10:07:51.607869	2026-08-03 10:07:51.607869
2489	0	67	1001	2026-08-03 10:07:51.611092	2026-08-03 10:07:51.611092
2490	2	65	1002	2026-08-03 10:07:51.68138	2026-08-03 10:07:51.68138
2491	0	66	1002	2026-08-03 10:07:51.68443	2026-08-03 10:07:51.68443
2492	1	67	1002	2026-08-03 10:07:51.687606	2026-08-03 10:07:51.687606
2493	0	65	1003	2026-08-03 10:07:51.776005	2026-08-03 10:07:51.776005
2494	1	66	1003	2026-08-03 10:07:51.778499	2026-08-03 10:07:51.778499
2495	2	67	1003	2026-08-03 10:07:51.780776	2026-08-03 10:07:51.780776
2496	1	65	1004	2026-08-03 10:07:51.856473	2026-08-03 10:07:51.856473
2497	2	66	1004	2026-08-03 10:07:51.859001	2026-08-03 10:07:51.859001
2498	0	67	1004	2026-08-03 10:07:51.861141	2026-08-03 10:07:51.861141
2499	2	65	1005	2026-08-03 10:07:51.993272	2026-08-03 10:07:51.993272
2500	0	66	1005	2026-08-03 10:07:51.99662	2026-08-03 10:07:51.99662
2501	1	67	1005	2026-08-03 10:07:51.999674	2026-08-03 10:07:51.999674
2502	0	65	1006	2026-08-03 10:07:52.087776	2026-08-03 10:07:52.087776
2503	1	66	1006	2026-08-03 10:07:52.094325	2026-08-03 10:07:52.094325
2504	2	67	1006	2026-08-03 10:07:52.100078	2026-08-03 10:07:52.100078
2505	1	65	1007	2026-08-03 10:07:52.228467	2026-08-03 10:07:52.228467
2506	2	66	1007	2026-08-03 10:07:52.231546	2026-08-03 10:07:52.231546
2507	0	67	1007	2026-08-03 10:07:52.234492	2026-08-03 10:07:52.234492
2508	2	65	1008	2026-08-03 10:07:52.347685	2026-08-03 10:07:52.347685
2509	0	66	1008	2026-08-03 10:07:52.350786	2026-08-03 10:07:52.350786
2510	1	67	1008	2026-08-03 10:07:52.354272	2026-08-03 10:07:52.354272
2511	0	65	1009	2026-08-03 10:07:52.512301	2026-08-03 10:07:52.512301
2512	1	66	1009	2026-08-03 10:07:52.515436	2026-08-03 10:07:52.515436
2513	2	67	1009	2026-08-03 10:07:52.51866	2026-08-03 10:07:52.51866
2514	1	65	1010	2026-08-03 10:07:52.598938	2026-08-03 10:07:52.598938
2515	2	66	1010	2026-08-03 10:07:52.601685	2026-08-03 10:07:52.601685
2516	0	67	1010	2026-08-03 10:07:52.604825	2026-08-03 10:07:52.604825
2517	2	65	1011	2026-08-03 10:07:52.672702	2026-08-03 10:07:52.672702
2518	0	66	1011	2026-08-03 10:07:52.675252	2026-08-03 10:07:52.675252
2519	1	67	1011	2026-08-03 10:07:52.677608	2026-08-03 10:07:52.677608
2520	0	65	1012	2026-08-03 10:07:52.745951	2026-08-03 10:07:52.745951
2521	1	66	1012	2026-08-03 10:07:52.748169	2026-08-03 10:07:52.748169
2522	2	67	1012	2026-08-03 10:07:52.750075	2026-08-03 10:07:52.750075
2523	1	65	1013	2026-08-03 10:07:52.841889	2026-08-03 10:07:52.841889
2524	2	66	1013	2026-08-03 10:07:52.844739	2026-08-03 10:07:52.844739
2525	0	67	1013	2026-08-03 10:07:52.847527	2026-08-03 10:07:52.847527
2526	2	65	1014	2026-08-03 10:07:52.884826	2026-08-03 10:07:52.884826
2527	0	66	1014	2026-08-03 10:07:52.887074	2026-08-03 10:07:52.887074
2528	1	67	1014	2026-08-03 10:07:52.889189	2026-08-03 10:07:52.889189
2529	0	65	1015	2026-08-03 10:07:52.951565	2026-08-03 10:07:52.951565
2530	1	66	1015	2026-08-03 10:07:52.955499	2026-08-03 10:07:52.955499
2531	2	67	1015	2026-08-03 10:07:52.958665	2026-08-03 10:07:52.958665
2532	1	65	1016	2026-08-03 10:07:53.006306	2026-08-03 10:07:53.006306
2533	2	66	1016	2026-08-03 10:07:53.010081	2026-08-03 10:07:53.010081
2534	0	67	1016	2026-08-03 10:07:53.01359	2026-08-03 10:07:53.01359
2535	2	65	1017	2026-08-03 10:07:53.082997	2026-08-03 10:07:53.082997
2536	0	66	1017	2026-08-03 10:07:53.087289	2026-08-03 10:07:53.087289
2537	1	67	1017	2026-08-03 10:07:53.092095	2026-08-03 10:07:53.092095
2538	0	65	1018	2026-08-03 10:07:53.156663	2026-08-03 10:07:53.156663
2539	1	66	1018	2026-08-03 10:07:53.16014	2026-08-03 10:07:53.16014
2540	2	67	1018	2026-08-03 10:07:53.164589	2026-08-03 10:07:53.164589
2541	1	65	1019	2026-08-03 10:07:53.20461	2026-08-03 10:07:53.20461
2542	2	66	1019	2026-08-03 10:07:53.20739	2026-08-03 10:07:53.20739
2543	0	67	1019	2026-08-03 10:07:53.210426	2026-08-03 10:07:53.210426
2544	2	65	1020	2026-08-03 10:07:53.237731	2026-08-03 10:07:53.237731
2545	0	66	1020	2026-08-03 10:07:53.240679	2026-08-03 10:07:53.240679
2546	1	67	1020	2026-08-03 10:07:53.244111	2026-08-03 10:07:53.244111
2547	0	65	1021	2026-08-03 10:07:53.312944	2026-08-03 10:07:53.312944
2548	1	66	1021	2026-08-03 10:07:53.316027	2026-08-03 10:07:53.316027
2549	2	67	1021	2026-08-03 10:07:53.319234	2026-08-03 10:07:53.319234
2550	1	65	1022	2026-08-03 10:07:53.359347	2026-08-03 10:07:53.359347
2551	2	66	1022	2026-08-03 10:07:53.362832	2026-08-03 10:07:53.362832
2552	0	67	1022	2026-08-03 10:07:53.366384	2026-08-03 10:07:53.366384
2553	2	65	1023	2026-08-03 10:07:53.457981	2026-08-03 10:07:53.457981
2554	0	66	1023	2026-08-03 10:07:53.464437	2026-08-03 10:07:53.464437
2555	1	67	1023	2026-08-03 10:07:53.471068	2026-08-03 10:07:53.471068
2556	0	65	1024	2026-08-03 10:07:53.556472	2026-08-03 10:07:53.556472
2557	1	66	1024	2026-08-03 10:07:53.559891	2026-08-03 10:07:53.559891
2558	2	67	1024	2026-08-03 10:07:53.563131	2026-08-03 10:07:53.563131
2559	1	65	1025	2026-08-03 10:07:53.683673	2026-08-03 10:07:53.683673
2560	2	66	1025	2026-08-03 10:07:53.686915	2026-08-03 10:07:53.686915
2561	0	67	1025	2026-08-03 10:07:53.689995	2026-08-03 10:07:53.689995
2562	2	65	1026	2026-08-03 10:07:53.728522	2026-08-03 10:07:53.728522
2563	0	66	1026	2026-08-03 10:07:53.730963	2026-08-03 10:07:53.730963
2564	1	67	1026	2026-08-03 10:07:53.733223	2026-08-03 10:07:53.733223
2565	0	65	1027	2026-08-03 10:07:53.779921	2026-08-03 10:07:53.779921
2566	1	66	1027	2026-08-03 10:07:53.782022	2026-08-03 10:07:53.782022
2567	2	67	1027	2026-08-03 10:07:53.784264	2026-08-03 10:07:53.784264
2568	1	65	1028	2026-08-03 10:07:53.895954	2026-08-03 10:07:53.895954
2569	2	66	1028	2026-08-03 10:07:53.900673	2026-08-03 10:07:53.900673
2570	0	67	1028	2026-08-03 10:07:53.904688	2026-08-03 10:07:53.904688
2571	2	65	1029	2026-08-03 10:07:54.077296	2026-08-03 10:07:54.077296
2572	0	66	1029	2026-08-03 10:07:54.081955	2026-08-03 10:07:54.081955
2573	1	67	1029	2026-08-03 10:07:54.087902	2026-08-03 10:07:54.087902
2574	0	65	1030	2026-08-03 10:07:54.226594	2026-08-03 10:07:54.226594
2575	1	66	1030	2026-08-03 10:07:54.232865	2026-08-03 10:07:54.232865
2576	2	67	1030	2026-08-03 10:07:54.23919	2026-08-03 10:07:54.23919
2577	1	65	1031	2026-08-03 10:07:54.344505	2026-08-03 10:07:54.344505
2578	2	66	1031	2026-08-03 10:07:54.347627	2026-08-03 10:07:54.347627
2579	0	67	1031	2026-08-03 10:07:54.35063	2026-08-03 10:07:54.35063
2580	2	65	1032	2026-08-03 10:07:54.460815	2026-08-03 10:07:54.460815
2581	0	66	1032	2026-08-03 10:07:54.464166	2026-08-03 10:07:54.464166
2582	1	67	1032	2026-08-03 10:07:54.467673	2026-08-03 10:07:54.467673
2583	0	65	1033	2026-08-03 10:07:54.6359	2026-08-03 10:07:54.6359
2584	1	66	1033	2026-08-03 10:07:54.638919	2026-08-03 10:07:54.638919
2585	2	67	1033	2026-08-03 10:07:54.642087	2026-08-03 10:07:54.642087
2586	1	65	1034	2026-08-03 10:07:54.717799	2026-08-03 10:07:54.717799
2587	2	66	1034	2026-08-03 10:07:54.72011	2026-08-03 10:07:54.72011
2588	0	67	1034	2026-08-03 10:07:54.722661	2026-08-03 10:07:54.722661
2589	2	65	1035	2026-08-03 10:07:54.791096	2026-08-03 10:07:54.791096
2590	0	66	1035	2026-08-03 10:07:54.793435	2026-08-03 10:07:54.793435
2591	1	67	1035	2026-08-03 10:07:54.795727	2026-08-03 10:07:54.795727
2592	0	65	1036	2026-08-03 10:07:54.890095	2026-08-03 10:07:54.890095
2593	1	66	1036	2026-08-03 10:07:54.895981	2026-08-03 10:07:54.895981
2594	2	67	1036	2026-08-03 10:07:54.90143	2026-08-03 10:07:54.90143
2595	1	65	1037	2026-08-03 10:07:55.073587	2026-08-03 10:07:55.073587
2596	2	66	1037	2026-08-03 10:07:55.077116	2026-08-03 10:07:55.077116
2597	0	67	1037	2026-08-03 10:07:55.080486	2026-08-03 10:07:55.080486
2598	2	65	1038	2026-08-03 10:07:55.185795	2026-08-03 10:07:55.185795
2599	0	66	1038	2026-08-03 10:07:55.190548	2026-08-03 10:07:55.190548
2600	1	67	1038	2026-08-03 10:07:55.195108	2026-08-03 10:07:55.195108
2601	0	65	1039	2026-08-03 10:07:55.309737	2026-08-03 10:07:55.309737
2602	1	66	1039	2026-08-03 10:07:55.313003	2026-08-03 10:07:55.313003
2603	2	67	1039	2026-08-03 10:07:55.315972	2026-08-03 10:07:55.315972
2604	1	65	1040	2026-08-03 10:07:55.428138	2026-08-03 10:07:55.428138
2605	2	66	1040	2026-08-03 10:07:55.442122	2026-08-03 10:07:55.442122
2606	0	67	1040	2026-08-03 10:07:55.446139	2026-08-03 10:07:55.446139
2607	2	65	1041	2026-08-03 10:07:55.590273	2026-08-03 10:07:55.590273
2608	0	66	1041	2026-08-03 10:07:55.594176	2026-08-03 10:07:55.594176
2609	1	67	1041	2026-08-03 10:07:55.598021	2026-08-03 10:07:55.598021
2610	0	65	1042	2026-08-03 10:07:55.682454	2026-08-03 10:07:55.682454
2611	1	66	1042	2026-08-03 10:07:55.685308	2026-08-03 10:07:55.685308
2612	2	67	1042	2026-08-03 10:07:55.688628	2026-08-03 10:07:55.688628
2613	1	65	1043	2026-08-03 10:07:55.811082	2026-08-03 10:07:55.811082
2614	2	66	1043	2026-08-03 10:07:55.814748	2026-08-03 10:07:55.814748
2615	0	67	1043	2026-08-03 10:07:55.818083	2026-08-03 10:07:55.818083
2616	2	65	1044	2026-08-03 10:07:55.896323	2026-08-03 10:07:55.896323
2617	0	66	1044	2026-08-03 10:07:55.899238	2026-08-03 10:07:55.899238
2618	1	67	1044	2026-08-03 10:07:55.902352	2026-08-03 10:07:55.902352
2619	0	65	1045	2026-08-03 10:07:56.099554	2026-08-03 10:07:56.099554
2620	1	66	1045	2026-08-03 10:07:56.106163	2026-08-03 10:07:56.106163
2621	2	67	1045	2026-08-03 10:07:56.114487	2026-08-03 10:07:56.114487
2622	1	65	1046	2026-08-03 10:07:56.283052	2026-08-03 10:07:56.283052
2623	2	66	1046	2026-08-03 10:07:56.289161	2026-08-03 10:07:56.289161
2624	0	67	1046	2026-08-03 10:07:56.295231	2026-08-03 10:07:56.295231
2625	2	65	1047	2026-08-03 10:07:56.460094	2026-08-03 10:07:56.460094
2626	0	66	1047	2026-08-03 10:07:56.464134	2026-08-03 10:07:56.464134
2627	1	67	1047	2026-08-03 10:07:56.467968	2026-08-03 10:07:56.467968
2628	0	65	1048	2026-08-03 10:07:56.570489	2026-08-03 10:07:56.570489
2629	1	66	1048	2026-08-03 10:07:56.573869	2026-08-03 10:07:56.573869
2630	2	67	1048	2026-08-03 10:07:56.577252	2026-08-03 10:07:56.577252
2631	1	65	1049	2026-08-03 10:07:56.68309	2026-08-03 10:07:56.68309
2632	2	66	1049	2026-08-03 10:07:56.685575	2026-08-03 10:07:56.685575
2633	0	67	1049	2026-08-03 10:07:56.688108	2026-08-03 10:07:56.688108
2634	2	65	1050	2026-08-03 10:07:56.781585	2026-08-03 10:07:56.781585
2635	0	66	1050	2026-08-03 10:07:56.784013	2026-08-03 10:07:56.784013
2636	1	67	1050	2026-08-03 10:07:56.786049	2026-08-03 10:07:56.786049
2637	0	65	1051	2026-08-03 10:07:56.902882	2026-08-03 10:07:56.902882
2638	1	66	1051	2026-08-03 10:07:56.909662	2026-08-03 10:07:56.909662
2639	2	67	1051	2026-08-03 10:07:56.917412	2026-08-03 10:07:56.917412
2640	1	65	1052	2026-08-03 10:07:57.083189	2026-08-03 10:07:57.083189
2641	2	66	1052	2026-08-03 10:07:57.09161	2026-08-03 10:07:57.09161
2642	0	67	1052	2026-08-03 10:07:57.098074	2026-08-03 10:07:57.098074
2643	2	65	1053	2026-08-03 10:07:57.270004	2026-08-03 10:07:57.270004
2644	0	66	1053	2026-08-03 10:07:57.273275	2026-08-03 10:07:57.273275
2645	1	67	1053	2026-08-03 10:07:57.277341	2026-08-03 10:07:57.277341
2646	0	65	1054	2026-08-03 10:07:57.421561	2026-08-03 10:07:57.421561
2647	1	66	1054	2026-08-03 10:07:57.426959	2026-08-03 10:07:57.426959
2648	2	67	1054	2026-08-03 10:07:57.433526	2026-08-03 10:07:57.433526
2649	1	65	1055	2026-08-03 10:07:57.522484	2026-08-03 10:07:57.522484
2650	2	66	1055	2026-08-03 10:07:57.528967	2026-08-03 10:07:57.528967
2651	0	67	1055	2026-08-03 10:07:57.534888	2026-08-03 10:07:57.534888
2652	2	65	1056	2026-08-03 10:07:57.595662	2026-08-03 10:07:57.595662
2653	0	66	1056	2026-08-03 10:07:57.599138	2026-08-03 10:07:57.599138
2654	1	67	1056	2026-08-03 10:07:57.602655	2026-08-03 10:07:57.602655
2655	0	65	1057	2026-08-03 10:07:57.709756	2026-08-03 10:07:57.709756
2656	1	66	1057	2026-08-03 10:07:57.714469	2026-08-03 10:07:57.714469
2657	2	67	1057	2026-08-03 10:07:57.719723	2026-08-03 10:07:57.719723
2658	1	65	1058	2026-08-03 10:07:57.762477	2026-08-03 10:07:57.762477
2659	2	66	1058	2026-08-03 10:07:57.764911	2026-08-03 10:07:57.764911
2660	0	67	1058	2026-08-03 10:07:57.767145	2026-08-03 10:07:57.767145
2661	2	65	1059	2026-08-03 10:07:57.80474	2026-08-03 10:07:57.80474
2662	0	66	1059	2026-08-03 10:07:57.807	2026-08-03 10:07:57.807
2663	1	67	1059	2026-08-03 10:07:57.809301	2026-08-03 10:07:57.809301
2664	0	65	1060	2026-08-03 10:07:57.865702	2026-08-03 10:07:57.865702
2665	1	66	1060	2026-08-03 10:07:57.86867	2026-08-03 10:07:57.86867
2666	2	67	1060	2026-08-03 10:07:57.871569	2026-08-03 10:07:57.871569
2667	1	65	1061	2026-08-03 10:07:57.966532	2026-08-03 10:07:57.966532
2668	2	66	1061	2026-08-03 10:07:57.970405	2026-08-03 10:07:57.970405
2669	0	67	1061	2026-08-03 10:07:57.974354	2026-08-03 10:07:57.974354
2408	1	63	963	2026-08-03 10:07:43.675269	2026-08-03 10:07:43.675269
2409	1	64	963	2026-08-03 10:07:43.682074	2026-08-03 10:07:43.682074
2410	0	63	964	2026-08-03 10:07:43.848534	2026-08-03 10:07:43.848534
2411	1	64	964	2026-08-03 10:07:43.853804	2026-08-03 10:07:43.853804
2412	2	63	965	2026-08-03 10:07:44.047584	2026-08-03 10:07:44.047584
2413	1	64	965	2026-08-03 10:07:44.054885	2026-08-03 10:07:44.054885
2414	1	63	966	2026-08-03 10:07:44.266468	2026-08-03 10:07:44.266468
2415	1	64	966	2026-08-03 10:07:44.27268	2026-08-03 10:07:44.27268
2416	2	63	967	2026-08-03 10:07:44.423805	2026-08-03 10:07:44.423805
2417	0	64	967	2026-08-03 10:07:44.427114	2026-08-03 10:07:44.427114
2418	1	63	968	2026-08-03 10:07:44.536577	2026-08-03 10:07:44.536577
2419	0	64	968	2026-08-03 10:07:44.540624	2026-08-03 10:07:44.540624
2420	2	63	969	2026-08-03 10:07:44.638579	2026-08-03 10:07:44.638579
2421	1	64	969	2026-08-03 10:07:44.641293	2026-08-03 10:07:44.641293
2422	0	63	970	2026-08-03 10:07:44.705836	2026-08-03 10:07:44.705836
2423	1	64	970	2026-08-03 10:07:44.708658	2026-08-03 10:07:44.708658
2424	1	63	971	2026-08-03 10:07:44.782908	2026-08-03 10:07:44.782908
2425	0	64	971	2026-08-03 10:07:44.785405	2026-08-03 10:07:44.785405
2426	2	63	972	2026-08-03 10:07:44.864326	2026-08-03 10:07:44.864326
2427	0	64	972	2026-08-03 10:07:44.867585	2026-08-03 10:07:44.867585
2428	1	63	973	2026-08-03 10:07:44.987104	2026-08-03 10:07:44.987104
2429	1	64	973	2026-08-03 10:07:44.991103	2026-08-03 10:07:44.991103
2430	0	63	974	2026-08-03 10:07:45.095083	2026-08-03 10:07:45.095083
2431	0	64	974	2026-08-03 10:07:45.103535	2026-08-03 10:07:45.103535
2432	0	63	975	2026-08-03 10:07:45.260647	2026-08-03 10:07:45.260647
2433	0	64	975	2026-08-03 10:07:45.263866	2026-08-03 10:07:45.263866
2434	2	63	976	2026-08-03 10:07:45.321961	2026-08-03 10:07:45.321961
2435	1	64	976	2026-08-03 10:07:45.325082	2026-08-03 10:07:45.325082
2436	1	63	977	2026-08-03 10:07:45.388673	2026-08-03 10:07:45.388673
2437	2	64	977	2026-08-03 10:07:45.393702	2026-08-03 10:07:45.393702
2438	0	63	978	2026-08-03 10:07:45.457821	2026-08-03 10:07:45.457821
2439	0	64	978	2026-08-03 10:07:45.463106	2026-08-03 10:07:45.463106
2440	0	63	979	2026-08-03 10:07:45.509698	2026-08-03 10:07:45.509698
2441	1	64	979	2026-08-03 10:07:45.514112	2026-08-03 10:07:45.514112
2442	1	63	980	2026-08-03 10:07:45.572904	2026-08-03 10:07:45.572904
2443	0	64	980	2026-08-03 10:07:45.576314	2026-08-03 10:07:45.576314
2444	2	63	981	2026-08-03 10:07:45.639491	2026-08-03 10:07:45.639491
2445	2	64	981	2026-08-03 10:07:45.642327	2026-08-03 10:07:45.642327
2446	0	63	982	2026-08-03 10:07:45.683487	2026-08-03 10:07:45.683487
2447	0	64	982	2026-08-03 10:07:45.685819	2026-08-03 10:07:45.685819
\.


--
-- Data for Name: event_feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_feedbacks (id, event_id, rating, comment, created_at, updated_at) FROM stdin;
1142	988	3	Really useful, thanks!	2026-08-03 10:08:35.805785	2026-08-03 10:08:35.805785
1143	988	4	A bit too fast for me.	2026-08-03 10:08:35.835287	2026-08-03 10:08:35.835287
1144	988	5	Best talk of the day.	2026-08-03 10:08:35.858981	2026-08-03 10:08:35.858981
1145	988	4.5	Good content, the room was too small.	2026-08-03 10:08:35.884412	2026-08-03 10:08:35.884412
1146	989	4	A bit too fast for me.	2026-08-03 10:08:35.91532	2026-08-03 10:08:35.91532
1147	989	5	Best talk of the day.	2026-08-03 10:08:36.01896	2026-08-03 10:08:36.01896
1148	989	4.5	Good content, the room was too small.	2026-08-03 10:08:36.070922	2026-08-03 10:08:36.070922
1149	989	2.5	\N	2026-08-03 10:08:36.133254	2026-08-03 10:08:36.133254
1150	989	5	I would have liked more live demos.	2026-08-03 10:08:36.195755	2026-08-03 10:08:36.195755
1151	990	5	Best talk of the day.	2026-08-03 10:08:36.26825	2026-08-03 10:08:36.26825
1152	990	4.5	Good content, the room was too small.	2026-08-03 10:08:36.334781	2026-08-03 10:08:36.334781
1153	990	2.5	\N	2026-08-03 10:08:36.380995	2026-08-03 10:08:36.380995
1154	990	5	I would have liked more live demos.	2026-08-03 10:08:36.425995	2026-08-03 10:08:36.425995
1155	990	4	Great speaker, clear slides.	2026-08-03 10:08:36.474804	2026-08-03 10:08:36.474804
1156	990	3	Really useful, thanks!	2026-08-03 10:08:36.537395	2026-08-03 10:08:36.537395
1157	991	4.5	Good content, the room was too small.	2026-08-03 10:08:36.581469	2026-08-03 10:08:36.581469
1158	991	2.5	\N	2026-08-03 10:08:36.614127	2026-08-03 10:08:36.614127
1159	991	5	I would have liked more live demos.	2026-08-03 10:08:36.639144	2026-08-03 10:08:36.639144
1160	991	4	Great speaker, clear slides.	2026-08-03 10:08:36.674681	2026-08-03 10:08:36.674681
1161	991	3	Really useful, thanks!	2026-08-03 10:08:36.712651	2026-08-03 10:08:36.712651
1162	991	4	A bit too fast for me.	2026-08-03 10:08:36.751659	2026-08-03 10:08:36.751659
1163	991	5	Best talk of the day.	2026-08-03 10:08:36.791352	2026-08-03 10:08:36.791352
1164	992	2.5	\N	2026-08-03 10:08:36.816491	2026-08-03 10:08:36.816491
1165	992	5	I would have liked more live demos.	2026-08-03 10:08:36.842638	2026-08-03 10:08:36.842638
1166	992	4	Great speaker, clear slides.	2026-08-03 10:08:36.86601	2026-08-03 10:08:36.86601
1167	992	3	Really useful, thanks!	2026-08-03 10:08:36.888021	2026-08-03 10:08:36.888021
1168	992	4	A bit too fast for me.	2026-08-03 10:08:36.916729	2026-08-03 10:08:36.916729
1169	992	5	Best talk of the day.	2026-08-03 10:08:36.945502	2026-08-03 10:08:36.945502
1170	992	4.5	Good content, the room was too small.	2026-08-03 10:08:36.974699	2026-08-03 10:08:36.974699
1171	992	2.5	\N	2026-08-03 10:08:37.010537	2026-08-03 10:08:37.010537
1172	993	5	I would have liked more live demos.	2026-08-03 10:08:37.055738	2026-08-03 10:08:37.055738
1173	993	4	Great speaker, clear slides.	2026-08-03 10:08:37.086683	2026-08-03 10:08:37.086683
1174	993	3	Really useful, thanks!	2026-08-03 10:08:37.116104	2026-08-03 10:08:37.116104
1175	993	4	A bit too fast for me.	2026-08-03 10:08:37.145591	2026-08-03 10:08:37.145591
1176	994	4	Great speaker, clear slides.	2026-08-03 10:08:37.176062	2026-08-03 10:08:37.176062
1177	994	3	Really useful, thanks!	2026-08-03 10:08:37.237793	2026-08-03 10:08:37.237793
1178	994	4	A bit too fast for me.	2026-08-03 10:08:37.291696	2026-08-03 10:08:37.291696
1179	994	5	Best talk of the day.	2026-08-03 10:08:37.348029	2026-08-03 10:08:37.348029
1180	994	4.5	Good content, the room was too small.	2026-08-03 10:08:37.391698	2026-08-03 10:08:37.391698
1181	995	3	Really useful, thanks!	2026-08-03 10:08:37.43729	2026-08-03 10:08:37.43729
1182	995	4	A bit too fast for me.	2026-08-03 10:08:37.465949	2026-08-03 10:08:37.465949
1183	995	5	Best talk of the day.	2026-08-03 10:08:37.49431	2026-08-03 10:08:37.49431
1184	995	4.5	Good content, the room was too small.	2026-08-03 10:08:37.527692	2026-08-03 10:08:37.527692
1185	995	2.5	\N	2026-08-03 10:08:37.562034	2026-08-03 10:08:37.562034
1186	995	5	I would have liked more live demos.	2026-08-03 10:08:37.606779	2026-08-03 10:08:37.606779
1187	996	4	A bit too fast for me.	2026-08-03 10:08:37.653222	2026-08-03 10:08:37.653222
1188	996	5	Best talk of the day.	2026-08-03 10:08:37.703954	2026-08-03 10:08:37.703954
1189	996	4.5	Good content, the room was too small.	2026-08-03 10:08:37.756539	2026-08-03 10:08:37.756539
1190	996	2.5	\N	2026-08-03 10:08:37.804844	2026-08-03 10:08:37.804844
1191	996	5	I would have liked more live demos.	2026-08-03 10:08:37.846801	2026-08-03 10:08:37.846801
1192	996	4	Great speaker, clear slides.	2026-08-03 10:08:37.872334	2026-08-03 10:08:37.872334
1193	996	3	Really useful, thanks!	2026-08-03 10:08:37.896045	2026-08-03 10:08:37.896045
1194	997	5	Best talk of the day.	2026-08-03 10:08:37.927282	2026-08-03 10:08:37.927282
1195	997	4.5	Good content, the room was too small.	2026-08-03 10:08:37.960824	2026-08-03 10:08:37.960824
1196	997	2.5	\N	2026-08-03 10:08:37.992982	2026-08-03 10:08:37.992982
1197	997	5	I would have liked more live demos.	2026-08-03 10:08:38.038738	2026-08-03 10:08:38.038738
1198	997	4	Great speaker, clear slides.	2026-08-03 10:08:38.079652	2026-08-03 10:08:38.079652
1199	997	3	Really useful, thanks!	2026-08-03 10:08:38.109751	2026-08-03 10:08:38.109751
1200	997	4	A bit too fast for me.	2026-08-03 10:08:38.139627	2026-08-03 10:08:38.139627
1201	997	5	Best talk of the day.	2026-08-03 10:08:38.171044	2026-08-03 10:08:38.171044
1202	998	4.5	Good content, the room was too small.	2026-08-03 10:08:38.228333	2026-08-03 10:08:38.228333
1203	998	2.5	\N	2026-08-03 10:08:38.306458	2026-08-03 10:08:38.306458
1204	998	5	I would have liked more live demos.	2026-08-03 10:08:38.39206	2026-08-03 10:08:38.39206
1205	998	4	Great speaker, clear slides.	2026-08-03 10:08:38.479886	2026-08-03 10:08:38.479886
1206	999	2.5	\N	2026-08-03 10:08:38.541484	2026-08-03 10:08:38.541484
1207	999	5	I would have liked more live demos.	2026-08-03 10:08:38.574207	2026-08-03 10:08:38.574207
1208	999	4	Great speaker, clear slides.	2026-08-03 10:08:38.604934	2026-08-03 10:08:38.604934
1209	999	3	Really useful, thanks!	2026-08-03 10:08:38.63467	2026-08-03 10:08:38.63467
1210	999	4	A bit too fast for me.	2026-08-03 10:08:38.65918	2026-08-03 10:08:38.65918
1211	1000	5	I would have liked more live demos.	2026-08-03 10:08:38.681949	2026-08-03 10:08:38.681949
1212	1000	4	Great speaker, clear slides.	2026-08-03 10:08:38.706195	2026-08-03 10:08:38.706195
1213	1000	3	Really useful, thanks!	2026-08-03 10:08:38.729499	2026-08-03 10:08:38.729499
1214	1000	4	A bit too fast for me.	2026-08-03 10:08:38.755765	2026-08-03 10:08:38.755765
1215	1000	5	Best talk of the day.	2026-08-03 10:08:38.778899	2026-08-03 10:08:38.778899
1216	1000	4.5	Good content, the room was too small.	2026-08-03 10:08:38.80214	2026-08-03 10:08:38.80214
1217	1001	4	Great speaker, clear slides.	2026-08-03 10:08:38.825022	2026-08-03 10:08:38.825022
1218	1001	3	Really useful, thanks!	2026-08-03 10:08:38.8525	2026-08-03 10:08:38.8525
1219	1001	4	A bit too fast for me.	2026-08-03 10:08:38.876682	2026-08-03 10:08:38.876682
1220	1001	5	Best talk of the day.	2026-08-03 10:08:38.903025	2026-08-03 10:08:38.903025
1221	1001	4.5	Good content, the room was too small.	2026-08-03 10:08:38.9361	2026-08-03 10:08:38.9361
1222	1001	2.5	\N	2026-08-03 10:08:38.980316	2026-08-03 10:08:38.980316
1223	1001	5	I would have liked more live demos.	2026-08-03 10:08:39.016159	2026-08-03 10:08:39.016159
1224	1002	3	Really useful, thanks!	2026-08-03 10:08:39.0482	2026-08-03 10:08:39.0482
1225	1002	4	A bit too fast for me.	2026-08-03 10:08:39.080051	2026-08-03 10:08:39.080051
1226	1002	5	Best talk of the day.	2026-08-03 10:08:39.108946	2026-08-03 10:08:39.108946
1227	1002	4.5	Good content, the room was too small.	2026-08-03 10:08:39.137897	2026-08-03 10:08:39.137897
1228	1002	2.5	\N	2026-08-03 10:08:39.165786	2026-08-03 10:08:39.165786
1229	1002	5	I would have liked more live demos.	2026-08-03 10:08:39.20167	2026-08-03 10:08:39.20167
1230	1002	4	Great speaker, clear slides.	2026-08-03 10:08:39.22868	2026-08-03 10:08:39.22868
1231	1002	3	Really useful, thanks!	2026-08-03 10:08:39.259629	2026-08-03 10:08:39.259629
1232	1003	4	A bit too fast for me.	2026-08-03 10:08:39.294472	2026-08-03 10:08:39.294472
1233	1003	5	Best talk of the day.	2026-08-03 10:08:39.369682	2026-08-03 10:08:39.369682
1234	1003	4.5	Good content, the room was too small.	2026-08-03 10:08:39.443128	2026-08-03 10:08:39.443128
1235	1003	2.5	\N	2026-08-03 10:08:39.493135	2026-08-03 10:08:39.493135
1236	1004	5	Best talk of the day.	2026-08-03 10:08:39.541136	2026-08-03 10:08:39.541136
1237	1004	4.5	Good content, the room was too small.	2026-08-03 10:08:39.589402	2026-08-03 10:08:39.589402
1238	1004	2.5	\N	2026-08-03 10:08:39.640067	2026-08-03 10:08:39.640067
1239	1004	5	I would have liked more live demos.	2026-08-03 10:08:39.674171	2026-08-03 10:08:39.674171
1240	1004	4	Great speaker, clear slides.	2026-08-03 10:08:39.715863	2026-08-03 10:08:39.715863
1241	1005	4.5	Good content, the room was too small.	2026-08-03 10:08:39.753365	2026-08-03 10:08:39.753365
1242	1005	2.5	\N	2026-08-03 10:08:39.779582	2026-08-03 10:08:39.779582
1243	1005	5	I would have liked more live demos.	2026-08-03 10:08:39.800915	2026-08-03 10:08:39.800915
1244	1005	4	Great speaker, clear slides.	2026-08-03 10:08:39.821432	2026-08-03 10:08:39.821432
1245	1005	3	Really useful, thanks!	2026-08-03 10:08:39.849861	2026-08-03 10:08:39.849861
1246	1005	4	A bit too fast for me.	2026-08-03 10:08:39.870479	2026-08-03 10:08:39.870479
1247	1006	2.5	\N	2026-08-03 10:08:39.891465	2026-08-03 10:08:39.891465
1248	1006	5	I would have liked more live demos.	2026-08-03 10:08:39.923905	2026-08-03 10:08:39.923905
1249	1006	4	Great speaker, clear slides.	2026-08-03 10:08:39.9535	2026-08-03 10:08:39.9535
1250	1006	3	Really useful, thanks!	2026-08-03 10:08:39.983191	2026-08-03 10:08:39.983191
1251	1006	4	A bit too fast for me.	2026-08-03 10:08:40.026939	2026-08-03 10:08:40.026939
1252	1006	5	Best talk of the day.	2026-08-03 10:08:40.083767	2026-08-03 10:08:40.083767
1253	1006	4.5	Good content, the room was too small.	2026-08-03 10:08:40.135804	2026-08-03 10:08:40.135804
1254	1007	5	I would have liked more live demos.	2026-08-03 10:08:40.194383	2026-08-03 10:08:40.194383
1255	1007	4	Great speaker, clear slides.	2026-08-03 10:08:40.280735	2026-08-03 10:08:40.280735
1256	1007	3	Really useful, thanks!	2026-08-03 10:08:40.39983	2026-08-03 10:08:40.39983
1257	1007	4	A bit too fast for me.	2026-08-03 10:08:40.512846	2026-08-03 10:08:40.512846
1258	1007	5	Best talk of the day.	2026-08-03 10:08:40.604129	2026-08-03 10:08:40.604129
1259	1007	4.5	Good content, the room was too small.	2026-08-03 10:08:40.713123	2026-08-03 10:08:40.713123
1260	1007	2.5	\N	2026-08-03 10:08:40.810505	2026-08-03 10:08:40.810505
1261	1007	5	I would have liked more live demos.	2026-08-03 10:08:40.863895	2026-08-03 10:08:40.863895
1262	1008	4	Great speaker, clear slides.	2026-08-03 10:08:40.922849	2026-08-03 10:08:40.922849
1263	1008	3	Really useful, thanks!	2026-08-03 10:08:40.943966	2026-08-03 10:08:40.943966
1264	1008	4	A bit too fast for me.	2026-08-03 10:08:40.962208	2026-08-03 10:08:40.962208
1265	1008	5	Best talk of the day.	2026-08-03 10:08:40.981725	2026-08-03 10:08:40.981725
1266	1028	3	Really useful, thanks!	2026-08-03 10:08:41.002939	2026-08-03 10:08:41.002939
1267	1028	4	A bit too fast for me.	2026-08-03 10:08:41.03521	2026-08-03 10:08:41.03521
1268	1028	5	Best talk of the day.	2026-08-03 10:08:41.062975	2026-08-03 10:08:41.062975
1269	1028	4.5	Good content, the room was too small.	2026-08-03 10:08:41.091109	2026-08-03 10:08:41.091109
1270	1028	2.5	\N	2026-08-03 10:08:41.119459	2026-08-03 10:08:41.119459
1271	1029	4	A bit too fast for me.	2026-08-03 10:08:41.149891	2026-08-03 10:08:41.149891
1272	1029	5	Best talk of the day.	2026-08-03 10:08:41.195033	2026-08-03 10:08:41.195033
1273	1029	4.5	Good content, the room was too small.	2026-08-03 10:08:41.241969	2026-08-03 10:08:41.241969
1274	1029	2.5	\N	2026-08-03 10:08:41.286387	2026-08-03 10:08:41.286387
1275	1029	5	I would have liked more live demos.	2026-08-03 10:08:41.321092	2026-08-03 10:08:41.321092
1276	1029	4	Great speaker, clear slides.	2026-08-03 10:08:41.356582	2026-08-03 10:08:41.356582
\.


--
-- Data for Name: event_people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_people (id, event_id, person_id, event_role, role_state, comment, created_at, updated_at, confirmation_token, notification_subject, notification_body) FROM stdin;
2871	983	334	submitter	\N	\N	2026-08-03 10:07:49.680939	2026-08-03 10:07:49.680939	\N	\N	\N
2872	983	334	speaker	confirmed	\N	2026-08-03 10:07:49.692215	2026-08-03 10:07:49.7218	ccXzFxU10F33JtT_RoRVb	\N	\N
2873	983	331	coordinator	\N	\N	2026-08-03 10:07:49.735365	2026-08-03 10:07:49.735365	\N	\N	\N
2874	984	335	submitter	\N	\N	2026-08-03 10:07:49.762035	2026-08-03 10:07:49.762035	\N	\N	\N
2819	965	341	speaker	confirmed	\N	2026-08-03 10:07:44.012689	2026-08-03 10:07:44.082168	t_-27svIfanRagDTq0olb	\N	\N
2875	984	335	speaker	confirmed	\N	2026-08-03 10:07:49.774966	2026-08-03 10:07:49.803247	MQSITPkpDTvu3-6eppJ-b	\N	\N
2818	965	336	speaker	confirmed	\N	2026-08-03 10:07:43.98613	2026-08-03 10:07:44.112186	IaqSwIslU4flA4xR8g_sb	\N	\N
2820	965	331	coordinator	\N	\N	2026-08-03 10:07:44.138905	2026-08-03 10:07:44.138905	\N	\N	\N
2821	966	337	submitter	\N	\N	2026-08-03 10:07:44.218306	2026-08-03 10:07:44.218306	\N	\N	\N
2822	966	337	speaker	confirmed	\N	2026-08-03 10:07:44.242374	2026-08-03 10:07:44.297089	ynI0yy8IeTFVTw9n0KTvb	\N	\N
2823	966	331	coordinator	\N	\N	2026-08-03 10:07:44.32436	2026-08-03 10:07:44.32436	\N	\N	\N
2824	967	338	submitter	\N	\N	2026-08-03 10:07:44.391378	2026-08-03 10:07:44.391378	\N	\N	\N
2825	967	338	speaker	confirmed	\N	2026-08-03 10:07:44.406273	2026-08-03 10:07:44.440898	sKUtlICxnVc2RpmVowMpb	\N	\N
2826	967	331	coordinator	\N	\N	2026-08-03 10:07:44.453836	2026-08-03 10:07:44.453836	\N	\N	\N
2827	968	339	submitter	\N	\N	2026-08-03 10:07:44.491657	2026-08-03 10:07:44.491657	\N	\N	\N
2828	968	339	speaker	confirmed	\N	2026-08-03 10:07:44.506673	2026-08-03 10:07:44.552236	2MF67oNDbAEyWDdMU-_5b	\N	\N
2829	968	344	speaker	confirmed	\N	2026-08-03 10:07:44.522514	2026-08-03 10:07:44.5669	mS-cfIFZt3L2myzxMSTrb	\N	\N
2830	968	331	coordinator	\N	\N	2026-08-03 10:07:44.579716	2026-08-03 10:07:44.579716	\N	\N	\N
2831	969	340	submitter	\N	\N	2026-08-03 10:07:44.614628	2026-08-03 10:07:44.614628	\N	\N	\N
2811	963	334	submitter	\N	\N	2026-08-03 10:07:43.624002	2026-08-03 10:07:43.624002	\N	\N	\N
2812	963	334	speaker	confirmed	\N	2026-08-03 10:07:43.645276	2026-08-03 10:07:43.703783	EJD77i4UDK4m-yAIBkt8b	\N	\N
2813	963	331	coordinator	\N	\N	2026-08-03 10:07:43.726072	2026-08-03 10:07:43.726072	\N	\N	\N
2814	964	335	submitter	\N	\N	2026-08-03 10:07:43.809955	2026-08-03 10:07:43.809955	\N	\N	\N
2815	964	335	speaker	confirmed	\N	2026-08-03 10:07:43.82675	2026-08-03 10:07:43.872393	DnUZyxTRT7P5jWqMa4Qlb	\N	\N
2816	964	331	coordinator	\N	\N	2026-08-03 10:07:43.891691	2026-08-03 10:07:43.891691	\N	\N	\N
2817	965	336	submitter	\N	\N	2026-08-03 10:07:43.964326	2026-08-03 10:07:43.964326	\N	\N	\N
2832	969	340	speaker	confirmed	\N	2026-08-03 10:07:44.625841	2026-08-03 10:07:44.650743	vzbAxhB1lSbw3qxLD6Pwb	\N	\N
2833	969	331	coordinator	\N	\N	2026-08-03 10:07:44.660982	2026-08-03 10:07:44.660982	\N	\N	\N
2834	970	341	submitter	\N	\N	2026-08-03 10:07:44.688211	2026-08-03 10:07:44.688211	\N	\N	\N
2835	970	341	speaker	confirmed	\N	2026-08-03 10:07:44.696524	2026-08-03 10:07:44.716593	n7Chmczj-gEBXPXJzjYSb	\N	\N
2836	970	331	coordinator	\N	\N	2026-08-03 10:07:44.724792	2026-08-03 10:07:44.724792	\N	\N	\N
2837	971	342	submitter	\N	\N	2026-08-03 10:07:44.750211	2026-08-03 10:07:44.750211	\N	\N	\N
2838	971	342	speaker	confirmed	\N	2026-08-03 10:07:44.759713	2026-08-03 10:07:44.794894	ffqr8tEbWosZFLtY-3onb	\N	\N
2839	971	347	speaker	confirmed	\N	2026-08-03 10:07:44.768773	2026-08-03 10:07:44.804485	BP6pQx5QOUAUr1bYno1fb	\N	\N
2840	971	331	coordinator	\N	\N	2026-08-03 10:07:44.814107	2026-08-03 10:07:44.814107	\N	\N	\N
2841	972	343	submitter	\N	\N	2026-08-03 10:07:44.84618	2026-08-03 10:07:44.84618	\N	\N	\N
2842	972	343	speaker	confirmed	\N	2026-08-03 10:07:44.854241	2026-08-03 10:07:44.876176	kIxLY6VnC_GQqeD89Y8Nb	\N	\N
2843	972	331	coordinator	\N	\N	2026-08-03 10:07:44.887912	2026-08-03 10:07:44.887912	\N	\N	\N
2844	973	344	submitter	\N	\N	2026-08-03 10:07:44.944141	2026-08-03 10:07:44.944141	\N	\N	\N
2845	973	344	speaker	confirmed	\N	2026-08-03 10:07:44.963597	2026-08-03 10:07:45.004931	_mUsb3IAf1XaKMM78Rbfb	\N	\N
2846	973	331	coordinator	\N	\N	2026-08-03 10:07:45.017846	2026-08-03 10:07:45.017846	\N	\N	\N
2847	974	345	submitter	\N	\N	2026-08-03 10:07:45.049083	2026-08-03 10:07:45.049083	\N	\N	\N
2848	974	345	speaker	confirmed	\N	2026-08-03 10:07:45.059908	2026-08-03 10:07:45.125836	NeDHnOs3NQF9u0n0vyC3b	\N	\N
2849	974	350	speaker	confirmed	\N	2026-08-03 10:07:45.072987	2026-08-03 10:07:45.151283	2vtsJF3QatqcxsUGIm8Tb	\N	\N
2850	974	331	coordinator	\N	\N	2026-08-03 10:07:45.175661	2026-08-03 10:07:45.175661	\N	\N	\N
2851	975	346	submitter	\N	\N	2026-08-03 10:07:45.231088	2026-08-03 10:07:45.231088	\N	\N	\N
2852	975	346	speaker	confirmed	\N	2026-08-03 10:07:45.244862	2026-08-03 10:07:45.244862	\N	\N	\N
2853	976	347	submitter	\N	\N	2026-08-03 10:07:45.293902	2026-08-03 10:07:45.293902	\N	\N	\N
2854	976	347	speaker	confirmed	\N	2026-08-03 10:07:45.307388	2026-08-03 10:07:45.307388	\N	\N	\N
2855	977	348	submitter	\N	\N	2026-08-03 10:07:45.349567	2026-08-03 10:07:45.349567	\N	\N	\N
2856	977	348	speaker	confirmed	\N	2026-08-03 10:07:45.360253	2026-08-03 10:07:45.360253	\N	\N	\N
2857	977	353	speaker	confirmed	\N	2026-08-03 10:07:45.372913	2026-08-03 10:07:45.372913	\N	\N	\N
2858	978	349	submitter	\N	\N	2026-08-03 10:07:45.419225	2026-08-03 10:07:45.419225	\N	\N	\N
2859	978	349	speaker	confirmed	\N	2026-08-03 10:07:45.438261	2026-08-03 10:07:45.438261	\N	\N	\N
2860	979	350	submitter	\N	\N	2026-08-03 10:07:45.48262	2026-08-03 10:07:45.48262	\N	\N	\N
2861	979	350	speaker	confirmed	\N	2026-08-03 10:07:45.493599	2026-08-03 10:07:45.493599	\N	\N	\N
2862	980	351	submitter	\N	\N	2026-08-03 10:07:45.532473	2026-08-03 10:07:45.532473	\N	\N	\N
2863	980	351	speaker	confirmed	\N	2026-08-03 10:07:45.545395	2026-08-03 10:07:45.545395	\N	\N	\N
2864	980	334	speaker	confirmed	\N	2026-08-03 10:07:45.559191	2026-08-03 10:07:45.559191	\N	\N	\N
2865	980	331	coordinator	\N	\N	2026-08-03 10:07:45.584381	2026-08-03 10:07:45.584381	\N	\N	\N
2866	981	352	submitter	\N	\N	2026-08-03 10:07:45.614763	2026-08-03 10:07:45.614763	\N	\N	\N
2867	981	352	speaker	confirmed	\N	2026-08-03 10:07:45.626106	2026-08-03 10:07:45.626106	\N	\N	\N
2868	982	353	submitter	\N	\N	2026-08-03 10:07:45.665181	2026-08-03 10:07:45.665181	\N	\N	\N
2869	982	353	speaker	confirmed	\N	2026-08-03 10:07:45.673664	2026-08-03 10:07:45.695515	jYPSrV-QDwtGmUqOvbdAb	\N	\N
2870	982	331	coordinator	\N	\N	2026-08-03 10:07:45.704939	2026-08-03 10:07:45.704939	\N	\N	\N
2876	984	331	coordinator	\N	\N	2026-08-03 10:07:49.81462	2026-08-03 10:07:49.81462	\N	\N	\N
2877	985	336	submitter	\N	\N	2026-08-03 10:07:49.842216	2026-08-03 10:07:49.842216	\N	\N	\N
2878	985	336	speaker	confirmed	\N	2026-08-03 10:07:49.849211	2026-08-03 10:07:49.849211	\N	\N	\N
2879	985	331	coordinator	\N	\N	2026-08-03 10:07:49.861738	2026-08-03 10:07:49.861738	\N	\N	\N
2880	986	337	submitter	\N	\N	2026-08-03 10:07:49.88069	2026-08-03 10:07:49.88069	\N	\N	\N
2881	986	337	speaker	confirmed	\N	2026-08-03 10:07:49.888542	2026-08-03 10:07:49.888542	\N	\N	\N
2882	987	338	submitter	\N	\N	2026-08-03 10:07:49.916509	2026-08-03 10:07:49.916509	\N	\N	\N
2883	987	338	speaker	confirmed	\N	2026-08-03 10:07:49.927037	2026-08-03 10:07:49.927037	\N	\N	\N
2884	988	334	submitter	\N	\N	2026-08-03 10:07:50.041961	2026-08-03 10:07:50.041961	\N	\N	\N
2885	988	334	speaker	confirmed	\N	2026-08-03 10:07:50.054947	2026-08-03 10:07:50.125354	NQM8MMCw4iczHu8CfZRPb	\N	\N
2886	988	331	coordinator	\N	\N	2026-08-03 10:07:50.137257	2026-08-03 10:07:50.137257	\N	\N	\N
2887	989	335	submitter	\N	\N	2026-08-03 10:07:50.176394	2026-08-03 10:07:50.176394	\N	\N	\N
2890	989	331	coordinator	\N	\N	2026-08-03 10:07:50.259397	2026-08-03 10:07:50.259397	\N	\N	\N
2891	990	336	submitter	\N	\N	2026-08-03 10:07:50.296524	2026-08-03 10:07:50.296524	\N	\N	\N
2892	990	336	speaker	confirmed	\N	2026-08-03 10:07:50.308552	2026-08-03 10:07:50.347635	u9nm59Io-iq4OvbzEq7Ob	\N	\N
2893	990	331	coordinator	\N	\N	2026-08-03 10:07:50.359765	2026-08-03 10:07:50.359765	\N	\N	\N
2894	991	337	submitter	\N	\N	2026-08-03 10:07:50.397233	2026-08-03 10:07:50.397233	\N	\N	\N
2896	991	331	coordinator	\N	\N	2026-08-03 10:07:50.458618	2026-08-03 10:07:50.458618	\N	\N	\N
2897	992	338	submitter	\N	\N	2026-08-03 10:07:50.497167	2026-08-03 10:07:50.497167	\N	\N	\N
2898	992	338	speaker	confirmed	\N	2026-08-03 10:07:50.509943	2026-08-03 10:07:50.603022	cMV4mVprd60DwpnfS_Bub	\N	\N
2899	992	331	coordinator	\N	\N	2026-08-03 10:07:50.625255	2026-08-03 10:07:50.625255	\N	\N	\N
2900	993	339	submitter	\N	\N	2026-08-03 10:07:50.672152	2026-08-03 10:07:50.672152	\N	\N	\N
2902	993	331	coordinator	\N	\N	2026-08-03 10:07:50.715783	2026-08-03 10:07:50.715783	\N	\N	\N
2903	994	340	submitter	\N	\N	2026-08-03 10:07:50.744333	2026-08-03 10:07:50.744333	\N	\N	\N
2904	994	340	speaker	confirmed	\N	2026-08-03 10:07:50.75296	2026-08-03 10:07:50.787572	IaVkfN5jGgQGqQzUOlu9b	\N	\N
2905	994	347	speaker	confirmed	\N	2026-08-03 10:07:50.763429	2026-08-03 10:07:50.797385	k1q1YRuCcXbaEFQs7ixyb	\N	\N
2906	994	331	coordinator	\N	\N	2026-08-03 10:07:50.806061	2026-08-03 10:07:50.806061	\N	\N	\N
2907	995	341	submitter	\N	\N	2026-08-03 10:07:50.833312	2026-08-03 10:07:50.833312	\N	\N	\N
2909	995	331	coordinator	\N	\N	2026-08-03 10:07:50.874097	2026-08-03 10:07:50.874097	\N	\N	\N
2910	996	342	submitter	\N	\N	2026-08-03 10:07:50.904539	2026-08-03 10:07:50.904539	\N	\N	\N
2911	996	342	speaker	confirmed	\N	2026-08-03 10:07:50.916798	2026-08-03 10:07:50.975201	VCFEjlv6z8ThNolCQl1qb	\N	\N
2912	996	331	coordinator	\N	\N	2026-08-03 10:07:50.986061	2026-08-03 10:07:50.986061	\N	\N	\N
2913	997	343	submitter	\N	\N	2026-08-03 10:07:51.041548	2026-08-03 10:07:51.041548	\N	\N	\N
2915	997	331	coordinator	\N	\N	2026-08-03 10:07:51.115088	2026-08-03 10:07:51.115088	\N	\N	\N
2916	998	344	submitter	\N	\N	2026-08-03 10:07:51.163759	2026-08-03 10:07:51.163759	\N	\N	\N
2917	998	344	speaker	confirmed	\N	2026-08-03 10:07:51.175959	2026-08-03 10:07:51.228296	uWlN-9tZ_bQZVwkUNqdEb	\N	\N
2918	998	351	speaker	confirmed	\N	2026-08-03 10:07:51.192983	2026-08-03 10:07:51.242498	oQYpTC6tOyWPvuGlWpe7b	\N	\N
2919	998	331	coordinator	\N	\N	2026-08-03 10:07:51.254542	2026-08-03 10:07:51.254542	\N	\N	\N
2920	999	345	submitter	\N	\N	2026-08-03 10:07:51.302876	2026-08-03 10:07:51.302876	\N	\N	\N
2922	999	331	coordinator	\N	\N	2026-08-03 10:07:51.375767	2026-08-03 10:07:51.375767	\N	\N	\N
2923	1000	346	submitter	\N	\N	2026-08-03 10:07:51.423719	2026-08-03 10:07:51.423719	\N	\N	\N
2924	1000	346	speaker	confirmed	\N	2026-08-03 10:07:51.447433	2026-08-03 10:07:51.506296	fbLRBJ_sOMDMNnLwdP69b	\N	\N
2925	1000	331	coordinator	\N	\N	2026-08-03 10:07:51.524006	2026-08-03 10:07:51.524006	\N	\N	\N
2926	1001	347	submitter	\N	\N	2026-08-03 10:07:51.57854	2026-08-03 10:07:51.57854	\N	\N	\N
2928	1001	331	coordinator	\N	\N	2026-08-03 10:07:51.633297	2026-08-03 10:07:51.633297	\N	\N	\N
2929	1002	348	submitter	\N	\N	2026-08-03 10:07:51.660547	2026-08-03 10:07:51.660547	\N	\N	\N
2930	1002	348	speaker	confirmed	\N	2026-08-03 10:07:51.669715	2026-08-03 10:07:51.697001	Lc-aee0ncGQRRAXdpyZrb	\N	\N
2931	1002	331	coordinator	\N	\N	2026-08-03 10:07:51.706511	2026-08-03 10:07:51.706511	\N	\N	\N
2932	1003	349	submitter	\N	\N	2026-08-03 10:07:51.739915	2026-08-03 10:07:51.739915	\N	\N	\N
2935	1003	331	coordinator	\N	\N	2026-08-03 10:07:51.809217	2026-08-03 10:07:51.809217	\N	\N	\N
2936	1004	350	submitter	\N	\N	2026-08-03 10:07:51.837519	2026-08-03 10:07:51.837519	\N	\N	\N
2937	1004	350	speaker	confirmed	\N	2026-08-03 10:07:51.845805	2026-08-03 10:07:51.89468	XNES9If2aFxj64hEhfnNb	\N	\N
2938	1004	331	coordinator	\N	\N	2026-08-03 10:07:51.916568	2026-08-03 10:07:51.916568	\N	\N	\N
2939	1005	351	submitter	\N	\N	2026-08-03 10:07:51.967547	2026-08-03 10:07:51.967547	\N	\N	\N
2941	1005	331	coordinator	\N	\N	2026-08-03 10:07:52.022692	2026-08-03 10:07:52.022692	\N	\N	\N
2942	1006	352	submitter	\N	\N	2026-08-03 10:07:52.058604	2026-08-03 10:07:52.058604	\N	\N	\N
2943	1006	352	speaker	confirmed	\N	2026-08-03 10:07:52.070718	2026-08-03 10:07:52.116812	_dTKP8X9qP86zS9yJZ8qb	\N	\N
2944	1006	331	coordinator	\N	\N	2026-08-03 10:07:52.129949	2026-08-03 10:07:52.129949	\N	\N	\N
2945	1007	353	submitter	\N	\N	2026-08-03 10:07:52.167332	2026-08-03 10:07:52.167332	\N	\N	\N
2949	1007	331	coordinator	\N	\N	2026-08-03 10:07:52.28419	2026-08-03 10:07:52.28419	\N	\N	\N
2950	1008	354	submitter	\N	\N	2026-08-03 10:07:52.320966	2026-08-03 10:07:52.320966	\N	\N	\N
2951	1008	354	speaker	confirmed	\N	2026-08-03 10:07:52.332904	2026-08-03 10:07:52.394379	mJxsVn8VrNrTMlMeqh1Qb	\N	\N
2952	1008	331	coordinator	\N	\N	2026-08-03 10:07:52.41523	2026-08-03 10:07:52.41523	\N	\N	\N
2953	1009	355	submitter	\N	\N	2026-08-03 10:07:52.479931	2026-08-03 10:07:52.479931	\N	\N	\N
2954	1009	355	speaker	confirmed	\N	2026-08-03 10:07:52.495222	2026-08-03 10:07:52.530469	vaXBOG4zxls5y-o1GlrWb	\N	\N
2955	1009	331	coordinator	\N	\N	2026-08-03 10:07:52.542745	2026-08-03 10:07:52.542745	\N	\N	\N
2956	1010	334	submitter	\N	\N	2026-08-03 10:07:52.573295	2026-08-03 10:07:52.573295	\N	\N	\N
2957	1010	334	speaker	confirmed	\N	2026-08-03 10:07:52.586082	2026-08-03 10:07:52.616305	-dKE-tTK3y4TDsil_qBab	\N	\N
2958	1010	331	coordinator	\N	\N	2026-08-03 10:07:52.628715	2026-08-03 10:07:52.628715	\N	\N	\N
2959	1011	335	submitter	\N	\N	2026-08-03 10:07:52.653334	2026-08-03 10:07:52.653334	\N	\N	\N
2960	1011	335	speaker	confirmed	\N	2026-08-03 10:07:52.662646	2026-08-03 10:07:52.685676	lCDHYGFw01xDL1_-vdS9b	\N	\N
2961	1011	331	coordinator	\N	\N	2026-08-03 10:07:52.695289	2026-08-03 10:07:52.695289	\N	\N	\N
2962	1012	336	submitter	\N	\N	2026-08-03 10:07:52.716856	2026-08-03 10:07:52.716856	\N	\N	\N
2963	1012	336	speaker	unclear	\N	2026-08-03 10:07:52.726051	2026-08-03 10:07:52.779799	V0epT0rKAHTfRZIi0z0sb	\N	\N
2964	1012	343	speaker	confirmed	\N	2026-08-03 10:07:52.735327	2026-08-03 10:07:52.788498	KjGNllRvoUavCY61Seudb	\N	\N
2965	1012	331	coordinator	\N	\N	2026-08-03 10:07:52.796746	2026-08-03 10:07:52.796746	\N	\N	\N
2966	1013	337	submitter	\N	\N	2026-08-03 10:07:52.818967	2026-08-03 10:07:52.818967	\N	\N	\N
2967	1013	337	speaker	offer	\N	2026-08-03 10:07:52.828737	2026-08-03 10:07:52.828737	\N	\N	\N
2968	1014	338	submitter	\N	\N	2026-08-03 10:07:52.866632	2026-08-03 10:07:52.866632	\N	\N	\N
2969	1014	338	speaker	offer	\N	2026-08-03 10:07:52.875551	2026-08-03 10:07:52.875551	\N	\N	\N
2970	1015	339	submitter	\N	\N	2026-08-03 10:07:52.92219	2026-08-03 10:07:52.92219	\N	\N	\N
2971	1015	339	speaker	offer	\N	2026-08-03 10:07:52.934946	2026-08-03 10:07:52.934946	\N	\N	\N
2972	1016	340	submitter	\N	\N	2026-08-03 10:07:52.981821	2026-08-03 10:07:52.981821	\N	\N	\N
2973	1016	340	speaker	offer	\N	2026-08-03 10:07:52.993092	2026-08-03 10:07:52.993092	\N	\N	\N
2974	1017	341	submitter	\N	\N	2026-08-03 10:07:53.05894	2026-08-03 10:07:53.05894	\N	\N	\N
2975	1017	341	speaker	offer	\N	2026-08-03 10:07:53.070221	2026-08-03 10:07:53.070221	\N	\N	\N
2976	1018	342	submitter	\N	\N	2026-08-03 10:07:53.122747	2026-08-03 10:07:53.122747	\N	\N	\N
2977	1018	342	speaker	offer	\N	2026-08-03 10:07:53.138084	2026-08-03 10:07:53.138084	\N	\N	\N
2978	1019	343	submitter	\N	\N	2026-08-03 10:07:53.180349	2026-08-03 10:07:53.180349	\N	\N	\N
2979	1019	343	speaker	offer	\N	2026-08-03 10:07:53.191809	2026-08-03 10:07:53.191809	\N	\N	\N
2980	1020	344	submitter	\N	\N	2026-08-03 10:07:53.226865	2026-08-03 10:07:53.226865	\N	\N	\N
2981	1021	345	submitter	\N	\N	2026-08-03 10:07:53.286688	2026-08-03 10:07:53.286688	\N	\N	\N
2982	1021	345	speaker	offer	\N	2026-08-03 10:07:53.29816	2026-08-03 10:07:53.29816	\N	\N	\N
2983	1022	346	submitter	\N	\N	2026-08-03 10:07:53.336007	2026-08-03 10:07:53.336007	\N	\N	\N
2984	1022	346	speaker	offer	\N	2026-08-03 10:07:53.34707	2026-08-03 10:07:53.34707	\N	\N	\N
2985	1022	331	coordinator	\N	\N	2026-08-03 10:07:53.376187	2026-08-03 10:07:53.376187	\N	\N	\N
2986	1023	347	submitter	\N	\N	2026-08-03 10:07:53.413126	2026-08-03 10:07:53.413126	\N	\N	\N
2987	1023	347	speaker	offer	\N	2026-08-03 10:07:53.431377	2026-08-03 10:07:53.431377	\N	\N	\N
2988	1023	331	coordinator	\N	\N	2026-08-03 10:07:53.487741	2026-08-03 10:07:53.487741	\N	\N	\N
2989	1024	348	submitter	\N	\N	2026-08-03 10:07:53.528007	2026-08-03 10:07:53.528007	\N	\N	\N
2990	1024	348	speaker	offer	\N	2026-08-03 10:07:53.540651	2026-08-03 10:07:53.540651	\N	\N	\N
2991	1024	331	coordinator	\N	\N	2026-08-03 10:07:53.596999	2026-08-03 10:07:53.596999	\N	\N	\N
2992	1025	349	submitter	\N	\N	2026-08-03 10:07:53.646959	2026-08-03 10:07:53.646959	\N	\N	\N
2993	1025	349	speaker	offer	\N	2026-08-03 10:07:53.665834	2026-08-03 10:07:53.665834	\N	\N	\N
2994	1026	350	submitter	\N	\N	2026-08-03 10:07:53.71013	2026-08-03 10:07:53.71013	\N	\N	\N
2995	1026	350	speaker	offer	\N	2026-08-03 10:07:53.718529	2026-08-03 10:07:53.718529	\N	\N	\N
2996	1027	351	submitter	\N	\N	2026-08-03 10:07:53.760891	2026-08-03 10:07:53.760891	\N	\N	\N
2997	1027	351	speaker	offer	\N	2026-08-03 10:07:53.769725	2026-08-03 10:07:53.792768	e5BFffvBShOv7fm-7V1kb	\N	\N
2940	1005	351	speaker	attending	\N	2026-08-03 10:07:51.979704	2026-08-03 10:08:31.862114	EL0qc7aCyAoyhtVEa4CYb	\N	\N
2946	1007	353	speaker	attending	\N	2026-08-03 10:07:52.180046	2026-08-03 10:08:31.885765	gGIjU_ULwUfdoJTthv5pb	\N	\N
2947	1007	338	speaker	attending	\N	2026-08-03 10:07:52.193835	2026-08-03 10:08:31.939704	LQcbrrAf3usGYXhjbDaTb	\N	\N
2948	1007	345	speaker	attending	\N	2026-08-03 10:07:52.21509	2026-08-03 10:08:31.989444	7c3-bioUa2GYHChPfh-qb	\N	\N
2998	1027	331	coordinator	\N	\N	2026-08-03 10:07:53.802287	2026-08-03 10:07:53.802287	\N	\N	\N
2999	1028	352	submitter	\N	\N	2026-08-03 10:07:53.860874	2026-08-03 10:07:53.860874	\N	\N	\N
3001	1028	331	coordinator	\N	\N	2026-08-03 10:07:53.983997	2026-08-03 10:07:53.983997	\N	\N	\N
3002	1029	353	submitter	\N	\N	2026-08-03 10:07:54.045121	2026-08-03 10:07:54.045121	\N	\N	\N
3003	1029	353	speaker	confirmed	\N	2026-08-03 10:07:54.060243	2026-08-03 10:07:54.109186	ziJ9kB2dd-njMVjMCUs9b	\N	\N
3004	1029	331	coordinator	\N	\N	2026-08-03 10:07:54.129587	2026-08-03 10:07:54.129587	\N	\N	\N
3005	1030	354	submitter	\N	\N	2026-08-03 10:07:54.181427	2026-08-03 10:07:54.181427	\N	\N	\N
3007	1030	331	coordinator	\N	\N	2026-08-03 10:07:54.277379	2026-08-03 10:07:54.277379	\N	\N	\N
3008	1031	355	submitter	\N	\N	2026-08-03 10:07:54.317427	2026-08-03 10:07:54.317427	\N	\N	\N
3009	1031	355	speaker	confirmed	\N	2026-08-03 10:07:54.330031	2026-08-03 10:07:54.363147	7X6e6S8-Luj_VcI5US63b	\N	\N
3010	1031	331	coordinator	\N	\N	2026-08-03 10:07:54.375079	2026-08-03 10:07:54.375079	\N	\N	\N
3011	1032	334	submitter	\N	\N	2026-08-03 10:07:54.416966	2026-08-03 10:07:54.416966	\N	\N	\N
3014	1032	331	coordinator	\N	\N	2026-08-03 10:07:54.562301	2026-08-03 10:07:54.562301	\N	\N	\N
3015	1033	335	submitter	\N	\N	2026-08-03 10:07:54.605904	2026-08-03 10:07:54.605904	\N	\N	\N
3016	1033	335	speaker	confirmed	\N	2026-08-03 10:07:54.619139	2026-08-03 10:07:54.659657	k3Mtl2sS0_Fg4c8GlvwCb	\N	\N
3017	1033	331	coordinator	\N	\N	2026-08-03 10:07:54.67128	2026-08-03 10:07:54.67128	\N	\N	\N
3018	1034	336	submitter	\N	\N	2026-08-03 10:07:54.697358	2026-08-03 10:07:54.697358	\N	\N	\N
3020	1034	331	coordinator	\N	\N	2026-08-03 10:07:54.742545	2026-08-03 10:07:54.742545	\N	\N	\N
3021	1035	337	submitter	\N	\N	2026-08-03 10:07:54.77081	2026-08-03 10:07:54.77081	\N	\N	\N
3022	1035	337	speaker	confirmed	\N	2026-08-03 10:07:54.780535	2026-08-03 10:07:54.804261	0-GWO_f4yW0GcAx2D-eYb	\N	\N
3023	1035	331	coordinator	\N	\N	2026-08-03 10:07:54.814024	2026-08-03 10:07:54.814024	\N	\N	\N
3024	1036	338	submitter	\N	\N	2026-08-03 10:07:54.845433	2026-08-03 10:07:54.845433	\N	\N	\N
3026	1036	331	coordinator	\N	\N	2026-08-03 10:07:54.983527	2026-08-03 10:07:54.983527	\N	\N	\N
3027	1037	339	submitter	\N	\N	2026-08-03 10:07:55.037592	2026-08-03 10:07:55.037592	\N	\N	\N
3028	1037	339	speaker	confirmed	\N	2026-08-03 10:07:55.057078	2026-08-03 10:07:55.094331	TWt0NemDyP242x9pnSIhb	\N	\N
3029	1037	331	coordinator	\N	\N	2026-08-03 10:07:55.114697	2026-08-03 10:07:55.114697	\N	\N	\N
3030	1038	340	submitter	\N	\N	2026-08-03 10:07:55.155001	2026-08-03 10:07:55.155001	\N	\N	\N
3032	1038	331	coordinator	\N	\N	2026-08-03 10:07:55.22233	2026-08-03 10:07:55.22233	\N	\N	\N
3033	1039	341	submitter	\N	\N	2026-08-03 10:07:55.278129	2026-08-03 10:07:55.278129	\N	\N	\N
3034	1039	341	speaker	confirmed	\N	2026-08-03 10:07:55.292652	2026-08-03 10:07:55.328275	zNU_7783LFT3t0-ZPujOb	\N	\N
3035	1039	331	coordinator	\N	\N	2026-08-03 10:07:55.341839	2026-08-03 10:07:55.341839	\N	\N	\N
3036	1040	342	submitter	\N	\N	2026-08-03 10:07:55.378923	2026-08-03 10:07:55.378923	\N	\N	\N
3039	1040	331	coordinator	\N	\N	2026-08-03 10:07:55.52016	2026-08-03 10:07:55.52016	\N	\N	\N
3040	1041	343	submitter	\N	\N	2026-08-03 10:07:55.562664	2026-08-03 10:07:55.562664	\N	\N	\N
3041	1041	343	speaker	confirmed	\N	2026-08-03 10:07:55.576191	2026-08-03 10:07:55.611832	-FY9m9j6Odzx7i2RWUZdb	\N	\N
3042	1041	331	coordinator	\N	\N	2026-08-03 10:07:55.627667	2026-08-03 10:07:55.627667	\N	\N	\N
3043	1042	344	submitter	\N	\N	2026-08-03 10:07:55.659054	2026-08-03 10:07:55.659054	\N	\N	\N
3045	1042	331	coordinator	\N	\N	2026-08-03 10:07:55.716362	2026-08-03 10:07:55.716362	\N	\N	\N
3046	1043	345	submitter	\N	\N	2026-08-03 10:07:55.776319	2026-08-03 10:07:55.776319	\N	\N	\N
3047	1043	345	speaker	confirmed	\N	2026-08-03 10:07:55.792401	2026-08-03 10:07:55.82898	7gpGUYrh-TQjisuZviwwb	\N	\N
3048	1043	331	coordinator	\N	\N	2026-08-03 10:07:55.840755	2026-08-03 10:07:55.840755	\N	\N	\N
3049	1044	346	submitter	\N	\N	2026-08-03 10:07:55.870948	2026-08-03 10:07:55.870948	\N	\N	\N
3051	1044	331	coordinator	\N	\N	2026-08-03 10:07:55.97625	2026-08-03 10:07:55.97625	\N	\N	\N
3052	1045	347	submitter	\N	\N	2026-08-03 10:07:56.03358	2026-08-03 10:07:56.03358	\N	\N	\N
3053	1045	347	speaker	confirmed	\N	2026-08-03 10:07:56.058167	2026-08-03 10:07:56.128652	2UDaxiKi0Xc14vbkB4Xbb	\N	\N
3054	1045	331	coordinator	\N	\N	2026-08-03 10:07:56.14932	2026-08-03 10:07:56.14932	\N	\N	\N
3055	1046	348	submitter	\N	\N	2026-08-03 10:07:56.201873	2026-08-03 10:07:56.201873	\N	\N	\N
3058	1046	331	coordinator	\N	\N	2026-08-03 10:07:56.356426	2026-08-03 10:07:56.356426	\N	\N	\N
3059	1047	349	submitter	\N	\N	2026-08-03 10:07:56.429062	2026-08-03 10:07:56.429062	\N	\N	\N
3060	1047	349	speaker	confirmed	\N	2026-08-03 10:07:56.445275	2026-08-03 10:07:56.479457	MKgsNp_XQvJJy-oltzR6b	\N	\N
3061	1047	331	coordinator	\N	\N	2026-08-03 10:07:56.494774	2026-08-03 10:07:56.494774	\N	\N	\N
3062	1048	350	submitter	\N	\N	2026-08-03 10:07:56.536985	2026-08-03 10:07:56.536985	\N	\N	\N
3064	1048	331	coordinator	\N	\N	2026-08-03 10:07:56.628906	2026-08-03 10:07:56.628906	\N	\N	\N
3065	1049	351	submitter	\N	\N	2026-08-03 10:07:56.658631	2026-08-03 10:07:56.658631	\N	\N	\N
3066	1049	351	speaker	confirmed	\N	2026-08-03 10:07:56.670992	2026-08-03 10:07:56.696805	snxoTp3R1YVufR6Lhi73b	\N	\N
3067	1049	331	coordinator	\N	\N	2026-08-03 10:07:56.707566	2026-08-03 10:07:56.707566	\N	\N	\N
3068	1050	352	submitter	\N	\N	2026-08-03 10:07:56.736577	2026-08-03 10:07:56.736577	\N	\N	\N
3072	1050	331	coordinator	\N	\N	2026-08-03 10:07:56.82751	2026-08-03 10:07:56.82751	\N	\N	\N
3073	1051	353	submitter	\N	\N	2026-08-03 10:07:56.857359	2026-08-03 10:07:56.857359	\N	\N	\N
3074	1051	353	speaker	confirmed	\N	2026-08-03 10:07:56.874412	2026-08-03 10:07:56.943271	hiU3YVLlbdZUl023T-Pqb	\N	\N
3075	1051	331	coordinator	\N	\N	2026-08-03 10:07:56.970536	2026-08-03 10:07:56.970536	\N	\N	\N
3076	1052	354	submitter	\N	\N	2026-08-03 10:07:57.030723	2026-08-03 10:07:57.030723	\N	\N	\N
3077	1052	354	speaker	confirmed	\N	2026-08-03 10:07:57.054564	2026-08-03 10:07:57.17089	I78mBL7R6ax5_mImxmwub	\N	\N
3078	1052	331	coordinator	\N	\N	2026-08-03 10:07:57.194922	2026-08-03 10:07:57.194922	\N	\N	\N
3079	1053	355	submitter	\N	\N	2026-08-03 10:07:57.239482	2026-08-03 10:07:57.239482	\N	\N	\N
3080	1053	355	speaker	confirmed	\N	2026-08-03 10:07:57.253057	2026-08-03 10:07:57.299841	mAEjpfZF08w-Wq4UF8WRb	\N	\N
3081	1053	331	coordinator	\N	\N	2026-08-03 10:07:57.327174	2026-08-03 10:07:57.327174	\N	\N	\N
3082	1054	334	submitter	\N	\N	2026-08-03 10:07:57.383926	2026-08-03 10:07:57.383926	\N	\N	\N
3083	1054	334	speaker	offer	\N	2026-08-03 10:07:57.400539	2026-08-03 10:07:57.400539	\N	\N	\N
3084	1055	335	submitter	\N	\N	2026-08-03 10:07:57.476287	2026-08-03 10:07:57.476287	\N	\N	\N
3085	1055	335	speaker	offer	\N	2026-08-03 10:07:57.497004	2026-08-03 10:07:57.497004	\N	\N	\N
3086	1056	336	submitter	\N	\N	2026-08-03 10:07:57.563818	2026-08-03 10:07:57.563818	\N	\N	\N
3087	1056	336	speaker	offer	\N	2026-08-03 10:07:57.579269	2026-08-03 10:07:57.579269	\N	\N	\N
3088	1057	337	submitter	\N	\N	2026-08-03 10:07:57.662226	2026-08-03 10:07:57.662226	\N	\N	\N
3089	1057	337	speaker	offer	\N	2026-08-03 10:07:57.683547	2026-08-03 10:07:57.683547	\N	\N	\N
3090	1058	338	submitter	\N	\N	2026-08-03 10:07:57.737752	2026-08-03 10:07:57.737752	\N	\N	\N
3091	1058	338	speaker	offer	\N	2026-08-03 10:07:57.748264	2026-08-03 10:07:57.748264	\N	\N	\N
3092	1059	339	submitter	\N	\N	2026-08-03 10:07:57.780623	2026-08-03 10:07:57.780623	\N	\N	\N
3093	1059	339	speaker	offer	\N	2026-08-03 10:07:57.792591	2026-08-03 10:07:57.792591	\N	\N	\N
3094	1059	331	coordinator	\N	\N	2026-08-03 10:07:57.815569	2026-08-03 10:07:57.815569	\N	\N	\N
3095	1060	340	submitter	\N	\N	2026-08-03 10:07:57.840233	2026-08-03 10:07:57.840233	\N	\N	\N
3096	1060	340	speaker	offer	\N	2026-08-03 10:07:57.850696	2026-08-03 10:07:57.850696	\N	\N	\N
3097	1060	331	coordinator	\N	\N	2026-08-03 10:07:57.904971	2026-08-03 10:07:57.904971	\N	\N	\N
3098	1061	341	submitter	\N	\N	2026-08-03 10:07:57.936394	2026-08-03 10:07:57.936394	\N	\N	\N
3099	1061	341	speaker	offer	\N	2026-08-03 10:07:57.952239	2026-08-03 10:07:57.952239	\N	\N	\N
3063	1048	350	speaker	attending	\N	2026-08-03 10:07:56.550448	2026-08-03 10:08:31.426359	yuTdf5CVUwoApMKLq4I9b	\N	\N
3069	1050	352	speaker	attending	\N	2026-08-03 10:07:56.746891	2026-08-03 10:08:31.442946	QaVhKeS2eqg6KEeJR-EXb	\N	\N
3070	1050	337	speaker	attending	\N	2026-08-03 10:07:56.760009	2026-08-03 10:08:31.460915	r2HEyBuGXNqq0MKgiKUUb	\N	\N
3071	1050	344	speaker	attending	\N	2026-08-03 10:07:56.771279	2026-08-03 10:08:31.476687	mi9uU3qmGUtMn31Q011nb	\N	\N
2888	989	335	speaker	attending	\N	2026-08-03 10:07:50.188925	2026-08-03 10:08:31.495322	-ZaIP8iZAEuYl9cWXTmEb	\N	\N
2889	989	342	speaker	attending	\N	2026-08-03 10:07:50.201345	2026-08-03 10:08:31.550303	1drXqLsGmxiiKrtDwl3Pb	\N	\N
2895	991	337	speaker	attending	\N	2026-08-03 10:07:50.408808	2026-08-03 10:08:31.606298	JlxWLDe94-JIYr8p62O9b	\N	\N
2901	993	339	speaker	attending	\N	2026-08-03 10:07:50.680868	2026-08-03 10:08:31.64358	6aA1xBO9kmG4sKedM6Hkb	\N	\N
2908	995	341	speaker	attending	\N	2026-08-03 10:07:50.843296	2026-08-03 10:08:31.674435	fEju7PUYgVXfy0x_l8yBb	\N	\N
2914	997	343	speaker	attending	\N	2026-08-03 10:07:51.057564	2026-08-03 10:08:31.707928	csUnsLo73e6Y6F3EAyOHb	\N	\N
2921	999	345	speaker	attending	\N	2026-08-03 10:07:51.318844	2026-08-03 10:08:31.73346	jjT8Lzo_5elkhxtvBEmkb	\N	\N
2927	1001	347	speaker	attending	\N	2026-08-03 10:07:51.589639	2026-08-03 10:08:31.759513	taibiMSekit_201pZHuXb	\N	\N
2933	1003	349	speaker	attending	\N	2026-08-03 10:07:51.751531	2026-08-03 10:08:31.793946	UtKWZN-uncGFmiKEy4W-b	\N	\N
2934	1003	334	speaker	attending	\N	2026-08-03 10:07:51.763234	2026-08-03 10:08:31.82895	7JVV5O8OZhPwEtSb_4mjb	\N	\N
3000	1028	352	speaker	attending	\N	2026-08-03 10:07:53.877161	2026-08-03 10:08:32.051656	73jZrs1R3G6iE47YcMTmb	\N	\N
3006	1030	354	speaker	attending	\N	2026-08-03 10:07:54.197097	2026-08-03 10:08:32.094551	AAWluNJ6612l01n6-6Twb	\N	\N
3012	1032	334	speaker	attending	\N	2026-08-03 10:07:54.43111	2026-08-03 10:08:32.153319	owykPEZdnJHY2vvHviUPb	\N	\N
3013	1032	341	speaker	attending	\N	2026-08-03 10:07:54.446262	2026-08-03 10:08:32.24931	uJdIjchJVqppcnarNQXUb	\N	\N
3019	1034	336	speaker	attending	\N	2026-08-03 10:07:54.707646	2026-08-03 10:08:32.335937	VmNjI2yh5gkgAEDtUZdQb	\N	\N
3025	1036	338	speaker	attending	\N	2026-08-03 10:07:54.864761	2026-08-03 10:08:32.399344	VOQHXFi1sy-1By8-Hor2b	\N	\N
3031	1038	340	speaker	attending	\N	2026-08-03 10:07:55.168051	2026-08-03 10:08:32.472908	Ywtg_mAf8apGUYRfZ3cJb	\N	\N
3037	1040	342	speaker	attending	\N	2026-08-03 10:07:55.394187	2026-08-03 10:08:32.546301	KLIE1WFPsMKV2o-y6U6Rb	\N	\N
3038	1040	349	speaker	attending	\N	2026-08-03 10:07:55.410649	2026-08-03 10:08:32.621882	cQe-WeNHcZpcSDNSZyFeb	\N	\N
3044	1042	344	speaker	attending	\N	2026-08-03 10:07:55.669332	2026-08-03 10:08:32.657405	g1dac5MCC0LF0O797k8Bb	\N	\N
3050	1044	346	speaker	attending	\N	2026-08-03 10:07:55.882053	2026-08-03 10:08:32.706268	oIBj5ALgaGne0Cc7H9x8b	\N	\N
3056	1046	348	speaker	attending	\N	2026-08-03 10:07:56.217461	2026-08-03 10:08:32.752546	LxqePgfrE7xbark2J-RDb	\N	\N
3057	1046	355	speaker	attending	\N	2026-08-03 10:07:56.250798	2026-08-03 10:08:32.810221	XcUWuAnKrvJP9ukJD6Qgb	\N	\N
\.


--
-- Data for Name: event_ratings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_ratings (id, event_id, person_id, rating, comment, created_at, updated_at, peer) FROM stdin;
2410	988	333	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:07:57.99605	2026-08-03 10:07:57.99605	f
2411	988	331	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:07:58.198573	2026-08-03 10:07:58.198573	f
2412	988	330	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:07:58.365305	2026-08-03 10:07:58.365305	f
2413	989	332	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:07:58.586915	2026-08-03 10:07:58.586915	f
2414	989	333	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:07:58.74201	2026-08-03 10:07:58.74201	f
2415	989	331	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:07:58.920812	2026-08-03 10:07:58.920812	f
2416	990	332	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:07:59.073868	2026-08-03 10:07:59.073868	f
2417	990	333	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:07:59.237496	2026-08-03 10:07:59.237496	f
2418	990	330	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:07:59.368285	2026-08-03 10:07:59.368285	f
2419	991	332	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:07:59.536453	2026-08-03 10:07:59.536453	f
2420	991	331	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:07:59.678653	2026-08-03 10:07:59.678653	f
2421	991	330	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:07:59.764641	2026-08-03 10:07:59.764641	f
2422	992	333	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:07:59.859477	2026-08-03 10:07:59.859477	f
2423	992	331	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:00.016149	2026-08-03 10:08:00.016149	f
2424	992	330	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:00.193837	2026-08-03 10:08:00.193837	f
2425	993	332	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:00.367196	2026-08-03 10:08:00.367196	f
2426	993	333	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:00.556585	2026-08-03 10:08:00.556585	f
2427	993	331	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:00.674816	2026-08-03 10:08:00.674816	f
2428	994	332	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:00.78137	2026-08-03 10:08:00.78137	f
2429	994	333	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:00.87855	2026-08-03 10:08:00.87855	f
2430	994	330	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:00.998818	2026-08-03 10:08:00.998818	f
2431	995	332	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:01.173879	2026-08-03 10:08:01.173879	f
2432	995	331	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:01.364026	2026-08-03 10:08:01.364026	f
2433	995	330	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:01.495904	2026-08-03 10:08:01.495904	f
2434	996	333	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:01.648832	2026-08-03 10:08:01.648832	f
2435	996	331	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:01.751948	2026-08-03 10:08:01.751948	f
2436	996	330	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:01.838527	2026-08-03 10:08:01.838527	f
2437	997	332	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:01.980813	2026-08-03 10:08:01.980813	f
2438	997	333	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:02.15002	2026-08-03 10:08:02.15002	f
2439	997	331	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:02.343667	2026-08-03 10:08:02.343667	f
2440	998	332	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:02.562123	2026-08-03 10:08:02.562123	f
2441	998	333	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:02.677009	2026-08-03 10:08:02.677009	f
2442	998	330	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:02.771811	2026-08-03 10:08:02.771811	f
2443	999	332	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:02.884164	2026-08-03 10:08:02.884164	f
2444	999	331	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:03.021564	2026-08-03 10:08:03.021564	f
2445	999	330	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:03.169348	2026-08-03 10:08:03.169348	f
2446	1000	333	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:03.343116	2026-08-03 10:08:03.343116	f
2447	1000	331	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:03.503447	2026-08-03 10:08:03.503447	f
2448	1000	330	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:03.734215	2026-08-03 10:08:03.734215	f
2449	1001	332	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:03.941274	2026-08-03 10:08:03.941274	f
2450	1001	333	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:04.146341	2026-08-03 10:08:04.146341	f
2451	1001	331	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:04.31865	2026-08-03 10:08:04.31865	f
2452	1002	332	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:04.541337	2026-08-03 10:08:04.541337	f
2453	1002	333	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:04.719232	2026-08-03 10:08:04.719232	f
2454	1002	330	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:04.861224	2026-08-03 10:08:04.861224	f
2455	1003	332	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:05.04021	2026-08-03 10:08:05.04021	f
2456	1003	331	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:05.176269	2026-08-03 10:08:05.176269	f
2457	1003	330	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:05.304588	2026-08-03 10:08:05.304588	f
2458	1004	333	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:05.468777	2026-08-03 10:08:05.468777	f
2459	1004	331	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:05.633246	2026-08-03 10:08:05.633246	f
2460	1004	330	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:05.770143	2026-08-03 10:08:05.770143	f
2461	1005	332	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:05.874946	2026-08-03 10:08:05.874946	f
2462	1005	333	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:06.009606	2026-08-03 10:08:06.009606	f
2463	1005	331	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:06.204504	2026-08-03 10:08:06.204504	f
2464	1006	332	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:06.425607	2026-08-03 10:08:06.425607	f
2465	1006	333	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:06.600628	2026-08-03 10:08:06.600628	f
2466	1006	330	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:06.710944	2026-08-03 10:08:06.710944	f
2467	1007	332	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:06.851213	2026-08-03 10:08:06.851213	f
2468	1007	331	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:07.001302	2026-08-03 10:08:07.001302	f
2469	1007	330	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:07.129131	2026-08-03 10:08:07.129131	f
2470	1008	333	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:07.294419	2026-08-03 10:08:07.294419	f
2471	1008	331	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:07.442885	2026-08-03 10:08:07.442885	f
2472	1008	330	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:07.569777	2026-08-03 10:08:07.569777	f
2473	1009	332	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:07.711149	2026-08-03 10:08:07.711149	f
2474	1009	333	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:07.820677	2026-08-03 10:08:07.820677	f
2475	1009	331	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:07.944842	2026-08-03 10:08:07.944842	f
2476	1010	332	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:08.138307	2026-08-03 10:08:08.138307	f
2477	1010	333	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:08.280058	2026-08-03 10:08:08.280058	f
2478	1010	330	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:08.393842	2026-08-03 10:08:08.393842	f
2479	1011	332	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:08.554579	2026-08-03 10:08:08.554579	f
2480	1011	331	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:08.671628	2026-08-03 10:08:08.671628	f
2481	1011	330	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:08.756967	2026-08-03 10:08:08.756967	f
2482	1012	333	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:08.858846	2026-08-03 10:08:08.858846	f
2483	1012	331	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:08.986168	2026-08-03 10:08:08.986168	f
2484	1012	330	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:09.123828	2026-08-03 10:08:09.123828	f
2488	1014	332	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:09.760731	2026-08-03 10:08:09.760731	f
2489	1014	333	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:09.872523	2026-08-03 10:08:09.872523	f
2490	1014	330	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:09.990871	2026-08-03 10:08:09.990871	f
2491	1015	332	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:10.183719	2026-08-03 10:08:10.183719	f
2492	1015	331	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:10.35089	2026-08-03 10:08:10.35089	f
2493	1015	330	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:10.482778	2026-08-03 10:08:10.482778	f
2494	1016	333	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:10.64071	2026-08-03 10:08:10.64071	f
2495	1016	331	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:10.742467	2026-08-03 10:08:10.742467	f
2496	1016	330	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:10.832522	2026-08-03 10:08:10.832522	f
2497	1017	332	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:10.956127	2026-08-03 10:08:10.956127	f
2498	1017	333	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:11.104531	2026-08-03 10:08:11.104531	f
2499	1017	331	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:11.252914	2026-08-03 10:08:11.252914	f
2500	1022	332	5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:11.400739	2026-08-03 10:08:11.400739	f
2501	1022	333	2	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:11.536484	2026-08-03 10:08:11.536484	f
2502	1022	330	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:11.649305	2026-08-03 10:08:11.649305	f
2503	1023	332	2	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:11.754754	2026-08-03 10:08:11.754754	f
2504	1023	331	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:11.875621	2026-08-03 10:08:11.875621	f
2505	1023	330	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:12.017223	2026-08-03 10:08:12.017223	f
2506	1024	333	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:12.190023	2026-08-03 10:08:12.190023	f
2507	1024	331	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:12.337249	2026-08-03 10:08:12.337249	f
2508	1024	330	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:12.481895	2026-08-03 10:08:12.481895	f
2509	1025	332	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:12.630253	2026-08-03 10:08:12.630253	f
2510	1025	333	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:12.729889	2026-08-03 10:08:12.729889	f
2511	1025	331	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:12.818828	2026-08-03 10:08:12.818828	f
2512	1026	332	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:12.990217	2026-08-03 10:08:12.990217	f
2513	1026	333	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:13.148978	2026-08-03 10:08:13.148978	f
2514	1026	330	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:13.304858	2026-08-03 10:08:13.304858	f
2515	1027	332	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:13.487499	2026-08-03 10:08:13.487499	f
2516	1027	331	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:13.627344	2026-08-03 10:08:13.627344	f
2517	1027	330	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:13.75076	2026-08-03 10:08:13.75076	f
2518	1028	333	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:13.865121	2026-08-03 10:08:13.865121	f
2519	1028	331	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:14.031042	2026-08-03 10:08:14.031042	f
2520	1028	330	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:14.187655	2026-08-03 10:08:14.187655	f
2521	1029	332	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:14.352211	2026-08-03 10:08:14.352211	f
2522	1029	333	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:14.494353	2026-08-03 10:08:14.494353	f
2523	1029	331	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:14.627913	2026-08-03 10:08:14.627913	f
2524	1030	332	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:14.809931	2026-08-03 10:08:14.809931	f
2525	1030	333	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:14.910942	2026-08-03 10:08:14.910942	f
2526	1030	330	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:15.037886	2026-08-03 10:08:15.037886	f
2527	1031	332	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:15.246185	2026-08-03 10:08:15.246185	f
2528	1031	331	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:15.38149	2026-08-03 10:08:15.38149	f
2529	1031	330	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:15.540131	2026-08-03 10:08:15.540131	f
2530	1032	333	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:15.722763	2026-08-03 10:08:15.722763	f
2531	1032	331	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:15.842408	2026-08-03 10:08:15.842408	f
2532	1032	330	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:15.990526	2026-08-03 10:08:15.990526	f
2533	1033	332	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:16.16718	2026-08-03 10:08:16.16718	f
2534	1033	333	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:16.326044	2026-08-03 10:08:16.326044	f
2535	1033	331	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:16.479279	2026-08-03 10:08:16.479279	f
2536	1034	332	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:16.622098	2026-08-03 10:08:16.622098	f
2537	1034	333	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:16.74958	2026-08-03 10:08:16.74958	f
2538	1034	330	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:16.83798	2026-08-03 10:08:16.83798	f
2539	1035	332	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:16.971099	2026-08-03 10:08:16.971099	f
2540	1035	331	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:17.105192	2026-08-03 10:08:17.105192	f
2541	1035	330	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:17.245211	2026-08-03 10:08:17.245211	f
2542	1036	333	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:17.388438	2026-08-03 10:08:17.388438	f
2543	1036	331	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:17.546971	2026-08-03 10:08:17.546971	f
2544	1036	330	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:17.664966	2026-08-03 10:08:17.664966	f
2545	1037	332	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:17.771791	2026-08-03 10:08:17.771791	f
2546	1037	333	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:17.908138	2026-08-03 10:08:17.908138	f
2547	1037	331	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:18.048091	2026-08-03 10:08:18.048091	f
2548	1038	332	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:18.2216	2026-08-03 10:08:18.2216	f
2549	1038	333	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:18.394641	2026-08-03 10:08:18.394641	f
2550	1038	330	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:18.536735	2026-08-03 10:08:18.536735	f
2551	1039	332	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:18.66826	2026-08-03 10:08:18.66826	f
2552	1039	331	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:18.763752	2026-08-03 10:08:18.763752	f
2553	1039	330	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:18.852075	2026-08-03 10:08:18.852075	f
2554	1040	333	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:18.984223	2026-08-03 10:08:18.984223	f
2555	1040	331	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:19.130358	2026-08-03 10:08:19.130358	f
2556	1040	330	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:19.259859	2026-08-03 10:08:19.259859	f
2557	1041	332	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:19.411477	2026-08-03 10:08:19.411477	f
2558	1041	333	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:19.615262	2026-08-03 10:08:19.615262	f
2559	1041	331	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:19.709482	2026-08-03 10:08:19.709482	f
2560	1042	332	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:19.839174	2026-08-03 10:08:19.839174	f
2561	1042	333	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:19.983766	2026-08-03 10:08:19.983766	f
2562	1042	330	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:20.139255	2026-08-03 10:08:20.139255	f
2563	1043	332	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:20.313847	2026-08-03 10:08:20.313847	f
2564	1043	331	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:20.461248	2026-08-03 10:08:20.461248	f
2565	1043	330	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:20.60298	2026-08-03 10:08:20.60298	f
2566	1044	333	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:20.719326	2026-08-03 10:08:20.719326	f
2567	1044	331	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:20.863549	2026-08-03 10:08:20.863549	f
2568	1044	330	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:21.01523	2026-08-03 10:08:21.01523	f
2569	1045	332	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:21.17725	2026-08-03 10:08:21.17725	f
2570	1045	333	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:21.323571	2026-08-03 10:08:21.323571	f
2571	1045	331	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:21.457354	2026-08-03 10:08:21.457354	f
2572	1046	332	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:21.631373	2026-08-03 10:08:21.631373	f
2573	1046	333	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:21.739269	2026-08-03 10:08:21.739269	f
2574	1046	330	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:21.829269	2026-08-03 10:08:21.829269	f
2575	1047	332	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:21.951716	2026-08-03 10:08:21.951716	f
2576	1047	331	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:22.08849	2026-08-03 10:08:22.08849	f
2577	1047	330	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:22.232945	2026-08-03 10:08:22.232945	f
2578	1048	333	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:22.460767	2026-08-03 10:08:22.460767	f
2579	1048	331	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:22.631631	2026-08-03 10:08:22.631631	f
2580	1048	330	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:22.720988	2026-08-03 10:08:22.720988	f
2581	1049	332	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:22.865506	2026-08-03 10:08:22.865506	f
2582	1049	333	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:23.068022	2026-08-03 10:08:23.068022	f
2583	1049	331	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:23.205775	2026-08-03 10:08:23.205775	f
2584	1050	332	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:23.363498	2026-08-03 10:08:23.363498	f
2585	1050	333	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:23.50574	2026-08-03 10:08:23.50574	f
2586	1050	330	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:23.646987	2026-08-03 10:08:23.646987	f
2587	1051	332	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:23.782928	2026-08-03 10:08:23.782928	f
2588	1051	331	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:23.886124	2026-08-03 10:08:23.886124	f
2589	1051	330	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:24.014846	2026-08-03 10:08:24.014846	f
2590	1052	333	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:24.203472	2026-08-03 10:08:24.203472	f
2591	1052	331	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:24.374895	2026-08-03 10:08:24.374895	f
2592	1052	330	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:24.557951	2026-08-03 10:08:24.557951	f
2593	1053	332	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:24.683476	2026-08-03 10:08:24.683476	f
2594	1053	333	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:24.780699	2026-08-03 10:08:24.780699	f
2595	1053	331	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:24.872282	2026-08-03 10:08:24.872282	f
2596	1054	332	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:08:25.076877	2026-08-03 10:08:25.076877	f
2597	1054	333	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:25.240509	2026-08-03 10:08:25.240509	f
2598	1054	330	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:25.359465	2026-08-03 10:08:25.359465	f
2599	1055	332	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:25.507374	2026-08-03 10:08:25.507374	f
2600	1055	331	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:25.634902	2026-08-03 10:08:25.634902	f
2601	1055	330	2	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:25.722868	2026-08-03 10:08:25.722868	f
2602	1056	333	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:25.836862	2026-08-03 10:08:25.836862	f
2603	1056	331	2	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:08:26.038051	2026-08-03 10:08:26.038051	f
2604	1056	330	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:26.204884	2026-08-03 10:08:26.204884	f
2605	1059	332	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:08:26.372094	2026-08-03 10:08:26.372094	f
2606	1059	331	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:26.626908	2026-08-03 10:08:26.626908	f
2607	1059	330	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:26.723985	2026-08-03 10:08:26.723985	f
2608	1060	333	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:26.862171	2026-08-03 10:08:26.862171	f
2609	1060	331	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:27.029317	2026-08-03 10:08:27.029317	f
2610	1060	330	4.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:27.169189	2026-08-03 10:08:27.169189	f
2611	1061	332	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:08:27.36177	2026-08-03 10:08:27.36177	f
2612	1061	333	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:08:27.513601	2026-08-03 10:08:27.513601	f
2613	1061	331	4.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:08:27.633686	2026-08-03 10:08:27.633686	f
2614	988	337	3	Peer review: methodology is sound.	2026-08-03 10:08:27.920325	2026-08-03 10:08:27.920325	t
2615	989	337	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:27.933751	2026-08-03 10:08:27.933751	t
2616	990	337	4	Peer review: solid contribution, accept.	2026-08-03 10:08:27.943493	2026-08-03 10:08:27.943493	t
2617	991	338	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:27.95939	2026-08-03 10:08:27.95939	t
2618	993	338	4	Peer review: solid contribution, accept.	2026-08-03 10:08:27.971473	2026-08-03 10:08:27.971473	t
2619	994	338	4.5	Peer review: methodology is sound.	2026-08-03 10:08:27.983632	2026-08-03 10:08:27.983632	t
2620	995	334	4	Peer review: solid contribution, accept.	2026-08-03 10:08:27.999972	2026-08-03 10:08:27.999972	t
2621	996	334	4.5	Peer review: methodology is sound.	2026-08-03 10:08:28.011345	2026-08-03 10:08:28.011345	t
2622	997	334	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.024639	2026-08-03 10:08:28.024639	t
2623	998	335	4.5	Peer review: methodology is sound.	2026-08-03 10:08:28.041032	2026-08-03 10:08:28.041032	t
2624	999	335	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.053499	2026-08-03 10:08:28.053499	t
2625	1000	335	3	Peer review: solid contribution, accept.	2026-08-03 10:08:28.068475	2026-08-03 10:08:28.068475	t
2626	1001	336	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.091186	2026-08-03 10:08:28.091186	t
2627	1002	336	3	Peer review: solid contribution, accept.	2026-08-03 10:08:28.114848	2026-08-03 10:08:28.114848	t
2628	1003	336	3.5	Peer review: methodology is sound.	2026-08-03 10:08:28.135205	2026-08-03 10:08:28.135205	t
2629	1004	339	3	Peer review: solid contribution, accept.	2026-08-03 10:08:28.154184	2026-08-03 10:08:28.154184	t
2630	1005	339	3.5	Peer review: methodology is sound.	2026-08-03 10:08:28.167372	2026-08-03 10:08:28.167372	t
2631	1006	339	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.182199	2026-08-03 10:08:28.182199	t
2632	1007	340	3.5	Peer review: methodology is sound.	2026-08-03 10:08:28.196952	2026-08-03 10:08:28.196952	t
2633	1008	340	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.210433	2026-08-03 10:08:28.210433	t
2634	1009	340	4.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.221685	2026-08-03 10:08:28.221685	t
2635	1010	341	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.2378	2026-08-03 10:08:28.2378	t
2636	1011	341	4.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.249827	2026-08-03 10:08:28.249827	t
2637	1012	341	5	Peer review: methodology is sound.	2026-08-03 10:08:28.261806	2026-08-03 10:08:28.261806	t
2638	1014	342	4.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.277125	2026-08-03 10:08:28.277125	t
2639	1015	342	5	Peer review: methodology is sound.	2026-08-03 10:08:28.288195	2026-08-03 10:08:28.288195	t
2640	1016	342	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.300388	2026-08-03 10:08:28.300388	t
2641	1017	343	5	Peer review: methodology is sound.	2026-08-03 10:08:28.317679	2026-08-03 10:08:28.317679	t
2642	1018	343	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.329063	2026-08-03 10:08:28.329063	t
2643	1020	343	3.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.347266	2026-08-03 10:08:28.347266	t
2644	1019	344	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.366854	2026-08-03 10:08:28.366854	t
2645	1021	344	3.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.381746	2026-08-03 10:08:28.381746	t
2646	1022	344	4	Peer review: methodology is sound.	2026-08-03 10:08:28.398437	2026-08-03 10:08:28.398437	t
2647	1024	345	3.5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.416009	2026-08-03 10:08:28.416009	t
2648	1028	345	4	Peer review: methodology is sound.	2026-08-03 10:08:28.429549	2026-08-03 10:08:28.429549	t
2649	1029	345	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.443165	2026-08-03 10:08:28.443165	t
2650	1029	346	4	Peer review: methodology is sound.	2026-08-03 10:08:28.458568	2026-08-03 10:08:28.458568	t
2651	1030	346	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.469267	2026-08-03 10:08:28.469267	t
2652	1031	346	5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.481252	2026-08-03 10:08:28.481252	t
2653	1033	347	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.502608	2026-08-03 10:08:28.502608	t
2654	1034	347	5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.522995	2026-08-03 10:08:28.522995	t
2655	1035	347	3	Peer review: methodology is sound.	2026-08-03 10:08:28.545175	2026-08-03 10:08:28.545175	t
2656	1035	348	5	Peer review: solid contribution, accept.	2026-08-03 10:08:28.581872	2026-08-03 10:08:28.581872	t
2657	1036	348	3	Peer review: methodology is sound.	2026-08-03 10:08:28.60491	2026-08-03 10:08:28.60491	t
2658	1037	348	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.628498	2026-08-03 10:08:28.628498	t
2659	1037	349	3	Peer review: methodology is sound.	2026-08-03 10:08:28.652984	2026-08-03 10:08:28.652984	t
2660	1038	349	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.670541	2026-08-03 10:08:28.670541	t
2661	1039	349	4	Peer review: solid contribution, accept.	2026-08-03 10:08:28.686073	2026-08-03 10:08:28.686073	t
2662	1040	350	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.700266	2026-08-03 10:08:28.700266	t
2663	1041	350	4	Peer review: solid contribution, accept.	2026-08-03 10:08:28.708908	2026-08-03 10:08:28.708908	t
2664	1042	350	4.5	Peer review: methodology is sound.	2026-08-03 10:08:28.725801	2026-08-03 10:08:28.725801	t
2665	1044	351	4	Peer review: solid contribution, accept.	2026-08-03 10:08:28.737271	2026-08-03 10:08:28.737271	t
2666	1045	351	4.5	Peer review: methodology is sound.	2026-08-03 10:08:28.744855	2026-08-03 10:08:28.744855	t
2667	1046	351	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.753224	2026-08-03 10:08:28.753224	t
2668	1047	352	4.5	Peer review: methodology is sound.	2026-08-03 10:08:28.765513	2026-08-03 10:08:28.765513	t
2669	1048	352	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.772976	2026-08-03 10:08:28.772976	t
2670	1049	352	3	Peer review: solid contribution, accept.	2026-08-03 10:08:28.781242	2026-08-03 10:08:28.781242	t
2671	1050	353	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:08:28.79439	2026-08-03 10:08:28.79439	t
2672	1054	354	3	Peer review: solid contribution, accept.	2026-08-03 10:08:28.809218	2026-08-03 10:08:28.809218	t
2673	1058	355	3.5	Peer review: methodology is sound.	2026-08-03 10:08:28.831122	2026-08-03 10:08:28.831122	t
2674	1013	332	1	I do not think this fits at all.	2026-08-03 10:08:29.280211	2026-08-03 10:08:29.280211	f
2675	1013	333	5	I would put this in the main hall.	2026-08-03 10:08:29.41801	2026-08-03 10:08:29.41801	f
2376	963	333	2.5	Abstract is a bit thin.	2026-08-03 10:07:45.727307	2026-08-03 10:07:45.727307	f
2377	963	331	3	Great fit for our audience.	2026-08-03 10:07:45.803656	2026-08-03 10:07:45.803656	f
2378	964	332	2.5	Abstract is a bit thin.	2026-08-03 10:07:45.872988	2026-08-03 10:07:45.872988	f
2379	964	333	3	Great fit for our audience.	2026-08-03 10:07:45.955682	2026-08-03 10:07:45.955682	f
2380	965	332	3	Great fit for our audience.	2026-08-03 10:07:46.042989	2026-08-03 10:07:46.042989	f
2381	965	331	4	Solid topic, would like to see it.	2026-08-03 10:07:46.153105	2026-08-03 10:07:46.153105	f
2382	966	333	4	Solid topic, would like to see it.	2026-08-03 10:07:46.257146	2026-08-03 10:07:46.257146	f
2383	966	331	4.5	Abstract is a bit thin.	2026-08-03 10:07:46.416709	2026-08-03 10:07:46.416709	f
2384	967	332	4	Solid topic, would like to see it.	2026-08-03 10:07:46.520572	2026-08-03 10:07:46.520572	f
2385	967	333	4.5	Abstract is a bit thin.	2026-08-03 10:07:46.630068	2026-08-03 10:07:46.630068	f
2386	968	332	4.5	Abstract is a bit thin.	2026-08-03 10:07:46.717684	2026-08-03 10:07:46.717684	f
2387	968	331	2	We had a similar talk last year.	2026-08-03 10:07:46.788471	2026-08-03 10:07:46.788471	f
2388	969	333	2	We had a similar talk last year.	2026-08-03 10:07:46.874024	2026-08-03 10:07:46.874024	f
2389	969	331	2.5	Solid topic, would like to see it.	2026-08-03 10:07:46.976431	2026-08-03 10:07:46.976431	f
2390	970	332	2	We had a similar talk last year.	2026-08-03 10:07:47.077365	2026-08-03 10:07:47.077365	f
2391	970	333	2.5	Solid topic, would like to see it.	2026-08-03 10:07:47.193601	2026-08-03 10:07:47.193601	f
2392	971	332	2.5	Solid topic, would like to see it.	2026-08-03 10:07:47.313558	2026-08-03 10:07:47.313558	f
2393	971	331	3.5	Great fit for our audience.	2026-08-03 10:07:47.402814	2026-08-03 10:07:47.402814	f
2394	972	333	3.5	Great fit for our audience.	2026-08-03 10:07:47.500108	2026-08-03 10:07:47.500108	f
2395	972	331	4	We had a similar talk last year.	2026-08-03 10:07:47.614935	2026-08-03 10:07:47.614935	f
2396	973	332	3.5	Great fit for our audience.	2026-08-03 10:07:47.673904	2026-08-03 10:07:47.673904	f
2397	973	333	4	We had a similar talk last year.	2026-08-03 10:07:47.734923	2026-08-03 10:07:47.734923	f
2398	974	332	4	We had a similar talk last year.	2026-08-03 10:07:47.788415	2026-08-03 10:07:47.788415	f
2399	974	331	5	Abstract is a bit thin.	2026-08-03 10:07:47.852257	2026-08-03 10:07:47.852257	f
2400	975	333	5	Abstract is a bit thin.	2026-08-03 10:07:47.916491	2026-08-03 10:07:47.916491	f
2401	975	331	2	Great fit for our audience.	2026-08-03 10:07:48.028163	2026-08-03 10:07:48.028163	f
2402	976	332	5	Abstract is a bit thin.	2026-08-03 10:07:48.139528	2026-08-03 10:07:48.139528	f
2403	976	333	2	Great fit for our audience.	2026-08-03 10:07:48.245235	2026-08-03 10:07:48.245235	f
2404	977	332	2	Great fit for our audience.	2026-08-03 10:07:48.334863	2026-08-03 10:07:48.334863	f
2405	977	331	3	Solid topic, would like to see it.	2026-08-03 10:07:48.418987	2026-08-03 10:07:48.418987	f
2406	980	332	3.5	Abstract is a bit thin.	2026-08-03 10:07:48.494118	2026-08-03 10:07:48.494118	f
2407	980	331	4.5	We had a similar talk last year.	2026-08-03 10:07:48.5778	2026-08-03 10:07:48.5778	f
2408	982	332	4.5	We had a similar talk last year.	2026-08-03 10:07:48.648885	2026-08-03 10:07:48.648885	f
2409	982	333	5	Solid topic, would like to see it.	2026-08-03 10:07:48.711816	2026-08-03 10:07:48.711816	f
\.


--
-- Data for Name: event_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_translations (id, title, subtitle, abstract, description, locale, event_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events (id, conference_id, title, subtitle, event_type, time_slots, state, language, start_time, abstract, description, public, logo_file_name, logo_content_type, logo_file_size, logo_updated_at, track_id, room_id, created_at, updated_at, average_rating, event_ratings_count, note, submission_note, speaker_count, event_feedbacks_count, average_feedback, guid, do_not_record, recording_license, tech_rider, invite_token, video_url, coauthors, coauthor_1, coauthor_2, coauthor_3, coauthor_4, coauthor_5, coauthor_1_name, coauthor_1_last_name, coauthor_2_name, coauthor_2_last_name, coauthor_3_name, coauthor_3_last_name, coauthor_4_name, coauthor_4_last_name, coauthor_5_name, coauthor_5_last_name) FROM stdin;
1057	42	A grammar of graphics for the web	Charts without a framework	lecture	4	new	en	\N	A grammar of graphics for the web. Charts without a framework. This abstract is demo content generated by demo:seed.	A longer description for "A grammar of graphics for the web".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	\N	2026-06-29 10:07:57.641357	2026-08-03 10:07:57.689147	\N	0	\N	\N	1	0	\N	cc9b98d0-a774-4de9-a446-befe827c6068	f	CC BY-SA 4.0	\N	7fio6UZ6T2CoBLjZLYR7sNJA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
978	40	Debugging production at 3am	War stories	lightning_talk	2	new	en	\N	Debugging production at 3am. War stories. This abstract is demo content generated by demo:seed.	A longer description for "Debugging production at 3am".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	166	\N	2026-07-29 10:07:45.403288	2026-08-03 10:07:45.445725	\N	0	\N	\N	1	0	\N	65f47733-6c84-4384-ae4f-903da391384b	f	CC BY-SA 4.0	\N	5AmH4iwkK8WGLbjuBsT5hkbB	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	40	Why we left microservices	And what we built instead	lecture	4	new	en	\N	Why we left microservices. And what we built instead. This abstract is demo content generated by demo:seed.	A longer description for "Why we left microservices".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	166	\N	2026-07-30 10:07:45.468553	2026-08-03 10:07:45.498383	\N	0	\N	Prefers a morning slot.	1	0	\N	9956cb88-881e-4266-a66f-efb6d530ccef	f	CC BY-SA 4.0	\N	ocQEW5aNJqJgRTbwW3aG5hCi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
981	40	Terraform anti-patterns	Modules gone wrong	lightning_talk	2	withdrawn	de	\N	Terraform anti-patterns. Modules gone wrong. This abstract is demo content generated by demo:seed.	A longer description for "Terraform anti-patterns".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	168	\N	2026-08-01 10:07:45.60173	2026-08-03 10:07:45.64976	\N	0	\N	Prefers a morning slot.	1	0	\N	57ba383a-c4a7-4e74-ba6a-5ad338cb9ec9	f	CC BY-SA 4.0	\N	r93DqK8YDfYz3T9x5djKPdK5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
972	40	Supply chain attacks explained	How dependencies bite	lecture	4	unconfirmed	fr	\N	Supply chain attacks explained. How dependencies bite. This abstract is demo content generated by demo:seed.	A longer description for "Supply chain attacks explained".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	169	\N	2026-07-23 10:07:44.829874	2026-08-03 10:07:47.619348	3.75	2	\N	\N	1	0	\N	e2f1e872-08e8-441a-b93d-ca149af48218	f	CC BY-SA 4.0	\N	jAD7CMzGMPX7FYZTwBQSi3f1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
973	40	Secrets management done right	Stop committing .env	lightning_talk	2	unconfirmed	en	\N	Secrets management done right. Stop committing .env. This abstract is demo content generated by demo:seed.	A longer description for "Secrets management done right".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	169	\N	2026-07-24 10:07:44.921217	2026-08-03 10:07:47.73831	3.75	2	\N	Prefers a morning slot.	1	0	\N	b55a18f3-8805-40a7-b066-e128a7b2728f	f	CC BY-SA 4.0	\N	HRmiM8Q7ibcuwLnbmynCkaic	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
974	40	Running a conference on frab	Lessons from the orga desk	lecture	4	unconfirmed	en	\N	Running a conference on frab. Lessons from the orga desk. This abstract is demo content generated by demo:seed.	A longer description for "Running a conference on frab".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	170	\N	2026-07-25 10:07:45.037472	2026-08-03 10:07:47.855626	4.5	2	\N	\N	2	0	\N	c1bc1d7f-e5e1-4b40-b4e6-625b010ff1f6	f	CC BY-SA 4.0	\N	TRRJuMKcoiyVnq8T5JXx717P	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	40	Growing a local user group	From 5 to 300 people	lecture	4	review	en	\N	Growing a local user group. From 5 to 300 people. This abstract is demo content generated by demo:seed.	A longer description for "Growing a local user group".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	170	\N	2026-07-26 10:07:45.21314	2026-08-03 10:07:48.033297	3.5	2	\N	Prefers a morning slot.	1	0	\N	96f2a598-71e1-41c5-8917-b94fee51edb0	f	CC BY-SA 4.0	\N	8Dh3gzxJJsX8besTZhinNKMV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
976	40	Code of conduct enforcement	The unglamorous work	podium	4	review	de	\N	Code of conduct enforcement. The unglamorous work. This abstract is demo content generated by demo:seed.	A longer description for "Code of conduct enforcement".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	170	\N	2026-07-27 10:07:45.276743	2026-08-03 10:07:48.250256	3.5	2	\N	\N	1	0	\N	7513a717-449e-46d8-9daa-7e97df8a9116	f	CC BY-SA 4.0	\N	inMEWUbB9ns7aECeFx5p8SoU	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
977	40	My first open source contribution	A beginner story	lightning_talk	2	review	fr	\N	My first open source contribution. A beginner story. This abstract is demo content generated by demo:seed.	A longer description for "My first open source contribution".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	170	\N	2026-07-28 10:07:45.335818	2026-08-03 10:07:48.423893	2.5	2	\N	Prefers a morning slot.	2	0	\N	dd397ba9-db59-4869-91b9-3e83f63fadd9	t	CC BY-SA 4.0	\N	41bJY6Zs6LnvwvhcsETgZBkq	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
980	40	Accessibility is not optional	Testing with real users	lecture	4	rejected	en	\N	Accessibility is not optional. Testing with real users. This abstract is demo content generated by demo:seed.	A longer description for "Accessibility is not optional".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	167	\N	2026-07-31 10:07:45.518615	2026-08-03 10:07:48.582557	4	2	\N	\N	2	0	\N	3a287898-652d-4ad7-b624-e55b332f66f9	f	CC BY-SA 4.0	\N	Z4aG8fxUiucAxH9C8nrNxh8C	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
982	40	Ask the organizers anything	Open Q&A	podium	8	canceled	fr	\N	Ask the organizers anything. Open Q&A. This abstract is demo content generated by demo:seed.	A longer description for "Ask the organizers anything".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	170	\N	2026-08-02 10:07:45.654997	2026-08-03 10:07:48.715135	4.75	2	\N	\N	1	0	\N	645f7664-27b4-4f83-92f5-f36a226674d7	f	CC BY-SA 4.0	\N	ros5KPcYbLesgvgL26yqRcyq	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
963	40	Scaling Rails to a million requests	What actually breaks first	lecture	4	confirmed	en	2026-08-24 07:00:00	Scaling Rails to a million requests. What actually breaks first. This abstract is demo content generated by demo:seed.	A longer description for "Scaling Rails to a million requests".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	166	123	2026-07-14 10:07:43.570951	2026-08-03 10:07:48.764515	2.75	2	\N	Prefers a morning slot.	1	0	\N	b59c630a-2179-4c9d-9a8c-0841f1a710d8	t	CC BY-SA 4.0	\N	6C2CAvcStmaYDTcGAnJHB3FE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
964	40	Postgres indexes you are not using	A practical tour	lecture	4	confirmed	en	2026-08-25 07:00:00	Postgres indexes you are not using. A practical tour. This abstract is demo content generated by demo:seed.	A longer description for "Postgres indexes you are not using".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	166	123	2026-07-15 10:07:43.787386	2026-08-03 10:07:48.774852	2.75	2	\N	\N	1	0	\N	1bd8a901-4006-4180-b47e-5c9c13d58664	f	CC BY-SA 4.0	\N	u2n4yxnFXkAzN57hNchdqKyc	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
965	40	Hexagonal architecture in practice	Ports, adapters, regrets	lecture	4	confirmed	en	2026-08-26 07:00:00	Hexagonal architecture in practice. Ports, adapters, regrets. This abstract is demo content generated by demo:seed.	A longer description for "Hexagonal architecture in practice".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	166	123	2026-07-16 10:07:43.94033	2026-08-03 10:07:48.785692	3.5	2	\N	Prefers a morning slot.	2	0	\N	acc2ae1b-19fa-45d0-ba55-f28907e08877	f	CC BY-SA 4.0	\N	NcYaWJ1wrXjdbjC9pKf5RCN7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
966	40	Building a design system from zero	Without a design team	workshop	8	confirmed	de	2026-08-24 07:00:00	Building a design system from zero. Without a design team. This abstract is demo content generated by demo:seed.	A longer description for "Building a design system from zero".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	167	124	2026-07-17 10:07:44.190506	2026-08-03 10:07:48.798786	4.25	2	\N	\N	1	0	\N	3f2e9055-9265-409f-ac0a-c723bdb5a370	f	CC BY-SA 4.0	\N	DjEBz9e3xzHhCMqTtAhf8GMY	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	40	CSS layout in 2026	Grid, subgrid and beyond	lecture	4	confirmed	fr	2026-08-25 07:00:00	CSS layout in 2026. Grid, subgrid and beyond. This abstract is demo content generated by demo:seed.	A longer description for "CSS layout in 2026".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	167	124	2026-07-18 10:07:44.371604	2026-08-03 10:07:48.808545	4.25	2	\N	Prefers a morning slot.	1	0	\N	1b429801-c020-42db-970a-d86fe925a6c0	f	CC BY-SA 4.0	\N	VPPuYRyETUs8Fq7ThWZ2FV8x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
968	40	Kubernetes without tears	An honest retrospective	lecture	4	confirmed	en	2026-08-26 07:00:00	Kubernetes without tears. An honest retrospective. This abstract is demo content generated by demo:seed.	A longer description for "Kubernetes without tears".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	168	124	2026-07-19 10:07:44.479339	2026-08-03 10:07:48.817844	3.25	2	\N	\N	2	0	\N	09e5f6b9-611e-472e-aeaa-e37f91022899	f	CC BY-SA 4.0	\N	4CemEvpkoi5wpG3EyFAzi3R5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
969	40	Observability on a budget	Logs, metrics, traces	lecture	4	confirmed	en	2026-08-24 07:00:00	Observability on a budget. Logs, metrics, traces. This abstract is demo content generated by demo:seed.	A longer description for "Observability on a budget".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	168	125	2026-07-20 10:07:44.603145	2026-08-03 10:07:48.829952	2.25	2	\N	Prefers a morning slot.	1	0	\N	12af2c83-d754-4a71-bffc-8fea73e96425	f	CC BY-SA 4.0	\N	zgc5y5MGY9J285Ee9NJim26U	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
970	40	Zero downtime migrations	A hands-on workshop	workshop	8	confirmed	en	2026-08-25 07:00:00	Zero downtime migrations. A hands-on workshop. This abstract is demo content generated by demo:seed.	A longer description for "Zero downtime migrations".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	168	125	2026-07-21 10:07:44.678941	2026-08-03 10:07:48.840602	2.25	2	\N	\N	1	0	\N	0a596853-22ef-4fc5-b4ca-16e25b932ccd	t	CC BY-SA 4.0	\N	rQopbPYXPYCXE3zBx9bcEvY2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	40	Threat modeling for small teams	Start on a whiteboard	lecture	4	confirmed	de	2026-08-26 07:00:00	Threat modeling for small teams. Start on a whiteboard. This abstract is demo content generated by demo:seed.	A longer description for "Threat modeling for small teams".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	169	125	2026-07-22 10:07:44.740644	2026-08-03 10:07:48.851699	3	2	\N	Prefers a morning slot.	2	0	\N	8d18bc92-4a39-45b0-bc10-2b7c75014643	f	CC BY-SA 4.0	\N	adrZ2RrtCEdxhSXooMJ9ezad	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
983	41	Ruby 4 in production	Ruby devroom talk	lecture	2	accepting	en	\N	Ruby 4 in production. Demo submission for the Ruby devroom.	Demo description for "Ruby 4 in production".	t	\N	\N	\N	\N	171	\N	2026-08-03 10:07:49.67253	2026-08-03 10:07:49.74615	\N	0	\N	\N	1	0	\N	540f7d39-c863-4561-b543-769f3bebb17d	f	\N	\N	H9QismPRWhqJYfaaeRLLKzv3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
984	41	Rewriting Sidekiq jobs	Ruby devroom talk	lecture	2	accepting	en	\N	Rewriting Sidekiq jobs. Demo submission for the Ruby devroom.	Demo description for "Rewriting Sidekiq jobs".	t	\N	\N	\N	\N	171	\N	2026-08-03 10:07:49.752741	2026-08-03 10:07:49.828852	\N	0	\N	\N	1	0	\N	395c6a02-e0f6-4d93-b854-0355f6bef8c1	f	\N	\N	kRQ4tZkY5FQDL39NQxNXe8C2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
985	41	Hanami vs Rails	Ruby devroom talk	lecture	2	rejecting	en	\N	Hanami vs Rails. Demo submission for the Ruby devroom.	Demo description for "Hanami vs Rails".	t	\N	\N	\N	\N	171	\N	2026-08-03 10:07:49.834026	2026-08-03 10:07:49.868772	\N	0	\N	\N	1	0	\N	1a932bd8-d8e0-4c83-8e6c-24f1ca57becd	f	\N	\N	mr1Zy39WZi3GW8qu3ZdkisZx	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
986	41	Fibers for the impatient	Ruby devroom talk	lecture	2	review	en	\N	Fibers for the impatient. Demo submission for the Ruby devroom.	Demo description for "Fibers for the impatient".	t	\N	\N	\N	\N	171	\N	2026-08-03 10:07:49.87334	2026-08-03 10:07:49.898982	\N	0	\N	\N	1	0	\N	302aebd7-6229-4d47-8842-85900c69dabb	f	\N	\N	o5wi4emP3xtctHuECt7VxiG7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
987	41	My gem has 12 downloads	Ruby devroom talk	lecture	2	new	en	\N	My gem has 12 downloads. Demo submission for the Ruby devroom.	Demo description for "My gem has 12 downloads".	t	\N	\N	\N	\N	171	\N	2026-08-03 10:07:49.90612	2026-08-03 10:07:49.931176	\N	0	\N	\N	1	0	\N	6b25a195-3f10-48d7-a884-7dec4fb579d4	f	\N	\N	TQR82BKNqVhLYamEh1s3RH66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1023	42	Blockchain for conference tickets	A proposal	lecture	4	rejected	fr	\N	Blockchain for conference tickets. A proposal. This abstract is demo content generated by demo:seed.	A longer description for "Blockchain for conference tickets".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-05-26 10:07:53.395151	2026-08-03 10:08:12.02259	2.8333333333333335	3	Off topic for this edition.	\N	1	0	\N	87eb8d24-d536-402e-b3bd-d3ac44db9439	f	CC BY-SA 4.0	\N	5GEanbgebz8HupEexxDGKgpn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1025	42	Migrating 200 microservices	A long story	lecture	8	withdrawn	en	\N	Migrating 200 microservices. A long story. This abstract is demo content generated by demo:seed.	A longer description for "Migrating 200 microservices".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-05-28 10:07:53.626965	2026-08-03 10:08:12.822056	3.5	3	\N	\N	1	0	\N	4f485067-e53e-44c9-9a0e-f9183cbc19e0	f	CC BY-SA 4.0	\N	28MVukeDWwgruoStFTWGUcTQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1026	42	Kubernetes operators from scratch	Writing your own controller	workshop	8	withdrawn	en	\N	Kubernetes operators from scratch. Writing your own controller. This abstract is demo content generated by demo:seed.	A longer description for "Kubernetes operators from scratch".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-05-29 10:07:53.701507	2026-08-03 10:08:13.311117	4.166666666666667	3	Speaker changed employer.	\N	1	0	\N	7a6548b4-73ec-4de4-a917-6dcfc9c574c0	f	CC BY-SA 4.0	\N	QM37XP51je1wSsCGQfQa9gnQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1027	42	Sponsor session: observability tooling	Vendor showcase	other	4	canceled	en	\N	Sponsor session: observability tooling. Vendor showcase. This abstract is demo content generated by demo:seed.	A longer description for "Sponsor session: observability tooling".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	\N	2026-05-30 10:07:53.751875	2026-08-03 10:08:13.754337	3.6666666666666665	3	Sponsor pulled out two weeks before the event.	\N	1	0	\N	931ee5c8-ac75-4e75-80ad-b348589753d9	f	CC BY-SA 4.0	\N	8EdpVm5n4GDska5jNKywUABi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1051	42	Building a plugin system	Extension points done right	lecture	4	unconfirmed	en	\N	Building a plugin system. Extension points done right. This abstract is demo content generated by demo:seed.	A longer description for "Building a plugin system".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-06-23 10:07:56.847344	2026-08-03 10:08:24.022171	2.8333333333333335	3	\N	\N	1	0	\N	3cfb2dfd-66ee-4e11-bd72-2bb5a559100c	f	CC BY-SA 4.0	\N	JG9YcR24DZPZ3zsmU3P1a5ow	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1052	42	Offline-first web apps	Sync is the hard part	lecture	4	unconfirmed	de	\N	Offline-first web apps. Sync is the hard part. This abstract is demo content generated by demo:seed.	A longer description for "Offline-first web apps".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-06-24 10:07:57.009532	2026-08-03 10:08:24.565102	3.5	3	\N	\N	1	0	\N	f5927137-bcad-4d1b-85d6-326661822b1c	f	CC BY-SA 4.0	\N	BYLyWJEmvbHSZ76JND8ZmTP9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1053	42	Cost control in the cloud	Reading the bill	lecture	4	unconfirmed	fr	\N	Cost control in the cloud. Reading the bill. This abstract is demo content generated by demo:seed.	A longer description for "Cost control in the cloud".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-06-25 10:07:57.217962	2026-08-03 10:08:24.875904	3.5	3	\N	Would prefer the second day.	1	0	\N	b23e441c-946b-4772-900f-b81d0026c40b	f	CC BY-SA 4.0	\N	ucBkYH8ZDw8u8qCZY7v23pML	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1055	42	Dark mode is an accessibility feature	Contrast in both themes	lecture	4	review	en	\N	Dark mode is an accessibility feature. Contrast in both themes. This abstract is demo content generated by demo:seed.	A longer description for "Dark mode is an accessibility feature".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-06-27 10:07:57.453548	2026-08-03 10:08:25.726247	3.6666666666666665	3	\N	\N	1	0	\N	dc5db80e-40f8-4bf7-b8b3-e1e58134aa14	f	CC BY-SA 4.0	\N	CkqcdySMz7m3pSEibzWzrR2R	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1056	42	Running Postgres yourself	When managed is not an option	lecture	4	review	en	\N	Running Postgres yourself. When managed is not an option. This abstract is demo content generated by demo:seed.	A longer description for "Running Postgres yourself".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-06-28 10:07:57.549926	2026-08-03 10:08:26.211579	3.1666666666666665	3	\N	\N	1	0	\N	048c0cb2-7279-4555-afe4-8d5c6ccccea9	f	CC BY-SA 4.0	\N	FLcxfPwtBbdzLiHbwbQ8Eg2k	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1059	42	Our new JavaScript framework	You will love it	lecture	4	rejected	fr	\N	Our new JavaScript framework. You will love it. This abstract is demo content generated by demo:seed.	A longer description for "Our new JavaScript framework".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-07-01 10:07:57.771228	2026-08-03 10:08:26.727628	3.3333333333333335	3	\N	\N	1	0	\N	9ef8cede-1e5b-46e6-84df-064b88cdc138	f	CC BY-SA 4.0	\N	13t6JDfoo3QJXc5MALTWnHmG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1060	42	AI will replace conferences	A provocation	podium	4	rejected	en	\N	AI will replace conferences. A provocation. This abstract is demo content generated by demo:seed.	A longer description for "AI will replace conferences".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	\N	2026-07-02 10:07:57.830363	2026-08-03 10:08:27.176086	4	3	Programme committee voted this down unanimously.	\N	1	0	\N	bf23f7ae-0d87-4ce7-a3fd-af9c74efe122	f	CC BY-SA 4.0	\N	zdeYEt5R1MLNfKX1NKkd7taY	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	42	Scaling our support team	Not a technical talk	lecture	4	withdrawn	en	\N	Scaling our support team. Not a technical talk. This abstract is demo content generated by demo:seed.	A longer description for "Scaling our support team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-07-03 10:07:57.923639	2026-08-03 10:08:27.637482	4	3	\N	\N	1	0	\N	626b10e1-8b6a-4668-ad45-7963c075b0f0	f	CC BY-SA 4.0	\N	UDeM7tsak2oqDt6eTBpGtoj2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1010	42	Feature flags at scale	Cleaning up is the hard part	lecture	4	unconfirmed	de	\N	Feature flags at scale. Cleaning up is the hard part. This abstract is demo content generated by demo:seed.	A longer description for "Feature flags at scale".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-05-13 10:07:52.56193	2026-08-03 10:08:28.242805	3.375	4	\N	\N	1	0	\N	df3285db-016d-4472-aaf3-067a6d05319c	f	CC BY-SA 4.0	\N	C1QPUNDyUuTGJtxg9dJ7qwht	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	42	Fine-tuning on a laptop	Small models, real results	workshop	8	unconfirmed	fr	\N	Fine-tuning on a laptop. Small models, real results. This abstract is demo content generated by demo:seed.	A longer description for "Fine-tuning on a laptop".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	\N	2026-05-14 10:07:52.643427	2026-08-03 10:08:28.254968	4	4	\N	Can only attend on the last day.	1	0	\N	91f83466-f3b9-4f45-abdb-44504e471ec9	f	CC BY-SA 4.0	\N	ssRmGHQg5VXjNfpZktPQpHsz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1012	42	Passkeys in production	Killing the password	lecture	4	unconfirmed	en	\N	Passkeys in production. Killing the password. This abstract is demo content generated by demo:seed.	A longer description for "Passkeys in production".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	\N	2026-05-15 10:07:52.708532	2026-08-03 10:08:28.266561	4.625	4	\N	\N	2	0	\N	451dcfcf-5f2f-4e64-bce2-08d245f2c2ea	f	CC BY-SA 4.0	\N	imtZZCc2jw4x9SZ7qTS5MXmi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1015	42	Incident response on a shoestring	Two people, one pager	lecture	4	review	en	\N	Incident response on a shoestring. Two people, one pager. This abstract is demo content generated by demo:seed.	A longer description for "Incident response on a shoestring".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-05-18 10:07:52.89902	2026-08-03 10:08:28.293688	3.875	4	\N	\N	1	0	\N	056c5a12-e908-4a08-9198-1781c480c374	f	CC BY-SA 4.0	\N	8P7UXTyRTWKUoYQYdnr5d86o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1016	42	Privacy engineering basics	GDPR for developers	lecture	6	review	de	\N	Privacy engineering basics. GDPR for developers. This abstract is demo content generated by demo:seed.	A longer description for "Privacy engineering basics".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	\N	2026-05-19 10:07:52.969057	2026-08-03 10:08:28.305534	3	4	\N	\N	1	0	\N	703c30a9-fd5f-49a0-ae20-6689ad81865a	f	CC BY-SA 4.0	\N	gUP84Lq61PwEUuQT4Booz29F	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1018	42	Rewriting our search stack	Elastic, Postgres, or neither	lecture	4	new	en	\N	Rewriting our search stack. Elastic, Postgres, or neither. This abstract is demo content generated by demo:seed.	A longer description for "Rewriting our search stack".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-05-21 10:07:53.106148	2026-08-03 10:08:28.338711	3	1	\N	\N	1	0	\N	de0f4d19-9825-4771-a45f-4ab6142f98bf	f	CC BY-SA 4.0	\N	qMCAkpbxwX8XH3LEvnBEnjSZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1020	42	Self-hosting your metrics	Prometheus on one box	lecture	4	new	en	\N	Self-hosting your metrics. Prometheus on one box. This abstract is demo content generated by demo:seed.	A longer description for "Self-hosting your metrics".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	\N	2026-05-23 10:07:53.215197	2026-08-03 10:08:28.356949	3.5	1	\N	\N	0	0	\N	d0aa6ea8-b657-4800-b72f-ce92203f9c55	f	CC BY-SA 4.0	\N	DYukJsYzMv3XcDzVP1LTxaA3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1019	42	A11y audits that developers act on	Reports nobody reads	lecture	4	new	en	\N	A11y audits that developers act on. Reports nobody reads. This abstract is demo content generated by demo:seed.	A longer description for "A11y audits that developers act on".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-05-22 10:07:53.168558	2026-08-03 10:08:28.375719	3	1	\N	\N	1	0	\N	755a74e5-7987-41aa-b64d-978bec8ae796	f	CC BY-SA 4.0	\N	MdhauhE5CtRJExuWDAxr33NE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1021	42	Open data for city budgets	Scraping, cleaning, publishing	lecture	4	new	en	\N	Open data for city budgets. Scraping, cleaning, publishing. This abstract is demo content generated by demo:seed.	A longer description for "Open data for city budgets".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	\N	2026-05-24 10:07:53.27354	2026-08-03 10:08:28.390834	3.5	1	\N	First time speaker, would appreciate mentoring.	1	0	\N	04811d2f-3160-4293-80ae-f0ff00e0020e	f	CC BY-SA 4.0	\N	AUPe3hFQ2ZaUTpUxLQaNpf3a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	42	Why our startup failed	A cautionary tale	lecture	4	rejected	de	\N	Why our startup failed. A cautionary tale. This abstract is demo content generated by demo:seed.	A longer description for "Why our startup failed".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-05-25 10:07:53.323628	2026-08-03 10:08:28.403318	3.5	4	\N	\N	1	0	\N	2d371bae-317f-47f8-8a37-bbd7b77e35fa	f	CC BY-SA 4.0	\N	V9aMLbFoV9hZo5wf5knAcZob	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1024	42	Ten JavaScript frameworks in 40 minutes	A speedrun	lecture	4	rejected	en	\N	Ten JavaScript frameworks in 40 minutes. A speedrun. This abstract is demo content generated by demo:seed.	A longer description for "Ten JavaScript frameworks in 40 minutes".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-05-27 10:07:53.513759	2026-08-03 10:08:28.422888	3.5	4	\N	\N	1	0	\N	e6be8946-c931-423c-a4ed-2eda6c6b88cb	f	CC BY-SA 4.0	\N	D26FFPkKJujmJNG9qwhn8dpQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1048	42	Lightning: our first hackathon	What we would change	lightning_talk	2	confirmed	en	\N	Lightning: our first hackathon. What we would change. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: our first hackathon".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-06-20 10:07:56.523391	2026-08-03 10:08:28.776424	4.125	4	\N	\N	1	0	\N	08ead161-16e7-4c8a-b1b8-75c239eceb0e	f	CC BY-SA 4.0	\N	mv8CpPcqJZZHno7LMpFM239d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1049	42	Volunteer coordination in practice	Shifts, radios and coffee	meeting	4	confirmed	en	\N	Volunteer coordination in practice. Shifts, radios and coffee. This abstract is demo content generated by demo:seed.	A longer description for "Volunteer coordination in practice".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-06-21 10:07:56.649907	2026-08-03 10:08:28.785328	3.625	4	\N	\N	1	0	\N	bedd7231-cf76-4e61-ac74-c297dbb69f39	f	CC BY-SA 4.0	\N	x8iPXow1oEGbLEcUKoqUiLtH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1050	42	Ask the schedule team anything	Open session	podium	4	confirmed	en	\N	Ask the schedule team anything. Open session. This abstract is demo content generated by demo:seed.	A longer description for "Ask the schedule team anything".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-06-22 10:07:56.727244	2026-08-03 10:08:28.798202	3.75	4	\N	\N	3	0	\N	7e41bfc8-1389-4a67-8522-6db7aa42d404	f	CC BY-SA 4.0	\N	WXzpoaJ12dG8GqUcTnxvz5m3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1054	42	Static analysis that developers keep	Tuning the noise down	lecture	4	review	en	\N	Static analysis that developers keep. Tuning the noise down. This abstract is demo content generated by demo:seed.	A longer description for "Static analysis that developers keep".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-06-26 10:07:57.365527	2026-08-03 10:08:28.814959	3.875	4	\N	\N	1	0	\N	2b37f778-143f-48e0-92ea-153a228817e1	f	CC BY-SA 4.0	\N	XjBEqwJjwZ72W3yhCEcVRNAv	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1058	42	Mentoring junior developers	Structure beats good intentions	lecture	4	new	de	\N	Mentoring junior developers. Structure beats good intentions. This abstract is demo content generated by demo:seed.	A longer description for "Mentoring junior developers".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-06-30 10:07:57.725803	2026-08-03 10:08:28.842367	3.5	1	\N	\N	1	0	\N	40c412c5-530d-4dd5-8430-4b86804ce86c	f	CC BY-SA 4.0	\N	ZNgSgWGaeankERK7EL5kpjWR	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036	42	Web performance for content sites	Core Web Vitals in practice	lecture	4	confirmed	en	2026-08-04 07:00:00	Web performance for content sites. Core Web Vitals in practice. This abstract is demo content generated by demo:seed.	A longer description for "Web performance for content sites".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	129	2026-06-08 10:07:54.832821	2026-08-03 10:08:30.692025	2.625	4	\N	\N	1	0	\N	8bb9dca3-1494-4247-a5df-f984affd5609	f	CC BY-SA 4.0	\N	2rZxaDYrhvZobgf5PmCgQMew	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	42	Forms nobody hates	Validation, errors and focus	workshop	8	confirmed	en	2026-08-04 07:00:00	Forms nobody hates. Validation, errors and focus. This abstract is demo content generated by demo:seed.	A longer description for "Forms nobody hates".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	130	2026-06-09 10:07:55.014649	2026-08-03 10:08:30.731519	2.8	5	\N	\N	1	0	\N	f586c888-02d3-4f6d-aa01-a1c0c04b22c1	f	CC BY-SA 4.0	\N	AutC3q6Unsyx2jh1yHJRfWhp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1038	42	Infrastructure as code reviews	What to look for	lecture	4	confirmed	en	2026-08-04 07:00:00	Infrastructure as code reviews. What to look for. This abstract is demo content generated by demo:seed.	A longer description for "Infrastructure as code reviews".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	131	2026-06-10 10:07:55.141295	2026-08-03 10:08:30.767847	3.25	4	\N	\N	1	0	\N	1762bdd5-68b1-4718-a69a-cbbd4841d61f	f	CC BY-SA 4.0	\N	JQ5iMyDEe3WxNfXa68zYXz3T	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1039	42	Backups you have actually restored	A checklist	lecture	4	confirmed	en	2026-08-04 08:15:00	Backups you have actually restored. A checklist. This abstract is demo content generated by demo:seed.	A longer description for "Backups you have actually restored".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	128	2026-06-11 10:07:55.263168	2026-08-03 10:08:30.80432	3.875	4	\N	\N	1	0	\N	777f7943-216c-40f1-bed6-736a5dc817e9	f	CC BY-SA 4.0	Terminal font must be readable from the back row.	wWGwnDz8CfACVCoq6NqtZanP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1040	42	On-call without burnout	Rotations that work	lecture	4	confirmed	de	2026-08-04 08:15:00	On-call without burnout. Rotations that work. This abstract is demo content generated by demo:seed.	A longer description for "On-call without burnout".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	129	2026-06-12 10:07:55.366277	2026-08-03 10:08:30.848899	4.25	4	\N	\N	2	0	\N	960280d7-492f-4de7-b3f3-bba0254c5841	f	CC BY-SA 4.0	\N	TF8Qc3ReVh41rdnnkp4nookt	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1041	42	Hardening a small fleet	Ten changes that matter	lecture	4	confirmed	fr	2026-08-04 08:15:00	Hardening a small fleet. Ten changes that matter. This abstract is demo content generated by demo:seed.	A longer description for "Hardening a small fleet".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	131	2026-06-13 10:07:55.547885	2026-08-03 10:08:30.8987	4.375	4	\N	\N	1	0	\N	62aeb774-4e90-4354-9668-f4373e00507e	f	CC BY-SA 4.0	\N	JU8FtH2UirHw8oNnnMonuv6S	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1042	42	Security reviews for feature teams	A lightweight process	lecture	4	confirmed	en	2026-08-04 09:15:00	Security reviews for feature teams. A lightweight process. This abstract is demo content generated by demo:seed.	A longer description for "Security reviews for feature teams".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	130	2026-06-14 10:07:55.648574	2026-08-03 10:08:30.926718	4.125	4	\N	\N	1	0	\N	13e451a3-c294-4e35-81e3-19a7be011022	f	CC BY-SA 4.0	\N	mpdzrgLKEJYS6G61pDTsfLXK	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1043	42	Lightning: rotate your keys	Three minutes of nagging	lightning_talk	2	confirmed	en	2026-08-04 09:30:00	Lightning: rotate your keys. Three minutes of nagging. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: rotate your keys".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	128	2026-06-15 10:07:55.758037	2026-08-03 10:08:30.969281	3.5	3	\N	\N	1	0	\N	4ed7f37e-6095-4242-beda-09ba36b9b192	f	CC BY-SA 4.0	\N	jozTsYDtuejVnAmQqjcM9dfZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1044	42	Cleaning messy public data	Pandas, but carefully	workshop	8	confirmed	en	2026-08-04 09:30:00	Cleaning messy public data. Pandas, but carefully. This abstract is demo content generated by demo:seed.	A longer description for "Cleaning messy public data".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	129	2026-06-16 10:07:55.861707	2026-08-03 10:08:30.996852	3.25	4	\N	\N	1	0	\N	c8293e55-6090-49ec-ab54-6ec04edc2f8b	f	CC BY-SA 4.0	\N	Vs7K7tYN38xu3rF46ukZU4AU	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1045	42	Recommendations without creepiness	Useful and boring	lecture	4	confirmed	en	2026-08-04 09:30:00	Recommendations without creepiness. Useful and boring. This abstract is demo content generated by demo:seed.	A longer description for "Recommendations without creepiness".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	131	2026-06-17 10:07:56.01253	2026-08-03 10:08:31.018021	3.375	4	\N	\N	1	0	\N	67e9b1bf-de25-43dd-97fb-065ee9d928a1	f	CC BY-SA 4.0	\N	45WBpmeonRJ1oEhfF8n89pXm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1046	42	Running a code of conduct team	Process, not vibes	lecture	4	confirmed	de	2026-08-04 10:15:00	Running a code of conduct team. Process, not vibes. This abstract is demo content generated by demo:seed.	A longer description for "Running a code of conduct team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	128	2026-06-18 10:07:56.188451	2026-08-03 10:08:31.050433	4	4	\N	\N	2	0	\N	de7bf6e3-d26c-455c-babd-54c6b814594b	f	CC BY-SA 4.0	\N	i5YhvJxJ812YKag3vzkJTneZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1047	42	Sponsorship without selling out	How we fund this	lecture	4	confirmed	fr	2026-08-04 10:30:00	Sponsorship without selling out. How we fund this. This abstract is demo content generated by demo:seed.	A longer description for "Sponsorship without selling out".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	130	2026-06-19 10:07:56.40933	2026-08-03 10:08:31.075796	4.375	4	\N	\N	1	0	\N	af6f5138-d44d-4675-bec7-bc99db9a1eed	f	CC BY-SA 4.0	\N	QEGsjxft9Y6KVkc7cCLn6fLp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	42	Postgres query plans explained	Reading EXPLAIN without fear	lecture	4	confirmed	en	2026-08-02 07:00:00	Postgres query plans explained. Reading EXPLAIN without fear. This abstract is demo content generated by demo:seed.	A longer description for "Postgres query plans explained".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	131	2026-04-24 10:07:50.383865	2026-08-03 10:08:36.588698	4.125	4	\N	\N	1	7	4.5	ce9f0bbe-b244-491c-b4ae-e5e1d8b2150e	f	CC BY-SA 4.0	\N	ijecN6fuJKZuoUrSJmiHiHiA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	42	Background jobs that never lose work	Idempotency in practice	lecture	4	confirmed	de	2026-08-02 08:15:00	Background jobs that never lose work. Idempotency in practice. This abstract is demo content generated by demo:seed.	A longer description for "Background jobs that never lose work".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	128	2026-04-25 10:07:50.4843	2026-08-03 10:08:36.821102	3.8333333333333335	3	\N	\N	1	8	2.5	e227f636-889f-40e6-a5ff-44b85137150a	t	CC BY-SA 4.0	\N	jSJXbfk9f2SgJEq59VRBMa2A	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
993	42	Continuous deployment for teams of one	Ship on Friday anyway	lecture	4	confirmed	fr	2026-08-02 08:15:00	Continuous deployment for teams of one. Ship on Friday anyway. This abstract is demo content generated by demo:seed.	A longer description for "Continuous deployment for teams of one".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	129	2026-04-26 10:07:50.661686	2026-08-03 10:08:37.061347	3.875	4	\N	\N	1	4	5	800bc9af-f9ab-4496-aff5-dea6f97d71d5	f	CC BY-SA 4.0	\N	YcvyKSpFAeCKgvcuvufcb3ih	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
994	42	The art of the postmortem	Blameless, but useful	lecture	4	confirmed	en	2026-08-02 08:15:00	The art of the postmortem. Blameless, but useful. This abstract is demo content generated by demo:seed.	A longer description for "The art of the postmortem".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	130	2026-04-27 10:07:50.734269	2026-08-03 10:08:37.182071	3.625	4	Coordinate with the SRE track next year.	\N	2	5	4	e32ad9bd-f75f-4d14-b1fd-d20d76d3ea79	f	CC BY-SA 4.0	\N	TyY23mQoPR54f7PUZMxhYyZg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	42	Zero downtime database migrations	Hands-on workshop	workshop	8	confirmed	en	2026-08-02 08:15:00	Zero downtime database migrations. Hands-on workshop. This abstract is demo content generated by demo:seed.	A longer description for "Zero downtime database migrations".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	131	2026-04-28 10:07:50.823983	2026-08-03 10:08:37.441232	3.125	4	\N	\N	1	6	3	580a3228-234a-47b7-a9bd-2876e91975a2	f	CC BY-SA 4.0	Power strips for 20 laptops, whiteboard.	zFja1VypY4iVBD1Tuw3g4on8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
996	42	Threat modeling for small teams	Start on a whiteboard	lecture	4	confirmed	en	2026-08-02 09:30:00	Threat modeling for small teams. Start on a whiteboard. This abstract is demo content generated by demo:seed.	A longer description for "Threat modeling for small teams".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	128	2026-04-29 10:07:50.89222	2026-08-03 10:08:37.661779	3.75	4	\N	\N	1	7	4	c2c2e90e-84b5-4d78-83a9-a3df86641073	f	CC BY-SA 4.0	\N	v1GyNG5JPUGcJ2sK5BVoHv6J	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	42	Supply chain attacks explained	How your dependencies bite	lecture	4	confirmed	en	2026-08-02 09:30:00	Supply chain attacks explained. How your dependencies bite. This abstract is demo content generated by demo:seed.	A longer description for "Supply chain attacks explained".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	129	2026-04-30 10:07:51.018359	2026-08-03 10:08:37.932323	3.875	4	\N	\N	1	8	5	841dc061-f72c-4191-be05-49587bd50cf5	f	CC BY-SA 4.0	\N	TLDN47CnUS49UCoChfZvYABD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
998	42	Designing for accessibility	Testing with real users	lecture	4	confirmed	de	2026-08-02 09:30:00	Designing for accessibility. Testing with real users. This abstract is demo content generated by demo:seed.	A longer description for "Designing for accessibility".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	130	2026-05-01 10:07:51.148096	2026-08-03 10:08:38.235108	4.25	4	\N	\N	2	4	4.5	a671ec0d-f225-4f21-be77-f8a764f84148	f	CC BY-SA 4.0	\N	tuzd5GpR7SktaGF997kZ4euY	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	42	CSS layout, the calm parts	Grid, subgrid and container queries	lecture	4	confirmed	fr	2026-08-02 10:30:00	CSS layout, the calm parts. Grid, subgrid and container queries. This abstract is demo content generated by demo:seed.	A longer description for "CSS layout, the calm parts".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	131	2026-05-02 10:07:51.283361	2026-08-03 10:08:38.547762	4	4	\N	\N	1	5	2.5	551aab61-293a-4b14-be73-09204110f8fb	f	CC BY-SA 4.0	\N	RU567sfmknBjnAxHoMnA61sw	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1000	42	Documentation that people read	Writing for tired humans	lecture	4	confirmed	en	2026-08-02 10:45:00	Documentation that people read. Writing for tired humans. This abstract is demo content generated by demo:seed.	A longer description for "Documentation that people read".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	128	2026-05-03 10:07:51.403936	2026-08-03 10:08:38.686138	3.125	4	\N	\N	1	6	5	f2d3fa12-827f-4b5c-8e9d-1721d482e9ae	f	CC BY-SA 4.0	\N	5ukwAK3wQ6wN8UGQy13CS7cY	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1001	42	Onboarding new contributors	The first pull request	lecture	4	confirmed	en	2026-08-02 10:45:00	Onboarding new contributors. The first pull request. This abstract is demo content generated by demo:seed.	A longer description for "Onboarding new contributors".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	129	2026-05-04 10:07:51.563966	2026-08-03 10:08:38.829093	3.625	4	\N	\N	1	7	4	a8204cb0-4db0-4135-b812-7717d086a6d5	f	CC BY-SA 4.0	\N	PYXLtjgH9HoeLjmUcXvzfiMS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1002	42	Vector databases without the hype	What they are actually good at	lecture	4	confirmed	en	2026-08-03 08:00:00	Vector databases without the hype. What they are actually good at. This abstract is demo content generated by demo:seed.	A longer description for "Vector databases without the hype".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	128	2026-05-05 10:07:51.651503	2026-08-03 10:08:39.05313	2.75	4	\N	\N	1	8	3	01f9142f-50b0-4e20-8742-fb861026d644	f	CC BY-SA 4.0	\N	Z5ppcJB42AfKVPoz8jxcmDzG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1003	42	Evaluating LLM output	Metrics you can defend	lecture	4	confirmed	en	2026-08-03 08:00:00	Evaluating LLM output. Metrics you can defend. This abstract is demo content generated by demo:seed.	A longer description for "Evaluating LLM output".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	177	129	2026-05-06 10:07:51.724792	2026-08-03 10:08:39.30363	3.375	4	\N	\N	2	4	4	20ab3be1-2a34-43e9-8ad8-46778f52229f	f	CC BY-SA 4.0	\N	a3pFQq4iC7r78NXCAvbaT3DN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1004	42	Lightning: my gem has 12 downloads	And I am proud of it	lightning_talk	2	confirmed	de	2026-08-03 08:00:00	Lightning: my gem has 12 downloads. And I am proud of it. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: my gem has 12 downloads".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	130	2026-05-07 10:07:51.828241	2026-08-03 10:08:39.547692	3.75	4	\N	\N	1	5	5	03c57abd-e5c9-425b-af83-bc66a17fb0cc	f	CC BY-SA 4.0	\N	kFvYugN6vCeTofYUWSmzmwgg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1005	42	Lightning: stop committing .env	Secrets management in five minutes	lightning_talk	2	confirmed	fr	2026-08-03 08:00:00	Lightning: stop committing .env. Secrets management in five minutes. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: stop committing .env".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	176	131	2026-05-08 10:07:51.954126	2026-08-03 10:08:39.759011	3.875	4	\N	\N	1	6	4.5	d696a122-c68e-4a2a-8a64-c86bb3c91c9b	f	CC BY-SA 4.0	\N	FwxUbxeNZRA4BV2XURhphmYG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	42	Lightning: Terraform anti-patterns	Modules gone wrong	lightning_talk	2	confirmed	en	2026-08-03 08:45:00	Lightning: Terraform anti-patterns. Modules gone wrong. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: Terraform anti-patterns".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	175	130	2026-05-09 10:07:52.045876	2026-08-03 10:08:39.896829	3.625	4	\N	\N	1	7	2.5	c5e73132-b815-4f07-b51e-c06835473dda	f	CC BY-SA 4.0	\N	HjN6MwiybUHtCHcbmVV32Vhx	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1007	42	Closing panel: the next ten years	Open discussion	podium	8	confirmed	en	2026-08-03 08:45:00	Closing panel: the next ten years. Open discussion. This abstract is demo content generated by demo:seed.	A longer description for "Closing panel: the next ten years".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	172	131	2026-05-10 10:07:52.155528	2026-08-03 10:08:40.201175	3.125	4	\N	\N	3	8	5	adef2364-b86b-497e-a64f-b656dc6acd91	f	CC BY-SA 4.0	Four lapel microphones, four bar stools.	vWFHAf8WLc1Z3UvUiYKJbPmt	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1008	42	Community meetup: local user groups	Bring your own agenda	meeting	4	confirmed	en	2026-08-03 09:15:00	Community meetup: local user groups. Bring your own agenda. This abstract is demo content generated by demo:seed.	A longer description for "Community meetup: local user groups".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	f	\N	\N	\N	\N	178	128	2026-05-11 10:07:52.308293	2026-08-03 10:08:40.92904	2.875	4	\N	\N	1	4	4	e2bba613-4b1a-453a-a4d5-0d3796f68ab3	f	CC BY-SA 4.0	\N	AdXbNkWP4jmmgMFMo2gnojtk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1028	42	Day 2 keynote: software we can maintain	A talk about restraint	lecture	4	confirmed	de	2026-08-03 09:15:00	Day 2 keynote: software we can maintain. A talk about restraint. This abstract is demo content generated by demo:seed.	A longer description for "Day 2 keynote: software we can maintain".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	172	129	2026-05-31 10:07:53.84119	2026-08-03 10:08:41.008364	3.375	4	\N	\N	1	5	3	e6f37102-afb2-43d1-ac2b-7361f1769399	f	CC BY-SA 4.0	\N	KgHeHwVFgSZegACc73kZ8DRs	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1029	42	Day 3 keynote: the people problem	Teams beat tools	lecture	4	confirmed	fr	2026-08-03 09:30:00	Day 3 keynote: the people problem. Teams beat tools. This abstract is demo content generated by demo:seed.	A longer description for "Day 3 keynote: the people problem".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	172	130	2026-06-01 10:07:54.026598	2026-08-03 10:08:41.154841	3.6	5	\N	\N	1	6	4	d92a0dac-5ea1-4e1e-9c76-1e8bd14ef24b	f	CC BY-SA 4.0	\N	EhV44FZ5UArMU5DhoDfTkCY1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1030	42	Caching strategies that survive contact	Invalidate this	lecture	4	scheduled	en	2026-08-03 10:30:00	Caching strategies that survive contact. Invalidate this. This abstract is demo content generated by demo:seed.	A longer description for "Caching strategies that survive contact".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	128	2026-06-02 10:07:54.163321	2026-08-03 10:08:41.479031	3.125	4	\N	\N	1	0	\N	95a2b7e3-d1d8-4c38-a6fc-b02a5fe05858	f	CC BY-SA 4.0	\N	G1RVqKLqEnJPGNudM3pjzDjW	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	42	Typed Ruby in a legacy codebase	Sorbet, one file at a time	lecture	4	scheduled	en	2026-08-03 10:30:00	Typed Ruby in a legacy codebase. Sorbet, one file at a time. This abstract is demo content generated by demo:seed.	A longer description for "Typed Ruby in a legacy codebase".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	129	2026-06-03 10:07:54.305062	2026-08-03 10:08:41.555065	3.75	4	\N	\N	1	0	\N	3e5bacbe-6731-4a2f-938b-61cef61cf93e	f	CC BY-SA 4.0	\N	duXVr5iU5AGiU2uLC1gU5Zek	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1032	42	Rate limiting for humans	Fair queues and honest errors	lecture	4	scheduled	en	2026-08-03 10:45:00	Rate limiting for humans. Fair queues and honest errors. This abstract is demo content generated by demo:seed.	A longer description for "Rate limiting for humans".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	130	2026-06-04 10:07:54.403769	2026-08-03 10:08:41.646095	4	3	\N	\N	2	0	\N	ec963178-d971-40c3-b8c1-9a9b9f33dd85	f	CC BY-SA 4.0	\N	uBYh56JMY68So9qAC8TWHP94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1033	42	Testing what actually breaks	A pragmatic pyramid	workshop	8	scheduled	en	2026-08-03 11:00:00	Testing what actually breaks. A pragmatic pyramid. This abstract is demo content generated by demo:seed.	A longer description for "Testing what actually breaks".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	131	2026-06-05 10:07:54.592088	2026-08-03 10:08:41.753017	4.125	4	\N	\N	1	0	\N	9cd9eb17-e9aa-4d3f-a840-078c9013b028	f	CC BY-SA 4.0	\N	3pc8zaR5AeMuCKM7P1DExWXK	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1034	42	Progressive enhancement is back	Less JavaScript, more product	lecture	4	scheduled	de	2026-08-03 11:45:00	Progressive enhancement is back. Less JavaScript, more product. This abstract is demo content generated by demo:seed.	A longer description for "Progressive enhancement is back".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	128	2026-06-06 10:07:54.689041	2026-08-03 10:08:41.813209	3.875	4	\N	\N	1	0	\N	9f147869-8db9-471a-b296-60f3f7810633	f	CC BY-SA 4.0	\N	dtU3KveruTnNpuTmLkUJ4e96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1035	42	Component libraries that survive	Versioning and deprecation	lecture	4	scheduled	fr	2026-08-04 07:00:00	Component libraries that survive. Versioning and deprecation. This abstract is demo content generated by demo:seed.	A longer description for "Component libraries that survive".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	128	2026-06-07 10:07:54.760772	2026-08-03 10:08:41.872988	3.4	5	\N	\N	1	0	\N	d07ce295-1c33-483e-86d3-bcc00e725270	f	CC BY-SA 4.0	\N	dnXR5omptSEFe8KHwhwUC6vW	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
988	42	Opening keynote: ten years of frab	What we learned running conferences	lecture	4	confirmed	en	2026-08-02 07:00:00	Opening keynote: ten years of frab. What we learned running conferences. This abstract is demo content generated by demo:seed.	A longer description for "Opening keynote: ten years of frab".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	172	128	2026-04-21 10:07:50.029499	2026-08-03 10:08:41.915073	3	4	Confirmed by phone, speaker will bring their own laptop.	\N	1	4	3	1c35d343-64ae-4c84-be16-4933c1e8c1a7	f	CC BY-SA 4.0	Wireless handheld microphone, HDMI, clicker.	TroDfNaeKmBcJRQZRHiyGqez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
989	42	Refactoring legacy Rails	A field guide	lecture	4	confirmed	en	2026-08-02 07:00:00	Refactoring legacy Rails. A field guide. This abstract is demo content generated by demo:seed.	A longer description for "Refactoring legacy Rails".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	129	2026-04-22 10:07:50.164675	2026-08-03 10:08:42.000954	3.125	4	\N	\N	2	5	4	5bc25013-d125-4c6d-a233-fc3b35855f72	t	CC BY-SA 4.0	\N	PcpgrLvNHmtqs7vqJWV59WmD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1013	42	WebAssembly for backend developers	A tour without the buzzwords	lecture	4	review	en	\N	WebAssembly for backend developers. A tour without the buzzwords. This abstract is demo content generated by demo:seed.	A longer description for "WebAssembly for backend developers".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-05-16 10:07:52.81052	2026-08-03 10:08:42.127504	\N	2	\N	Asked the speaker for a longer abstract.	1	0	\N	784b7907-70c1-40a3-b3a5-4999a96c4d72	f	CC BY-SA 4.0	\N	a7vuMvqzSed3zQBKAXWu7wHj	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1009	42	Event sourcing, one year later	Would we do it again?	lecture	4	unconfirmed	en	\N	Event sourcing, one year later. Would we do it again?. This abstract is demo content generated by demo:seed.	A longer description for "Event sourcing, one year later".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	\N	2026-05-12 10:07:52.459365	2026-08-03 10:08:42.155648	3	4	Reminder sent, waiting for confirmation.	\N	1	0	\N	b016e61d-8137-4666-b39d-3c56e810b3e7	f	CC BY-SA 4.0	\N	JRavSnYPNtutnkagpJrfDeXq	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
990	42	From monolith to modules	Without a big bang rewrite	lecture	4	confirmed	en	2026-08-02 07:00:00	From monolith to modules. Without a big bang rewrite. This abstract is demo content generated by demo:seed.	A longer description for "From monolith to modules".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	173	130	2026-04-23 10:07:50.284434	2026-08-03 10:08:42.195671	3.75	4	\N	Prefers a morning slot.	1	6	5	589ca6df-1a57-40e3-8bcd-cc7e712807b2	f	CC BY-SA 4.0	Needs a second screen for the notes view.	Lnf5VUReCUM3NmHz7qpA9gZ6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	42	Design tokens in a small team		lecture	4	review	en	\N	Design tokens in a small team. One source of truth. This abstract is demo content generated by demo:seed.	A longer description for "Design tokens in a small team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	174	\N	2026-05-17 10:07:52.856414	2026-08-03 10:08:28.282008	4.125	4	\N	\N	1	0	\N	4cda2a0a-4f13-411d-a957-beb0f1e4ac63	f	CC BY-SA 4.0	\N	nDLBCeGDvHCvq8Ao2TmoVAGz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1017	42	Teaching kids to code	Lessons from a school club	lecture	4	review	fr	\N		A longer description for "Teaching kids to code".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	178	\N	2026-05-20 10:07:53.046934	2026-08-03 10:08:28.321872	3.5	4	\N	\N	1	0	\N	947c087d-0610-456b-bff0-9c8ade9d44a6	f	CC BY-SA 4.0	\N	S7M27atGmBaRMp2nd8Huqn5o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, name, value, reimbursed, person_id, conference_id, created_at, updated_at) FROM stdin;
211	Train ticket	45.5000	t	334	40	2026-08-03 10:07:49.634505	2026-08-03 10:07:49.634505
212	Hotel, 2 nights	180.0000	f	335	40	2026-08-03 10:07:49.63786	2026-08-03 10:07:49.63786
213	Flight	320.0000	t	336	40	2026-08-03 10:07:49.640627	2026-08-03 10:07:49.640627
214	Taxi	22.0000	f	337	40	2026-08-03 10:07:49.644206	2026-08-03 10:07:49.644206
215	Dinner	35.0000	t	338	40	2026-08-03 10:07:49.646948	2026-08-03 10:07:49.646948
216	Train ticket, return	78.4000	t	350	42	2026-08-03 10:08:31.298358	2026-08-03 10:08:31.298358
217	Hotel, 2 nights	210.0000	f	351	42	2026-08-03 10:08:31.307374	2026-08-03 10:08:31.307374
218	Taxi from the airport	28.5000	f	337	42	2026-08-03 10:08:31.314023	2026-08-03 10:08:31.314023
219	Speaker dinner	45.0000	t	344	42	2026-08-03 10:08:31.321531	2026-08-03 10:08:31.321531
220	Train ticket	52.1000	t	335	42	2026-08-03 10:08:31.328489	2026-08-03 10:08:31.328489
221	Train ticket, return	78.4000	f	342	42	2026-08-03 10:08:31.336027	2026-08-03 10:08:31.336027
222	Flight	340.0000	f	338	42	2026-08-03 10:08:31.342739	2026-08-03 10:08:31.342739
223	Taxi from the airport	28.5000	t	339	42	2026-08-03 10:08:31.350071	2026-08-03 10:08:31.350071
224	Conference visa fee	80.0000	t	347	42	2026-08-03 10:08:31.359046	2026-08-03 10:08:31.359046
225	Train ticket	52.1000	f	341	42	2026-08-03 10:08:31.366353	2026-08-03 10:08:31.366353
226	Hotel, 2 nights	210.0000	f	345	42	2026-08-03 10:08:31.372914	2026-08-03 10:08:31.372914
227	Flight	340.0000	t	346	42	2026-08-03 10:08:31.380272	2026-08-03 10:08:31.380272
228	Speaker dinner	45.0000	t	349	42	2026-08-03 10:08:31.387474	2026-08-03 10:08:31.387474
229	Conference visa fee	80.0000	f	353	42	2026-08-03 10:08:31.403943	2026-08-03 10:08:31.403943
230	Train ticket, return	78.4000	f	355	42	2026-08-03 10:08:31.409989	2026-08-03 10:08:31.409989
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grades (id, user_id, paper_id, value, note, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: im_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.im_accounts (id, person_id, im_type, im_address, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.languages (id, code, attachable_id, attachable_type, created_at, updated_at) FROM stdin;
90	en	40	Conference	2026-08-03 10:07:43.513699	2026-08-03 10:07:43.513699
91	de	40	Conference	2026-08-03 10:07:43.515775	2026-08-03 10:07:43.515775
92	fr	40	Conference	2026-08-03 10:07:43.517596	2026-08-03 10:07:43.517596
93	en	41	Conference	2026-08-03 10:07:49.660841	2026-08-03 10:07:49.660841
94	en	42	Conference	2026-08-03 10:07:49.974924	2026-08-03 10:07:49.974924
95	de	42	Conference	2026-08-03 10:07:49.976497	2026-08-03 10:07:49.976497
96	fr	42	Conference	2026-08-03 10:07:49.978134	2026-08-03 10:07:49.978134
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, title, url, linkable_id, linkable_type, created_at, updated_at) FROM stdin;
505	Project homepage	https://example.org/project	1028	Event	2026-08-03 10:07:53.890844	2026-08-03 10:07:53.890844
506	Slides	https://example.org/slides	1030	Event	2026-08-03 10:07:54.219451	2026-08-03 10:07:54.219451
507	Slides	https://example.org/slides	1033	Event	2026-08-03 10:07:54.631375	2026-08-03 10:07:54.631375
508	Project homepage	https://example.org/project	1033	Event	2026-08-03 10:07:54.632976	2026-08-03 10:07:54.632976
509	Slides	https://example.org/slides	1036	Event	2026-08-03 10:07:54.883996	2026-08-03 10:07:54.883996
510	Project homepage	https://example.org/project	1038	Event	2026-08-03 10:07:55.182147	2026-08-03 10:07:55.182147
511	Slides	https://example.org/slides	1039	Event	2026-08-03 10:07:55.306236	2026-08-03 10:07:55.306236
512	Slides	https://example.org/slides	1042	Event	2026-08-03 10:07:55.679204	2026-08-03 10:07:55.679204
513	Project homepage	https://example.org/project	1043	Event	2026-08-03 10:07:55.806988	2026-08-03 10:07:55.806988
514	Slides	https://example.org/slides	1045	Event	2026-08-03 10:07:56.08938	2026-08-03 10:07:56.08938
515	Slides	https://example.org/slides	1048	Event	2026-08-03 10:07:56.564568	2026-08-03 10:07:56.564568
516	Project homepage	https://example.org/project	1048	Event	2026-08-03 10:07:56.566551	2026-08-03 10:07:56.566551
517	Slides	https://example.org/slides	1051	Event	2026-08-03 10:07:56.896486	2026-08-03 10:07:56.896486
518	Project homepage	https://example.org/project	1053	Event	2026-08-03 10:07:57.266364	2026-08-03 10:07:57.266364
519	Slides	https://example.org/slides	1054	Event	2026-08-03 10:07:57.416536	2026-08-03 10:07:57.416536
520	Slides	https://example.org/slides	1057	Event	2026-08-03 10:07:57.704242	2026-08-03 10:07:57.704242
521	Project homepage	https://example.org/project	1058	Event	2026-08-03 10:07:57.759438	2026-08-03 10:07:57.759438
522	Slides	https://example.org/slides	1060	Event	2026-08-03 10:07:57.862853	2026-08-03 10:07:57.862853
473	Slides	https://example.org/slides	963	Event	2026-08-03 10:07:43.665811	2026-08-03 10:07:43.665811
474	Slides	https://example.org/slides	965	Event	2026-08-03 10:07:44.039688	2026-08-03 10:07:44.039688
475	Slides	https://example.org/slides	967	Event	2026-08-03 10:07:44.419683	2026-08-03 10:07:44.419683
476	Slides	https://example.org/slides	969	Event	2026-08-03 10:07:44.635708	2026-08-03 10:07:44.635708
477	Slides	https://example.org/slides	971	Event	2026-08-03 10:07:44.780185	2026-08-03 10:07:44.780185
478	Slides	https://example.org/slides	973	Event	2026-08-03 10:07:44.982027	2026-08-03 10:07:44.982027
479	Slides	https://example.org/slides	975	Event	2026-08-03 10:07:45.257204	2026-08-03 10:07:45.257204
480	Slides	https://example.org/slides	977	Event	2026-08-03 10:07:45.384533	2026-08-03 10:07:45.384533
481	Slides	https://example.org/slides	979	Event	2026-08-03 10:07:45.505425	2026-08-03 10:07:45.505425
482	Slides	https://example.org/slides	981	Event	2026-08-03 10:07:45.63662	2026-08-03 10:07:45.63662
483	Slides	https://example.org/slides	988	Event	2026-08-03 10:07:50.066826	2026-08-03 10:07:50.066826
484	Project homepage	https://example.org/project	988	Event	2026-08-03 10:07:50.068728	2026-08-03 10:07:50.068728
485	Slides	https://example.org/slides	991	Event	2026-08-03 10:07:50.420251	2026-08-03 10:07:50.420251
486	Project homepage	https://example.org/project	993	Event	2026-08-03 10:07:50.689376	2026-08-03 10:07:50.689376
487	Slides	https://example.org/slides	994	Event	2026-08-03 10:07:50.771576	2026-08-03 10:07:50.771576
488	Slides	https://example.org/slides	997	Event	2026-08-03 10:07:51.071342	2026-08-03 10:07:51.071342
489	Project homepage	https://example.org/project	998	Event	2026-08-03 10:07:51.207223	2026-08-03 10:07:51.207223
490	Slides	https://example.org/slides	1000	Event	2026-08-03 10:07:51.459977	2026-08-03 10:07:51.459977
491	Slides	https://example.org/slides	1003	Event	2026-08-03 10:07:51.771897	2026-08-03 10:07:51.771897
492	Project homepage	https://example.org/project	1003	Event	2026-08-03 10:07:51.773312	2026-08-03 10:07:51.773312
493	Slides	https://example.org/slides	1006	Event	2026-08-03 10:07:52.083117	2026-08-03 10:07:52.083117
494	Project homepage	https://example.org/project	1008	Event	2026-08-03 10:07:52.344219	2026-08-03 10:07:52.344219
495	Slides	https://example.org/slides	1009	Event	2026-08-03 10:07:52.508393	2026-08-03 10:07:52.508393
496	Slides	https://example.org/slides	1012	Event	2026-08-03 10:07:52.743457	2026-08-03 10:07:52.743457
497	Project homepage	https://example.org/project	1013	Event	2026-08-03 10:07:52.83854	2026-08-03 10:07:52.83854
498	Slides	https://example.org/slides	1015	Event	2026-08-03 10:07:52.947543	2026-08-03 10:07:52.947543
499	Slides	https://example.org/slides	1018	Event	2026-08-03 10:07:53.151854	2026-08-03 10:07:53.151854
500	Project homepage	https://example.org/project	1018	Event	2026-08-03 10:07:53.153597	2026-08-03 10:07:53.153597
501	Slides	https://example.org/slides	1021	Event	2026-08-03 10:07:53.309282	2026-08-03 10:07:53.309282
502	Project homepage	https://example.org/project	1023	Event	2026-08-03 10:07:53.450481	2026-08-03 10:07:53.450481
503	Slides	https://example.org/slides	1024	Event	2026-08-03 10:07:53.551632	2026-08-03 10:07:53.551632
504	Slides	https://example.org/slides	1027	Event	2026-08-03 10:07:53.777508	2026-08-03 10:07:53.777508
\.


--
-- Data for Name: mail_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mail_templates (id, conference_id, name, subject, content, created_at, updated_at) FROM stdin;
112	40	Speaker reminder	[%{conference}] Reminder for %{event}	Hi %{public_name},\n\njust a reminder that your talk "%{event}" is part of %{conference}.\n\nCheers,\nthe orga team	2026-08-03 10:07:43.552443	2026-08-03 10:07:43.552443
113	40	Call for volunteers	[%{conference}] We need helpers	Hi %{forename},\n\nwe are still looking for volunteers at %{conference}.\n\nThanks!	2026-08-03 10:07:43.554858	2026-08-03 10:07:43.554858
114	42	Speaker reminder	[%{conference}] Reminder for %{event}	Hi %{public_name},\n\njust a reminder that your talk "%{event}" is part of %{conference}.\n\nCheers,\nthe orga team	2026-08-03 10:07:50.007603	2026-08-03 10:07:50.007603
115	42	Call for volunteers	[%{conference}] We need helpers	Hi %{forename},\n\nwe are still looking for volunteers at %{conference}.\n\nThanks!	2026-08-03 10:07:50.009162	2026-08-03 10:07:50.009162
116	42	Confirm your talk	[%{conference}] Please confirm "%{event}"	Hi %{public_name},\n\nyour submission "%{event}" (%{type}, %{duration}) was accepted for %{conference}.\n\nPlease confirm that you will be there:\n%{link}\n\nIf you cannot make it, just tell us - no hard feelings.\n\nThe %{conference} programme team	2026-08-03 10:07:50.011208	2026-08-03 10:07:50.011208
117	42	Schedule announcement	[%{conference}] Your slot: %{date} %{time}	Hi %{public_name},\n\nthe schedule is public. "%{event}" is on %{date} at %{time} in %{room}.\n\nPlease be at the room 15 minutes early so the video team can wire you up.\n\nSee you soon!	2026-08-03 10:07:50.013012	2026-08-03 10:07:50.013012
118	42	Technical check reminder	[%{conference}] Tech check for "%{event}"	Hi %{forename},\n\nplease come to %{room} on %{date} at least 30 minutes before %{time} for a short technical check (audio, video, your laptop).\n\nIf you need an adapter, tell us now and we will bring one.\n\nThe %{conference} tech team	2026-08-03 10:07:50.014847	2026-08-03 10:07:50.014847
119	42	Slides and recording	[%{conference}] Slides for "%{event}"	Hi %{public_name},\n\nthank you for your talk at %{conference}!\n\nCould you upload your slides to your submission (%{event_id}) so we can publish them together with the recording?\n\nThank you,\nthe %{conference} team	2026-08-03 10:07:50.01695	2026-08-03 10:07:50.01695
120	42	Invite a co-speaker	[%{conference}] Join "%{event}" as co-speaker	Hi,\n\n%{public_name} would like you to join the session "%{event}" at %{conference} as a co-speaker.\n\nUse this link to join:\n%{joinlink}\n\nThe %{conference} team	2026-08-03 10:07:50.018771	2026-08-03 10:07:50.018771
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, created_at, updated_at, locale, accept_subject, reject_subject, accept_body, reject_body, conference_id, schedule_subject, schedule_body) FROM stdin;
79	2026-08-03 10:07:43.54745	2026-08-03 10:07:43.54745	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	40	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
80	2026-08-03 10:07:43.549963	2026-08-03 10:07:43.549963	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	40	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
81	2026-08-03 10:07:49.664279	2026-08-03 10:07:49.664279	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	41	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
82	2026-08-03 10:07:49.665539	2026-08-03 10:07:49.665539	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	41	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
83	2026-08-03 10:07:50.003786	2026-08-03 10:07:50.003786	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	42	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
84	2026-08-03 10:07:50.005895	2026-08-03 10:07:50.005895	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	42	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
\.


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.papers (id, event_id, created_at, updated_at) FROM stdin;
1	1	2026-07-30 08:01:58.191053	2026-07-30 08:01:58.191053
2	2	2026-07-30 08:01:58.33368	2026-07-30 08:01:58.33368
3	3	2026-07-30 08:01:58.415904	2026-07-30 08:01:58.415904
4	4	2026-07-30 08:01:58.526982	2026-07-30 08:01:58.526982
5	5	2026-07-30 08:01:58.638923	2026-07-30 08:01:58.638923
6	6	2026-07-30 08:01:58.776389	2026-07-30 08:01:58.776389
7	7	2026-07-30 08:01:58.884554	2026-07-30 08:01:58.884554
8	8	2026-07-30 08:01:58.992155	2026-07-30 08:01:58.992155
9	9	2026-07-30 08:01:59.089565	2026-07-30 08:01:59.089565
10	10	2026-07-30 08:01:59.207793	2026-07-30 08:01:59.207793
11	11	2026-07-30 08:01:59.274877	2026-07-30 08:01:59.274877
12	12	2026-07-30 08:01:59.337457	2026-07-30 08:01:59.337457
13	13	2026-07-30 08:01:59.424003	2026-07-30 08:01:59.424003
14	14	2026-07-30 08:01:59.471798	2026-07-30 08:01:59.471798
15	15	2026-07-30 08:01:59.512577	2026-07-30 08:01:59.512577
16	16	2026-07-30 08:01:59.562633	2026-07-30 08:01:59.562633
17	17	2026-07-30 08:01:59.616499	2026-07-30 08:01:59.616499
18	18	2026-07-30 08:01:59.652428	2026-07-30 08:01:59.652428
19	19	2026-07-30 08:01:59.721328	2026-07-30 08:01:59.721328
20	20	2026-07-30 08:01:59.766505	2026-07-30 08:01:59.766505
21	21	2026-07-30 08:02:03.632042	2026-07-30 08:02:03.632042
22	22	2026-07-30 08:02:03.690942	2026-07-30 08:02:03.690942
23	23	2026-07-30 08:02:03.75421	2026-07-30 08:02:03.75421
24	24	2026-07-30 08:02:03.800025	2026-07-30 08:02:03.800025
25	25	2026-07-30 08:02:03.838444	2026-07-30 08:02:03.838444
26	26	2026-07-30 08:02:03.913111	2026-07-30 08:02:03.913111
27	27	2026-07-30 08:02:04.126417	2026-07-30 08:02:04.126417
28	28	2026-07-30 08:02:04.359921	2026-07-30 08:02:04.359921
29	29	2026-07-30 08:02:04.543378	2026-07-30 08:02:04.543378
30	30	2026-07-30 08:02:04.744634	2026-07-30 08:02:04.744634
31	31	2026-07-30 08:02:04.998074	2026-07-30 08:02:04.998074
32	32	2026-07-30 08:02:05.212396	2026-07-30 08:02:05.212396
33	33	2026-07-30 08:02:05.429681	2026-07-30 08:02:05.429681
143	143	2026-08-03 07:59:30.259666	2026-08-03 07:59:30.259666
144	144	2026-08-03 07:59:30.436714	2026-08-03 07:59:30.436714
145	145	2026-08-03 07:59:30.523512	2026-08-03 07:59:30.523512
146	146	2026-08-03 07:59:30.596323	2026-08-03 07:59:30.596323
147	147	2026-08-03 07:59:30.652152	2026-08-03 07:59:30.652152
148	148	2026-08-03 07:59:30.708686	2026-08-03 07:59:30.708686
149	149	2026-08-03 07:59:30.780479	2026-08-03 07:59:30.780479
150	150	2026-08-03 07:59:30.835821	2026-08-03 07:59:30.835821
151	151	2026-08-03 07:59:30.893686	2026-08-03 07:59:30.893686
152	152	2026-08-03 07:59:30.963976	2026-08-03 07:59:30.963976
153	153	2026-08-03 07:59:31.014926	2026-08-03 07:59:31.014926
154	154	2026-08-03 07:59:31.068678	2026-08-03 07:59:31.068678
155	155	2026-08-03 07:59:31.138365	2026-08-03 07:59:31.138365
156	156	2026-08-03 07:59:31.184686	2026-08-03 07:59:31.184686
157	157	2026-08-03 07:59:31.219037	2026-08-03 07:59:31.219037
158	158	2026-08-03 07:59:31.260579	2026-08-03 07:59:31.260579
159	159	2026-08-03 07:59:31.290935	2026-08-03 07:59:31.290935
160	160	2026-08-03 07:59:31.320916	2026-08-03 07:59:31.320916
161	161	2026-08-03 07:59:31.37302	2026-08-03 07:59:31.37302
162	162	2026-08-03 07:59:31.413076	2026-08-03 07:59:31.413076
163	163	2026-08-03 07:59:34.515191	2026-08-03 07:59:34.515191
164	164	2026-08-03 07:59:34.571505	2026-08-03 07:59:34.571505
165	165	2026-08-03 07:59:34.647585	2026-08-03 07:59:34.647585
166	166	2026-08-03 07:59:34.696832	2026-08-03 07:59:34.696832
167	167	2026-08-03 07:59:34.745292	2026-08-03 07:59:34.745292
168	168	2026-08-03 07:59:34.847604	2026-08-03 07:59:34.847604
169	169	2026-08-03 07:59:34.952923	2026-08-03 07:59:34.952923
170	170	2026-08-03 07:59:35.033582	2026-08-03 07:59:35.033582
171	171	2026-08-03 07:59:35.097867	2026-08-03 07:59:35.097867
172	172	2026-08-03 07:59:35.172941	2026-08-03 07:59:35.172941
173	173	2026-08-03 07:59:35.256663	2026-08-03 07:59:35.256663
174	174	2026-08-03 07:59:35.318735	2026-08-03 07:59:35.318735
175	175	2026-08-03 07:59:35.447984	2026-08-03 07:59:35.447984
176	176	2026-08-03 07:59:35.508412	2026-08-03 07:59:35.508412
177	177	2026-08-03 07:59:35.591582	2026-08-03 07:59:35.591582
178	178	2026-08-03 07:59:35.656397	2026-08-03 07:59:35.656397
179	179	2026-08-03 07:59:35.782761	2026-08-03 07:59:35.782761
180	180	2026-08-03 07:59:35.886857	2026-08-03 07:59:35.886857
181	181	2026-08-03 07:59:36.026665	2026-08-03 07:59:36.026665
182	182	2026-08-03 07:59:36.093571	2026-08-03 07:59:36.093571
183	183	2026-08-03 07:59:36.15858	2026-08-03 07:59:36.15858
184	184	2026-08-03 07:59:36.248442	2026-08-03 07:59:36.248442
185	185	2026-08-03 07:59:36.383583	2026-08-03 07:59:36.383583
186	186	2026-08-03 07:59:36.459377	2026-08-03 07:59:36.459377
187	187	2026-08-03 07:59:36.527626	2026-08-03 07:59:36.527626
188	188	2026-08-03 07:59:36.637035	2026-08-03 07:59:36.637035
189	189	2026-08-03 07:59:36.737992	2026-08-03 07:59:36.737992
190	190	2026-08-03 07:59:36.864471	2026-08-03 07:59:36.864471
191	191	2026-08-03 07:59:36.936852	2026-08-03 07:59:36.936852
192	192	2026-08-03 07:59:37.003356	2026-08-03 07:59:37.003356
193	193	2026-08-03 07:59:37.139229	2026-08-03 07:59:37.139229
194	194	2026-08-03 07:59:37.179349	2026-08-03 07:59:37.179349
195	195	2026-08-03 07:59:37.220685	2026-08-03 07:59:37.220685
196	196	2026-08-03 07:59:37.260497	2026-08-03 07:59:37.260497
197	197	2026-08-03 07:59:37.318083	2026-08-03 07:59:37.318083
198	198	2026-08-03 07:59:37.358529	2026-08-03 07:59:37.358529
199	199	2026-08-03 07:59:37.426578	2026-08-03 07:59:37.426578
200	200	2026-08-03 07:59:37.474809	2026-08-03 07:59:37.474809
201	201	2026-08-03 07:59:37.532292	2026-08-03 07:59:37.532292
202	202	2026-08-03 07:59:37.586619	2026-08-03 07:59:37.586619
203	203	2026-08-03 07:59:37.639292	2026-08-03 07:59:37.639292
204	204	2026-08-03 07:59:37.696948	2026-08-03 07:59:37.696948
205	205	2026-08-03 07:59:37.804005	2026-08-03 07:59:37.804005
206	206	2026-08-03 07:59:37.859896	2026-08-03 07:59:37.859896
207	207	2026-08-03 07:59:37.9014	2026-08-03 07:59:37.9014
208	208	2026-08-03 08:01:45.202842	2026-08-03 08:01:45.202842
209	209	2026-08-03 08:01:45.269053	2026-08-03 08:01:45.269053
210	210	2026-08-03 08:01:45.331348	2026-08-03 08:01:45.331348
211	211	2026-08-03 08:01:45.461	2026-08-03 08:01:45.461
212	212	2026-08-03 08:01:45.525004	2026-08-03 08:01:45.525004
213	213	2026-08-03 08:01:45.593127	2026-08-03 08:01:45.593127
214	214	2026-08-03 08:01:45.687903	2026-08-03 08:01:45.687903
215	215	2026-08-03 08:01:45.749371	2026-08-03 08:01:45.749371
216	216	2026-08-03 08:01:45.817587	2026-08-03 08:01:45.817587
217	217	2026-08-03 08:01:45.94114	2026-08-03 08:01:45.94114
218	218	2026-08-03 08:01:46.003541	2026-08-03 08:01:46.003541
219	219	2026-08-03 08:01:46.085682	2026-08-03 08:01:46.085682
220	220	2026-08-03 08:01:46.16026	2026-08-03 08:01:46.16026
221	221	2026-08-03 08:01:46.198484	2026-08-03 08:01:46.198484
222	222	2026-08-03 08:01:46.23584	2026-08-03 08:01:46.23584
223	223	2026-08-03 08:01:46.300034	2026-08-03 08:01:46.300034
224	224	2026-08-03 08:01:46.333127	2026-08-03 08:01:46.333127
225	225	2026-08-03 08:01:46.370055	2026-08-03 08:01:46.370055
226	226	2026-08-03 08:01:46.424471	2026-08-03 08:01:46.424471
227	227	2026-08-03 08:01:46.465682	2026-08-03 08:01:46.465682
228	228	2026-08-03 08:01:49.448087	2026-08-03 08:01:49.448087
229	229	2026-08-03 08:01:49.499006	2026-08-03 08:01:49.499006
230	230	2026-08-03 08:01:49.555962	2026-08-03 08:01:49.555962
231	231	2026-08-03 08:01:49.592426	2026-08-03 08:01:49.592426
232	232	2026-08-03 08:01:49.618014	2026-08-03 08:01:49.618014
233	233	2026-08-03 08:01:49.70324	2026-08-03 08:01:49.70324
234	234	2026-08-03 08:01:49.78974	2026-08-03 08:01:49.78974
235	235	2026-08-03 08:01:49.871728	2026-08-03 08:01:49.871728
236	236	2026-08-03 08:01:49.938173	2026-08-03 08:01:49.938173
237	237	2026-08-03 08:01:50.012824	2026-08-03 08:01:50.012824
238	238	2026-08-03 08:01:50.131346	2026-08-03 08:01:50.131346
239	239	2026-08-03 08:01:50.206056	2026-08-03 08:01:50.206056
240	240	2026-08-03 08:01:50.291363	2026-08-03 08:01:50.291363
241	241	2026-08-03 08:01:50.36191	2026-08-03 08:01:50.36191
242	242	2026-08-03 08:01:50.515525	2026-08-03 08:01:50.515525
243	243	2026-08-03 08:01:50.590408	2026-08-03 08:01:50.590408
244	244	2026-08-03 08:01:50.687191	2026-08-03 08:01:50.687191
245	245	2026-08-03 08:01:50.752827	2026-08-03 08:01:50.752827
246	246	2026-08-03 08:01:50.84198	2026-08-03 08:01:50.84198
247	247	2026-08-03 08:01:50.905616	2026-08-03 08:01:50.905616
248	248	2026-08-03 08:01:50.971085	2026-08-03 08:01:50.971085
249	249	2026-08-03 08:01:51.055176	2026-08-03 08:01:51.055176
250	250	2026-08-03 08:01:51.149083	2026-08-03 08:01:51.149083
251	251	2026-08-03 08:01:51.214623	2026-08-03 08:01:51.214623
252	252	2026-08-03 08:01:51.282911	2026-08-03 08:01:51.282911
253	253	2026-08-03 08:01:51.443108	2026-08-03 08:01:51.443108
254	254	2026-08-03 08:01:51.5306	2026-08-03 08:01:51.5306
255	255	2026-08-03 08:01:51.592106	2026-08-03 08:01:51.592106
256	256	2026-08-03 08:01:51.658067	2026-08-03 08:01:51.658067
257	257	2026-08-03 08:01:51.733755	2026-08-03 08:01:51.733755
258	258	2026-08-03 08:01:51.843797	2026-08-03 08:01:51.843797
259	259	2026-08-03 08:01:51.885827	2026-08-03 08:01:51.885827
260	260	2026-08-03 08:01:51.958038	2026-08-03 08:01:51.958038
261	261	2026-08-03 08:01:52.006564	2026-08-03 08:01:52.006564
262	262	2026-08-03 08:01:52.067795	2026-08-03 08:01:52.067795
263	263	2026-08-03 08:01:52.106538	2026-08-03 08:01:52.106538
264	264	2026-08-03 08:01:52.143616	2026-08-03 08:01:52.143616
265	265	2026-08-03 08:01:52.198084	2026-08-03 08:01:52.198084
266	266	2026-08-03 08:01:52.293395	2026-08-03 08:01:52.293395
267	267	2026-08-03 08:01:52.36672	2026-08-03 08:01:52.36672
268	268	2026-08-03 08:01:52.423216	2026-08-03 08:01:52.423216
269	269	2026-08-03 08:01:52.474539	2026-08-03 08:01:52.474539
270	270	2026-08-03 08:01:52.55257	2026-08-03 08:01:52.55257
271	271	2026-08-03 08:01:52.594959	2026-08-03 08:01:52.594959
272	272	2026-08-03 08:01:52.63727	2026-08-03 08:01:52.63727
273	273	2026-08-03 08:03:35.035565	2026-08-03 08:03:35.035565
274	274	2026-08-03 08:03:35.099521	2026-08-03 08:03:35.099521
275	275	2026-08-03 08:03:35.156639	2026-08-03 08:03:35.156639
276	276	2026-08-03 08:03:35.232338	2026-08-03 08:03:35.232338
277	277	2026-08-03 08:03:35.288152	2026-08-03 08:03:35.288152
278	278	2026-08-03 08:03:35.347346	2026-08-03 08:03:35.347346
279	279	2026-08-03 08:03:35.420429	2026-08-03 08:03:35.420429
280	280	2026-08-03 08:03:35.482729	2026-08-03 08:03:35.482729
281	281	2026-08-03 08:03:35.548425	2026-08-03 08:03:35.548425
282	282	2026-08-03 08:03:35.628072	2026-08-03 08:03:35.628072
283	283	2026-08-03 08:03:35.691609	2026-08-03 08:03:35.691609
284	284	2026-08-03 08:03:35.786062	2026-08-03 08:03:35.786062
285	285	2026-08-03 08:03:35.865185	2026-08-03 08:03:35.865185
286	286	2026-08-03 08:03:35.903924	2026-08-03 08:03:35.903924
287	287	2026-08-03 08:03:35.940595	2026-08-03 08:03:35.940595
288	288	2026-08-03 08:03:36.013917	2026-08-03 08:03:36.013917
289	289	2026-08-03 08:03:36.050011	2026-08-03 08:03:36.050011
290	290	2026-08-03 08:03:36.096783	2026-08-03 08:03:36.096783
291	291	2026-08-03 08:03:36.189723	2026-08-03 08:03:36.189723
292	292	2026-08-03 08:03:36.229935	2026-08-03 08:03:36.229935
293	293	2026-08-03 08:03:39.067454	2026-08-03 08:03:39.067454
294	294	2026-08-03 08:03:39.113443	2026-08-03 08:03:39.113443
295	295	2026-08-03 08:03:39.160576	2026-08-03 08:03:39.160576
296	296	2026-08-03 08:03:39.197129	2026-08-03 08:03:39.197129
297	297	2026-08-03 08:03:39.222926	2026-08-03 08:03:39.222926
298	298	2026-08-03 08:03:39.314736	2026-08-03 08:03:39.314736
299	299	2026-08-03 08:03:39.482027	2026-08-03 08:03:39.482027
300	300	2026-08-03 08:03:39.609936	2026-08-03 08:03:39.609936
301	301	2026-08-03 08:03:39.710394	2026-08-03 08:03:39.710394
302	302	2026-08-03 08:03:39.79473	2026-08-03 08:03:39.79473
303	303	2026-08-03 08:03:39.935637	2026-08-03 08:03:39.935637
304	304	2026-08-03 08:03:40.004944	2026-08-03 08:03:40.004944
305	305	2026-08-03 08:03:40.099395	2026-08-03 08:03:40.099395
306	306	2026-08-03 08:03:40.165875	2026-08-03 08:03:40.165875
307	307	2026-08-03 08:03:40.250933	2026-08-03 08:03:40.250933
308	308	2026-08-03 08:03:40.314533	2026-08-03 08:03:40.314533
309	309	2026-08-03 08:03:40.443536	2026-08-03 08:03:40.443536
310	310	2026-08-03 08:03:40.511653	2026-08-03 08:03:40.511653
311	311	2026-08-03 08:03:40.607514	2026-08-03 08:03:40.607514
312	312	2026-08-03 08:03:40.711765	2026-08-03 08:03:40.711765
313	313	2026-08-03 08:03:40.790136	2026-08-03 08:03:40.790136
314	314	2026-08-03 08:03:40.910613	2026-08-03 08:03:40.910613
315	315	2026-08-03 08:03:40.992545	2026-08-03 08:03:40.992545
316	316	2026-08-03 08:03:41.054454	2026-08-03 08:03:41.054454
317	317	2026-08-03 08:03:41.115494	2026-08-03 08:03:41.115494
318	318	2026-08-03 08:03:41.218941	2026-08-03 08:03:41.218941
319	319	2026-08-03 08:03:41.301207	2026-08-03 08:03:41.301207
320	320	2026-08-03 08:03:41.360674	2026-08-03 08:03:41.360674
321	321	2026-08-03 08:03:41.433543	2026-08-03 08:03:41.433543
322	322	2026-08-03 08:03:41.525635	2026-08-03 08:03:41.525635
323	323	2026-08-03 08:03:41.63636	2026-08-03 08:03:41.63636
324	324	2026-08-03 08:03:41.68736	2026-08-03 08:03:41.68736
325	325	2026-08-03 08:03:41.752526	2026-08-03 08:03:41.752526
326	326	2026-08-03 08:03:41.832444	2026-08-03 08:03:41.832444
327	327	2026-08-03 08:03:41.905224	2026-08-03 08:03:41.905224
328	328	2026-08-03 08:03:41.964498	2026-08-03 08:03:41.964498
329	329	2026-08-03 08:03:41.999861	2026-08-03 08:03:41.999861
330	330	2026-08-03 08:03:42.031381	2026-08-03 08:03:42.031381
331	331	2026-08-03 08:03:42.075276	2026-08-03 08:03:42.075276
332	332	2026-08-03 08:03:42.109249	2026-08-03 08:03:42.109249
333	333	2026-08-03 08:03:42.15684	2026-08-03 08:03:42.15684
334	334	2026-08-03 08:03:42.206047	2026-08-03 08:03:42.206047
335	335	2026-08-03 08:03:42.285251	2026-08-03 08:03:42.285251
336	336	2026-08-03 08:03:42.323854	2026-08-03 08:03:42.323854
337	337	2026-08-03 08:03:42.362244	2026-08-03 08:03:42.362244
338	338	2026-08-03 08:04:43.638799	2026-08-03 08:04:43.638799
339	339	2026-08-03 08:04:43.736728	2026-08-03 08:04:43.736728
340	340	2026-08-03 08:04:43.836103	2026-08-03 08:04:43.836103
341	341	2026-08-03 08:04:43.975942	2026-08-03 08:04:43.975942
342	342	2026-08-03 08:04:44.036605	2026-08-03 08:04:44.036605
343	343	2026-08-03 08:04:44.125728	2026-08-03 08:04:44.125728
344	344	2026-08-03 08:04:44.230391	2026-08-03 08:04:44.230391
345	345	2026-08-03 08:04:44.294205	2026-08-03 08:04:44.294205
346	346	2026-08-03 08:04:44.366012	2026-08-03 08:04:44.366012
347	347	2026-08-03 08:04:44.446043	2026-08-03 08:04:44.446043
348	348	2026-08-03 08:04:44.498325	2026-08-03 08:04:44.498325
349	349	2026-08-03 08:04:44.556189	2026-08-03 08:04:44.556189
350	350	2026-08-03 08:04:44.648715	2026-08-03 08:04:44.648715
351	351	2026-08-03 08:04:44.687409	2026-08-03 08:04:44.687409
352	352	2026-08-03 08:04:44.722687	2026-08-03 08:04:44.722687
353	353	2026-08-03 08:04:44.766591	2026-08-03 08:04:44.766591
354	354	2026-08-03 08:04:44.798941	2026-08-03 08:04:44.798941
355	355	2026-08-03 08:04:44.832927	2026-08-03 08:04:44.832927
356	356	2026-08-03 08:04:44.956491	2026-08-03 08:04:44.956491
357	357	2026-08-03 08:04:44.996595	2026-08-03 08:04:44.996595
358	358	2026-08-03 08:04:48.055194	2026-08-03 08:04:48.055194
359	359	2026-08-03 08:04:48.105176	2026-08-03 08:04:48.105176
360	360	2026-08-03 08:04:48.158744	2026-08-03 08:04:48.158744
361	361	2026-08-03 08:04:48.213903	2026-08-03 08:04:48.213903
362	362	2026-08-03 08:04:48.272143	2026-08-03 08:04:48.272143
363	363	2026-08-03 08:04:48.380048	2026-08-03 08:04:48.380048
364	364	2026-08-03 08:04:48.527042	2026-08-03 08:04:48.527042
365	365	2026-08-03 08:04:48.650184	2026-08-03 08:04:48.650184
366	366	2026-08-03 08:04:48.768303	2026-08-03 08:04:48.768303
367	367	2026-08-03 08:04:48.837617	2026-08-03 08:04:48.837617
368	368	2026-08-03 08:04:48.923879	2026-08-03 08:04:48.923879
369	369	2026-08-03 08:04:48.995331	2026-08-03 08:04:48.995331
370	370	2026-08-03 08:04:49.081131	2026-08-03 08:04:49.081131
371	371	2026-08-03 08:04:49.169592	2026-08-03 08:04:49.169592
372	372	2026-08-03 08:04:49.290374	2026-08-03 08:04:49.290374
373	373	2026-08-03 08:04:49.365327	2026-08-03 08:04:49.365327
374	374	2026-08-03 08:04:49.458519	2026-08-03 08:04:49.458519
375	375	2026-08-03 08:04:49.523315	2026-08-03 08:04:49.523315
376	376	2026-08-03 08:04:49.615286	2026-08-03 08:04:49.615286
377	377	2026-08-03 08:04:49.682503	2026-08-03 08:04:49.682503
378	378	2026-08-03 08:04:49.817118	2026-08-03 08:04:49.817118
379	379	2026-08-03 08:04:49.95278	2026-08-03 08:04:49.95278
380	380	2026-08-03 08:04:50.045448	2026-08-03 08:04:50.045448
381	381	2026-08-03 08:04:50.109486	2026-08-03 08:04:50.109486
382	382	2026-08-03 08:04:50.18718	2026-08-03 08:04:50.18718
383	383	2026-08-03 08:04:50.301369	2026-08-03 08:04:50.301369
384	384	2026-08-03 08:04:50.401343	2026-08-03 08:04:50.401343
385	385	2026-08-03 08:04:50.463891	2026-08-03 08:04:50.463891
386	386	2026-08-03 08:04:50.529498	2026-08-03 08:04:50.529498
387	387	2026-08-03 08:04:50.596194	2026-08-03 08:04:50.596194
388	388	2026-08-03 08:04:50.720004	2026-08-03 08:04:50.720004
389	389	2026-08-03 08:04:50.761027	2026-08-03 08:04:50.761027
390	390	2026-08-03 08:04:50.803054	2026-08-03 08:04:50.803054
391	391	2026-08-03 08:04:50.847317	2026-08-03 08:04:50.847317
392	392	2026-08-03 08:04:50.961231	2026-08-03 08:04:50.961231
393	393	2026-08-03 08:04:51.026062	2026-08-03 08:04:51.026062
394	394	2026-08-03 08:04:51.065851	2026-08-03 08:04:51.065851
395	395	2026-08-03 08:04:51.099405	2026-08-03 08:04:51.099405
396	396	2026-08-03 08:04:51.143705	2026-08-03 08:04:51.143705
397	397	2026-08-03 08:04:51.179731	2026-08-03 08:04:51.179731
398	398	2026-08-03 08:04:51.227203	2026-08-03 08:04:51.227203
399	399	2026-08-03 08:04:51.287855	2026-08-03 08:04:51.287855
400	400	2026-08-03 08:04:51.363743	2026-08-03 08:04:51.363743
401	401	2026-08-03 08:04:51.410417	2026-08-03 08:04:51.410417
402	402	2026-08-03 08:04:51.45448	2026-08-03 08:04:51.45448
403	403	2026-08-03 09:28:57.552005	2026-08-03 09:28:57.552005
404	404	2026-08-03 09:28:57.632743	2026-08-03 09:28:57.632743
405	405	2026-08-03 09:28:57.710192	2026-08-03 09:28:57.710192
406	406	2026-08-03 09:28:57.815184	2026-08-03 09:28:57.815184
407	407	2026-08-03 09:28:57.879283	2026-08-03 09:28:57.879283
408	408	2026-08-03 09:28:57.9456	2026-08-03 09:28:57.9456
409	409	2026-08-03 09:28:58.034012	2026-08-03 09:28:58.034012
410	410	2026-08-03 09:28:58.115988	2026-08-03 09:28:58.115988
411	411	2026-08-03 09:28:58.181407	2026-08-03 09:28:58.181407
412	412	2026-08-03 09:28:58.27534	2026-08-03 09:28:58.27534
413	413	2026-08-03 09:28:58.350199	2026-08-03 09:28:58.350199
414	414	2026-08-03 09:28:58.447938	2026-08-03 09:28:58.447938
415	415	2026-08-03 09:28:58.52794	2026-08-03 09:28:58.52794
416	416	2026-08-03 09:28:58.568719	2026-08-03 09:28:58.568719
417	417	2026-08-03 09:28:58.608929	2026-08-03 09:28:58.608929
418	418	2026-08-03 09:28:58.657075	2026-08-03 09:28:58.657075
419	419	2026-08-03 09:28:58.692765	2026-08-03 09:28:58.692765
420	420	2026-08-03 09:28:58.751995	2026-08-03 09:28:58.751995
421	421	2026-08-03 09:28:58.818809	2026-08-03 09:28:58.818809
422	422	2026-08-03 09:28:58.86011	2026-08-03 09:28:58.86011
423	423	2026-08-03 09:29:02.123517	2026-08-03 09:29:02.123517
424	424	2026-08-03 09:29:02.184098	2026-08-03 09:29:02.184098
425	425	2026-08-03 09:29:02.237301	2026-08-03 09:29:02.237301
426	426	2026-08-03 09:29:02.279653	2026-08-03 09:29:02.279653
427	427	2026-08-03 09:29:02.307451	2026-08-03 09:29:02.307451
428	428	2026-08-03 09:29:02.432397	2026-08-03 09:29:02.432397
429	429	2026-08-03 09:29:02.53428	2026-08-03 09:29:02.53428
430	430	2026-08-03 09:29:02.65474	2026-08-03 09:29:02.65474
431	431	2026-08-03 09:29:02.740834	2026-08-03 09:29:02.740834
432	432	2026-08-03 09:29:02.806397	2026-08-03 09:29:02.806397
433	433	2026-08-03 09:29:02.888422	2026-08-03 09:29:02.888422
434	434	2026-08-03 09:29:02.949836	2026-08-03 09:29:02.949836
435	435	2026-08-03 09:29:03.037594	2026-08-03 09:29:03.037594
436	436	2026-08-03 09:29:03.135752	2026-08-03 09:29:03.135752
437	437	2026-08-03 09:29:03.229311	2026-08-03 09:29:03.229311
438	438	2026-08-03 09:29:03.298573	2026-08-03 09:29:03.298573
439	439	2026-08-03 09:29:03.379837	2026-08-03 09:29:03.379837
440	440	2026-08-03 09:29:03.444161	2026-08-03 09:29:03.444161
441	441	2026-08-03 09:29:03.561897	2026-08-03 09:29:03.561897
442	442	2026-08-03 09:29:03.688707	2026-08-03 09:29:03.688707
443	443	2026-08-03 09:29:03.798172	2026-08-03 09:29:03.798172
444	444	2026-08-03 09:29:03.887962	2026-08-03 09:29:03.887962
445	445	2026-08-03 09:29:03.978373	2026-08-03 09:29:03.978373
446	446	2026-08-03 09:29:04.044162	2026-08-03 09:29:04.044162
447	447	2026-08-03 09:29:04.114313	2026-08-03 09:29:04.114313
448	448	2026-08-03 09:29:04.334955	2026-08-03 09:29:04.334955
449	449	2026-08-03 09:29:04.493882	2026-08-03 09:29:04.493882
450	450	2026-08-03 09:29:04.628671	2026-08-03 09:29:04.628671
451	451	2026-08-03 09:29:04.705599	2026-08-03 09:29:04.705599
452	452	2026-08-03 09:29:04.77082	2026-08-03 09:29:04.77082
453	453	2026-08-03 09:29:04.877101	2026-08-03 09:29:04.877101
454	454	2026-08-03 09:29:04.914994	2026-08-03 09:29:04.914994
455	455	2026-08-03 09:29:04.954331	2026-08-03 09:29:04.954331
456	456	2026-08-03 09:29:05.004272	2026-08-03 09:29:05.004272
457	457	2026-08-03 09:29:05.067612	2026-08-03 09:29:05.067612
458	458	2026-08-03 09:29:05.144445	2026-08-03 09:29:05.144445
459	459	2026-08-03 09:29:05.185454	2026-08-03 09:29:05.185454
460	460	2026-08-03 09:29:05.224129	2026-08-03 09:29:05.224129
461	461	2026-08-03 09:29:05.270369	2026-08-03 09:29:05.270369
462	462	2026-08-03 09:29:05.307582	2026-08-03 09:29:05.307582
463	463	2026-08-03 09:29:05.357965	2026-08-03 09:29:05.357965
464	464	2026-08-03 09:29:05.415611	2026-08-03 09:29:05.415611
465	465	2026-08-03 09:29:05.494196	2026-08-03 09:29:05.494196
466	466	2026-08-03 09:29:05.548088	2026-08-03 09:29:05.548088
467	467	2026-08-03 09:29:05.59045	2026-08-03 09:29:05.59045
468	468	2026-08-03 09:34:00.859425	2026-08-03 09:34:00.859425
469	469	2026-08-03 09:34:00.954218	2026-08-03 09:34:00.954218
470	470	2026-08-03 09:34:01.014887	2026-08-03 09:34:01.014887
471	471	2026-08-03 09:34:01.103841	2026-08-03 09:34:01.103841
472	472	2026-08-03 09:34:01.180206	2026-08-03 09:34:01.180206
473	473	2026-08-03 09:34:01.252697	2026-08-03 09:34:01.252697
474	474	2026-08-03 09:34:01.338043	2026-08-03 09:34:01.338043
475	475	2026-08-03 09:34:01.436226	2026-08-03 09:34:01.436226
476	476	2026-08-03 09:34:01.501753	2026-08-03 09:34:01.501753
477	477	2026-08-03 09:34:01.592456	2026-08-03 09:34:01.592456
478	478	2026-08-03 09:34:01.655559	2026-08-03 09:34:01.655559
479	479	2026-08-03 09:34:01.721169	2026-08-03 09:34:01.721169
480	480	2026-08-03 09:34:01.812009	2026-08-03 09:34:01.812009
481	481	2026-08-03 09:34:01.852125	2026-08-03 09:34:01.852125
482	482	2026-08-03 09:34:01.888288	2026-08-03 09:34:01.888288
483	483	2026-08-03 09:34:01.969233	2026-08-03 09:34:01.969233
484	484	2026-08-03 09:34:02.012223	2026-08-03 09:34:02.012223
485	485	2026-08-03 09:34:02.046999	2026-08-03 09:34:02.046999
486	486	2026-08-03 09:34:02.120174	2026-08-03 09:34:02.120174
487	487	2026-08-03 09:34:02.16115	2026-08-03 09:34:02.16115
488	488	2026-08-03 09:34:05.443074	2026-08-03 09:34:05.443074
489	489	2026-08-03 09:34:05.512694	2026-08-03 09:34:05.512694
490	490	2026-08-03 09:34:05.586163	2026-08-03 09:34:05.586163
491	491	2026-08-03 09:34:05.642609	2026-08-03 09:34:05.642609
492	492	2026-08-03 09:34:05.684935	2026-08-03 09:34:05.684935
493	493	2026-08-03 09:34:05.780104	2026-08-03 09:34:05.780104
494	494	2026-08-03 09:34:05.904004	2026-08-03 09:34:05.904004
495	495	2026-08-03 09:34:05.994356	2026-08-03 09:34:05.994356
496	496	2026-08-03 09:34:06.073635	2026-08-03 09:34:06.073635
497	497	2026-08-03 09:34:06.147483	2026-08-03 09:34:06.147483
498	498	2026-08-03 09:34:06.258854	2026-08-03 09:34:06.258854
499	499	2026-08-03 09:34:06.332085	2026-08-03 09:34:06.332085
500	500	2026-08-03 09:34:06.425085	2026-08-03 09:34:06.425085
501	501	2026-08-03 09:34:06.504997	2026-08-03 09:34:06.504997
502	502	2026-08-03 09:34:06.609061	2026-08-03 09:34:06.609061
503	503	2026-08-03 09:34:06.736755	2026-08-03 09:34:06.736755
504	504	2026-08-03 09:34:06.852903	2026-08-03 09:34:06.852903
505	505	2026-08-03 09:34:06.918938	2026-08-03 09:34:06.918938
506	506	2026-08-03 09:34:07.02163	2026-08-03 09:34:07.02163
507	507	2026-08-03 09:34:07.152382	2026-08-03 09:34:07.152382
508	508	2026-08-03 09:34:07.298108	2026-08-03 09:34:07.298108
509	509	2026-08-03 09:34:07.433522	2026-08-03 09:34:07.433522
510	510	2026-08-03 09:34:07.565865	2026-08-03 09:34:07.565865
511	511	2026-08-03 09:34:07.663248	2026-08-03 09:34:07.663248
512	512	2026-08-03 09:34:07.735972	2026-08-03 09:34:07.735972
513	513	2026-08-03 09:34:07.842843	2026-08-03 09:34:07.842843
514	514	2026-08-03 09:34:07.965823	2026-08-03 09:34:07.965823
515	515	2026-08-03 09:34:08.068693	2026-08-03 09:34:08.068693
516	516	2026-08-03 09:34:08.18248	2026-08-03 09:34:08.18248
517	517	2026-08-03 09:34:08.250207	2026-08-03 09:34:08.250207
518	518	2026-08-03 09:34:08.357927	2026-08-03 09:34:08.357927
519	519	2026-08-03 09:34:08.428318	2026-08-03 09:34:08.428318
520	520	2026-08-03 09:34:08.502718	2026-08-03 09:34:08.502718
521	521	2026-08-03 09:34:08.556256	2026-08-03 09:34:08.556256
522	522	2026-08-03 09:34:08.621595	2026-08-03 09:34:08.621595
523	523	2026-08-03 09:34:08.702225	2026-08-03 09:34:08.702225
524	524	2026-08-03 09:34:08.745981	2026-08-03 09:34:08.745981
525	525	2026-08-03 09:34:08.782598	2026-08-03 09:34:08.782598
526	526	2026-08-03 09:34:08.848625	2026-08-03 09:34:08.848625
527	527	2026-08-03 09:34:08.902202	2026-08-03 09:34:08.902202
528	528	2026-08-03 09:34:08.958416	2026-08-03 09:34:08.958416
529	529	2026-08-03 09:34:09.011686	2026-08-03 09:34:09.011686
530	530	2026-08-03 09:34:09.109786	2026-08-03 09:34:09.109786
531	531	2026-08-03 09:34:09.202554	2026-08-03 09:34:09.202554
532	532	2026-08-03 09:34:09.297473	2026-08-03 09:34:09.297473
533	533	2026-08-03 09:34:09.433413	2026-08-03 09:34:09.433413
534	534	2026-08-03 09:34:09.607935	2026-08-03 09:34:09.607935
535	535	2026-08-03 09:34:09.678654	2026-08-03 09:34:09.678654
536	536	2026-08-03 09:34:09.778641	2026-08-03 09:34:09.778641
537	537	2026-08-03 09:34:09.892408	2026-08-03 09:34:09.892408
538	538	2026-08-03 09:34:10.048637	2026-08-03 09:34:10.048637
539	539	2026-08-03 09:34:10.151726	2026-08-03 09:34:10.151726
540	540	2026-08-03 09:34:10.224312	2026-08-03 09:34:10.224312
541	541	2026-08-03 09:34:10.310146	2026-08-03 09:34:10.310146
542	542	2026-08-03 09:34:10.421233	2026-08-03 09:34:10.421233
543	543	2026-08-03 09:34:10.48748	2026-08-03 09:34:10.48748
544	544	2026-08-03 09:34:10.560428	2026-08-03 09:34:10.560428
545	545	2026-08-03 09:34:10.646315	2026-08-03 09:34:10.646315
546	546	2026-08-03 09:34:10.773893	2026-08-03 09:34:10.773893
547	547	2026-08-03 09:34:10.857267	2026-08-03 09:34:10.857267
548	548	2026-08-03 09:34:10.970435	2026-08-03 09:34:10.970435
549	549	2026-08-03 09:34:11.058596	2026-08-03 09:34:11.058596
550	550	2026-08-03 09:34:11.204383	2026-08-03 09:34:11.204383
551	551	2026-08-03 09:34:11.330671	2026-08-03 09:34:11.330671
552	552	2026-08-03 09:34:11.430161	2026-08-03 09:34:11.430161
553	553	2026-08-03 09:34:11.502172	2026-08-03 09:34:11.502172
554	554	2026-08-03 09:34:11.657198	2026-08-03 09:34:11.657198
555	555	2026-08-03 09:34:11.80284	2026-08-03 09:34:11.80284
556	556	2026-08-03 09:34:11.983037	2026-08-03 09:34:11.983037
557	557	2026-08-03 09:34:12.056418	2026-08-03 09:34:12.056418
558	558	2026-08-03 09:34:12.16866	2026-08-03 09:34:12.16866
559	559	2026-08-03 09:34:12.298271	2026-08-03 09:34:12.298271
560	560	2026-08-03 09:34:12.343738	2026-08-03 09:34:12.343738
561	561	2026-08-03 09:34:12.392916	2026-08-03 09:34:12.392916
562	562	2026-08-03 09:34:12.456977	2026-08-03 09:34:12.456977
563	563	2026-08-03 09:34:12.500932	2026-08-03 09:34:12.500932
564	564	2026-08-03 09:34:12.539879	2026-08-03 09:34:12.539879
565	565	2026-08-03 09:34:12.595273	2026-08-03 09:34:12.595273
566	566	2026-08-03 09:34:12.671905	2026-08-03 09:34:12.671905
567	567	2026-08-03 09:36:54.83865	2026-08-03 09:36:54.83865
568	568	2026-08-03 09:36:54.916562	2026-08-03 09:36:54.916562
569	569	2026-08-03 09:36:54.993254	2026-08-03 09:36:54.993254
570	570	2026-08-03 09:36:55.138804	2026-08-03 09:36:55.138804
571	571	2026-08-03 09:36:55.205862	2026-08-03 09:36:55.205862
572	572	2026-08-03 09:36:55.274879	2026-08-03 09:36:55.274879
573	573	2026-08-03 09:36:55.40223	2026-08-03 09:36:55.40223
574	574	2026-08-03 09:36:55.48111	2026-08-03 09:36:55.48111
575	575	2026-08-03 09:36:55.583555	2026-08-03 09:36:55.583555
576	576	2026-08-03 09:36:55.662431	2026-08-03 09:36:55.662431
577	577	2026-08-03 09:36:55.718398	2026-08-03 09:36:55.718398
578	578	2026-08-03 09:36:55.778501	2026-08-03 09:36:55.778501
579	579	2026-08-03 09:36:55.857099	2026-08-03 09:36:55.857099
580	580	2026-08-03 09:36:55.896592	2026-08-03 09:36:55.896592
581	581	2026-08-03 09:36:55.94104	2026-08-03 09:36:55.94104
582	582	2026-08-03 09:36:55.992489	2026-08-03 09:36:55.992489
583	583	2026-08-03 09:36:56.060143	2026-08-03 09:36:56.060143
584	584	2026-08-03 09:36:56.128429	2026-08-03 09:36:56.128429
585	585	2026-08-03 09:36:56.189214	2026-08-03 09:36:56.189214
586	586	2026-08-03 09:36:56.228995	2026-08-03 09:36:56.228995
587	587	2026-08-03 09:36:59.189969	2026-08-03 09:36:59.189969
588	588	2026-08-03 09:36:59.24661	2026-08-03 09:36:59.24661
589	589	2026-08-03 09:36:59.301506	2026-08-03 09:36:59.301506
590	590	2026-08-03 09:36:59.33945	2026-08-03 09:36:59.33945
591	591	2026-08-03 09:36:59.368807	2026-08-03 09:36:59.368807
592	592	2026-08-03 09:36:59.473212	2026-08-03 09:36:59.473212
593	593	2026-08-03 09:36:59.573062	2026-08-03 09:36:59.573062
594	594	2026-08-03 09:36:59.735064	2026-08-03 09:36:59.735064
595	595	2026-08-03 09:36:59.841445	2026-08-03 09:36:59.841445
596	596	2026-08-03 09:36:59.925708	2026-08-03 09:36:59.925708
597	597	2026-08-03 09:37:00.031446	2026-08-03 09:37:00.031446
598	598	2026-08-03 09:37:00.100322	2026-08-03 09:37:00.100322
599	599	2026-08-03 09:37:00.191706	2026-08-03 09:37:00.191706
600	600	2026-08-03 09:37:00.265658	2026-08-03 09:37:00.265658
601	601	2026-08-03 09:37:00.35458	2026-08-03 09:37:00.35458
602	602	2026-08-03 09:37:00.445138	2026-08-03 09:37:00.445138
603	603	2026-08-03 09:37:00.550997	2026-08-03 09:37:00.550997
604	604	2026-08-03 09:37:00.616766	2026-08-03 09:37:00.616766
605	605	2026-08-03 09:37:00.707567	2026-08-03 09:37:00.707567
606	606	2026-08-03 09:37:00.782437	2026-08-03 09:37:00.782437
607	607	2026-08-03 09:37:00.860478	2026-08-03 09:37:00.860478
608	608	2026-08-03 09:37:00.974283	2026-08-03 09:37:00.974283
609	609	2026-08-03 09:37:01.094162	2026-08-03 09:37:01.094162
610	610	2026-08-03 09:37:01.185998	2026-08-03 09:37:01.185998
611	611	2026-08-03 09:37:01.270539	2026-08-03 09:37:01.270539
612	612	2026-08-03 09:37:01.396693	2026-08-03 09:37:01.396693
613	613	2026-08-03 09:37:01.506243	2026-08-03 09:37:01.506243
614	614	2026-08-03 09:37:01.577064	2026-08-03 09:37:01.577064
615	615	2026-08-03 09:37:01.652075	2026-08-03 09:37:01.652075
616	616	2026-08-03 09:37:01.750599	2026-08-03 09:37:01.750599
617	617	2026-08-03 09:37:01.935396	2026-08-03 09:37:01.935396
618	618	2026-08-03 09:37:01.986563	2026-08-03 09:37:01.986563
619	619	2026-08-03 09:37:02.028055	2026-08-03 09:37:02.028055
620	620	2026-08-03 09:37:02.069111	2026-08-03 09:37:02.069111
621	621	2026-08-03 09:37:02.138357	2026-08-03 09:37:02.138357
622	622	2026-08-03 09:37:02.178561	2026-08-03 09:37:02.178561
623	623	2026-08-03 09:37:02.219001	2026-08-03 09:37:02.219001
624	624	2026-08-03 09:37:02.258234	2026-08-03 09:37:02.258234
625	625	2026-08-03 09:37:02.308901	2026-08-03 09:37:02.308901
626	626	2026-08-03 09:37:02.364332	2026-08-03 09:37:02.364332
627	627	2026-08-03 09:37:02.460187	2026-08-03 09:37:02.460187
628	628	2026-08-03 09:37:02.539278	2026-08-03 09:37:02.539278
629	629	2026-08-03 09:37:02.640583	2026-08-03 09:37:02.640583
630	630	2026-08-03 09:37:02.736628	2026-08-03 09:37:02.736628
631	631	2026-08-03 09:37:02.820647	2026-08-03 09:37:02.820647
632	632	2026-08-03 09:37:02.929703	2026-08-03 09:37:02.929703
633	633	2026-08-03 09:37:03.114644	2026-08-03 09:37:03.114644
634	634	2026-08-03 09:37:03.221489	2026-08-03 09:37:03.221489
635	635	2026-08-03 09:37:03.289676	2026-08-03 09:37:03.289676
636	636	2026-08-03 09:37:03.383495	2026-08-03 09:37:03.383495
637	637	2026-08-03 09:37:03.523473	2026-08-03 09:37:03.523473
638	638	2026-08-03 09:37:03.636509	2026-08-03 09:37:03.636509
639	639	2026-08-03 09:37:03.709028	2026-08-03 09:37:03.709028
640	640	2026-08-03 09:37:03.795455	2026-08-03 09:37:03.795455
641	641	2026-08-03 09:37:03.924416	2026-08-03 09:37:03.924416
642	642	2026-08-03 09:37:04.012349	2026-08-03 09:37:04.012349
643	643	2026-08-03 09:37:04.092315	2026-08-03 09:37:04.092315
644	644	2026-08-03 09:37:04.193656	2026-08-03 09:37:04.193656
645	645	2026-08-03 09:37:04.33437	2026-08-03 09:37:04.33437
646	646	2026-08-03 09:37:04.432719	2026-08-03 09:37:04.432719
647	647	2026-08-03 09:37:04.502425	2026-08-03 09:37:04.502425
648	648	2026-08-03 09:37:04.57074	2026-08-03 09:37:04.57074
649	649	2026-08-03 09:37:04.660518	2026-08-03 09:37:04.660518
650	650	2026-08-03 09:37:04.73775	2026-08-03 09:37:04.73775
651	651	2026-08-03 09:37:04.858127	2026-08-03 09:37:04.858127
652	652	2026-08-03 09:37:04.978478	2026-08-03 09:37:04.978478
653	653	2026-08-03 09:37:05.129578	2026-08-03 09:37:05.129578
654	654	2026-08-03 09:37:05.266922	2026-08-03 09:37:05.266922
655	655	2026-08-03 09:37:05.524183	2026-08-03 09:37:05.524183
656	656	2026-08-03 09:37:05.599327	2026-08-03 09:37:05.599327
657	657	2026-08-03 09:37:05.684945	2026-08-03 09:37:05.684945
658	658	2026-08-03 09:37:05.813384	2026-08-03 09:37:05.813384
659	659	2026-08-03 09:37:05.871775	2026-08-03 09:37:05.871775
660	660	2026-08-03 09:37:05.932704	2026-08-03 09:37:05.932704
661	661	2026-08-03 09:37:06.052464	2026-08-03 09:37:06.052464
662	662	2026-08-03 09:37:06.146351	2026-08-03 09:37:06.146351
663	663	2026-08-03 09:37:06.201987	2026-08-03 09:37:06.201987
664	664	2026-08-03 09:37:06.260061	2026-08-03 09:37:06.260061
665	665	2026-08-03 09:37:06.359016	2026-08-03 09:37:06.359016
666	666	2026-08-03 09:39:27.413874	2026-08-03 09:39:27.413874
667	667	2026-08-03 09:39:27.528137	2026-08-03 09:39:27.528137
668	668	2026-08-03 09:39:27.614365	2026-08-03 09:39:27.614365
669	669	2026-08-03 09:39:27.70611	2026-08-03 09:39:27.70611
670	670	2026-08-03 09:39:27.7978	2026-08-03 09:39:27.7978
671	671	2026-08-03 09:39:27.894472	2026-08-03 09:39:27.894472
672	672	2026-08-03 09:39:28.013375	2026-08-03 09:39:28.013375
673	673	2026-08-03 09:39:28.12538	2026-08-03 09:39:28.12538
674	674	2026-08-03 09:39:28.260277	2026-08-03 09:39:28.260277
675	675	2026-08-03 09:39:28.424714	2026-08-03 09:39:28.424714
676	676	2026-08-03 09:39:28.509795	2026-08-03 09:39:28.509795
677	677	2026-08-03 09:39:28.629559	2026-08-03 09:39:28.629559
678	678	2026-08-03 09:39:28.716854	2026-08-03 09:39:28.716854
679	679	2026-08-03 09:39:28.758538	2026-08-03 09:39:28.758538
680	680	2026-08-03 09:39:28.800215	2026-08-03 09:39:28.800215
681	681	2026-08-03 09:39:28.859782	2026-08-03 09:39:28.859782
682	682	2026-08-03 09:39:28.897067	2026-08-03 09:39:28.897067
683	683	2026-08-03 09:39:28.931139	2026-08-03 09:39:28.931139
684	684	2026-08-03 09:39:29.004744	2026-08-03 09:39:29.004744
685	685	2026-08-03 09:39:29.051268	2026-08-03 09:39:29.051268
686	686	2026-08-03 09:39:32.546666	2026-08-03 09:39:32.546666
687	687	2026-08-03 09:39:32.645742	2026-08-03 09:39:32.645742
688	688	2026-08-03 09:39:32.752186	2026-08-03 09:39:32.752186
689	689	2026-08-03 09:39:32.817814	2026-08-03 09:39:32.817814
690	690	2026-08-03 09:39:32.853321	2026-08-03 09:39:32.853321
691	691	2026-08-03 09:39:32.948249	2026-08-03 09:39:32.948249
692	692	2026-08-03 09:39:33.129539	2026-08-03 09:39:33.129539
693	693	2026-08-03 09:39:33.282594	2026-08-03 09:39:33.282594
694	694	2026-08-03 09:39:33.377221	2026-08-03 09:39:33.377221
695	695	2026-08-03 09:39:33.505953	2026-08-03 09:39:33.505953
696	696	2026-08-03 09:39:33.648183	2026-08-03 09:39:33.648183
697	697	2026-08-03 09:39:33.761824	2026-08-03 09:39:33.761824
698	698	2026-08-03 09:39:33.86959	2026-08-03 09:39:33.86959
699	699	2026-08-03 09:39:33.946345	2026-08-03 09:39:33.946345
700	700	2026-08-03 09:39:34.051113	2026-08-03 09:39:34.051113
701	701	2026-08-03 09:39:34.146921	2026-08-03 09:39:34.146921
702	702	2026-08-03 09:39:34.251454	2026-08-03 09:39:34.251454
703	703	2026-08-03 09:39:34.336756	2026-08-03 09:39:34.336756
704	704	2026-08-03 09:39:34.454579	2026-08-03 09:39:34.454579
705	705	2026-08-03 09:39:34.523401	2026-08-03 09:39:34.523401
706	706	2026-08-03 09:39:34.592523	2026-08-03 09:39:34.592523
707	707	2026-08-03 09:39:34.686744	2026-08-03 09:39:34.686744
708	708	2026-08-03 09:39:34.781862	2026-08-03 09:39:34.781862
709	709	2026-08-03 09:39:34.856916	2026-08-03 09:39:34.856916
710	710	2026-08-03 09:39:34.9594	2026-08-03 09:39:34.9594
711	711	2026-08-03 09:39:35.07611	2026-08-03 09:39:35.07611
712	712	2026-08-03 09:39:35.176533	2026-08-03 09:39:35.176533
713	713	2026-08-03 09:39:35.245783	2026-08-03 09:39:35.245783
714	714	2026-08-03 09:39:35.328737	2026-08-03 09:39:35.328737
715	715	2026-08-03 09:39:35.404811	2026-08-03 09:39:35.404811
716	716	2026-08-03 09:39:35.55615	2026-08-03 09:39:35.55615
717	717	2026-08-03 09:39:35.597414	2026-08-03 09:39:35.597414
718	718	2026-08-03 09:39:35.64004	2026-08-03 09:39:35.64004
719	719	2026-08-03 09:39:35.684858	2026-08-03 09:39:35.684858
720	720	2026-08-03 09:39:35.749746	2026-08-03 09:39:35.749746
721	721	2026-08-03 09:39:35.790817	2026-08-03 09:39:35.790817
722	722	2026-08-03 09:39:35.830551	2026-08-03 09:39:35.830551
723	723	2026-08-03 09:39:35.87212	2026-08-03 09:39:35.87212
724	724	2026-08-03 09:39:35.926576	2026-08-03 09:39:35.926576
725	725	2026-08-03 09:39:35.981643	2026-08-03 09:39:35.981643
726	726	2026-08-03 09:39:36.095635	2026-08-03 09:39:36.095635
727	727	2026-08-03 09:39:36.166337	2026-08-03 09:39:36.166337
728	728	2026-08-03 09:39:36.297415	2026-08-03 09:39:36.297415
729	729	2026-08-03 09:39:36.39137	2026-08-03 09:39:36.39137
730	730	2026-08-03 09:39:36.45749	2026-08-03 09:39:36.45749
731	731	2026-08-03 09:39:36.583957	2026-08-03 09:39:36.583957
732	732	2026-08-03 09:39:36.782783	2026-08-03 09:39:36.782783
733	733	2026-08-03 09:39:36.851136	2026-08-03 09:39:36.851136
734	734	2026-08-03 09:39:36.918494	2026-08-03 09:39:36.918494
735	735	2026-08-03 09:39:37.016398	2026-08-03 09:39:37.016398
736	736	2026-08-03 09:39:37.193758	2026-08-03 09:39:37.193758
737	737	2026-08-03 09:39:37.269755	2026-08-03 09:39:37.269755
738	738	2026-08-03 09:39:37.397162	2026-08-03 09:39:37.397162
739	739	2026-08-03 09:39:37.496933	2026-08-03 09:39:37.496933
740	740	2026-08-03 09:39:37.642276	2026-08-03 09:39:37.642276
741	741	2026-08-03 09:39:37.771095	2026-08-03 09:39:37.771095
742	742	2026-08-03 09:39:37.905393	2026-08-03 09:39:37.905393
743	743	2026-08-03 09:39:37.986624	2026-08-03 09:39:37.986624
744	744	2026-08-03 09:39:38.155201	2026-08-03 09:39:38.155201
745	745	2026-08-03 09:39:38.232155	2026-08-03 09:39:38.232155
746	746	2026-08-03 09:39:38.314002	2026-08-03 09:39:38.314002
747	747	2026-08-03 09:39:38.425872	2026-08-03 09:39:38.425872
748	748	2026-08-03 09:39:38.557367	2026-08-03 09:39:38.557367
749	749	2026-08-03 09:39:38.68882	2026-08-03 09:39:38.68882
750	750	2026-08-03 09:39:38.797837	2026-08-03 09:39:38.797837
751	751	2026-08-03 09:39:38.87737	2026-08-03 09:39:38.87737
752	752	2026-08-03 09:39:38.989526	2026-08-03 09:39:38.989526
753	753	2026-08-03 09:39:39.062965	2026-08-03 09:39:39.062965
754	754	2026-08-03 09:39:39.19621	2026-08-03 09:39:39.19621
755	755	2026-08-03 09:39:39.275922	2026-08-03 09:39:39.275922
756	756	2026-08-03 09:39:39.39811	2026-08-03 09:39:39.39811
757	757	2026-08-03 09:39:39.482703	2026-08-03 09:39:39.482703
758	758	2026-08-03 09:39:39.527714	2026-08-03 09:39:39.527714
759	759	2026-08-03 09:39:39.569745	2026-08-03 09:39:39.569745
760	760	2026-08-03 09:39:39.634596	2026-08-03 09:39:39.634596
761	761	2026-08-03 09:39:39.691447	2026-08-03 09:39:39.691447
762	762	2026-08-03 09:39:39.735724	2026-08-03 09:39:39.735724
763	763	2026-08-03 09:39:39.795529	2026-08-03 09:39:39.795529
764	764	2026-08-03 09:39:39.881598	2026-08-03 09:39:39.881598
765	765	2026-08-03 09:44:37.670829	2026-08-03 09:44:37.670829
766	766	2026-08-03 09:44:37.787334	2026-08-03 09:44:37.787334
767	767	2026-08-03 09:44:37.858785	2026-08-03 09:44:37.858785
768	768	2026-08-03 09:44:37.981052	2026-08-03 09:44:37.981052
769	769	2026-08-03 09:44:38.055376	2026-08-03 09:44:38.055376
770	770	2026-08-03 09:44:38.169436	2026-08-03 09:44:38.169436
771	771	2026-08-03 09:44:38.329996	2026-08-03 09:44:38.329996
772	772	2026-08-03 09:44:38.412859	2026-08-03 09:44:38.412859
773	773	2026-08-03 09:44:38.476324	2026-08-03 09:44:38.476324
774	774	2026-08-03 09:44:38.566035	2026-08-03 09:44:38.566035
775	775	2026-08-03 09:44:38.637006	2026-08-03 09:44:38.637006
776	776	2026-08-03 09:44:38.733453	2026-08-03 09:44:38.733453
777	777	2026-08-03 09:44:38.857365	2026-08-03 09:44:38.857365
778	778	2026-08-03 09:44:38.895501	2026-08-03 09:44:38.895501
779	779	2026-08-03 09:44:38.933044	2026-08-03 09:44:38.933044
780	780	2026-08-03 09:44:38.986187	2026-08-03 09:44:38.986187
781	781	2026-08-03 09:44:39.020202	2026-08-03 09:44:39.020202
782	782	2026-08-03 09:44:39.057453	2026-08-03 09:44:39.057453
783	783	2026-08-03 09:44:39.116242	2026-08-03 09:44:39.116242
784	784	2026-08-03 09:44:39.163592	2026-08-03 09:44:39.163592
785	785	2026-08-03 09:44:42.742359	2026-08-03 09:44:42.742359
786	786	2026-08-03 09:44:42.802984	2026-08-03 09:44:42.802984
787	787	2026-08-03 09:44:42.860387	2026-08-03 09:44:42.860387
788	788	2026-08-03 09:44:42.931568	2026-08-03 09:44:42.931568
789	789	2026-08-03 09:44:42.970329	2026-08-03 09:44:42.970329
790	790	2026-08-03 09:44:43.064846	2026-08-03 09:44:43.064846
791	791	2026-08-03 09:44:43.216597	2026-08-03 09:44:43.216597
792	792	2026-08-03 09:44:43.309266	2026-08-03 09:44:43.309266
793	793	2026-08-03 09:44:43.436583	2026-08-03 09:44:43.436583
794	794	2026-08-03 09:44:43.511622	2026-08-03 09:44:43.511622
795	795	2026-08-03 09:44:43.632934	2026-08-03 09:44:43.632934
796	796	2026-08-03 09:44:43.702781	2026-08-03 09:44:43.702781
797	797	2026-08-03 09:44:43.801536	2026-08-03 09:44:43.801536
798	798	2026-08-03 09:44:43.930513	2026-08-03 09:44:43.930513
799	799	2026-08-03 09:44:44.047954	2026-08-03 09:44:44.047954
800	800	2026-08-03 09:44:44.11728	2026-08-03 09:44:44.11728
801	801	2026-08-03 09:44:44.252541	2026-08-03 09:44:44.252541
802	802	2026-08-03 09:44:44.325798	2026-08-03 09:44:44.325798
803	803	2026-08-03 09:44:44.41879	2026-08-03 09:44:44.41879
804	804	2026-08-03 09:44:44.486932	2026-08-03 09:44:44.486932
805	805	2026-08-03 09:44:44.566873	2026-08-03 09:44:44.566873
806	806	2026-08-03 09:44:44.66813	2026-08-03 09:44:44.66813
807	807	2026-08-03 09:44:44.756061	2026-08-03 09:44:44.756061
808	808	2026-08-03 09:44:44.823909	2026-08-03 09:44:44.823909
809	809	2026-08-03 09:44:44.901001	2026-08-03 09:44:44.901001
810	810	2026-08-03 09:44:45.029113	2026-08-03 09:44:45.029113
811	811	2026-08-03 09:44:45.218184	2026-08-03 09:44:45.218184
812	812	2026-08-03 09:44:45.341138	2026-08-03 09:44:45.341138
813	813	2026-08-03 09:44:45.468895	2026-08-03 09:44:45.468895
814	814	2026-08-03 09:44:45.551751	2026-08-03 09:44:45.551751
815	815	2026-08-03 09:44:45.769141	2026-08-03 09:44:45.769141
816	816	2026-08-03 09:44:45.827143	2026-08-03 09:44:45.827143
817	817	2026-08-03 09:44:45.868774	2026-08-03 09:44:45.868774
818	818	2026-08-03 09:44:45.91147	2026-08-03 09:44:45.91147
819	819	2026-08-03 09:44:45.9795	2026-08-03 09:44:45.9795
820	820	2026-08-03 09:44:46.018746	2026-08-03 09:44:46.018746
821	821	2026-08-03 09:44:46.059248	2026-08-03 09:44:46.059248
822	822	2026-08-03 09:44:46.099225	2026-08-03 09:44:46.099225
823	823	2026-08-03 09:44:46.148869	2026-08-03 09:44:46.148869
824	824	2026-08-03 09:44:46.193655	2026-08-03 09:44:46.193655
825	825	2026-08-03 09:44:46.250902	2026-08-03 09:44:46.250902
826	826	2026-08-03 09:44:46.313814	2026-08-03 09:44:46.313814
827	827	2026-08-03 09:44:46.44387	2026-08-03 09:44:46.44387
828	828	2026-08-03 09:44:46.494188	2026-08-03 09:44:46.494188
829	829	2026-08-03 09:44:46.544368	2026-08-03 09:44:46.544368
830	830	2026-08-03 09:44:46.680488	2026-08-03 09:44:46.680488
831	831	2026-08-03 09:44:46.817822	2026-08-03 09:44:46.817822
832	832	2026-08-03 09:44:46.888394	2026-08-03 09:44:46.888394
833	833	2026-08-03 09:44:46.962124	2026-08-03 09:44:46.962124
834	834	2026-08-03 09:44:47.038906	2026-08-03 09:44:47.038906
835	835	2026-08-03 09:44:47.201672	2026-08-03 09:44:47.201672
836	836	2026-08-03 09:44:47.291344	2026-08-03 09:44:47.291344
837	837	2026-08-03 09:44:47.370643	2026-08-03 09:44:47.370643
838	838	2026-08-03 09:44:47.449527	2026-08-03 09:44:47.449527
839	839	2026-08-03 09:44:47.571616	2026-08-03 09:44:47.571616
840	840	2026-08-03 09:44:47.717601	2026-08-03 09:44:47.717601
841	841	2026-08-03 09:44:47.796658	2026-08-03 09:44:47.796658
842	842	2026-08-03 09:44:47.922199	2026-08-03 09:44:47.922199
843	843	2026-08-03 09:44:48.055534	2026-08-03 09:44:48.055534
844	844	2026-08-03 09:44:48.13265	2026-08-03 09:44:48.13265
845	845	2026-08-03 09:44:48.213173	2026-08-03 09:44:48.213173
846	846	2026-08-03 09:44:48.31868	2026-08-03 09:44:48.31868
847	847	2026-08-03 09:44:48.467027	2026-08-03 09:44:48.467027
848	848	2026-08-03 09:44:48.584579	2026-08-03 09:44:48.584579
849	849	2026-08-03 09:44:48.833929	2026-08-03 09:44:48.833929
850	850	2026-08-03 09:44:49.018535	2026-08-03 09:44:49.018535
851	851	2026-08-03 09:44:49.202153	2026-08-03 09:44:49.202153
852	852	2026-08-03 09:44:49.291933	2026-08-03 09:44:49.291933
853	853	2026-08-03 09:44:49.513708	2026-08-03 09:44:49.513708
854	854	2026-08-03 09:44:49.657953	2026-08-03 09:44:49.657953
855	855	2026-08-03 09:44:49.906654	2026-08-03 09:44:49.906654
856	856	2026-08-03 09:44:50.079061	2026-08-03 09:44:50.079061
857	857	2026-08-03 09:44:50.175484	2026-08-03 09:44:50.175484
858	858	2026-08-03 09:44:50.239038	2026-08-03 09:44:50.239038
859	859	2026-08-03 09:44:50.361257	2026-08-03 09:44:50.361257
860	860	2026-08-03 09:44:50.474218	2026-08-03 09:44:50.474218
861	861	2026-08-03 09:44:50.575451	2026-08-03 09:44:50.575451
862	862	2026-08-03 09:44:50.665233	2026-08-03 09:44:50.665233
863	863	2026-08-03 09:44:50.89109	2026-08-03 09:44:50.89109
864	864	2026-08-03 09:58:44.197058	2026-08-03 09:58:44.197058
865	865	2026-08-03 09:58:44.294802	2026-08-03 09:58:44.294802
866	866	2026-08-03 09:58:44.37199	2026-08-03 09:58:44.37199
867	867	2026-08-03 09:58:44.492176	2026-08-03 09:58:44.492176
868	868	2026-08-03 09:58:44.581278	2026-08-03 09:58:44.581278
869	869	2026-08-03 09:58:44.677154	2026-08-03 09:58:44.677154
870	870	2026-08-03 09:58:44.881297	2026-08-03 09:58:44.881297
871	871	2026-08-03 09:58:44.974025	2026-08-03 09:58:44.974025
872	872	2026-08-03 09:58:45.060687	2026-08-03 09:58:45.060687
873	873	2026-08-03 09:58:45.177597	2026-08-03 09:58:45.177597
874	874	2026-08-03 09:58:45.251366	2026-08-03 09:58:45.251366
875	875	2026-08-03 09:58:45.330827	2026-08-03 09:58:45.330827
876	876	2026-08-03 09:58:45.432662	2026-08-03 09:58:45.432662
877	877	2026-08-03 09:58:45.481836	2026-08-03 09:58:45.481836
878	878	2026-08-03 09:58:45.524246	2026-08-03 09:58:45.524246
879	879	2026-08-03 09:58:45.579255	2026-08-03 09:58:45.579255
880	880	2026-08-03 09:58:45.616545	2026-08-03 09:58:45.616545
881	881	2026-08-03 09:58:45.654723	2026-08-03 09:58:45.654723
882	882	2026-08-03 09:58:45.722013	2026-08-03 09:58:45.722013
883	883	2026-08-03 09:58:45.772287	2026-08-03 09:58:45.772287
884	884	2026-08-03 09:58:49.972804	2026-08-03 09:58:49.972804
885	885	2026-08-03 09:58:50.041183	2026-08-03 09:58:50.041183
886	886	2026-08-03 09:58:50.112963	2026-08-03 09:58:50.112963
887	887	2026-08-03 09:58:50.167712	2026-08-03 09:58:50.167712
888	888	2026-08-03 09:58:50.209935	2026-08-03 09:58:50.209935
889	889	2026-08-03 09:58:50.351994	2026-08-03 09:58:50.351994
890	890	2026-08-03 09:58:50.540801	2026-08-03 09:58:50.540801
891	891	2026-08-03 09:58:50.653158	2026-08-03 09:58:50.653158
892	892	2026-08-03 09:58:50.728621	2026-08-03 09:58:50.728621
893	893	2026-08-03 09:58:50.814064	2026-08-03 09:58:50.814064
894	894	2026-08-03 09:58:50.991565	2026-08-03 09:58:50.991565
895	895	2026-08-03 09:58:51.093908	2026-08-03 09:58:51.093908
896	896	2026-08-03 09:58:51.219728	2026-08-03 09:58:51.219728
897	897	2026-08-03 09:58:51.317266	2026-08-03 09:58:51.317266
898	898	2026-08-03 09:58:51.530316	2026-08-03 09:58:51.530316
899	899	2026-08-03 09:58:51.628672	2026-08-03 09:58:51.628672
900	900	2026-08-03 09:58:51.772406	2026-08-03 09:58:51.772406
901	901	2026-08-03 09:58:51.858267	2026-08-03 09:58:51.858267
902	902	2026-08-03 09:58:52.00577	2026-08-03 09:58:52.00577
903	903	2026-08-03 09:58:52.098398	2026-08-03 09:58:52.098398
904	904	2026-08-03 09:58:52.18319	2026-08-03 09:58:52.18319
905	905	2026-08-03 09:58:52.403498	2026-08-03 09:58:52.403498
906	906	2026-08-03 09:58:52.577249	2026-08-03 09:58:52.577249
907	907	2026-08-03 09:58:52.700567	2026-08-03 09:58:52.700567
908	908	2026-08-03 09:58:52.812089	2026-08-03 09:58:52.812089
909	909	2026-08-03 09:58:52.941872	2026-08-03 09:58:52.941872
910	910	2026-08-03 09:58:53.055914	2026-08-03 09:58:53.055914
911	911	2026-08-03 09:58:53.131523	2026-08-03 09:58:53.131523
912	912	2026-08-03 09:58:53.208708	2026-08-03 09:58:53.208708
913	913	2026-08-03 09:58:53.312817	2026-08-03 09:58:53.312817
914	914	2026-08-03 09:58:53.477036	2026-08-03 09:58:53.477036
915	915	2026-08-03 09:58:53.576258	2026-08-03 09:58:53.576258
916	916	2026-08-03 09:58:53.651671	2026-08-03 09:58:53.651671
917	917	2026-08-03 09:58:53.697978	2026-08-03 09:58:53.697978
918	918	2026-08-03 09:58:53.822859	2026-08-03 09:58:53.822859
919	919	2026-08-03 09:58:53.886417	2026-08-03 09:58:53.886417
920	920	2026-08-03 09:58:53.932558	2026-08-03 09:58:53.932558
921	921	2026-08-03 09:58:53.974014	2026-08-03 09:58:53.974014
922	922	2026-08-03 09:58:54.025559	2026-08-03 09:58:54.025559
923	923	2026-08-03 09:58:54.072785	2026-08-03 09:58:54.072785
924	924	2026-08-03 09:58:54.153669	2026-08-03 09:58:54.153669
925	925	2026-08-03 09:58:54.213566	2026-08-03 09:58:54.213566
926	926	2026-08-03 09:58:54.357247	2026-08-03 09:58:54.357247
927	927	2026-08-03 09:58:54.448682	2026-08-03 09:58:54.448682
928	928	2026-08-03 09:58:54.522422	2026-08-03 09:58:54.522422
929	929	2026-08-03 09:58:54.693283	2026-08-03 09:58:54.693283
930	930	2026-08-03 09:58:54.804647	2026-08-03 09:58:54.804647
931	931	2026-08-03 09:58:54.917381	2026-08-03 09:58:54.917381
932	932	2026-08-03 09:58:55.058043	2026-08-03 09:58:55.058043
933	933	2026-08-03 09:58:55.15873	2026-08-03 09:58:55.15873
934	934	2026-08-03 09:58:55.302896	2026-08-03 09:58:55.302896
935	935	2026-08-03 09:58:55.409542	2026-08-03 09:58:55.409542
936	936	2026-08-03 09:58:55.503236	2026-08-03 09:58:55.503236
937	937	2026-08-03 09:58:55.592327	2026-08-03 09:58:55.592327
938	938	2026-08-03 09:58:55.73694	2026-08-03 09:58:55.73694
939	939	2026-08-03 09:58:55.828936	2026-08-03 09:58:55.828936
940	940	2026-08-03 09:58:55.912868	2026-08-03 09:58:55.912868
941	941	2026-08-03 09:58:56.013874	2026-08-03 09:58:56.013874
942	942	2026-08-03 09:58:56.209245	2026-08-03 09:58:56.209245
943	943	2026-08-03 09:58:56.310988	2026-08-03 09:58:56.310988
944	944	2026-08-03 09:58:56.41769	2026-08-03 09:58:56.41769
945	945	2026-08-03 09:58:56.50928	2026-08-03 09:58:56.50928
946	946	2026-08-03 09:58:56.672037	2026-08-03 09:58:56.672037
947	947	2026-08-03 09:58:56.756729	2026-08-03 09:58:56.756729
948	948	2026-08-03 09:58:56.906253	2026-08-03 09:58:56.906253
949	949	2026-08-03 09:58:57.027219	2026-08-03 09:58:57.027219
950	950	2026-08-03 09:58:57.227149	2026-08-03 09:58:57.227149
951	951	2026-08-03 09:58:57.445834	2026-08-03 09:58:57.445834
952	952	2026-08-03 09:58:57.781103	2026-08-03 09:58:57.781103
953	953	2026-08-03 09:58:57.938735	2026-08-03 09:58:57.938735
954	954	2026-08-03 09:58:58.126636	2026-08-03 09:58:58.126636
955	955	2026-08-03 09:58:58.22205	2026-08-03 09:58:58.22205
956	956	2026-08-03 09:58:58.292018	2026-08-03 09:58:58.292018
957	957	2026-08-03 09:58:58.341509	2026-08-03 09:58:58.341509
958	958	2026-08-03 09:58:58.419914	2026-08-03 09:58:58.419914
959	959	2026-08-03 09:58:58.469155	2026-08-03 09:58:58.469155
960	960	2026-08-03 09:58:58.525749	2026-08-03 09:58:58.525749
961	961	2026-08-03 09:58:58.596861	2026-08-03 09:58:58.596861
962	962	2026-08-03 09:58:58.789352	2026-08-03 09:58:58.789352
963	963	2026-08-03 10:07:43.606138	2026-08-03 10:07:43.606138
964	964	2026-08-03 10:07:43.798372	2026-08-03 10:07:43.798372
965	965	2026-08-03 10:07:43.950969	2026-08-03 10:07:43.950969
966	966	2026-08-03 10:07:44.20323	2026-08-03 10:07:44.20323
967	967	2026-08-03 10:07:44.381612	2026-08-03 10:07:44.381612
968	968	2026-08-03 10:07:44.484909	2026-08-03 10:07:44.484909
969	969	2026-08-03 10:07:44.608685	2026-08-03 10:07:44.608685
970	970	2026-08-03 10:07:44.683318	2026-08-03 10:07:44.683318
971	971	2026-08-03 10:07:44.745528	2026-08-03 10:07:44.745528
972	972	2026-08-03 10:07:44.834242	2026-08-03 10:07:44.834242
973	973	2026-08-03 10:07:44.932029	2026-08-03 10:07:44.932029
974	974	2026-08-03 10:07:45.042359	2026-08-03 10:07:45.042359
975	975	2026-08-03 10:07:45.222366	2026-08-03 10:07:45.222366
976	976	2026-08-03 10:07:45.284662	2026-08-03 10:07:45.284662
977	977	2026-08-03 10:07:45.342513	2026-08-03 10:07:45.342513
978	978	2026-08-03 10:07:45.409901	2026-08-03 10:07:45.409901
979	979	2026-08-03 10:07:45.474991	2026-08-03 10:07:45.474991
980	980	2026-08-03 10:07:45.525301	2026-08-03 10:07:45.525301
981	981	2026-08-03 10:07:45.607595	2026-08-03 10:07:45.607595
982	982	2026-08-03 10:07:45.659905	2026-08-03 10:07:45.659905
983	983	2026-08-03 10:07:49.675912	2026-08-03 10:07:49.675912
984	984	2026-08-03 10:07:49.756468	2026-08-03 10:07:49.756468
985	985	2026-08-03 10:07:49.837473	2026-08-03 10:07:49.837473
986	986	2026-08-03 10:07:49.87641	2026-08-03 10:07:49.87641
987	987	2026-08-03 10:07:49.910133	2026-08-03 10:07:49.910133
988	988	2026-08-03 10:07:50.035503	2026-08-03 10:07:50.035503
989	989	2026-08-03 10:07:50.170198	2026-08-03 10:07:50.170198
990	990	2026-08-03 10:07:50.290534	2026-08-03 10:07:50.290534
991	991	2026-08-03 10:07:50.390196	2026-08-03 10:07:50.390196
992	992	2026-08-03 10:07:50.490363	2026-08-03 10:07:50.490363
993	993	2026-08-03 10:07:50.667064	2026-08-03 10:07:50.667064
994	994	2026-08-03 10:07:50.739297	2026-08-03 10:07:50.739297
995	995	2026-08-03 10:07:50.82852	2026-08-03 10:07:50.82852
996	996	2026-08-03 10:07:50.898237	2026-08-03 10:07:50.898237
997	997	2026-08-03 10:07:51.030114	2026-08-03 10:07:51.030114
998	998	2026-08-03 10:07:51.155966	2026-08-03 10:07:51.155966
999	999	2026-08-03 10:07:51.293009	2026-08-03 10:07:51.293009
1000	1000	2026-08-03 10:07:51.413523	2026-08-03 10:07:51.413523
1001	1001	2026-08-03 10:07:51.571102	2026-08-03 10:07:51.571102
1002	1002	2026-08-03 10:07:51.655675	2026-08-03 10:07:51.655675
1003	1003	2026-08-03 10:07:51.730896	2026-08-03 10:07:51.730896
1004	1004	2026-08-03 10:07:51.832647	2026-08-03 10:07:51.832647
1005	1005	2026-08-03 10:07:51.960775	2026-08-03 10:07:51.960775
1006	1006	2026-08-03 10:07:52.051006	2026-08-03 10:07:52.051006
1007	1007	2026-08-03 10:07:52.161457	2026-08-03 10:07:52.161457
1008	1008	2026-08-03 10:07:52.314015	2026-08-03 10:07:52.314015
1009	1009	2026-08-03 10:07:52.469582	2026-08-03 10:07:52.469582
1010	1010	2026-08-03 10:07:52.56699	2026-08-03 10:07:52.56699
1011	1011	2026-08-03 10:07:52.647942	2026-08-03 10:07:52.647942
1012	1012	2026-08-03 10:07:52.712681	2026-08-03 10:07:52.712681
1013	1013	2026-08-03 10:07:52.814569	2026-08-03 10:07:52.814569
1014	1014	2026-08-03 10:07:52.861446	2026-08-03 10:07:52.861446
1015	1015	2026-08-03 10:07:52.905242	2026-08-03 10:07:52.905242
1016	1016	2026-08-03 10:07:52.974792	2026-08-03 10:07:52.974792
1017	1017	2026-08-03 10:07:53.052198	2026-08-03 10:07:53.052198
1018	1018	2026-08-03 10:07:53.116071	2026-08-03 10:07:53.116071
1019	1019	2026-08-03 10:07:53.172989	2026-08-03 10:07:53.172989
1020	1020	2026-08-03 10:07:53.220879	2026-08-03 10:07:53.220879
1021	1021	2026-08-03 10:07:53.27931	2026-08-03 10:07:53.27931
1022	1022	2026-08-03 10:07:53.329335	2026-08-03 10:07:53.329335
1023	1023	2026-08-03 10:07:53.401854	2026-08-03 10:07:53.401854
1024	1024	2026-08-03 10:07:53.519832	2026-08-03 10:07:53.519832
1025	1025	2026-08-03 10:07:53.635767	2026-08-03 10:07:53.635767
1026	1026	2026-08-03 10:07:53.705658	2026-08-03 10:07:53.705658
1027	1027	2026-08-03 10:07:53.756228	2026-08-03 10:07:53.756228
1028	1028	2026-08-03 10:07:53.851239	2026-08-03 10:07:53.851239
1029	1029	2026-08-03 10:07:54.035211	2026-08-03 10:07:54.035211
1030	1030	2026-08-03 10:07:54.172823	2026-08-03 10:07:54.172823
1031	1031	2026-08-03 10:07:54.310768	2026-08-03 10:07:54.310768
1032	1032	2026-08-03 10:07:54.410242	2026-08-03 10:07:54.410242
1033	1033	2026-08-03 10:07:54.598135	2026-08-03 10:07:54.598135
1034	1034	2026-08-03 10:07:54.693111	2026-08-03 10:07:54.693111
1035	1035	2026-08-03 10:07:54.765794	2026-08-03 10:07:54.765794
1036	1036	2026-08-03 10:07:54.838241	2026-08-03 10:07:54.838241
1037	1037	2026-08-03 10:07:55.025221	2026-08-03 10:07:55.025221
1038	1038	2026-08-03 10:07:55.146963	2026-08-03 10:07:55.146963
1039	1039	2026-08-03 10:07:55.271121	2026-08-03 10:07:55.271121
1040	1040	2026-08-03 10:07:55.372422	2026-08-03 10:07:55.372422
1041	1041	2026-08-03 10:07:55.5544	2026-08-03 10:07:55.5544
1042	1042	2026-08-03 10:07:55.653535	2026-08-03 10:07:55.653535
1043	1043	2026-08-03 10:07:55.766891	2026-08-03 10:07:55.766891
1044	1044	2026-08-03 10:07:55.865961	2026-08-03 10:07:55.865961
1045	1045	2026-08-03 10:07:56.022769	2026-08-03 10:07:56.022769
1046	1046	2026-08-03 10:07:56.194757	2026-08-03 10:07:56.194757
1047	1047	2026-08-03 10:07:56.41883	2026-08-03 10:07:56.41883
1048	1048	2026-08-03 10:07:56.52952	2026-08-03 10:07:56.52952
1049	1049	2026-08-03 10:07:56.65415	2026-08-03 10:07:56.65415
1050	1050	2026-08-03 10:07:56.731676	2026-08-03 10:07:56.731676
1051	1051	2026-08-03 10:07:56.852283	2026-08-03 10:07:56.852283
1052	1052	2026-08-03 10:07:57.019328	2026-08-03 10:07:57.019328
1053	1053	2026-08-03 10:07:57.232953	2026-08-03 10:07:57.232953
1054	1054	2026-08-03 10:07:57.37465	2026-08-03 10:07:57.37465
1055	1055	2026-08-03 10:07:57.465229	2026-08-03 10:07:57.465229
1056	1056	2026-08-03 10:07:57.556684	2026-08-03 10:07:57.556684
1057	1057	2026-08-03 10:07:57.652075	2026-08-03 10:07:57.652075
1058	1058	2026-08-03 10:07:57.732294	2026-08-03 10:07:57.732294
1059	1059	2026-08-03 10:07:57.775619	2026-08-03 10:07:57.775619
1060	1060	2026-08-03 10:07:57.834632	2026-08-03 10:07:57.834632
1061	1061	2026-08-03 10:07:57.929817	2026-08-03 10:07:57.929817
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people (id, first_name, last_name, public_name, email, email_public, gender, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, abstract, description, created_at, updated_at, user_id, note, include_in_mailings, use_gravatar) FROM stdin;
330	Olivia	Orga	Olivia Orga	orga@example.org	t	\N	\N	\N	\N	\N	Olivia Orga is a demo speaker created by demo:seed.	Longer demo biography for Olivia Orga. Works on APIs and speaks at conferences.	2026-08-03 10:07:39.781441	2026-08-03 10:07:39.781441	330	\N	t	f
1	admin	admin	admin_127	admin@example.org	t	\N	\N	\N	\N	\N	\N	\N	2026-07-30 08:01:41.474648	2026-07-30 08:01:41.671514	1	\N	f	f
331	Karlo	Koordinator	Karlo Koordinator	coordinator@example.org	t	\N	\N	\N	\N	\N	Karlo Koordinator is a demo speaker created by demo:seed.	Longer demo biography for Karlo Koordinator. Works on design and speaks at conferences.	2026-08-03 10:07:39.94424	2026-08-03 10:07:39.94424	331	\N	t	f
332	Rina	Recenzent	Rina Recenzent	reviewer@example.org	t	\N	\N	\N	\N	\N	Rina Recenzent is a demo speaker created by demo:seed.	Longer demo biography for Rina Recenzent. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:40.088174	2026-08-03 10:07:40.088174	332	\N	t	f
333	Robert	Recenzent	Robert Recenzent	reviewer2@example.org	t	\N	\N	\N	\N	\N	Robert Recenzent is a demo speaker created by demo:seed.	Longer demo biography for Robert Recenzent. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:40.231643	2026-08-03 10:07:40.231643	333	\N	t	f
334	Ana	Horvat	Ana Horvat	speaker1@example.org	t	female	\N	\N	\N	\N	Ana Horvat is a demo speaker created by demo:seed.	Longer demo biography for Ana Horvat. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:40.376263	2026-08-03 10:07:40.376263	334	\N	t	f
335	Marko	Kovac	Marko Kovac	speaker2@example.org	t	male	\N	\N	\N	\N	Marko Kovac is a demo speaker created by demo:seed.	Longer demo biography for Marko Kovac. Works on APIs and speaks at conferences.	2026-08-03 10:07:40.52232	2026-08-03 10:07:40.52232	335	\N	t	f
336	Ivana	Novak	Ivana Novak	speaker3@example.org	t	female	\N	\N	\N	\N	Ivana Novak is a demo speaker created by demo:seed.	Longer demo biography for Ivana Novak. Works on testing and speaks at conferences.	2026-08-03 10:07:40.665681	2026-08-03 10:07:40.667469	336	Needs a wheelchair accessible room.	t	f
337	Petar	Babic	Petar Babic	speaker4@example.org	t	male	\N	\N	\N	\N	Petar Babic is a demo speaker created by demo:seed.	Longer demo biography for Petar Babic. Works on APIs and speaks at conferences.	2026-08-03 10:07:40.806958	2026-08-03 10:07:40.806958	337	\N	t	f
338	Lucija	Maric	Lucija Maric	speaker5@example.org	t	female	\N	\N	\N	\N	Lucija Maric is a demo speaker created by demo:seed.	Longer demo biography for Lucija Maric. Works on design and speaks at conferences.	2026-08-03 10:07:40.948253	2026-08-03 10:07:40.948253	338	\N	t	f
339	Tomislav	Juric	Tomislav Juric	speaker6@example.org	t	male	\N	\N	\N	\N	Tomislav Juric is a demo speaker created by demo:seed.	Longer demo biography for Tomislav Juric. Works on design and speaks at conferences.	2026-08-03 10:07:41.091463	2026-08-03 10:07:41.091463	339	\N	t	f
340	Sara	Vukovic	Sara Vukovic	speaker7@example.org	t	female	\N	\N	\N	\N	Sara Vukovic is a demo speaker created by demo:seed.	Longer demo biography for Sara Vukovic. Works on testing and speaks at conferences.	2026-08-03 10:07:41.235473	2026-08-03 10:07:41.235473	340	\N	t	f
341	Filip	Knezevic	Filip Knezevic	speaker8@example.org	t	male	\N	\N	\N	\N	Filip Knezevic is a demo speaker created by demo:seed.	Longer demo biography for Filip Knezevic. Works on design and speaks at conferences.	2026-08-03 10:07:41.37806	2026-08-03 10:07:41.38105	341	Invited speaker - travel is paid by us.	t	f
342	Maja	Petrovic	Maja Petrovic	speaker9@example.org	t	female	\N	\N	\N	\N	Maja Petrovic is a demo speaker created by demo:seed.	Longer demo biography for Maja Petrovic. Works on APIs and speaks at conferences.	2026-08-03 10:07:41.526981	2026-08-03 10:07:41.526981	342	\N	t	f
343	Luka	Matic	Luka Matic	speaker10@example.org	t	male	\N	\N	\N	\N	Luka Matic is a demo speaker created by demo:seed.	Longer demo biography for Luka Matic. Works on APIs and speaks at conferences.	2026-08-03 10:07:41.668637	2026-08-03 10:07:41.668637	343	\N	t	f
344	Nina	Radic	Nina Radic	speaker11@example.org	t	female	\N	\N	\N	\N	Nina Radic is a demo speaker created by demo:seed.	Longer demo biography for Nina Radic. Works on testing and speaks at conferences.	2026-08-03 10:07:41.80878	2026-08-03 10:07:41.80878	344	\N	t	f
345	Josip	Bozic	Josip Bozic	speaker12@example.org	t	male	\N	\N	\N	\N	Josip Bozic is a demo speaker created by demo:seed.	Longer demo biography for Josip Bozic. Works on testing and speaks at conferences.	2026-08-03 10:07:41.950961	2026-08-03 10:07:41.950961	345	\N	t	f
346	Elena	Sokolova	Elena Sokolova	speaker13@example.org	t	female	\N	\N	\N	\N	Elena Sokolova is a demo speaker created by demo:seed.	Longer demo biography for Elena Sokolova. Works on APIs and speaks at conferences.	2026-08-03 10:07:42.100878	2026-08-03 10:07:42.100878	346	\N	t	f
347	Diego	Fernandez	Diego Fernandez	speaker14@example.org	t	male	\N	\N	\N	\N	Diego Fernandez is a demo speaker created by demo:seed.	Longer demo biography for Diego Fernandez. Works on testing and speaks at conferences.	2026-08-03 10:07:42.247472	2026-08-03 10:07:42.250061	347	Asked to not be scheduled before 12:00.	t	f
348	Amara	Okafor	Amara Okafor	speaker15@example.org	t	female	\N	\N	\N	\N	Amara Okafor is a demo speaker created by demo:seed.	Longer demo biography for Amara Okafor. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:42.395031	2026-08-03 10:07:42.395031	348	\N	t	f
349	Jonas	Lindqvist	Jonas Lindqvist	speaker16@example.org	t	male	\N	\N	\N	\N	Jonas Lindqvist is a demo speaker created by demo:seed.	Longer demo biography for Jonas Lindqvist. Works on APIs and speaks at conferences.	2026-08-03 10:07:42.537779	2026-08-03 10:07:42.537779	349	\N	t	f
350	Priya	Raman	Priya Raman	speaker17@example.org	t	female	\N	\N	\N	\N	Priya Raman is a demo speaker created by demo:seed.	Longer demo biography for Priya Raman. Works on APIs and speaks at conferences.	2026-08-03 10:07:42.680625	2026-08-03 10:07:42.680625	350	\N	t	f
351	Mehmet	Yilmaz	Mehmet Yilmaz	speaker18@example.org	t	male	\N	\N	\N	\N	Mehmet Yilmaz is a demo speaker created by demo:seed.	Longer demo biography for Mehmet Yilmaz. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:42.854785	2026-08-03 10:07:42.854785	351	\N	t	f
352	Clara	Dubois	Clara Dubois	speaker19@example.org	t	female	\N	\N	\N	\N	Clara Dubois is a demo speaker created by demo:seed.	Longer demo biography for Clara Dubois. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:43.00042	2026-08-03 10:07:43.00042	352	\N	t	f
353	Kenji	Tanaka	Kenji Tanaka	speaker20@example.org	t	male	\N	\N	\N	\N	Kenji Tanaka is a demo speaker created by demo:seed.	Longer demo biography for Kenji Tanaka. Works on design and speaks at conferences.	2026-08-03 10:07:43.150401	2026-08-03 10:07:43.150401	353	\N	t	f
354	Robin	Vermeer	Robin Vermeer	speaker21@example.org	t	other	\N	\N	\N	\N	Robin Vermeer is a demo speaker created by demo:seed.	Longer demo biography for Robin Vermeer. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:43.310258	2026-08-03 10:07:43.310258	354	\N	t	f
355	Sofia	Rossi	Sofia Rossi	speaker22@example.org	t	female	\N	\N	\N	\N	Sofia Rossi is a demo speaker created by demo:seed.	Longer demo biography for Sofia Rossi. Works on infrastructure and speaks at conferences.	2026-08-03 10:07:43.456136	2026-08-03 10:07:43.456136	355	\N	t	f
\.


--
-- Data for Name: person_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.person_translations (id, abstract, description, locale, person_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: phone_numbers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.phone_numbers (id, person_id, phone_type, phone_number, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: review_metrics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.review_metrics (id, name, description, conference_id, created_at, updated_at) FROM stdin;
89	Content quality	Is the topic well prepared and relevant?	40	2026-08-03 10:07:43.525653	2026-08-03 10:07:43.525653
90	Speaker experience	Has the speaker presented before?	40	2026-08-03 10:07:43.530741	2026-08-03 10:07:43.530741
91	Audience fit	Does this match our audience?	40	2026-08-03 10:07:43.536714	2026-08-03 10:07:43.536714
92	Content quality	Is the topic well prepared, correct and relevant?	42	2026-08-03 10:07:49.984479	2026-08-03 10:07:49.984479
93	Speaker experience	Has the speaker presented before, and how well?	42	2026-08-03 10:07:49.988079	2026-08-03 10:07:49.988079
94	Audience fit	Does this match the audience we expect?	42	2026-08-03 10:07:49.991005	2026-08-03 10:07:49.991005
95	Originality	Have we (or another conference) seen this talk already?	42	2026-08-03 10:07:49.994115	2026-08-03 10:07:49.994115
\.


--
-- Data for Name: review_scores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.review_scores (id, event_rating_id, review_metric_id, score, created_at, updated_at) FROM stdin;
7670	2410	92	2	2026-08-03 10:07:58.029545	2026-08-03 10:07:58.029545
7671	2410	93	3	2026-08-03 10:07:58.09428	2026-08-03 10:07:58.09428
7672	2410	94	4	2026-08-03 10:07:58.130215	2026-08-03 10:07:58.130215
7673	2410	95	5	2026-08-03 10:07:58.165858	2026-08-03 10:07:58.165858
7674	2411	92	3	2026-08-03 10:07:58.21295	2026-08-03 10:07:58.21295
7675	2411	93	4	2026-08-03 10:07:58.256254	2026-08-03 10:07:58.256254
7676	2411	94	5	2026-08-03 10:07:58.301052	2026-08-03 10:07:58.301052
7677	2411	95	1	2026-08-03 10:07:58.335708	2026-08-03 10:07:58.335708
7678	2412	92	4	2026-08-03 10:07:58.378022	2026-08-03 10:07:58.378022
7679	2412	93	5	2026-08-03 10:07:58.413465	2026-08-03 10:07:58.413465
7680	2412	94	1	2026-08-03 10:07:58.449262	2026-08-03 10:07:58.449262
7681	2412	95	2	2026-08-03 10:07:58.494849	2026-08-03 10:07:58.494849
7682	2413	92	2	2026-08-03 10:07:58.606048	2026-08-03 10:07:58.606048
7683	2413	93	3	2026-08-03 10:07:58.642646	2026-08-03 10:07:58.642646
7684	2413	94	4	2026-08-03 10:07:58.667503	2026-08-03 10:07:58.667503
7685	2413	95	5	2026-08-03 10:07:58.706351	2026-08-03 10:07:58.706351
7686	2414	92	3	2026-08-03 10:07:58.755943	2026-08-03 10:07:58.755943
7687	2414	93	4	2026-08-03 10:07:58.797214	2026-08-03 10:07:58.797214
7688	2414	94	5	2026-08-03 10:07:58.829948	2026-08-03 10:07:58.829948
7689	2414	95	1	2026-08-03 10:07:58.881105	2026-08-03 10:07:58.881105
7690	2415	92	4	2026-08-03 10:07:58.933847	2026-08-03 10:07:58.933847
7691	2415	93	5	2026-08-03 10:07:58.9637	2026-08-03 10:07:58.9637
7692	2415	94	1	2026-08-03 10:07:58.991362	2026-08-03 10:07:58.991362
7693	2415	95	2	2026-08-03 10:07:59.021758	2026-08-03 10:07:59.021758
7694	2416	92	3	2026-08-03 10:07:59.089811	2026-08-03 10:07:59.089811
7695	2416	93	4	2026-08-03 10:07:59.131626	2026-08-03 10:07:59.131626
7696	2416	94	5	2026-08-03 10:07:59.167864	2026-08-03 10:07:59.167864
7697	2416	95	1	2026-08-03 10:07:59.211213	2026-08-03 10:07:59.211213
7698	2417	92	4	2026-08-03 10:07:59.250576	2026-08-03 10:07:59.250576
7699	2417	93	5	2026-08-03 10:07:59.280862	2026-08-03 10:07:59.280862
7700	2417	94	1	2026-08-03 10:07:59.311548	2026-08-03 10:07:59.311548
7701	2417	95	2	2026-08-03 10:07:59.341023	2026-08-03 10:07:59.341023
7702	2418	92	1	2026-08-03 10:07:59.380254	2026-08-03 10:07:59.380254
7703	2418	93	2	2026-08-03 10:07:59.409423	2026-08-03 10:07:59.409423
7704	2418	94	3	2026-08-03 10:07:59.440398	2026-08-03 10:07:59.440398
7705	2418	95	4	2026-08-03 10:07:59.467915	2026-08-03 10:07:59.467915
7706	2419	92	4	2026-08-03 10:07:59.553061	2026-08-03 10:07:59.553061
7707	2419	93	5	2026-08-03 10:07:59.604622	2026-08-03 10:07:59.604622
7708	2419	94	1	2026-08-03 10:07:59.640277	2026-08-03 10:07:59.640277
7709	2419	95	2	2026-08-03 10:07:59.659227	2026-08-03 10:07:59.659227
7710	2420	92	1	2026-08-03 10:07:59.687064	2026-08-03 10:07:59.687064
7711	2420	93	2	2026-08-03 10:07:59.712255	2026-08-03 10:07:59.712255
7712	2420	94	3	2026-08-03 10:07:59.729399	2026-08-03 10:07:59.729399
7713	2420	95	4	2026-08-03 10:07:59.74676	2026-08-03 10:07:59.74676
7714	2421	92	2	2026-08-03 10:07:59.773009	2026-08-03 10:07:59.773009
7715	2421	93	3	2026-08-03 10:07:59.792659	2026-08-03 10:07:59.792659
7716	2421	94	4	2026-08-03 10:07:59.810721	2026-08-03 10:07:59.810721
7717	2421	95	5	2026-08-03 10:07:59.829155	2026-08-03 10:07:59.829155
7718	2422	92	1	2026-08-03 10:07:59.870346	2026-08-03 10:07:59.870346
7719	2422	93	2	2026-08-03 10:07:59.901356	2026-08-03 10:07:59.901356
7720	2422	94	3	2026-08-03 10:07:59.936821	2026-08-03 10:07:59.936821
7721	2422	95	4	2026-08-03 10:07:59.983795	2026-08-03 10:07:59.983795
7722	2423	92	2	2026-08-03 10:08:00.026681	2026-08-03 10:08:00.026681
7723	2423	93	3	2026-08-03 10:08:00.059916	2026-08-03 10:08:00.059916
7724	2423	94	4	2026-08-03 10:08:00.118322	2026-08-03 10:08:00.118322
7725	2423	95	5	2026-08-03 10:08:00.161696	2026-08-03 10:08:00.161696
7726	2424	92	3	2026-08-03 10:08:00.208843	2026-08-03 10:08:00.208843
7727	2424	93	4	2026-08-03 10:08:00.244003	2026-08-03 10:08:00.244003
7728	2424	94	5	2026-08-03 10:08:00.272168	2026-08-03 10:08:00.272168
7729	2424	95	1	2026-08-03 10:08:00.300396	2026-08-03 10:08:00.300396
7730	2425	92	1	2026-08-03 10:08:00.395615	2026-08-03 10:08:00.395615
7731	2425	93	2	2026-08-03 10:08:00.44639	2026-08-03 10:08:00.44639
7732	2425	94	3	2026-08-03 10:08:00.498237	2026-08-03 10:08:00.498237
7733	2425	95	4	2026-08-03 10:08:00.526372	2026-08-03 10:08:00.526372
7734	2426	92	2	2026-08-03 10:08:00.577932	2026-08-03 10:08:00.577932
7735	2426	93	3	2026-08-03 10:08:00.613722	2026-08-03 10:08:00.613722
7736	2426	94	4	2026-08-03 10:08:00.636288	2026-08-03 10:08:00.636288
7737	2426	95	5	2026-08-03 10:08:00.656477	2026-08-03 10:08:00.656477
7738	2427	92	3	2026-08-03 10:08:00.68247	2026-08-03 10:08:00.68247
7739	2427	93	4	2026-08-03 10:08:00.702073	2026-08-03 10:08:00.702073
7740	2427	94	5	2026-08-03 10:08:00.72187	2026-08-03 10:08:00.72187
7741	2427	95	1	2026-08-03 10:08:00.741935	2026-08-03 10:08:00.741935
7742	2428	92	2	2026-08-03 10:08:00.793526	2026-08-03 10:08:00.793526
7743	2428	93	3	2026-08-03 10:08:00.820022	2026-08-03 10:08:00.820022
7744	2428	94	4	2026-08-03 10:08:00.839185	2026-08-03 10:08:00.839185
7745	2428	95	5	2026-08-03 10:08:00.859746	2026-08-03 10:08:00.859746
7746	2429	92	3	2026-08-03 10:08:00.886407	2026-08-03 10:08:00.886407
7747	2429	93	4	2026-08-03 10:08:00.915565	2026-08-03 10:08:00.915565
7748	2429	94	5	2026-08-03 10:08:00.944522	2026-08-03 10:08:00.944522
7749	2429	95	1	2026-08-03 10:08:00.97196	2026-08-03 10:08:00.97196
7750	2430	92	5	2026-08-03 10:08:01.010361	2026-08-03 10:08:01.010361
7751	2430	93	1	2026-08-03 10:08:01.041084	2026-08-03 10:08:01.041084
7752	2430	94	2	2026-08-03 10:08:01.070269	2026-08-03 10:08:01.070269
7753	2430	95	3	2026-08-03 10:08:01.100714	2026-08-03 10:08:01.100714
7754	2431	92	3	2026-08-03 10:08:01.189403	2026-08-03 10:08:01.189403
7755	2431	93	4	2026-08-03 10:08:01.263424	2026-08-03 10:08:01.263424
7756	2431	94	5	2026-08-03 10:08:01.296399	2026-08-03 10:08:01.296399
7757	2431	95	1	2026-08-03 10:08:01.327582	2026-08-03 10:08:01.327582
7758	2432	92	5	2026-08-03 10:08:01.378281	2026-08-03 10:08:01.378281
7759	2432	93	1	2026-08-03 10:08:01.40897	2026-08-03 10:08:01.40897
7760	2432	94	2	2026-08-03 10:08:01.442406	2026-08-03 10:08:01.442406
7761	2432	95	3	2026-08-03 10:08:01.471326	2026-08-03 10:08:01.471326
7762	2433	92	1	2026-08-03 10:08:01.508919	2026-08-03 10:08:01.508919
7763	2433	93	2	2026-08-03 10:08:01.541135	2026-08-03 10:08:01.541135
7764	2433	94	3	2026-08-03 10:08:01.578238	2026-08-03 10:08:01.578238
7765	2433	95	4	2026-08-03 10:08:01.608582	2026-08-03 10:08:01.608582
7766	2434	92	5	2026-08-03 10:08:01.659244	2026-08-03 10:08:01.659244
7767	2434	93	1	2026-08-03 10:08:01.684206	2026-08-03 10:08:01.684206
7768	2434	94	2	2026-08-03 10:08:01.703763	2026-08-03 10:08:01.703763
7769	2434	95	3	2026-08-03 10:08:01.725085	2026-08-03 10:08:01.725085
7770	2435	92	1	2026-08-03 10:08:01.761732	2026-08-03 10:08:01.761732
7771	2435	93	2	2026-08-03 10:08:01.782805	2026-08-03 10:08:01.782805
7772	2435	94	3	2026-08-03 10:08:01.802156	2026-08-03 10:08:01.802156
7773	2435	95	4	2026-08-03 10:08:01.82064	2026-08-03 10:08:01.82064
7774	2436	92	2	2026-08-03 10:08:01.846693	2026-08-03 10:08:01.846693
7775	2436	93	3	2026-08-03 10:08:01.873526	2026-08-03 10:08:01.873526
7776	2436	94	4	2026-08-03 10:08:01.895681	2026-08-03 10:08:01.895681
7777	2436	95	5	2026-08-03 10:08:01.925282	2026-08-03 10:08:01.925282
7778	2437	92	5	2026-08-03 10:08:01.997735	2026-08-03 10:08:01.997735
7779	2437	93	1	2026-08-03 10:08:02.03741	2026-08-03 10:08:02.03741
7780	2437	94	2	2026-08-03 10:08:02.077724	2026-08-03 10:08:02.077724
7781	2437	95	3	2026-08-03 10:08:02.113867	2026-08-03 10:08:02.113867
7782	2438	92	1	2026-08-03 10:08:02.16342	2026-08-03 10:08:02.16342
7783	2438	93	2	2026-08-03 10:08:02.190754	2026-08-03 10:08:02.190754
7784	2438	94	3	2026-08-03 10:08:02.234469	2026-08-03 10:08:02.234469
7785	2438	95	4	2026-08-03 10:08:02.29076	2026-08-03 10:08:02.29076
7786	2439	92	2	2026-08-03 10:08:02.362117	2026-08-03 10:08:02.362117
7787	2439	93	3	2026-08-03 10:08:02.41678	2026-08-03 10:08:02.41678
7788	2439	94	4	2026-08-03 10:08:02.470261	2026-08-03 10:08:02.470261
7789	2439	95	5	2026-08-03 10:08:02.511673	2026-08-03 10:08:02.511673
7790	2440	92	1	2026-08-03 10:08:02.57661	2026-08-03 10:08:02.57661
7791	2440	93	2	2026-08-03 10:08:02.615151	2026-08-03 10:08:02.615151
7792	2440	94	3	2026-08-03 10:08:02.636303	2026-08-03 10:08:02.636303
7793	2440	95	4	2026-08-03 10:08:02.6574	2026-08-03 10:08:02.6574
7794	2441	92	2	2026-08-03 10:08:02.687057	2026-08-03 10:08:02.687057
7795	2441	93	3	2026-08-03 10:08:02.707461	2026-08-03 10:08:02.707461
7796	2441	94	4	2026-08-03 10:08:02.734914	2026-08-03 10:08:02.734914
7797	2441	95	5	2026-08-03 10:08:02.753108	2026-08-03 10:08:02.753108
7798	2442	92	4	2026-08-03 10:08:02.780443	2026-08-03 10:08:02.780443
7799	2442	93	5	2026-08-03 10:08:02.800015	2026-08-03 10:08:02.800015
7800	2442	94	1	2026-08-03 10:08:02.819752	2026-08-03 10:08:02.819752
7801	2442	95	2	2026-08-03 10:08:02.837401	2026-08-03 10:08:02.837401
7802	2443	92	2	2026-08-03 10:08:02.898087	2026-08-03 10:08:02.898087
7803	2443	93	3	2026-08-03 10:08:02.936219	2026-08-03 10:08:02.936219
7804	2443	94	4	2026-08-03 10:08:02.964119	2026-08-03 10:08:02.964119
7805	2443	95	5	2026-08-03 10:08:02.993192	2026-08-03 10:08:02.993192
7806	2444	92	4	2026-08-03 10:08:03.03484	2026-08-03 10:08:03.03484
7807	2444	93	5	2026-08-03 10:08:03.065819	2026-08-03 10:08:03.065819
7808	2444	94	1	2026-08-03 10:08:03.094044	2026-08-03 10:08:03.094044
7809	2444	95	2	2026-08-03 10:08:03.12987	2026-08-03 10:08:03.12987
7810	2445	92	5	2026-08-03 10:08:03.183888	2026-08-03 10:08:03.183888
7811	2445	93	1	2026-08-03 10:08:03.220634	2026-08-03 10:08:03.220634
7812	2445	94	2	2026-08-03 10:08:03.253918	2026-08-03 10:08:03.253918
7813	2445	95	3	2026-08-03 10:08:03.294698	2026-08-03 10:08:03.294698
7814	2446	92	4	2026-08-03 10:08:03.360256	2026-08-03 10:08:03.360256
7815	2446	93	5	2026-08-03 10:08:03.403831	2026-08-03 10:08:03.403831
7816	2446	94	1	2026-08-03 10:08:03.431707	2026-08-03 10:08:03.431707
7817	2446	95	2	2026-08-03 10:08:03.4664	2026-08-03 10:08:03.4664
7818	2447	92	5	2026-08-03 10:08:03.532159	2026-08-03 10:08:03.532159
7819	2447	93	1	2026-08-03 10:08:03.584505	2026-08-03 10:08:03.584505
7820	2447	94	2	2026-08-03 10:08:03.634391	2026-08-03 10:08:03.634391
7821	2447	95	3	2026-08-03 10:08:03.681733	2026-08-03 10:08:03.681733
7822	2448	92	1	2026-08-03 10:08:03.75006	2026-08-03 10:08:03.75006
7823	2448	93	2	2026-08-03 10:08:03.795645	2026-08-03 10:08:03.795645
7824	2448	94	3	2026-08-03 10:08:03.833493	2026-08-03 10:08:03.833493
7825	2448	95	4	2026-08-03 10:08:03.863188	2026-08-03 10:08:03.863188
7826	2449	92	4	2026-08-03 10:08:03.966232	2026-08-03 10:08:03.966232
7827	2449	93	5	2026-08-03 10:08:04.021992	2026-08-03 10:08:04.021992
7828	2449	94	1	2026-08-03 10:08:04.057278	2026-08-03 10:08:04.057278
7829	2449	95	2	2026-08-03 10:08:04.095154	2026-08-03 10:08:04.095154
7830	2450	92	5	2026-08-03 10:08:04.163438	2026-08-03 10:08:04.163438
7831	2450	93	1	2026-08-03 10:08:04.20218	2026-08-03 10:08:04.20218
7832	2450	94	2	2026-08-03 10:08:04.242016	2026-08-03 10:08:04.242016
7833	2450	95	3	2026-08-03 10:08:04.280486	2026-08-03 10:08:04.280486
7834	2451	92	1	2026-08-03 10:08:04.334552	2026-08-03 10:08:04.334552
7835	2451	93	2	2026-08-03 10:08:04.375564	2026-08-03 10:08:04.375564
7836	2451	94	3	2026-08-03 10:08:04.417365	2026-08-03 10:08:04.417365
7837	2451	95	4	2026-08-03 10:08:04.460559	2026-08-03 10:08:04.460559
7838	2452	92	5	2026-08-03 10:08:04.560555	2026-08-03 10:08:04.560555
7839	2452	93	1	2026-08-03 10:08:04.612234	2026-08-03 10:08:04.612234
7840	2452	94	2	2026-08-03 10:08:04.6468	2026-08-03 10:08:04.6468
7841	2452	95	3	2026-08-03 10:08:04.680986	2026-08-03 10:08:04.680986
7842	2453	92	1	2026-08-03 10:08:04.737584	2026-08-03 10:08:04.737584
7843	2453	93	2	2026-08-03 10:08:04.778478	2026-08-03 10:08:04.778478
7844	2453	94	3	2026-08-03 10:08:04.818358	2026-08-03 10:08:04.818358
7845	2453	95	4	2026-08-03 10:08:04.84068	2026-08-03 10:08:04.84068
7846	2454	92	3	2026-08-03 10:08:04.869741	2026-08-03 10:08:04.869741
7847	2454	93	4	2026-08-03 10:08:04.895664	2026-08-03 10:08:04.895664
7848	2454	94	5	2026-08-03 10:08:04.929296	2026-08-03 10:08:04.929296
7849	2454	95	1	2026-08-03 10:08:04.975755	2026-08-03 10:08:04.975755
7850	2455	92	1	2026-08-03 10:08:05.053642	2026-08-03 10:08:05.053642
7851	2455	93	2	2026-08-03 10:08:05.091056	2026-08-03 10:08:05.091056
7852	2455	94	3	2026-08-03 10:08:05.120068	2026-08-03 10:08:05.120068
7853	2455	95	4	2026-08-03 10:08:05.151763	2026-08-03 10:08:05.151763
7854	2456	92	3	2026-08-03 10:08:05.18898	2026-08-03 10:08:05.18898
7855	2456	93	4	2026-08-03 10:08:05.216205	2026-08-03 10:08:05.216205
7856	2456	94	5	2026-08-03 10:08:05.2435	2026-08-03 10:08:05.2435
7857	2456	95	1	2026-08-03 10:08:05.275728	2026-08-03 10:08:05.275728
7858	2457	92	4	2026-08-03 10:08:05.316707	2026-08-03 10:08:05.316707
7859	2457	93	5	2026-08-03 10:08:05.349732	2026-08-03 10:08:05.349732
7860	2457	94	1	2026-08-03 10:08:05.389539	2026-08-03 10:08:05.389539
7861	2457	95	2	2026-08-03 10:08:05.420147	2026-08-03 10:08:05.420147
7862	2458	92	3	2026-08-03 10:08:05.484363	2026-08-03 10:08:05.484363
7863	2458	93	4	2026-08-03 10:08:05.52663	2026-08-03 10:08:05.52663
7864	2458	94	5	2026-08-03 10:08:05.56138	2026-08-03 10:08:05.56138
7865	2458	95	1	2026-08-03 10:08:05.593179	2026-08-03 10:08:05.593179
7866	2459	92	4	2026-08-03 10:08:05.651432	2026-08-03 10:08:05.651432
7867	2459	93	5	2026-08-03 10:08:05.693772	2026-08-03 10:08:05.693772
7868	2459	94	1	2026-08-03 10:08:05.731231	2026-08-03 10:08:05.731231
7869	2459	95	2	2026-08-03 10:08:05.752276	2026-08-03 10:08:05.752276
7870	2460	92	5	2026-08-03 10:08:05.778434	2026-08-03 10:08:05.778434
7871	2460	93	1	2026-08-03 10:08:05.797889	2026-08-03 10:08:05.797889
7872	2460	94	2	2026-08-03 10:08:05.819438	2026-08-03 10:08:05.819438
7873	2460	95	3	2026-08-03 10:08:05.841202	2026-08-03 10:08:05.841202
7874	2461	92	3	2026-08-03 10:08:05.885288	2026-08-03 10:08:05.885288
7875	2461	93	4	2026-08-03 10:08:05.92267	2026-08-03 10:08:05.92267
7876	2461	94	5	2026-08-03 10:08:05.952854	2026-08-03 10:08:05.952854
7877	2461	95	1	2026-08-03 10:08:05.984073	2026-08-03 10:08:05.984073
7878	2462	92	4	2026-08-03 10:08:06.024288	2026-08-03 10:08:06.024288
7879	2462	93	5	2026-08-03 10:08:06.079103	2026-08-03 10:08:06.079103
7880	2462	94	1	2026-08-03 10:08:06.139716	2026-08-03 10:08:06.139716
7881	2462	95	2	2026-08-03 10:08:06.174733	2026-08-03 10:08:06.174733
7882	2463	92	5	2026-08-03 10:08:06.216693	2026-08-03 10:08:06.216693
7883	2463	93	1	2026-08-03 10:08:06.275225	2026-08-03 10:08:06.275225
7884	2463	94	2	2026-08-03 10:08:06.328921	2026-08-03 10:08:06.328921
7885	2463	95	3	2026-08-03 10:08:06.377251	2026-08-03 10:08:06.377251
7886	2464	92	4	2026-08-03 10:08:06.442226	2026-08-03 10:08:06.442226
7887	2464	93	5	2026-08-03 10:08:06.492822	2026-08-03 10:08:06.492822
7888	2464	94	1	2026-08-03 10:08:06.521847	2026-08-03 10:08:06.521847
7889	2464	95	2	2026-08-03 10:08:06.557741	2026-08-03 10:08:06.557741
7890	2465	92	5	2026-08-03 10:08:06.616982	2026-08-03 10:08:06.616982
7891	2465	93	1	2026-08-03 10:08:06.652592	2026-08-03 10:08:06.652592
7892	2465	94	2	2026-08-03 10:08:06.672499	2026-08-03 10:08:06.672499
7893	2465	95	3	2026-08-03 10:08:06.691678	2026-08-03 10:08:06.691678
7894	2466	92	2	2026-08-03 10:08:06.719847	2026-08-03 10:08:06.719847
7895	2466	93	3	2026-08-03 10:08:06.739816	2026-08-03 10:08:06.739816
7896	2466	94	4	2026-08-03 10:08:06.75725	2026-08-03 10:08:06.75725
7897	2466	95	5	2026-08-03 10:08:06.790439	2026-08-03 10:08:06.790439
7898	2467	92	5	2026-08-03 10:08:06.862342	2026-08-03 10:08:06.862342
7899	2467	93	1	2026-08-03 10:08:06.891068	2026-08-03 10:08:06.891068
7900	2467	94	2	2026-08-03 10:08:06.920753	2026-08-03 10:08:06.920753
7901	2467	95	3	2026-08-03 10:08:06.966947	2026-08-03 10:08:06.966947
7902	2468	92	2	2026-08-03 10:08:07.014034	2026-08-03 10:08:07.014034
7903	2468	93	3	2026-08-03 10:08:07.043875	2026-08-03 10:08:07.043875
7904	2468	94	4	2026-08-03 10:08:07.072885	2026-08-03 10:08:07.072885
7905	2468	95	5	2026-08-03 10:08:07.101404	2026-08-03 10:08:07.101404
7906	2469	92	3	2026-08-03 10:08:07.140911	2026-08-03 10:08:07.140911
7907	2469	93	4	2026-08-03 10:08:07.177988	2026-08-03 10:08:07.177988
7908	2469	94	5	2026-08-03 10:08:07.21442	2026-08-03 10:08:07.21442
7909	2469	95	1	2026-08-03 10:08:07.243759	2026-08-03 10:08:07.243759
7910	2470	92	2	2026-08-03 10:08:07.311376	2026-08-03 10:08:07.311376
7911	2470	93	3	2026-08-03 10:08:07.363328	2026-08-03 10:08:07.363328
7912	2470	94	4	2026-08-03 10:08:07.389684	2026-08-03 10:08:07.389684
7913	2470	95	5	2026-08-03 10:08:07.417188	2026-08-03 10:08:07.417188
7914	2471	92	3	2026-08-03 10:08:07.454202	2026-08-03 10:08:07.454202
7915	2471	93	4	2026-08-03 10:08:07.483402	2026-08-03 10:08:07.483402
7916	2471	94	5	2026-08-03 10:08:07.514138	2026-08-03 10:08:07.514138
7917	2471	95	1	2026-08-03 10:08:07.543542	2026-08-03 10:08:07.543542
7918	2472	92	4	2026-08-03 10:08:07.581888	2026-08-03 10:08:07.581888
7919	2472	93	5	2026-08-03 10:08:07.61397	2026-08-03 10:08:07.61397
7920	2472	94	1	2026-08-03 10:08:07.639119	2026-08-03 10:08:07.639119
7921	2472	95	2	2026-08-03 10:08:07.658175	2026-08-03 10:08:07.658175
7922	2473	92	2	2026-08-03 10:08:07.73213	2026-08-03 10:08:07.73213
7923	2473	93	3	2026-08-03 10:08:07.764538	2026-08-03 10:08:07.764538
7924	2473	94	4	2026-08-03 10:08:07.782222	2026-08-03 10:08:07.782222
7925	2473	95	5	2026-08-03 10:08:07.8012	2026-08-03 10:08:07.8012
7926	2474	92	3	2026-08-03 10:08:07.828372	2026-08-03 10:08:07.828372
7927	2474	93	4	2026-08-03 10:08:07.849702	2026-08-03 10:08:07.849702
7928	2474	94	5	2026-08-03 10:08:07.86972	2026-08-03 10:08:07.86972
7929	2474	95	1	2026-08-03 10:08:07.899493	2026-08-03 10:08:07.899493
7930	2475	92	4	2026-08-03 10:08:07.967479	2026-08-03 10:08:07.967479
7931	2475	93	5	2026-08-03 10:08:08.008539	2026-08-03 10:08:08.008539
7932	2475	94	1	2026-08-03 10:08:08.036518	2026-08-03 10:08:08.036518
7933	2475	95	2	2026-08-03 10:08:08.069331	2026-08-03 10:08:08.069331
7934	2476	92	3	2026-08-03 10:08:08.157193	2026-08-03 10:08:08.157193
7935	2476	93	4	2026-08-03 10:08:08.202133	2026-08-03 10:08:08.202133
7936	2476	94	5	2026-08-03 10:08:08.226631	2026-08-03 10:08:08.226631
7937	2476	95	1	2026-08-03 10:08:08.252775	2026-08-03 10:08:08.252775
7938	2477	92	4	2026-08-03 10:08:08.291723	2026-08-03 10:08:08.291723
7939	2477	93	5	2026-08-03 10:08:08.319109	2026-08-03 10:08:08.319109
7940	2477	94	1	2026-08-03 10:08:08.344339	2026-08-03 10:08:08.344339
7941	2477	95	2	2026-08-03 10:08:08.368629	2026-08-03 10:08:08.368629
7942	2478	92	1	2026-08-03 10:08:08.406775	2026-08-03 10:08:08.406775
7943	2478	93	2	2026-08-03 10:08:08.446342	2026-08-03 10:08:08.446342
7944	2478	94	3	2026-08-03 10:08:08.475575	2026-08-03 10:08:08.475575
7945	2478	95	4	2026-08-03 10:08:08.50626	2026-08-03 10:08:08.50626
7946	2479	92	4	2026-08-03 10:08:08.568043	2026-08-03 10:08:08.568043
7947	2479	93	5	2026-08-03 10:08:08.604658	2026-08-03 10:08:08.604658
7948	2479	94	1	2026-08-03 10:08:08.631426	2026-08-03 10:08:08.631426
7949	2479	95	2	2026-08-03 10:08:08.653102	2026-08-03 10:08:08.653102
7950	2480	92	1	2026-08-03 10:08:08.679448	2026-08-03 10:08:08.679448
7951	2480	93	2	2026-08-03 10:08:08.697988	2026-08-03 10:08:08.697988
7952	2480	94	3	2026-08-03 10:08:08.717114	2026-08-03 10:08:08.717114
7953	2480	95	4	2026-08-03 10:08:08.738055	2026-08-03 10:08:08.738055
7954	2481	92	2	2026-08-03 10:08:08.765383	2026-08-03 10:08:08.765383
7955	2481	93	3	2026-08-03 10:08:08.784624	2026-08-03 10:08:08.784624
7956	2481	94	4	2026-08-03 10:08:08.803161	2026-08-03 10:08:08.803161
7957	2481	95	5	2026-08-03 10:08:08.824331	2026-08-03 10:08:08.824331
7958	2482	92	1	2026-08-03 10:08:08.870414	2026-08-03 10:08:08.870414
7959	2482	93	2	2026-08-03 10:08:08.903123	2026-08-03 10:08:08.903123
7960	2482	94	3	2026-08-03 10:08:08.929968	2026-08-03 10:08:08.929968
7961	2482	95	4	2026-08-03 10:08:08.958451	2026-08-03 10:08:08.958451
7962	2483	92	2	2026-08-03 10:08:08.998628	2026-08-03 10:08:08.998628
7963	2483	93	3	2026-08-03 10:08:09.035353	2026-08-03 10:08:09.035353
7964	2483	94	4	2026-08-03 10:08:09.064997	2026-08-03 10:08:09.064997
7965	2483	95	5	2026-08-03 10:08:09.094472	2026-08-03 10:08:09.094472
7966	2484	92	3	2026-08-03 10:08:09.137176	2026-08-03 10:08:09.137176
7967	2484	93	4	2026-08-03 10:08:09.178099	2026-08-03 10:08:09.178099
7968	2484	94	5	2026-08-03 10:08:09.212973	2026-08-03 10:08:09.212973
7969	2484	95	1	2026-08-03 10:08:09.246261	2026-08-03 10:08:09.246261
7982	2488	92	2	2026-08-03 10:08:09.775551	2026-08-03 10:08:09.775551
7983	2488	93	3	2026-08-03 10:08:09.808473	2026-08-03 10:08:09.808473
7984	2488	94	4	2026-08-03 10:08:09.829001	2026-08-03 10:08:09.829001
7985	2488	95	5	2026-08-03 10:08:09.851784	2026-08-03 10:08:09.851784
7986	2489	92	3	2026-08-03 10:08:09.881282	2026-08-03 10:08:09.881282
7987	2489	93	4	2026-08-03 10:08:09.909069	2026-08-03 10:08:09.909069
7988	2489	94	5	2026-08-03 10:08:09.93667	2026-08-03 10:08:09.93667
7989	2489	95	1	2026-08-03 10:08:09.964455	2026-08-03 10:08:09.964455
7990	2490	92	5	2026-08-03 10:08:10.003551	2026-08-03 10:08:10.003551
7991	2490	93	1	2026-08-03 10:08:10.02958	2026-08-03 10:08:10.02958
7992	2490	94	2	2026-08-03 10:08:10.058611	2026-08-03 10:08:10.058611
7993	2490	95	3	2026-08-03 10:08:10.103491	2026-08-03 10:08:10.103491
7994	2491	92	3	2026-08-03 10:08:10.204543	2026-08-03 10:08:10.204543
7995	2491	93	4	2026-08-03 10:08:10.266797	2026-08-03 10:08:10.266797
7996	2491	94	5	2026-08-03 10:08:10.295566	2026-08-03 10:08:10.295566
7997	2491	95	1	2026-08-03 10:08:10.324296	2026-08-03 10:08:10.324296
7998	2492	92	5	2026-08-03 10:08:10.362124	2026-08-03 10:08:10.362124
7999	2492	93	1	2026-08-03 10:08:10.393481	2026-08-03 10:08:10.393481
8000	2492	94	2	2026-08-03 10:08:10.423001	2026-08-03 10:08:10.423001
8001	2492	95	3	2026-08-03 10:08:10.45563	2026-08-03 10:08:10.45563
8002	2493	92	1	2026-08-03 10:08:10.495135	2026-08-03 10:08:10.495135
8003	2493	93	2	2026-08-03 10:08:10.528531	2026-08-03 10:08:10.528531
8004	2493	94	3	2026-08-03 10:08:10.558055	2026-08-03 10:08:10.558055
8005	2493	95	4	2026-08-03 10:08:10.594553	2026-08-03 10:08:10.594553
8006	2494	92	5	2026-08-03 10:08:10.651989	2026-08-03 10:08:10.651989
8007	2494	93	1	2026-08-03 10:08:10.680946	2026-08-03 10:08:10.680946
8008	2494	94	2	2026-08-03 10:08:10.70106	2026-08-03 10:08:10.70106
8009	2494	95	3	2026-08-03 10:08:10.72193	2026-08-03 10:08:10.72193
8010	2495	92	1	2026-08-03 10:08:10.75132	2026-08-03 10:08:10.75132
8011	2495	93	2	2026-08-03 10:08:10.772816	2026-08-03 10:08:10.772816
8012	2495	94	3	2026-08-03 10:08:10.793167	2026-08-03 10:08:10.793167
8013	2495	95	4	2026-08-03 10:08:10.812768	2026-08-03 10:08:10.812768
8014	2496	92	2	2026-08-03 10:08:10.841071	2026-08-03 10:08:10.841071
8015	2496	93	3	2026-08-03 10:08:10.861642	2026-08-03 10:08:10.861642
8016	2496	94	4	2026-08-03 10:08:10.881744	2026-08-03 10:08:10.881744
8017	2496	95	5	2026-08-03 10:08:10.908415	2026-08-03 10:08:10.908415
8018	2497	92	5	2026-08-03 10:08:10.971076	2026-08-03 10:08:10.971076
8019	2497	93	1	2026-08-03 10:08:11.010258	2026-08-03 10:08:11.010258
8020	2497	94	2	2026-08-03 10:08:11.037445	2026-08-03 10:08:11.037445
8021	2497	95	3	2026-08-03 10:08:11.066521	2026-08-03 10:08:11.066521
8022	2498	92	1	2026-08-03 10:08:11.117143	2026-08-03 10:08:11.117143
8023	2498	93	2	2026-08-03 10:08:11.153851	2026-08-03 10:08:11.153851
8024	2498	94	3	2026-08-03 10:08:11.184566	2026-08-03 10:08:11.184566
8025	2498	95	4	2026-08-03 10:08:11.22252	2026-08-03 10:08:11.22252
8026	2499	92	2	2026-08-03 10:08:11.263625	2026-08-03 10:08:11.263625
8027	2499	93	3	2026-08-03 10:08:11.291096	2026-08-03 10:08:11.291096
8028	2499	94	4	2026-08-03 10:08:11.320946	2026-08-03 10:08:11.320946
8029	2499	95	5	2026-08-03 10:08:11.351302	2026-08-03 10:08:11.351302
8030	2500	92	5	2026-08-03 10:08:11.41578	2026-08-03 10:08:11.41578
8031	2500	93	1	2026-08-03 10:08:11.454931	2026-08-03 10:08:11.454931
8032	2500	94	2	2026-08-03 10:08:11.481232	2026-08-03 10:08:11.481232
8033	2500	95	3	2026-08-03 10:08:11.50991	2026-08-03 10:08:11.50991
8034	2501	92	1	2026-08-03 10:08:11.549459	2026-08-03 10:08:11.549459
8035	2501	93	2	2026-08-03 10:08:11.578442	2026-08-03 10:08:11.578442
8036	2501	94	3	2026-08-03 10:08:11.604045	2026-08-03 10:08:11.604045
8037	2501	95	4	2026-08-03 10:08:11.627747	2026-08-03 10:08:11.627747
8038	2502	92	3	2026-08-03 10:08:11.658257	2026-08-03 10:08:11.658257
8039	2502	93	4	2026-08-03 10:08:11.677741	2026-08-03 10:08:11.677741
8040	2502	94	5	2026-08-03 10:08:11.697229	2026-08-03 10:08:11.697229
8041	2502	95	1	2026-08-03 10:08:11.717297	2026-08-03 10:08:11.717297
8042	2503	92	1	2026-08-03 10:08:11.771284	2026-08-03 10:08:11.771284
8043	2503	93	2	2026-08-03 10:08:11.806881	2026-08-03 10:08:11.806881
8044	2503	94	3	2026-08-03 10:08:11.827633	2026-08-03 10:08:11.827633
8045	2503	95	4	2026-08-03 10:08:11.855534	2026-08-03 10:08:11.855534
8046	2504	92	3	2026-08-03 10:08:11.885749	2026-08-03 10:08:11.885749
8047	2504	93	4	2026-08-03 10:08:11.923586	2026-08-03 10:08:11.923586
8048	2504	94	5	2026-08-03 10:08:11.962599	2026-08-03 10:08:11.962599
8049	2504	95	1	2026-08-03 10:08:11.991141	2026-08-03 10:08:11.991141
8050	2505	92	4	2026-08-03 10:08:12.028793	2026-08-03 10:08:12.028793
8051	2505	93	5	2026-08-03 10:08:12.058382	2026-08-03 10:08:12.058382
8052	2505	94	1	2026-08-03 10:08:12.087823	2026-08-03 10:08:12.087823
8053	2505	95	2	2026-08-03 10:08:12.12836	2026-08-03 10:08:12.12836
8054	2506	92	3	2026-08-03 10:08:12.206357	2026-08-03 10:08:12.206357
8055	2506	93	4	2026-08-03 10:08:12.247009	2026-08-03 10:08:12.247009
8056	2506	94	5	2026-08-03 10:08:12.276209	2026-08-03 10:08:12.276209
8057	2506	95	1	2026-08-03 10:08:12.309665	2026-08-03 10:08:12.309665
8058	2507	92	4	2026-08-03 10:08:12.350014	2026-08-03 10:08:12.350014
8059	2507	93	5	2026-08-03 10:08:12.380072	2026-08-03 10:08:12.380072
8060	2507	94	1	2026-08-03 10:08:12.413134	2026-08-03 10:08:12.413134
8061	2507	95	2	2026-08-03 10:08:12.45548	2026-08-03 10:08:12.45548
8062	2508	92	5	2026-08-03 10:08:12.492248	2026-08-03 10:08:12.492248
8063	2508	93	1	2026-08-03 10:08:12.521838	2026-08-03 10:08:12.521838
8064	2508	94	2	2026-08-03 10:08:12.549734	2026-08-03 10:08:12.549734
8065	2508	95	3	2026-08-03 10:08:12.579252	2026-08-03 10:08:12.579252
8066	2509	92	3	2026-08-03 10:08:12.642343	2026-08-03 10:08:12.642343
8067	2509	93	4	2026-08-03 10:08:12.671374	2026-08-03 10:08:12.671374
8068	2509	94	5	2026-08-03 10:08:12.691639	2026-08-03 10:08:12.691639
8069	2509	95	1	2026-08-03 10:08:12.712339	2026-08-03 10:08:12.712339
8070	2510	92	4	2026-08-03 10:08:12.740303	2026-08-03 10:08:12.740303
8071	2510	93	5	2026-08-03 10:08:12.761993	2026-08-03 10:08:12.761993
8072	2510	94	1	2026-08-03 10:08:12.782069	2026-08-03 10:08:12.782069
8073	2510	95	2	2026-08-03 10:08:12.800348	2026-08-03 10:08:12.800348
8074	2511	92	5	2026-08-03 10:08:12.826613	2026-08-03 10:08:12.826613
8075	2511	93	1	2026-08-03 10:08:12.846083	2026-08-03 10:08:12.846083
8076	2511	94	2	2026-08-03 10:08:12.866924	2026-08-03 10:08:12.866924
8077	2511	95	3	2026-08-03 10:08:12.904846	2026-08-03 10:08:12.904846
8078	2512	92	4	2026-08-03 10:08:13.0067	2026-08-03 10:08:13.0067
8079	2512	93	5	2026-08-03 10:08:13.048363	2026-08-03 10:08:13.048363
8080	2512	94	1	2026-08-03 10:08:13.083352	2026-08-03 10:08:13.083352
8081	2512	95	2	2026-08-03 10:08:13.117423	2026-08-03 10:08:13.117423
8082	2513	92	5	2026-08-03 10:08:13.162038	2026-08-03 10:08:13.162038
8083	2513	93	1	2026-08-03 10:08:13.192745	2026-08-03 10:08:13.192745
8084	2513	94	2	2026-08-03 10:08:13.222573	2026-08-03 10:08:13.222573
8085	2513	95	3	2026-08-03 10:08:13.253106	2026-08-03 10:08:13.253106
8086	2514	92	2	2026-08-03 10:08:13.320278	2026-08-03 10:08:13.320278
8087	2514	93	3	2026-08-03 10:08:13.364711	2026-08-03 10:08:13.364711
8088	2514	94	4	2026-08-03 10:08:13.395087	2026-08-03 10:08:13.395087
8089	2514	95	5	2026-08-03 10:08:13.423408	2026-08-03 10:08:13.423408
8090	2515	92	5	2026-08-03 10:08:13.505395	2026-08-03 10:08:13.505395
8091	2515	93	1	2026-08-03 10:08:13.546345	2026-08-03 10:08:13.546345
8092	2515	94	2	2026-08-03 10:08:13.57591	2026-08-03 10:08:13.57591
8093	2515	95	3	2026-08-03 10:08:13.603878	2026-08-03 10:08:13.603878
8094	2516	92	2	2026-08-03 10:08:13.637645	2026-08-03 10:08:13.637645
8095	2516	93	3	2026-08-03 10:08:13.660778	2026-08-03 10:08:13.660778
8096	2516	94	4	2026-08-03 10:08:13.698833	2026-08-03 10:08:13.698833
8097	2516	95	5	2026-08-03 10:08:13.728364	2026-08-03 10:08:13.728364
8098	2517	92	3	2026-08-03 10:08:13.758905	2026-08-03 10:08:13.758905
8099	2517	93	4	2026-08-03 10:08:13.781636	2026-08-03 10:08:13.781636
8100	2517	94	5	2026-08-03 10:08:13.801793	2026-08-03 10:08:13.801793
8101	2517	95	1	2026-08-03 10:08:13.821697	2026-08-03 10:08:13.821697
8102	2518	92	2	2026-08-03 10:08:13.887875	2026-08-03 10:08:13.887875
8103	2518	93	3	2026-08-03 10:08:13.934715	2026-08-03 10:08:13.934715
8104	2518	94	4	2026-08-03 10:08:13.962312	2026-08-03 10:08:13.962312
8105	2518	95	5	2026-08-03 10:08:14.000725	2026-08-03 10:08:14.000725
8106	2519	92	3	2026-08-03 10:08:14.044331	2026-08-03 10:08:14.044331
8107	2519	93	4	2026-08-03 10:08:14.086475	2026-08-03 10:08:14.086475
8108	2519	94	5	2026-08-03 10:08:14.123692	2026-08-03 10:08:14.123692
8109	2519	95	1	2026-08-03 10:08:14.161068	2026-08-03 10:08:14.161068
8110	2520	92	4	2026-08-03 10:08:14.200896	2026-08-03 10:08:14.200896
8111	2520	93	5	2026-08-03 10:08:14.249845	2026-08-03 10:08:14.249845
8112	2520	94	1	2026-08-03 10:08:14.278593	2026-08-03 10:08:14.278593
8113	2520	95	2	2026-08-03 10:08:14.302692	2026-08-03 10:08:14.302692
8114	2521	92	2	2026-08-03 10:08:14.367827	2026-08-03 10:08:14.367827
8115	2521	93	3	2026-08-03 10:08:14.407883	2026-08-03 10:08:14.407883
8116	2521	94	4	2026-08-03 10:08:14.437134	2026-08-03 10:08:14.437134
8117	2521	95	5	2026-08-03 10:08:14.467825	2026-08-03 10:08:14.467825
8118	2522	92	3	2026-08-03 10:08:14.505434	2026-08-03 10:08:14.505434
8119	2522	93	4	2026-08-03 10:08:14.533753	2026-08-03 10:08:14.533753
8120	2522	94	5	2026-08-03 10:08:14.562399	2026-08-03 10:08:14.562399
8121	2522	95	1	2026-08-03 10:08:14.593255	2026-08-03 10:08:14.593255
8122	2523	92	4	2026-08-03 10:08:14.638879	2026-08-03 10:08:14.638879
8123	2523	93	5	2026-08-03 10:08:14.661668	2026-08-03 10:08:14.661668
8124	2523	94	1	2026-08-03 10:08:14.688365	2026-08-03 10:08:14.688365
8125	2523	95	2	2026-08-03 10:08:14.73036	2026-08-03 10:08:14.73036
8126	2524	92	3	2026-08-03 10:08:14.822465	2026-08-03 10:08:14.822465
8127	2524	93	4	2026-08-03 10:08:14.846592	2026-08-03 10:08:14.846592
8128	2524	94	5	2026-08-03 10:08:14.864372	2026-08-03 10:08:14.864372
8129	2524	95	1	2026-08-03 10:08:14.883946	2026-08-03 10:08:14.883946
8130	2525	92	4	2026-08-03 10:08:14.922766	2026-08-03 10:08:14.922766
8131	2525	93	5	2026-08-03 10:08:14.950727	2026-08-03 10:08:14.950727
8132	2525	94	1	2026-08-03 10:08:14.978613	2026-08-03 10:08:14.978613
8133	2525	95	2	2026-08-03 10:08:15.006892	2026-08-03 10:08:15.006892
8134	2526	92	1	2026-08-03 10:08:15.049566	2026-08-03 10:08:15.049566
8135	2526	93	2	2026-08-03 10:08:15.097451	2026-08-03 10:08:15.097451
8136	2526	94	3	2026-08-03 10:08:15.155674	2026-08-03 10:08:15.155674
8137	2526	95	4	2026-08-03 10:08:15.193023	2026-08-03 10:08:15.193023
8138	2527	92	4	2026-08-03 10:08:15.260445	2026-08-03 10:08:15.260445
8139	2527	93	5	2026-08-03 10:08:15.294972	2026-08-03 10:08:15.294972
8140	2527	94	1	2026-08-03 10:08:15.325013	2026-08-03 10:08:15.325013
8141	2527	95	2	2026-08-03 10:08:15.355758	2026-08-03 10:08:15.355758
8142	2528	92	1	2026-08-03 10:08:15.394766	2026-08-03 10:08:15.394766
8143	2528	93	2	2026-08-03 10:08:15.43041	2026-08-03 10:08:15.43041
8144	2528	94	3	2026-08-03 10:08:15.473079	2026-08-03 10:08:15.473079
8145	2528	95	4	2026-08-03 10:08:15.501474	2026-08-03 10:08:15.501474
8146	2529	92	2	2026-08-03 10:08:15.551857	2026-08-03 10:08:15.551857
8147	2529	93	3	2026-08-03 10:08:15.581102	2026-08-03 10:08:15.581102
8148	2529	94	4	2026-08-03 10:08:15.614245	2026-08-03 10:08:15.614245
8149	2529	95	5	2026-08-03 10:08:15.659993	2026-08-03 10:08:15.659993
8150	2530	92	1	2026-08-03 10:08:15.73436	2026-08-03 10:08:15.73436
8151	2530	93	2	2026-08-03 10:08:15.763044	2026-08-03 10:08:15.763044
8152	2530	94	3	2026-08-03 10:08:15.784107	2026-08-03 10:08:15.784107
8153	2530	95	4	2026-08-03 10:08:15.80478	2026-08-03 10:08:15.80478
8154	2531	92	2	2026-08-03 10:08:15.857113	2026-08-03 10:08:15.857113
8155	2531	93	3	2026-08-03 10:08:15.885201	2026-08-03 10:08:15.885201
8156	2531	94	4	2026-08-03 10:08:15.91736	2026-08-03 10:08:15.91736
8157	2531	95	5	2026-08-03 10:08:15.956963	2026-08-03 10:08:15.956963
8158	2532	92	3	2026-08-03 10:08:16.002944	2026-08-03 10:08:16.002944
8159	2532	93	4	2026-08-03 10:08:16.033267	2026-08-03 10:08:16.033267
8160	2532	94	5	2026-08-03 10:08:16.063647	2026-08-03 10:08:16.063647
8161	2532	95	1	2026-08-03 10:08:16.093121	2026-08-03 10:08:16.093121
8162	2533	92	1	2026-08-03 10:08:16.184707	2026-08-03 10:08:16.184707
8163	2533	93	2	2026-08-03 10:08:16.237367	2026-08-03 10:08:16.237367
8164	2533	94	3	2026-08-03 10:08:16.26523	2026-08-03 10:08:16.26523
8165	2533	95	4	2026-08-03 10:08:16.299993	2026-08-03 10:08:16.299993
8166	2534	92	2	2026-08-03 10:08:16.338632	2026-08-03 10:08:16.338632
8167	2534	93	3	2026-08-03 10:08:16.368221	2026-08-03 10:08:16.368221
8168	2534	94	4	2026-08-03 10:08:16.397328	2026-08-03 10:08:16.397328
8169	2534	95	5	2026-08-03 10:08:16.431895	2026-08-03 10:08:16.431895
8170	2535	92	3	2026-08-03 10:08:16.493065	2026-08-03 10:08:16.493065
8171	2535	93	4	2026-08-03 10:08:16.52222	2026-08-03 10:08:16.52222
8172	2535	94	5	2026-08-03 10:08:16.549278	2026-08-03 10:08:16.549278
8173	2535	95	1	2026-08-03 10:08:16.577128	2026-08-03 10:08:16.577128
8174	2536	92	2	2026-08-03 10:08:16.633222	2026-08-03 10:08:16.633222
8175	2536	93	3	2026-08-03 10:08:16.662461	2026-08-03 10:08:16.662461
8176	2536	94	4	2026-08-03 10:08:16.685367	2026-08-03 10:08:16.685367
8177	2536	95	5	2026-08-03 10:08:16.725826	2026-08-03 10:08:16.725826
8178	2537	92	3	2026-08-03 10:08:16.757808	2026-08-03 10:08:16.757808
8179	2537	93	4	2026-08-03 10:08:16.778023	2026-08-03 10:08:16.778023
8180	2537	94	5	2026-08-03 10:08:16.796806	2026-08-03 10:08:16.796806
8181	2537	95	1	2026-08-03 10:08:16.81656	2026-08-03 10:08:16.81656
8182	2538	92	5	2026-08-03 10:08:16.846852	2026-08-03 10:08:16.846852
8183	2538	93	1	2026-08-03 10:08:16.866436	2026-08-03 10:08:16.866436
8184	2538	94	2	2026-08-03 10:08:16.888245	2026-08-03 10:08:16.888245
8185	2538	95	3	2026-08-03 10:08:16.915829	2026-08-03 10:08:16.915829
8186	2539	92	3	2026-08-03 10:08:16.985655	2026-08-03 10:08:16.985655
8187	2539	93	4	2026-08-03 10:08:17.022387	2026-08-03 10:08:17.022387
8188	2539	94	5	2026-08-03 10:08:17.05293	2026-08-03 10:08:17.05293
8189	2539	95	1	2026-08-03 10:08:17.079769	2026-08-03 10:08:17.079769
8190	2540	92	5	2026-08-03 10:08:17.117237	2026-08-03 10:08:17.117237
8191	2540	93	1	2026-08-03 10:08:17.150425	2026-08-03 10:08:17.150425
8192	2540	94	2	2026-08-03 10:08:17.186514	2026-08-03 10:08:17.186514
8193	2540	95	3	2026-08-03 10:08:17.215848	2026-08-03 10:08:17.215848
8194	2541	92	1	2026-08-03 10:08:17.25534	2026-08-03 10:08:17.25534
8195	2541	93	2	2026-08-03 10:08:17.28213	2026-08-03 10:08:17.28213
8196	2541	94	3	2026-08-03 10:08:17.310961	2026-08-03 10:08:17.310961
8197	2541	95	4	2026-08-03 10:08:17.338291	2026-08-03 10:08:17.338291
8198	2542	92	5	2026-08-03 10:08:17.40452	2026-08-03 10:08:17.40452
8199	2542	93	1	2026-08-03 10:08:17.442405	2026-08-03 10:08:17.442405
8200	2542	94	2	2026-08-03 10:08:17.471905	2026-08-03 10:08:17.471905
8201	2542	95	3	2026-08-03 10:08:17.517729	2026-08-03 10:08:17.517729
8202	2543	92	1	2026-08-03 10:08:17.559218	2026-08-03 10:08:17.559218
8203	2543	93	2	2026-08-03 10:08:17.588997	2026-08-03 10:08:17.588997
8204	2543	94	3	2026-08-03 10:08:17.617049	2026-08-03 10:08:17.617049
8205	2543	95	4	2026-08-03 10:08:17.645916	2026-08-03 10:08:17.645916
8206	2544	92	2	2026-08-03 10:08:17.673854	2026-08-03 10:08:17.673854
8207	2544	93	3	2026-08-03 10:08:17.694159	2026-08-03 10:08:17.694159
8208	2544	94	4	2026-08-03 10:08:17.716142	2026-08-03 10:08:17.716142
8209	2544	95	5	2026-08-03 10:08:17.736164	2026-08-03 10:08:17.736164
8210	2545	92	5	2026-08-03 10:08:17.783497	2026-08-03 10:08:17.783497
8211	2545	93	1	2026-08-03 10:08:17.824804	2026-08-03 10:08:17.824804
8212	2545	94	2	2026-08-03 10:08:17.862761	2026-08-03 10:08:17.862761
8213	2545	95	3	2026-08-03 10:08:17.886004	2026-08-03 10:08:17.886004
8214	2546	92	1	2026-08-03 10:08:17.920345	2026-08-03 10:08:17.920345
8215	2546	93	2	2026-08-03 10:08:17.949644	2026-08-03 10:08:17.949644
8216	2546	94	3	2026-08-03 10:08:17.978069	2026-08-03 10:08:17.978069
8217	2546	95	4	2026-08-03 10:08:18.007725	2026-08-03 10:08:18.007725
8218	2547	92	2	2026-08-03 10:08:18.060461	2026-08-03 10:08:18.060461
8219	2547	93	3	2026-08-03 10:08:18.087192	2026-08-03 10:08:18.087192
8220	2547	94	4	2026-08-03 10:08:18.12003	2026-08-03 10:08:18.12003
8221	2547	95	5	2026-08-03 10:08:18.170882	2026-08-03 10:08:18.170882
8222	2548	92	1	2026-08-03 10:08:18.238242	2026-08-03 10:08:18.238242
8223	2548	93	2	2026-08-03 10:08:18.287236	2026-08-03 10:08:18.287236
8224	2548	94	3	2026-08-03 10:08:18.33151	2026-08-03 10:08:18.33151
8225	2548	95	4	2026-08-03 10:08:18.362055	2026-08-03 10:08:18.362055
8226	2549	92	2	2026-08-03 10:08:18.408465	2026-08-03 10:08:18.408465
8227	2549	93	3	2026-08-03 10:08:18.438807	2026-08-03 10:08:18.438807
8228	2549	94	4	2026-08-03 10:08:18.473728	2026-08-03 10:08:18.473728
8229	2549	95	5	2026-08-03 10:08:18.506583	2026-08-03 10:08:18.506583
8230	2550	92	4	2026-08-03 10:08:18.548879	2026-08-03 10:08:18.548879
8231	2550	93	5	2026-08-03 10:08:18.581996	2026-08-03 10:08:18.581996
8232	2550	94	1	2026-08-03 10:08:18.612748	2026-08-03 10:08:18.612748
8233	2550	95	2	2026-08-03 10:08:18.634465	2026-08-03 10:08:18.634465
8234	2551	92	2	2026-08-03 10:08:18.679414	2026-08-03 10:08:18.679414
8235	2551	93	3	2026-08-03 10:08:18.706015	2026-08-03 10:08:18.706015
8236	2551	94	4	2026-08-03 10:08:18.725225	2026-08-03 10:08:18.725225
8237	2551	95	5	2026-08-03 10:08:18.745946	2026-08-03 10:08:18.745946
8238	2552	92	4	2026-08-03 10:08:18.771911	2026-08-03 10:08:18.771911
8239	2552	93	5	2026-08-03 10:08:18.790375	2026-08-03 10:08:18.790375
8240	2552	94	1	2026-08-03 10:08:18.81288	2026-08-03 10:08:18.81288
8241	2552	95	2	2026-08-03 10:08:18.833511	2026-08-03 10:08:18.833511
8242	2553	92	5	2026-08-03 10:08:18.860249	2026-08-03 10:08:18.860249
8243	2553	93	1	2026-08-03 10:08:18.879653	2026-08-03 10:08:18.879653
8244	2553	94	2	2026-08-03 10:08:18.906469	2026-08-03 10:08:18.906469
8245	2553	95	3	2026-08-03 10:08:18.935073	2026-08-03 10:08:18.935073
8246	2554	92	4	2026-08-03 10:08:19.000567	2026-08-03 10:08:19.000567
8247	2554	93	5	2026-08-03 10:08:19.044187	2026-08-03 10:08:19.044187
8248	2554	94	1	2026-08-03 10:08:19.075153	2026-08-03 10:08:19.075153
8249	2554	95	2	2026-08-03 10:08:19.103556	2026-08-03 10:08:19.103556
8250	2555	92	5	2026-08-03 10:08:19.144436	2026-08-03 10:08:19.144436
8251	2555	93	1	2026-08-03 10:08:19.180925	2026-08-03 10:08:19.180925
8252	2555	94	2	2026-08-03 10:08:19.211184	2026-08-03 10:08:19.211184
8253	2555	95	3	2026-08-03 10:08:19.234741	2026-08-03 10:08:19.234741
8254	2556	92	1	2026-08-03 10:08:19.270403	2026-08-03 10:08:19.270403
8255	2556	93	2	2026-08-03 10:08:19.30219	2026-08-03 10:08:19.30219
8256	2556	94	3	2026-08-03 10:08:19.330474	2026-08-03 10:08:19.330474
8257	2556	95	4	2026-08-03 10:08:19.357967	2026-08-03 10:08:19.357967
8258	2557	92	4	2026-08-03 10:08:19.426905	2026-08-03 10:08:19.426905
8259	2557	93	5	2026-08-03 10:08:19.489165	2026-08-03 10:08:19.489165
8260	2557	94	1	2026-08-03 10:08:19.544801	2026-08-03 10:08:19.544801
8261	2557	95	2	2026-08-03 10:08:19.588075	2026-08-03 10:08:19.588075
8262	2558	92	5	2026-08-03 10:08:19.624686	2026-08-03 10:08:19.624686
8263	2558	93	1	2026-08-03 10:08:19.65403	2026-08-03 10:08:19.65403
8264	2558	94	2	2026-08-03 10:08:19.672408	2026-08-03 10:08:19.672408
8265	2558	95	3	2026-08-03 10:08:19.691478	2026-08-03 10:08:19.691478
8266	2559	92	1	2026-08-03 10:08:19.71931	2026-08-03 10:08:19.71931
8267	2559	93	2	2026-08-03 10:08:19.742666	2026-08-03 10:08:19.742666
8268	2559	94	3	2026-08-03 10:08:19.78017	2026-08-03 10:08:19.78017
8269	2559	95	4	2026-08-03 10:08:19.804936	2026-08-03 10:08:19.804936
8270	2560	92	5	2026-08-03 10:08:19.851511	2026-08-03 10:08:19.851511
8271	2560	93	1	2026-08-03 10:08:19.898806	2026-08-03 10:08:19.898806
8272	2560	94	2	2026-08-03 10:08:19.930697	2026-08-03 10:08:19.930697
8273	2560	95	3	2026-08-03 10:08:19.957994	2026-08-03 10:08:19.957994
8274	2561	92	1	2026-08-03 10:08:19.994577	2026-08-03 10:08:19.994577
8275	2561	93	2	2026-08-03 10:08:20.026664	2026-08-03 10:08:20.026664
8276	2561	94	3	2026-08-03 10:08:20.065889	2026-08-03 10:08:20.065889
8277	2561	95	4	2026-08-03 10:08:20.108005	2026-08-03 10:08:20.108005
8278	2562	92	3	2026-08-03 10:08:20.152369	2026-08-03 10:08:20.152369
8279	2562	93	4	2026-08-03 10:08:20.18409	2026-08-03 10:08:20.18409
8280	2562	94	5	2026-08-03 10:08:20.224936	2026-08-03 10:08:20.224936
8281	2562	95	1	2026-08-03 10:08:20.264626	2026-08-03 10:08:20.264626
8282	2563	92	1	2026-08-03 10:08:20.328178	2026-08-03 10:08:20.328178
8283	2563	93	2	2026-08-03 10:08:20.374261	2026-08-03 10:08:20.374261
8284	2563	94	3	2026-08-03 10:08:20.403937	2026-08-03 10:08:20.403937
8285	2563	95	4	2026-08-03 10:08:20.433262	2026-08-03 10:08:20.433262
8286	2564	92	3	2026-08-03 10:08:20.476818	2026-08-03 10:08:20.476818
8287	2564	93	4	2026-08-03 10:08:20.525136	2026-08-03 10:08:20.525136
8288	2564	94	5	2026-08-03 10:08:20.552297	2026-08-03 10:08:20.552297
8289	2564	95	1	2026-08-03 10:08:20.577472	2026-08-03 10:08:20.577472
8290	2565	92	4	2026-08-03 10:08:20.615952	2026-08-03 10:08:20.615952
8291	2565	93	5	2026-08-03 10:08:20.643544	2026-08-03 10:08:20.643544
8292	2565	94	1	2026-08-03 10:08:20.663631	2026-08-03 10:08:20.663631
8293	2565	95	2	2026-08-03 10:08:20.682615	2026-08-03 10:08:20.682615
8294	2566	92	3	2026-08-03 10:08:20.7316	2026-08-03 10:08:20.7316
8295	2566	93	4	2026-08-03 10:08:20.759685	2026-08-03 10:08:20.759685
8296	2566	94	5	2026-08-03 10:08:20.781117	2026-08-03 10:08:20.781117
8297	2566	95	1	2026-08-03 10:08:20.824456	2026-08-03 10:08:20.824456
8298	2567	92	4	2026-08-03 10:08:20.880547	2026-08-03 10:08:20.880547
8299	2567	93	5	2026-08-03 10:08:20.919476	2026-08-03 10:08:20.919476
8300	2567	94	1	2026-08-03 10:08:20.953174	2026-08-03 10:08:20.953174
8301	2567	95	2	2026-08-03 10:08:20.990396	2026-08-03 10:08:20.990396
8302	2568	92	5	2026-08-03 10:08:21.034675	2026-08-03 10:08:21.034675
8303	2568	93	1	2026-08-03 10:08:21.0646	2026-08-03 10:08:21.0646
8304	2568	94	2	2026-08-03 10:08:21.097414	2026-08-03 10:08:21.097414
8305	2568	95	3	2026-08-03 10:08:21.126143	2026-08-03 10:08:21.126143
8306	2569	92	3	2026-08-03 10:08:21.196252	2026-08-03 10:08:21.196252
8307	2569	93	4	2026-08-03 10:08:21.235812	2026-08-03 10:08:21.235812
8308	2569	94	5	2026-08-03 10:08:21.267825	2026-08-03 10:08:21.267825
8309	2569	95	1	2026-08-03 10:08:21.296902	2026-08-03 10:08:21.296902
8310	2570	92	4	2026-08-03 10:08:21.335687	2026-08-03 10:08:21.335687
8311	2570	93	5	2026-08-03 10:08:21.363815	2026-08-03 10:08:21.363815
8312	2570	94	1	2026-08-03 10:08:21.391107	2026-08-03 10:08:21.391107
8313	2570	95	2	2026-08-03 10:08:21.425515	2026-08-03 10:08:21.425515
8314	2571	92	5	2026-08-03 10:08:21.473837	2026-08-03 10:08:21.473837
8315	2571	93	1	2026-08-03 10:08:21.506031	2026-08-03 10:08:21.506031
8316	2571	94	2	2026-08-03 10:08:21.534201	2026-08-03 10:08:21.534201
8317	2571	95	3	2026-08-03 10:08:21.559048	2026-08-03 10:08:21.559048
8318	2572	92	4	2026-08-03 10:08:21.64269	2026-08-03 10:08:21.64269
8319	2572	93	5	2026-08-03 10:08:21.672046	2026-08-03 10:08:21.672046
8320	2572	94	1	2026-08-03 10:08:21.691384	2026-08-03 10:08:21.691384
8321	2572	95	2	2026-08-03 10:08:21.719739	2026-08-03 10:08:21.719739
8322	2573	92	5	2026-08-03 10:08:21.748199	2026-08-03 10:08:21.748199
8323	2573	93	1	2026-08-03 10:08:21.768963	2026-08-03 10:08:21.768963
8324	2573	94	2	2026-08-03 10:08:21.789158	2026-08-03 10:08:21.789158
8325	2573	95	3	2026-08-03 10:08:21.809121	2026-08-03 10:08:21.809121
8326	2574	92	2	2026-08-03 10:08:21.837339	2026-08-03 10:08:21.837339
8327	2574	93	3	2026-08-03 10:08:21.858295	2026-08-03 10:08:21.858295
8328	2574	94	4	2026-08-03 10:08:21.878556	2026-08-03 10:08:21.878556
8329	2574	95	5	2026-08-03 10:08:21.901229	2026-08-03 10:08:21.901229
8330	2575	92	5	2026-08-03 10:08:21.966985	2026-08-03 10:08:21.966985
8331	2575	93	1	2026-08-03 10:08:22.003853	2026-08-03 10:08:22.003853
8332	2575	94	2	2026-08-03 10:08:22.031482	2026-08-03 10:08:22.031482
8333	2575	95	3	2026-08-03 10:08:22.061387	2026-08-03 10:08:22.061387
8334	2576	92	2	2026-08-03 10:08:22.09983	2026-08-03 10:08:22.09983
8335	2576	93	3	2026-08-03 10:08:22.129255	2026-08-03 10:08:22.129255
8336	2576	94	4	2026-08-03 10:08:22.164728	2026-08-03 10:08:22.164728
8337	2576	95	5	2026-08-03 10:08:22.205677	2026-08-03 10:08:22.205677
8338	2577	92	3	2026-08-03 10:08:22.244845	2026-08-03 10:08:22.244845
8339	2577	93	4	2026-08-03 10:08:22.291558	2026-08-03 10:08:22.291558
8340	2577	94	5	2026-08-03 10:08:22.325719	2026-08-03 10:08:22.325719
8341	2577	95	1	2026-08-03 10:08:22.378968	2026-08-03 10:08:22.378968
8342	2578	92	2	2026-08-03 10:08:22.489259	2026-08-03 10:08:22.489259
8343	2578	93	3	2026-08-03 10:08:22.550516	2026-08-03 10:08:22.550516
8344	2578	94	4	2026-08-03 10:08:22.576831	2026-08-03 10:08:22.576831
8345	2578	95	5	2026-08-03 10:08:22.607543	2026-08-03 10:08:22.607543
8346	2579	92	3	2026-08-03 10:08:22.640897	2026-08-03 10:08:22.640897
8347	2579	93	4	2026-08-03 10:08:22.662816	2026-08-03 10:08:22.662816
8348	2579	94	5	2026-08-03 10:08:22.682675	2026-08-03 10:08:22.682675
8349	2579	95	1	2026-08-03 10:08:22.70181	2026-08-03 10:08:22.70181
8350	2580	92	4	2026-08-03 10:08:22.729244	2026-08-03 10:08:22.729244
8351	2580	93	5	2026-08-03 10:08:22.750124	2026-08-03 10:08:22.750124
8352	2580	94	1	2026-08-03 10:08:22.770825	2026-08-03 10:08:22.770825
8353	2580	95	2	2026-08-03 10:08:22.803629	2026-08-03 10:08:22.803629
8354	2581	92	2	2026-08-03 10:08:22.887205	2026-08-03 10:08:22.887205
8355	2581	93	3	2026-08-03 10:08:22.95947	2026-08-03 10:08:22.95947
8356	2581	94	4	2026-08-03 10:08:23.005994	2026-08-03 10:08:23.005994
8357	2581	95	5	2026-08-03 10:08:23.039376	2026-08-03 10:08:23.039376
8358	2582	92	3	2026-08-03 10:08:23.080874	2026-08-03 10:08:23.080874
8359	2582	93	4	2026-08-03 10:08:23.108031	2026-08-03 10:08:23.108031
8360	2582	94	5	2026-08-03 10:08:23.145133	2026-08-03 10:08:23.145133
8361	2582	95	1	2026-08-03 10:08:23.179503	2026-08-03 10:08:23.179503
8362	2583	92	4	2026-08-03 10:08:23.217456	2026-08-03 10:08:23.217456
8363	2583	93	5	2026-08-03 10:08:23.246783	2026-08-03 10:08:23.246783
8364	2583	94	1	2026-08-03 10:08:23.27797	2026-08-03 10:08:23.27797
8365	2583	95	2	2026-08-03 10:08:23.307279	2026-08-03 10:08:23.307279
8366	2584	92	3	2026-08-03 10:08:23.38525	2026-08-03 10:08:23.38525
8367	2584	93	4	2026-08-03 10:08:23.427411	2026-08-03 10:08:23.427411
8368	2584	94	5	2026-08-03 10:08:23.453715	2026-08-03 10:08:23.453715
8369	2584	95	1	2026-08-03 10:08:23.479368	2026-08-03 10:08:23.479368
8370	2585	92	4	2026-08-03 10:08:23.517549	2026-08-03 10:08:23.517549
8371	2585	93	5	2026-08-03 10:08:23.548831	2026-08-03 10:08:23.548831
8372	2585	94	1	2026-08-03 10:08:23.587053	2026-08-03 10:08:23.587053
8373	2585	95	2	2026-08-03 10:08:23.625747	2026-08-03 10:08:23.625747
8374	2586	92	1	2026-08-03 10:08:23.656106	2026-08-03 10:08:23.656106
8375	2586	93	2	2026-08-03 10:08:23.678766	2026-08-03 10:08:23.678766
8376	2586	94	3	2026-08-03 10:08:23.716621	2026-08-03 10:08:23.716621
8377	2586	95	4	2026-08-03 10:08:23.748899	2026-08-03 10:08:23.748899
8378	2587	92	4	2026-08-03 10:08:23.793721	2026-08-03 10:08:23.793721
8379	2587	93	5	2026-08-03 10:08:23.824266	2026-08-03 10:08:23.824266
8380	2587	94	1	2026-08-03 10:08:23.845374	2026-08-03 10:08:23.845374
8381	2587	95	2	2026-08-03 10:08:23.867115	2026-08-03 10:08:23.867115
8382	2588	92	1	2026-08-03 10:08:23.894606	2026-08-03 10:08:23.894606
8383	2588	93	2	2026-08-03 10:08:23.92184	2026-08-03 10:08:23.92184
8384	2588	94	3	2026-08-03 10:08:23.951102	2026-08-03 10:08:23.951102
8385	2588	95	4	2026-08-03 10:08:23.980184	2026-08-03 10:08:23.980184
8386	2589	92	2	2026-08-03 10:08:24.03138	2026-08-03 10:08:24.03138
8387	2589	93	3	2026-08-03 10:08:24.061662	2026-08-03 10:08:24.061662
8388	2589	94	4	2026-08-03 10:08:24.10532	2026-08-03 10:08:24.10532
8389	2589	95	5	2026-08-03 10:08:24.15031	2026-08-03 10:08:24.15031
8390	2590	92	1	2026-08-03 10:08:24.220653	2026-08-03 10:08:24.220653
8391	2590	93	2	2026-08-03 10:08:24.262789	2026-08-03 10:08:24.262789
8392	2590	94	3	2026-08-03 10:08:24.294858	2026-08-03 10:08:24.294858
8393	2590	95	4	2026-08-03 10:08:24.330417	2026-08-03 10:08:24.330417
8394	2591	92	2	2026-08-03 10:08:24.387404	2026-08-03 10:08:24.387404
8395	2591	93	3	2026-08-03 10:08:24.434473	2026-08-03 10:08:24.434473
8396	2591	94	4	2026-08-03 10:08:24.473859	2026-08-03 10:08:24.473859
8397	2591	95	5	2026-08-03 10:08:24.503913	2026-08-03 10:08:24.503913
8398	2592	92	3	2026-08-03 10:08:24.572398	2026-08-03 10:08:24.572398
8399	2592	93	4	2026-08-03 10:08:24.603868	2026-08-03 10:08:24.603868
8400	2592	94	5	2026-08-03 10:08:24.626447	2026-08-03 10:08:24.626447
8401	2592	95	1	2026-08-03 10:08:24.649535	2026-08-03 10:08:24.649535
8402	2593	92	1	2026-08-03 10:08:24.694181	2026-08-03 10:08:24.694181
8403	2593	93	2	2026-08-03 10:08:24.721726	2026-08-03 10:08:24.721726
8404	2593	94	3	2026-08-03 10:08:24.740833	2026-08-03 10:08:24.740833
8405	2593	95	4	2026-08-03 10:08:24.76183	2026-08-03 10:08:24.76183
8406	2594	92	2	2026-08-03 10:08:24.78997	2026-08-03 10:08:24.78997
8407	2594	93	3	2026-08-03 10:08:24.81013	2026-08-03 10:08:24.81013
8408	2594	94	4	2026-08-03 10:08:24.831081	2026-08-03 10:08:24.831081
8409	2594	95	5	2026-08-03 10:08:24.852027	2026-08-03 10:08:24.852027
8410	2595	92	3	2026-08-03 10:08:24.880929	2026-08-03 10:08:24.880929
8411	2595	93	4	2026-08-03 10:08:24.920463	2026-08-03 10:08:24.920463
8412	2595	94	5	2026-08-03 10:08:24.965076	2026-08-03 10:08:24.965076
8413	2595	95	1	2026-08-03 10:08:25.0146	2026-08-03 10:08:25.0146
8414	2596	92	2	2026-08-03 10:08:25.093086	2026-08-03 10:08:25.093086
8415	2596	93	3	2026-08-03 10:08:25.132357	2026-08-03 10:08:25.132357
8416	2596	94	4	2026-08-03 10:08:25.167974	2026-08-03 10:08:25.167974
8417	2596	95	5	2026-08-03 10:08:25.214158	2026-08-03 10:08:25.214158
8418	2597	92	3	2026-08-03 10:08:25.252106	2026-08-03 10:08:25.252106
8419	2597	93	4	2026-08-03 10:08:25.27722	2026-08-03 10:08:25.27722
8420	2597	94	5	2026-08-03 10:08:25.302271	2026-08-03 10:08:25.302271
8421	2597	95	1	2026-08-03 10:08:25.330677	2026-08-03 10:08:25.330677
8422	2598	92	5	2026-08-03 10:08:25.370272	2026-08-03 10:08:25.370272
8423	2598	93	1	2026-08-03 10:08:25.400454	2026-08-03 10:08:25.400454
8424	2598	94	2	2026-08-03 10:08:25.43108	2026-08-03 10:08:25.43108
8425	2598	95	3	2026-08-03 10:08:25.461072	2026-08-03 10:08:25.461072
8426	2599	92	3	2026-08-03 10:08:25.522661	2026-08-03 10:08:25.522661
8427	2599	93	4	2026-08-03 10:08:25.560794	2026-08-03 10:08:25.560794
8428	2599	94	5	2026-08-03 10:08:25.587675	2026-08-03 10:08:25.587675
8429	2599	95	1	2026-08-03 10:08:25.612756	2026-08-03 10:08:25.612756
8430	2600	92	5	2026-08-03 10:08:25.643273	2026-08-03 10:08:25.643273
8431	2600	93	1	2026-08-03 10:08:25.667607	2026-08-03 10:08:25.667607
8432	2600	94	2	2026-08-03 10:08:25.68661	2026-08-03 10:08:25.68661
8433	2600	95	3	2026-08-03 10:08:25.70579	2026-08-03 10:08:25.70579
8434	2601	92	1	2026-08-03 10:08:25.730888	2026-08-03 10:08:25.730888
8435	2601	93	2	2026-08-03 10:08:25.751036	2026-08-03 10:08:25.751036
8436	2601	94	3	2026-08-03 10:08:25.778797	2026-08-03 10:08:25.778797
8437	2601	95	4	2026-08-03 10:08:25.79967	2026-08-03 10:08:25.79967
8438	2602	92	5	2026-08-03 10:08:25.851057	2026-08-03 10:08:25.851057
8439	2602	93	1	2026-08-03 10:08:25.899725	2026-08-03 10:08:25.899725
8440	2602	94	2	2026-08-03 10:08:25.944358	2026-08-03 10:08:25.944358
8441	2602	95	3	2026-08-03 10:08:25.992847	2026-08-03 10:08:25.992847
8442	2603	92	1	2026-08-03 10:08:26.050765	2026-08-03 10:08:26.050765
8443	2603	93	2	2026-08-03 10:08:26.086981	2026-08-03 10:08:26.086981
8444	2603	94	3	2026-08-03 10:08:26.127126	2026-08-03 10:08:26.127126
8445	2603	95	4	2026-08-03 10:08:26.173993	2026-08-03 10:08:26.173993
8446	2604	92	2	2026-08-03 10:08:26.220445	2026-08-03 10:08:26.220445
8447	2604	93	3	2026-08-03 10:08:26.25209	2026-08-03 10:08:26.25209
8448	2604	94	4	2026-08-03 10:08:26.282626	2026-08-03 10:08:26.282626
8449	2604	95	5	2026-08-03 10:08:26.311625	2026-08-03 10:08:26.311625
8450	2605	92	2	2026-08-03 10:08:26.394198	2026-08-03 10:08:26.394198
8451	2605	93	3	2026-08-03 10:08:26.480722	2026-08-03 10:08:26.480722
8452	2605	94	4	2026-08-03 10:08:26.54216	2026-08-03 10:08:26.54216
8453	2605	95	5	2026-08-03 10:08:26.595952	2026-08-03 10:08:26.595952
8454	2606	92	4	2026-08-03 10:08:26.639072	2026-08-03 10:08:26.639072
8455	2606	93	5	2026-08-03 10:08:26.662957	2026-08-03 10:08:26.662957
8456	2606	94	1	2026-08-03 10:08:26.683776	2026-08-03 10:08:26.683776
8457	2606	95	2	2026-08-03 10:08:26.705427	2026-08-03 10:08:26.705427
8458	2607	92	5	2026-08-03 10:08:26.732908	2026-08-03 10:08:26.732908
8459	2607	93	1	2026-08-03 10:08:26.756789	2026-08-03 10:08:26.756789
8460	2607	94	2	2026-08-03 10:08:26.783579	2026-08-03 10:08:26.783579
8461	2607	95	3	2026-08-03 10:08:26.822894	2026-08-03 10:08:26.822894
8462	2608	92	4	2026-08-03 10:08:26.874542	2026-08-03 10:08:26.874542
8463	2608	93	5	2026-08-03 10:08:26.906907	2026-08-03 10:08:26.906907
8464	2608	94	1	2026-08-03 10:08:26.950156	2026-08-03 10:08:26.950156
8465	2608	95	2	2026-08-03 10:08:26.996215	2026-08-03 10:08:26.996215
8466	2609	92	5	2026-08-03 10:08:27.041804	2026-08-03 10:08:27.041804
8467	2609	93	1	2026-08-03 10:08:27.077156	2026-08-03 10:08:27.077156
8468	2609	94	2	2026-08-03 10:08:27.10588	2026-08-03 10:08:27.10588
8469	2609	95	3	2026-08-03 10:08:27.136804	2026-08-03 10:08:27.136804
8470	2610	92	1	2026-08-03 10:08:27.183805	2026-08-03 10:08:27.183805
8471	2610	93	2	2026-08-03 10:08:27.223139	2026-08-03 10:08:27.223139
8472	2610	94	3	2026-08-03 10:08:27.255117	2026-08-03 10:08:27.255117
8473	2610	95	4	2026-08-03 10:08:27.296898	2026-08-03 10:08:27.296898
8474	2611	92	4	2026-08-03 10:08:27.383788	2026-08-03 10:08:27.383788
8475	2611	93	5	2026-08-03 10:08:27.425842	2026-08-03 10:08:27.425842
8476	2611	94	1	2026-08-03 10:08:27.45595	2026-08-03 10:08:27.45595
8477	2611	95	2	2026-08-03 10:08:27.485434	2026-08-03 10:08:27.485434
8478	2612	92	5	2026-08-03 10:08:27.52638	2026-08-03 10:08:27.52638
8479	2612	93	1	2026-08-03 10:08:27.556549	2026-08-03 10:08:27.556549
8480	2612	94	2	2026-08-03 10:08:27.585778	2026-08-03 10:08:27.585778
8481	2612	95	3	2026-08-03 10:08:27.614195	2026-08-03 10:08:27.614195
8482	2613	92	1	2026-08-03 10:08:27.641825	2026-08-03 10:08:27.641825
8483	2613	93	2	2026-08-03 10:08:27.662002	2026-08-03 10:08:27.662002
8484	2613	94	3	2026-08-03 10:08:27.681799	2026-08-03 10:08:27.681799
8485	2613	95	4	2026-08-03 10:08:27.703152	2026-08-03 10:08:27.703152
8486	2674	92	1	2026-08-03 10:08:29.293365	2026-08-03 10:08:29.293365
8487	2674	93	1	2026-08-03 10:08:29.327554	2026-08-03 10:08:29.327554
8488	2674	94	1	2026-08-03 10:08:29.35837	2026-08-03 10:08:29.35837
8489	2674	95	1	2026-08-03 10:08:29.386013	2026-08-03 10:08:29.386013
8490	2675	92	5	2026-08-03 10:08:29.427963	2026-08-03 10:08:29.427963
8491	2675	93	5	2026-08-03 10:08:29.454595	2026-08-03 10:08:29.454595
8492	2675	94	5	2026-08-03 10:08:29.481096	2026-08-03 10:08:29.481096
8493	2675	95	5	2026-08-03 10:08:29.511027	2026-08-03 10:08:29.511027
7568	2376	89	2	2026-08-03 10:07:45.738228	2026-08-03 10:07:45.738228
7569	2376	90	3	2026-08-03 10:07:45.762895	2026-08-03 10:07:45.762895
7570	2376	91	4	2026-08-03 10:07:45.788328	2026-08-03 10:07:45.788328
7571	2377	89	3	2026-08-03 10:07:45.812108	2026-08-03 10:07:45.812108
7572	2377	90	4	2026-08-03 10:07:45.832	2026-08-03 10:07:45.832
7573	2377	91	5	2026-08-03 10:07:45.85753	2026-08-03 10:07:45.85753
7574	2378	89	2	2026-08-03 10:07:45.88388	2026-08-03 10:07:45.88388
7575	2378	90	3	2026-08-03 10:07:45.914006	2026-08-03 10:07:45.914006
7576	2378	91	4	2026-08-03 10:07:45.935566	2026-08-03 10:07:45.935566
7577	2379	89	3	2026-08-03 10:07:45.967773	2026-08-03 10:07:45.967773
7578	2379	90	4	2026-08-03 10:07:45.994173	2026-08-03 10:07:45.994173
7579	2379	91	5	2026-08-03 10:07:46.019302	2026-08-03 10:07:46.019302
7580	2380	89	3	2026-08-03 10:07:46.059497	2026-08-03 10:07:46.059497
7581	2380	90	4	2026-08-03 10:07:46.101115	2026-08-03 10:07:46.101115
7582	2380	91	5	2026-08-03 10:07:46.127631	2026-08-03 10:07:46.127631
7583	2381	89	5	2026-08-03 10:07:46.167478	2026-08-03 10:07:46.167478
7584	2381	90	1	2026-08-03 10:07:46.19155	2026-08-03 10:07:46.19155
7585	2381	91	2	2026-08-03 10:07:46.221786	2026-08-03 10:07:46.221786
7586	2382	89	5	2026-08-03 10:07:46.281206	2026-08-03 10:07:46.281206
7587	2382	90	1	2026-08-03 10:07:46.331513	2026-08-03 10:07:46.331513
7588	2382	91	2	2026-08-03 10:07:46.377021	2026-08-03 10:07:46.377021
7589	2383	89	1	2026-08-03 10:07:46.436176	2026-08-03 10:07:46.436176
7590	2383	90	2	2026-08-03 10:07:46.47847	2026-08-03 10:07:46.47847
7591	2383	91	3	2026-08-03 10:07:46.500806	2026-08-03 10:07:46.500806
7592	2384	89	5	2026-08-03 10:07:46.535909	2026-08-03 10:07:46.535909
7593	2384	90	1	2026-08-03 10:07:46.568394	2026-08-03 10:07:46.568394
7594	2384	91	2	2026-08-03 10:07:46.605049	2026-08-03 10:07:46.605049
7595	2385	89	1	2026-08-03 10:07:46.639599	2026-08-03 10:07:46.639599
7596	2385	90	2	2026-08-03 10:07:46.656991	2026-08-03 10:07:46.656991
7597	2385	91	3	2026-08-03 10:07:46.690599	2026-08-03 10:07:46.690599
7598	2386	89	1	2026-08-03 10:07:46.7316	2026-08-03 10:07:46.7316
7599	2386	90	2	2026-08-03 10:07:46.754092	2026-08-03 10:07:46.754092
7600	2386	91	3	2026-08-03 10:07:46.772198	2026-08-03 10:07:46.772198
7601	2387	89	3	2026-08-03 10:07:46.799131	2026-08-03 10:07:46.799131
7602	2387	90	4	2026-08-03 10:07:46.83106	2026-08-03 10:07:46.83106
7603	2387	91	5	2026-08-03 10:07:46.855486	2026-08-03 10:07:46.855486
7604	2388	89	3	2026-08-03 10:07:46.885048	2026-08-03 10:07:46.885048
7605	2388	90	4	2026-08-03 10:07:46.919113	2026-08-03 10:07:46.919113
7606	2388	91	5	2026-08-03 10:07:46.953777	2026-08-03 10:07:46.953777
7607	2389	89	4	2026-08-03 10:07:46.988523	2026-08-03 10:07:46.988523
7608	2389	90	5	2026-08-03 10:07:47.01299	2026-08-03 10:07:47.01299
7609	2389	91	1	2026-08-03 10:07:47.038762	2026-08-03 10:07:47.038762
7610	2390	89	3	2026-08-03 10:07:47.102635	2026-08-03 10:07:47.102635
7611	2390	90	4	2026-08-03 10:07:47.138995	2026-08-03 10:07:47.138995
7612	2390	91	5	2026-08-03 10:07:47.164463	2026-08-03 10:07:47.164463
7613	2391	89	4	2026-08-03 10:07:47.211179	2026-08-03 10:07:47.211179
7614	2391	90	5	2026-08-03 10:07:47.244666	2026-08-03 10:07:47.244666
7615	2391	91	1	2026-08-03 10:07:47.287032	2026-08-03 10:07:47.287032
7616	2392	89	4	2026-08-03 10:07:47.330057	2026-08-03 10:07:47.330057
7617	2392	90	5	2026-08-03 10:07:47.359321	2026-08-03 10:07:47.359321
7618	2392	91	1	2026-08-03 10:07:47.380867	2026-08-03 10:07:47.380867
7619	2393	89	1	2026-08-03 10:07:47.414811	2026-08-03 10:07:47.414811
7620	2393	90	2	2026-08-03 10:07:47.438707	2026-08-03 10:07:47.438707
7621	2393	91	3	2026-08-03 10:07:47.466928	2026-08-03 10:07:47.466928
7622	2394	89	1	2026-08-03 10:07:47.524292	2026-08-03 10:07:47.524292
7623	2394	90	2	2026-08-03 10:07:47.563311	2026-08-03 10:07:47.563311
7624	2394	91	3	2026-08-03 10:07:47.593807	2026-08-03 10:07:47.593807
7625	2395	89	2	2026-08-03 10:07:47.626155	2026-08-03 10:07:47.626155
7626	2395	90	3	2026-08-03 10:07:47.642298	2026-08-03 10:07:47.642298
7627	2395	91	4	2026-08-03 10:07:47.65903	2026-08-03 10:07:47.65903
7628	2396	89	1	2026-08-03 10:07:47.684455	2026-08-03 10:07:47.684455
7629	2396	90	2	2026-08-03 10:07:47.706598	2026-08-03 10:07:47.706598
7630	2396	91	3	2026-08-03 10:07:47.721676	2026-08-03 10:07:47.721676
7631	2397	89	2	2026-08-03 10:07:47.742482	2026-08-03 10:07:47.742482
7632	2397	90	3	2026-08-03 10:07:47.759257	2026-08-03 10:07:47.759257
7633	2397	91	4	2026-08-03 10:07:47.774411	2026-08-03 10:07:47.774411
7634	2398	89	2	2026-08-03 10:07:47.799147	2026-08-03 10:07:47.799147
7635	2398	90	3	2026-08-03 10:07:47.823627	2026-08-03 10:07:47.823627
7636	2398	91	4	2026-08-03 10:07:47.838395	2026-08-03 10:07:47.838395
7637	2399	89	4	2026-08-03 10:07:47.859959	2026-08-03 10:07:47.859959
7638	2399	90	5	2026-08-03 10:07:47.875133	2026-08-03 10:07:47.875133
7639	2399	91	1	2026-08-03 10:07:47.890119	2026-08-03 10:07:47.890119
7640	2400	89	4	2026-08-03 10:07:47.93467	2026-08-03 10:07:47.93467
7641	2400	90	5	2026-08-03 10:07:47.967503	2026-08-03 10:07:47.967503
7642	2400	91	1	2026-08-03 10:07:48.00142	2026-08-03 10:07:48.00142
7643	2401	89	5	2026-08-03 10:07:48.040894	2026-08-03 10:07:48.040894
7644	2401	90	1	2026-08-03 10:07:48.08368	2026-08-03 10:07:48.08368
7645	2401	91	2	2026-08-03 10:07:48.111746	2026-08-03 10:07:48.111746
7646	2402	89	4	2026-08-03 10:07:48.157242	2026-08-03 10:07:48.157242
7647	2402	90	5	2026-08-03 10:07:48.195286	2026-08-03 10:07:48.195286
7648	2402	91	1	2026-08-03 10:07:48.220198	2026-08-03 10:07:48.220198
7649	2403	89	5	2026-08-03 10:07:48.257036	2026-08-03 10:07:48.257036
7650	2403	90	1	2026-08-03 10:07:48.281842	2026-08-03 10:07:48.281842
7651	2403	91	2	2026-08-03 10:07:48.313558	2026-08-03 10:07:48.313558
7652	2404	89	5	2026-08-03 10:07:48.35027	2026-08-03 10:07:48.35027
7653	2404	90	1	2026-08-03 10:07:48.379485	2026-08-03 10:07:48.379485
7654	2404	91	2	2026-08-03 10:07:48.400055	2026-08-03 10:07:48.400055
7655	2405	89	2	2026-08-03 10:07:48.430086	2026-08-03 10:07:48.430086
7656	2405	90	3	2026-08-03 10:07:48.453278	2026-08-03 10:07:48.453278
7657	2405	91	4	2026-08-03 10:07:48.475186	2026-08-03 10:07:48.475186
7658	2406	89	3	2026-08-03 10:07:48.508213	2026-08-03 10:07:48.508213
7659	2406	90	4	2026-08-03 10:07:48.535866	2026-08-03 10:07:48.535866
7660	2406	91	5	2026-08-03 10:07:48.557384	2026-08-03 10:07:48.557384
7661	2407	89	5	2026-08-03 10:07:48.58935	2026-08-03 10:07:48.58935
7662	2407	90	1	2026-08-03 10:07:48.614036	2026-08-03 10:07:48.614036
7663	2407	91	2	2026-08-03 10:07:48.633854	2026-08-03 10:07:48.633854
7664	2408	89	5	2026-08-03 10:07:48.659973	2026-08-03 10:07:48.659973
7665	2408	90	1	2026-08-03 10:07:48.682887	2026-08-03 10:07:48.682887
7666	2408	91	2	2026-08-03 10:07:48.698718	2026-08-03 10:07:48.698718
7667	2409	89	1	2026-08-03 10:07:48.719379	2026-08-03 10:07:48.719379
7668	2409	90	2	2026-08-03 10:07:48.733959	2026-08-03 10:07:48.733959
7669	2409	91	3	2026-08-03 10:07:48.7484	2026-08-03 10:07:48.7484
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rooms (id, conference_id, name, size, created_at, updated_at, rank) FROM stdin;
123	40	Main Hall	500	2026-08-03 10:07:43.483598	2026-08-03 10:07:43.483598	1
124	40	Room B	150	2026-08-03 10:07:43.486143	2026-08-03 10:07:43.486143	2
125	40	Workshop Lab	40	2026-08-03 10:07:43.488572	2026-08-03 10:07:43.488572	3
126	40	Lightning Stage	80	2026-08-03 10:07:43.491373	2026-08-03 10:07:43.491373	4
127	41	Ruby Room	60	2026-08-03 10:07:49.656828	2026-08-03 10:07:49.656828	1
128	42	Main Hall	400	2026-08-03 10:07:49.953005	2026-08-03 10:07:49.953005	1
129	42	Room B	120	2026-08-03 10:07:49.955265	2026-08-03 10:07:49.955265	2
131	42	Lightning Stage	80	2026-08-03 10:07:49.958438	2026-08-03 10:07:49.958438	4
130	42	Workshop Lab	45	2026-08-03 10:07:49.956883	2026-08-03 10:08:42.107352	3
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20260730080000
20110125170413
20110125184213
20110128102448
20110128102959
20110128103044
20110128103441
20110128103551
20110128105450
20110128110128
20110128110821
20110128111944
20110128112912
20110302155320
20110304160010
20110310112726
20110315180937
20110321165509
20110322145105
20110325092540
20110327150649
20110408124552
20110510145153
20110511103813
20110513143301
20110513235042
20110526154037
20110603142013
20110603145005
20110611152237
20110615122659
20110615125223
20110706125013
20110805144819
20110914152636
20110920134303
20110920134304
20110920134342
20110930110209
20111217191420
20111217191457
20111222141647
20120117220807
20120328113456
20120420142658
20120425121612
20120503220948
20120523124125
20120523130743
20120722170102
20120804002727
20120804004336
20120804201907
20120804220617
20120806161457
20120920213816
20121027095651
20121118034920
20130323201244
20130415214732
20130522224159
20130525102656
20130615150810
20130726231929
20130727143350
20130727152400
20130809213538
20130811103746
20130921004845
20130921005732
20131013145045
20131013164530
20140322185641
20140322190529
20140322223731
20140329001424
20150504151913
20150504163534
20150505140202
20150507211302
20150618195753
20150618200026
20150815143628
20150815181454
20150817065210
20150913094318
20150913094717
20150920130550
20160219211735
20160221162627
20160908211732
20160918205752
20160919021700
20160923195521
20161224142836
20161227232916
20170319220737
20170323053712
20170327061339
20170327061701
20170528105033
20170811224245
20170811230712
20171015210428
20171022184419
20171110140104
20180213195422
20180219153146
20181230031926
20181230033823
20190811121538
20190829134733
20191001233800
20191002000000
20191004000001
20191004000002
20191004000003
20191004071111
20191116151919
20200918000000
20201114165533
20211024131039
20211024151515
20211121223120
20211121223350
20220902102530
20221002195802
20221004110907
20221205133527
20221220141958
20230316125645
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ticket_servers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ticket_servers (id, conference_id, url, "user", password, created_at, updated_at, queue) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tickets (id, object_id, remote_ticket_id, created_at, updated_at, object_type) FROM stdin;
\.


--
-- Data for Name: track_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.track_translations (id, name, locale, track_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tracks (id, conference_id, name, created_at, updated_at, color) FROM stdin;
166	40	Backend	2026-08-03 10:07:43.497877	2026-08-03 10:07:43.497877	4a90d9
167	40	Frontend	2026-08-03 10:07:43.501025	2026-08-03 10:07:43.501025	7ed321
168	40	DevOps	2026-08-03 10:07:43.503732	2026-08-03 10:07:43.503732	f5a623
169	40	Security	2026-08-03 10:07:43.507085	2026-08-03 10:07:43.507085	d0021b
170	40	Community	2026-08-03 10:07:43.510456	2026-08-03 10:07:43.510456	9013fe
171	41	Ruby	2026-08-03 10:07:49.659023	2026-08-03 10:07:49.659023	d0021b
172	42	Keynotes	2026-08-03 10:07:49.960475	2026-08-03 10:07:49.960475	111111
173	42	Backend	2026-08-03 10:07:49.96299	2026-08-03 10:07:49.96299	4a90d9
174	42	Frontend	2026-08-03 10:07:49.965173	2026-08-03 10:07:49.965173	7ed321
175	42	DevOps	2026-08-03 10:07:49.967134	2026-08-03 10:07:49.967134	f5a623
176	42	Security	2026-08-03 10:07:49.969202	2026-08-03 10:07:49.969202	d0021b
177	42	Data & AI	2026-08-03 10:07:49.971323	2026-08-03 10:07:49.971323	9013fe
178	42	Community	2026-08-03 10:07:49.973299	2026-08-03 10:07:49.973299	50e3c2
\.


--
-- Data for Name: transport_needs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_needs (id, person_id, conference_id, at, transport_type, seats, booked, note, created_at, updated_at) FROM stdin;
211	334	40	2026-08-24 05:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:07:49.636403	2026-08-03 10:07:49.636403
212	335	40	2026-08-24 05:00:00	plane	1	f	Arrives the evening before.	2026-08-03 10:07:49.639178	2026-08-03 10:07:49.639178
213	336	40	2026-08-24 05:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:07:49.642695	2026-08-03 10:07:49.642695
214	337	40	2026-08-24 05:00:00	train	1	f	Arrives the evening before.	2026-08-03 10:07:49.645561	2026-08-03 10:07:49.645561
215	338	40	2026-08-24 05:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:07:49.648221	2026-08-03 10:07:49.648221
216	350	42	2026-08-02 07:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:08:31.303634	2026-08-03 10:08:31.303634
217	351	42	2026-08-02 06:00:00	plane	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.310687	2026-08-03 10:08:31.310687
218	337	42	2026-08-02 04:00:00	bus	1	t	Arrives the evening before.	2026-08-03 10:08:31.318298	2026-08-03 10:08:31.318298
219	344	42	2026-08-02 03:00:00	train	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.325125	2026-08-03 10:08:31.325125
220	335	42	2026-08-02 06:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:08:31.331835	2026-08-03 10:08:31.331835
221	342	42	2026-08-02 05:00:00	bus	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.339461	2026-08-03 10:08:31.339461
222	338	42	2026-08-02 03:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:08:31.34607	2026-08-03 10:08:31.34607
223	339	42	2026-08-02 07:00:00	car	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.354477	2026-08-03 10:08:31.354477
224	347	42	2026-08-02 05:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:08:31.362736	2026-08-03 10:08:31.362736
225	341	42	2026-08-02 04:00:00	plane	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.369576	2026-08-03 10:08:31.369576
226	345	42	2026-08-02 07:00:00	bus	1	t	Arrives the evening before.	2026-08-03 10:08:31.37707	2026-08-03 10:08:31.37707
227	346	42	2026-08-02 06:00:00	train	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.383586	2026-08-03 10:08:31.383586
228	349	42	2026-08-02 04:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:08:31.400694	2026-08-03 10:08:31.400694
229	353	42	2026-08-02 03:00:00	bus	1	f	Needs a pickup at the station.	2026-08-03 10:08:31.406724	2026-08-03 10:08:31.406724
230	355	42	2026-08-02 06:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:08:31.412517	2026-08-03 10:08:31.412517
\.


--
-- Data for Name: user_adapter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_adapter (id, number_of_papers_evaluated, papers_evaluated, created_at, updated_at, papers_array) FROM stdin;
\.


--
-- Data for Name: user_adapters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_adapters (id, number_of_papers_evaluated, papers_evaluated, created_at, updated_at, user_id, skipped, accepted, paid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, reset_password_token, remember_created_at, remember_token, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, created_at, updated_at, role, encrypted_password, reset_password_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, provider, uid, gdpr) FROM stdin;
335	speaker2@example.org	\N	\N	\N	2	2026-08-03 10:16:28.743535	2026-08-03 10:09:46.054318	127.0.0.1	127.0.0.1	\N	2026-08-03 10:07:40.51544	\N	2026-08-03 10:07:40.51964	2026-08-03 10:16:28.743767	submitter	$2a$11$zTis.zYv5thpG.kGpqQG9umJaEyZPIKUoQdZCSJq8iD..6nrUyk9W	\N	\N	0	\N	\N	\N	\N	t
1	admin@example.org	\N	\N	\N	1	2026-08-03 07:40:26.858628	2026-08-03 07:40:26.858628	127.0.0.1	127.0.0.1	\N	2026-07-30 08:01:41.657703	\N	2026-07-30 08:01:41.669081	2026-08-03 07:40:26.859051	admin	$2a$11$vcpqe6RYd95ihK1cZdLBR.LEuRHVKHDsqy7DBJmjfR31Xo0o1RJR.	\N	\N	2	\N	\N	\N	\N	t
330	orga@example.org	\N	\N	\N	4	2026-08-03 10:16:37.764577	2026-08-03 10:16:01.521353	127.0.0.1	127.0.0.1	\N	2026-08-03 10:07:39.772041	\N	2026-08-03 10:07:39.777598	2026-08-03 10:16:37.764813	crew	$2a$11$iAE3jg4O7zg3Ewsnm4Tdde/ADaNzc73mlixrZXkUsolcub8JcQpH6	\N	\N	0	\N	\N	\N	\N	t
332	reviewer@example.org	\N	\N	\N	2	2026-08-03 10:18:10.853559	2026-08-03 10:11:40.413132	127.0.0.1	127.0.0.1	\N	2026-08-03 10:07:40.082411	\N	2026-08-03 10:07:40.086163	2026-08-03 10:18:10.853943	crew	$2a$11$St6zyxn/jU8cB9wu5JUusesqBnA9b9kDtsOIew8NBVhUuvwZ6I6j2	\N	\N	0	\N	\N	\N	\N	t
342	speaker9@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.519297	\N	2026-08-03 10:07:41.52431	2026-08-03 10:07:41.52431	submitter	$2a$11$/3hlol5hir9vzXEvl0w4YeEKGerBNatxnuFzi83ANbeThRybLq/86	\N	\N	0	\N	\N	\N	\N	t
331	coordinator@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:39.938314	\N	2026-08-03 10:07:39.941936	2026-08-03 10:07:39.941936	crew	$2a$11$T12xEto4/GY9.lwmINtPlOAWrYsGMuQhthr843PRTj6uBh65WGqq.	\N	\N	0	\N	\N	\N	\N	t
333	reviewer2@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:40.225536	\N	2026-08-03 10:07:40.229371	2026-08-03 10:07:40.229371	crew	$2a$11$7bPfGF5KItYjJ7PQgYEELeLslAHUbPec76pbi9p0ID8/4s43EoE2O	\N	\N	0	\N	\N	\N	\N	t
334	speaker1@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:40.368959	\N	2026-08-03 10:07:40.373412	2026-08-03 10:07:40.373412	submitter	$2a$11$LzYJo94fnYsZCsD0FiP5CegHhDS07PxiuUBjWUYfF54DUDarVYAU6	\N	\N	0	\N	\N	\N	\N	t
343	speaker10@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.663833	\N	2026-08-03 10:07:41.666891	2026-08-03 10:07:41.666891	submitter	$2a$11$eBySdgFC70Y8es1TfiW9duGtZrOOls1yVLaKw1mLVP5J7yp3U3nWG	\N	\N	0	\N	\N	\N	\N	t
336	speaker3@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:40.660875	\N	2026-08-03 10:07:40.663994	2026-08-03 10:07:40.663994	submitter	$2a$11$YLmUAIG/NSbLVOl0MCapYOkNsAGtjfP8o9kCdsCLPdwqEPBV.1oTe	\N	\N	0	\N	\N	\N	\N	t
344	speaker11@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.803979	\N	2026-08-03 10:07:41.807222	2026-08-03 10:07:41.807222	submitter	$2a$11$rQthoResDF/qPoozOBV97eMvRy8FFzWr2AaHn03IsPTX2zCQk9hc6	\N	\N	0	\N	\N	\N	\N	t
345	speaker12@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.945054	\N	2026-08-03 10:07:41.948957	2026-08-03 10:07:41.948957	submitter	$2a$11$CeboGTJ3S9EM6VyRnIU4Ee7lJ3AqASh0ZStLHUw4XQ8wDtYH2q7Qq	\N	\N	0	\N	\N	\N	\N	t
337	speaker4@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:40.802119	\N	2026-08-03 10:07:40.805313	2026-08-03 10:07:40.805313	submitter	$2a$11$fQ4tg7GIVa3vIwHJif434OauMeUy2G035Z70fiAnUn9VAL1hBbIVC	\N	\N	0	\N	\N	\N	\N	t
338	speaker5@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:40.942396	\N	2026-08-03 10:07:40.946068	2026-08-03 10:07:40.946068	submitter	$2a$11$38qObuSksyHqV0NY6zkNuuivggoyX8HTwCBjZqjvFjsDXyEGfOAsa	\N	\N	0	\N	\N	\N	\N	t
339	speaker6@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.085351	\N	2026-08-03 10:07:41.08923	2026-08-03 10:07:41.08923	submitter	$2a$11$leIBJwmLOb8J/GV773QibOEAxmPtcgOAhq8zeeJRFF3Yc2rl/C3We	\N	\N	0	\N	\N	\N	\N	t
340	speaker7@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.230456	\N	2026-08-03 10:07:41.233719	2026-08-03 10:07:41.233719	submitter	$2a$11$.QZxhXZ2rHT4hFjs/codEeeKk6Au6j6s3vbFCMSdGyQ2K655tt14.	\N	\N	0	\N	\N	\N	\N	t
341	speaker8@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:41.372273	\N	2026-08-03 10:07:41.375907	2026-08-03 10:07:41.375907	submitter	$2a$11$WK24OdNntxeGtADLSqDN7u7ply3J4AGvsNa4qMZslPk9EAedMYDb.	\N	\N	0	\N	\N	\N	\N	t
346	speaker13@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.093381	\N	2026-08-03 10:07:42.097641	2026-08-03 10:07:42.097641	submitter	$2a$11$yCvZ0GP0yMo36HDN3Xz0/uzabpHSu5LjXGQ3156XF8DBo8zYuuEey	\N	\N	0	\N	\N	\N	\N	t
347	speaker14@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.239801	\N	2026-08-03 10:07:42.244459	2026-08-03 10:07:42.244459	submitter	$2a$11$4FCrwTuESb7D.l/NA94E0eJt8xQLy68noALMqytp2BoPtE/KTKB1m	\N	\N	0	\N	\N	\N	\N	t
348	speaker15@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.38767	\N	2026-08-03 10:07:42.392852	2026-08-03 10:07:42.392852	submitter	$2a$11$dVGUiCJoAxo.QBmieH/m9efPujKSy1yKRFTl8T1ysMN2apdT7pQCy	\N	\N	0	\N	\N	\N	\N	t
349	speaker16@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.532311	\N	2026-08-03 10:07:42.535707	2026-08-03 10:07:42.535707	submitter	$2a$11$OV9H7I1uUOtJx21vMeDc..jMrWiFRopWytLv7Pbhn.cT0EbtTuupC	\N	\N	0	\N	\N	\N	\N	t
350	speaker17@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.675407	\N	2026-08-03 10:07:42.678642	2026-08-03 10:07:42.678642	submitter	$2a$11$2cvD3cgkOuMnraIR1VqqQOJd6fXAio.E4rG0p62BvoQH9tB6Zv0em	\N	\N	0	\N	\N	\N	\N	t
351	speaker18@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.849792	\N	2026-08-03 10:07:42.853177	2026-08-03 10:07:42.853177	submitter	$2a$11$02780Dx7FWKTMC.v9jBKW.0gzPWNHfxNTI4eWVChyC.JwRKwslY1m	\N	\N	0	\N	\N	\N	\N	t
352	speaker19@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:42.993374	\N	2026-08-03 10:07:42.997562	2026-08-03 10:07:42.997562	submitter	$2a$11$1dHnd9.qVSBYnXsFPmDsGewqBuU9Sl2X7KRbly7LI.CMdtyg1cfPS	\N	\N	0	\N	\N	\N	\N	t
353	speaker20@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:43.143972	\N	2026-08-03 10:07:43.148263	2026-08-03 10:07:43.148263	submitter	$2a$11$ENgKQsykJDUiesEyOu4nS.vI5KSZFoIMwszwAODHlK3HFgZ5L3jHS	\N	\N	0	\N	\N	\N	\N	t
354	speaker21@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:43.303412	\N	2026-08-03 10:07:43.307881	2026-08-03 10:07:43.307881	submitter	$2a$11$9dGwWxOdx8Iavfo0rxWSROBDXvZu2PzQgxgJXVKV51GZW4g3EryY.	\N	\N	0	\N	\N	\N	\N	t
355	speaker22@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:07:43.44988	\N	2026-08-03 10:07:43.453547	2026-08-03 10:07:43.453547	submitter	$2a$11$UdxSQdUuOrcJVSVYdeANpu1QesUIx45j9/HcTyVSu0Sblqu3Sz/hm	\N	\N	0	\N	\N	\N	\N	t
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.versions (id, item_type, item_id, event, whodunnit, object, created_at, conference_id, associated_id, associated_type, object_changes) FROM stdin;
1	CallForParticipation	3	create	1	\N	2026-08-03 07:43:38.862417	3	\N	\N	---\nid:\n- \n- 3\nstart_date:\n- \n- 2026-08-03\nend_date:\n- \n- 2026-08-03\nhard_deadline:\n- \n- 2026-08-03\nwelcome_text:\n- \n- hi\nconference_id:\n- \n- 3\ncreated_at:\n- \n- &1 2026-08-03 07:43:38.862417760 Z\nupdated_at:\n- \n- *1\ninfo_url:\n- \n- ''\ncontact_email:\n- \n- ''\n
2	ReviewMetric	4	create	1	\N	2026-08-03 07:45:31.083258	3	3	Conference	---\nid:\n- \n- 4\nname:\n- \n- hi\ndescription:\n- \n- hi\nconference_id:\n- \n- 3\ncreated_at:\n- \n- &1 2026-08-03 07:45:31.083258081 Z\nupdated_at:\n- \n- *1\n
3	Event	33	update	1	---\nid: 33\nconference_id: 3\ntitle: Closing keynote\nsubtitle: DemoConf 2025 talk\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: 2026-05-02 08:15:00.000000000 Z\nabstract: Closing keynote. A talk from last year's demo conference.\ndescription: Full description for "Closing keynote".\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 9\nroom_id: 7\ncreated_at: 2026-07-30 08:02:05.423165000 Z\nupdated_at: 2026-07-30 08:02:05.598376000 Z\naverage_rating: \nevent_ratings_count: 0\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 6\naverage_feedback: 5.0\nguid: 27c15f97-4d68-4289-bb52-3619dc00d606\ndo_not_record: false\nrecording_license: \ntech_rider: \ninvite_token: xBMrxLrF4bjvfJkPQt4PrJwe\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 07:45:39.141009	3	\N	\N	---\nupdated_at:\n- 2026-07-30 08:02:05.598376000 Z\n- 2026-08-03 07:45:39.141009541 Z\naverage_rating:\n- \n- 2.0\nevent_ratings_count:\n- 0\n- 1\n
4	Event	889	update	304	---\nconference_id: 39\nid: 889\ntitle: 'Opening keynote: ten years of frab'\nsubtitle: What we learned running conferences\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: 'Opening keynote: ten years of frab. What we learned running conferences.\n  This abstract is demo content generated by demo:seed.'\ndescription: |-\n  A longer description for "Opening keynote: ten years of frab".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 159\nroom_id: 119\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-21 09:58:50.346826000 Z\n  zone: *1\n  time: 2026-04-21 09:58:50.346826000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:35.812832000 Z\n  zone: *1\n  time: 2026-08-03 09:59:35.812832000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 4\naverage_feedback: 3.0\nguid: c6e0a9a3-b9b8-4810-b441-c83287209dfe\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: Wireless handheld microphone, HDMI, clicker.\ninvite_token: 8FWL37gR3RM1LF2kD7JrDGnm\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 09:59:41.869536	39	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:35.812832000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:59:35.812832000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:41.869536798 Z\n  zone: *1\n  time: 2026-08-03 09:59:41.869536798 Z\nnote:\n- \n- Confirmed by phone, speaker will bring their own laptop.\n
5	Event	890	update	305	---\nconference_id: 39\nid: 890\ntitle: Refactoring legacy Rails\nsubtitle: A field guide\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: Refactoring legacy Rails. A field guide. This abstract is demo content generated\n  by demo:seed.\ndescription: |-\n  A longer description for "Refactoring legacy Rails".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 160\nroom_id: 120\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-22 09:58:50.533080000 Z\n  zone: *1\n  time: 2026-04-22 09:58:50.533080000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:35.908587000 Z\n  zone: *1\n  time: 2026-08-03 09:59:35.908587000 Z\naverage_rating: 3.0\nevent_ratings_count: 3\nnote: \nsubmission_note: \nspeaker_count: 2\nevent_feedbacks_count: 5\naverage_feedback: 4.0\nguid: 7b8d8f72-d962-4d15-a7c5-e771d87d328c\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: gUNMi5VaxDGHAcU8NBTb4hSb\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 09:59:41.94513	39	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:35.908587000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:59:35.908587000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:41.945130785 Z\n  zone: *1\n  time: 2026-08-03 09:59:41.945130785 Z\ndo_not_record:\n- false\n- true\n
6	Room	121	update	304	---\nconference_id: 39\nsize: 40\nid: 121\nname: Workshop Lab\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:58:50.274859000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:58:50.274859000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:58:50.274859000 Z\n  zone: *1\n  time: 2026-08-03 09:58:50.274859000 Z\nrank: 3\n	2026-08-03 09:59:42.043967	39	39	Conference	---\nsize:\n- 40\n- 45\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:58:50.274859000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:58:50.274859000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:42.043967273 Z\n  zone: *1\n  time: 2026-08-03 09:59:42.043967273 Z\n
7	Event	914	update	305	---\nconference_id: 39\nid: 914\ntitle: WebAssembly for backend developers\nsubtitle: A tour without the buzzwords\nevent_type: lecture\ntime_slots: 4\nstate: review\nlanguage: en\nstart_time: \nabstract: WebAssembly for backend developers. A tour without the buzzwords. This abstract\n  is demo content generated by demo:seed.\ndescription: |-\n  A longer description for "WebAssembly for backend developers".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 160\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-16 09:58:53.465464000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-16 09:58:53.465464000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:30.266824000 Z\n  zone: *1\n  time: 2026-08-03 09:59:30.266824000 Z\naverage_rating: \nevent_ratings_count: 2\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: 84e1703a-c497-4cc4-9a4b-99b90681ab7a\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: KMs8fjrUxaXn4JhkrU8NqEqn\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 09:59:42.064131	39	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:30.266824000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:59:30.266824000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:42.064131948 Z\n  zone: *1\n  time: 2026-08-03 09:59:42.064131948 Z\nsubmission_note:\n- \n- Asked the speaker for a longer abstract.\n
8	Event	910	update	306	---\nconference_id: 39\nid: 910\ntitle: Event sourcing, one year later\nsubtitle: Would we do it again?\nevent_type: lecture\ntime_slots: 4\nstate: unconfirmed\nlanguage: en\nstart_time: \nabstract: Event sourcing, one year later. Would we do it again?. This abstract is\n  demo content generated by demo:seed.\ndescription: |-\n  A longer description for "Event sourcing, one year later".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 160\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-12 09:58:53.050438000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-12 09:58:53.050438000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:28.932173000 Z\n  zone: *1\n  time: 2026-08-03 09:59:28.932173000 Z\naverage_rating: 2.875\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: d85f3b7a-5686-490b-9f09-8ad587618b8f\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: Esof5jgMmTrroSF58VXRPzjb\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 09:59:42.089356	39	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:28.932173000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:59:28.932173000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:42.089356610 Z\n  zone: *1\n  time: 2026-08-03 09:59:42.089356610 Z\nnote:\n- \n- Reminder sent, waiting for confirmation.\n
9	Event	891	update	305	---\nconference_id: 39\nid: 891\ntitle: From monolith to modules\nsubtitle: Without a big bang rewrite\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: From monolith to modules. Without a big bang rewrite. This abstract is demo\n  content generated by demo:seed.\ndescription: |-\n  A longer description for "From monolith to modules".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 160\nroom_id: 121\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-23 09:58:50.646382000 Z\n  zone: *1\n  time: 2026-04-23 09:58:50.646382000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:36.173907000 Z\n  zone: *1\n  time: 2026-08-03 09:59:36.173907000 Z\naverage_rating: 3.625\nevent_ratings_count: 4\nnote: \nsubmission_note: Prefers a morning slot.\nspeaker_count: 1\nevent_feedbacks_count: 6\naverage_feedback: 5.0\nguid: ec690dc8-307f-41bf-a0fe-83d3d9e7a9b9\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: VNoGQYBX4g8PTtDHV2BmfMv8\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 09:59:42.124961	39	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:36.173907000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 09:59:36.173907000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 09:59:42.124961596 Z\n  zone: *1\n  time: 2026-08-03 09:59:42.124961596 Z\ntech_rider:\n- \n- Needs a second screen for the notes view.\n
10	Event	988	update	330	---\nconference_id: 42\nid: 988\ntitle: 'Opening keynote: ten years of frab'\nsubtitle: What we learned running conferences\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: 'Opening keynote: ten years of frab. What we learned running conferences.\n  This abstract is demo content generated by demo:seed.'\ndescription: |-\n  A longer description for "Opening keynote: ten years of frab".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 172\nroom_id: 128\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-21 10:07:50.029499000 Z\n  zone: *1\n  time: 2026-04-21 10:07:50.029499000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:35.811427000 Z\n  zone: *1\n  time: 2026-08-03 10:08:35.811427000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 4\naverage_feedback: 3.0\nguid: 1c35d343-64ae-4c84-be16-4933c1e8c1a7\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: Wireless handheld microphone, HDMI, clicker.\ninvite_token: TroDfNaeKmBcJRQZRHiyGqez\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:41.915073	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:35.811427000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:35.811427000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:41.915073923 Z\n  zone: *1\n  time: 2026-08-03 10:08:41.915073923 Z\nnote:\n- \n- Confirmed by phone, speaker will bring their own laptop.\n
11	Event	989	update	331	---\nconference_id: 42\nid: 989\ntitle: Refactoring legacy Rails\nsubtitle: A field guide\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: Refactoring legacy Rails. A field guide. This abstract is demo content generated\n  by demo:seed.\ndescription: |-\n  A longer description for "Refactoring legacy Rails".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: 129\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-22 10:07:50.164675000 Z\n  zone: *1\n  time: 2026-04-22 10:07:50.164675000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:35.934591000 Z\n  zone: *1\n  time: 2026-08-03 10:08:35.934591000 Z\naverage_rating: 3.125\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 2\nevent_feedbacks_count: 5\naverage_feedback: 4.0\nguid: 5bc25013-d125-4c6d-a233-fc3b35855f72\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: PcpgrLvNHmtqs7vqJWV59WmD\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.000954	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:35.934591000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:35.934591000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.000954251 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.000954251 Z\ndo_not_record:\n- false\n- true\n
12	Room	130	update	330	---\nconference_id: 42\nsize: 40\nid: 130\nname: Workshop Lab\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:07:49.956883000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:07:49.956883000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:07:49.956883000 Z\n  zone: *1\n  time: 2026-08-03 10:07:49.956883000 Z\nrank: 3\n	2026-08-03 10:08:42.107352	42	42	Conference	---\nsize:\n- 40\n- 45\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:07:49.956883000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:07:49.956883000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.107352904 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.107352904 Z\n
13	Event	1013	update	331	---\nconference_id: 42\nid: 1013\ntitle: WebAssembly for backend developers\nsubtitle: A tour without the buzzwords\nevent_type: lecture\ntime_slots: 4\nstate: review\nlanguage: en\nstart_time: \nabstract: WebAssembly for backend developers. A tour without the buzzwords. This abstract\n  is demo content generated by demo:seed.\ndescription: |-\n  A longer description for "WebAssembly for backend developers".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-16 10:07:52.810520000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-16 10:07:52.810520000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:29.421816000 Z\n  zone: *1\n  time: 2026-08-03 10:08:29.421816000 Z\naverage_rating: \nevent_ratings_count: 2\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: 784b7907-70c1-40a3-b3a5-4999a96c4d72\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: a7vuMvqzSed3zQBKAXWu7wHj\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.127504	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:29.421816000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:29.421816000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.127504732 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.127504732 Z\nsubmission_note:\n- \n- Asked the speaker for a longer abstract.\n
14	Event	1009	update	332	---\nconference_id: 42\nid: 1009\ntitle: Event sourcing, one year later\nsubtitle: Would we do it again?\nevent_type: lecture\ntime_slots: 4\nstate: unconfirmed\nlanguage: en\nstart_time: \nabstract: Event sourcing, one year later. Would we do it again?. This abstract is\n  demo content generated by demo:seed.\ndescription: |-\n  A longer description for "Event sourcing, one year later".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-12 10:07:52.459365000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-12 10:07:52.459365000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:28.227023000 Z\n  zone: *1\n  time: 2026-08-03 10:08:28.227023000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: b016e61d-8137-4666-b39d-3c56e810b3e7\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: JRavSnYPNtutnkagpJrfDeXq\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.155648	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:28.227023000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:28.227023000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.155648745 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.155648745 Z\nnote:\n- \n- Reminder sent, waiting for confirmation.\n
15	Event	990	update	331	---\nconference_id: 42\nid: 990\ntitle: From monolith to modules\nsubtitle: Without a big bang rewrite\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: From monolith to modules. Without a big bang rewrite. This abstract is demo\n  content generated by demo:seed.\ndescription: |-\n  A longer description for "From monolith to modules".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: 130\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-23 10:07:50.284434000 Z\n  zone: *1\n  time: 2026-04-23 10:07:50.284434000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:36.279192000 Z\n  zone: *1\n  time: 2026-08-03 10:08:36.279192000 Z\naverage_rating: 3.75\nevent_ratings_count: 4\nnote: \nsubmission_note: Prefers a morning slot.\nspeaker_count: 1\nevent_feedbacks_count: 6\naverage_feedback: 5.0\nguid: 589ca6df-1a57-40e3-8bcd-cc7e712807b2\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: Lnf5VUReCUM3NmHz7qpA9gZ6\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.195671	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:36.279192000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:36.279192000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.195671289 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.195671289 Z\ntech_rider:\n- \n- Needs a second screen for the notes view.\n
\.


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 1162, true);


--
-- Name: average_review_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.average_review_scores_id_seq', 3067, true);


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.call_for_participations_id_seq', 42, true);


--
-- Name: classifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classifiers_id_seq', 67, true);


--
-- Name: conference_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conference_exports_id_seq', 1, false);


--
-- Name: conference_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conference_users_id_seq', 137, true);


--
-- Name: conferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conferences_id_seq', 42, true);


--
-- Name: conflicts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conflicts_id_seq', 2664, true);


--
-- Name: days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.days_id_seq', 83, true);


--
-- Name: event_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_attachments_id_seq', 180, true);


--
-- Name: event_classifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_classifiers_id_seq', 2669, true);


--
-- Name: event_feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_feedbacks_id_seq', 1276, true);


--
-- Name: event_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_people_id_seq', 3099, true);


--
-- Name: event_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_ratings_id_seq', 2675, true);


--
-- Name: event_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_translations_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_id_seq', 1061, true);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expenses_id_seq', 230, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grades_id_seq', 1, false);


--
-- Name: im_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.im_accounts_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.languages_id_seq', 96, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 522, true);


--
-- Name: mail_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mail_templates_id_seq', 120, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 84, true);


--
-- Name: papers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.papers_id_seq', 1061, true);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_id_seq', 355, true);


--
-- Name: person_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.person_translations_id_seq', 1, false);


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.phone_numbers_id_seq', 1, false);


--
-- Name: review_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.review_metrics_id_seq', 95, true);


--
-- Name: review_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.review_scores_id_seq', 8493, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rooms_id_seq', 131, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: ticket_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_servers_id_seq', 1, false);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: track_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.track_translations_id_seq', 1, false);


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tracks_id_seq', 178, true);


--
-- Name: transport_needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_needs_id_seq', 230, true);


--
-- Name: user_adapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_adapter_id_seq', 1, false);


--
-- Name: user_adapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_adapters_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 355, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.versions_id_seq', 15, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: average_review_scores average_review_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.average_review_scores
    ADD CONSTRAINT average_review_scores_pkey PRIMARY KEY (id);


--
-- Name: call_for_participations call_for_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_for_participations
    ADD CONSTRAINT call_for_participations_pkey PRIMARY KEY (id);


--
-- Name: classifiers classifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classifiers
    ADD CONSTRAINT classifiers_pkey PRIMARY KEY (id);


--
-- Name: conference_exports conference_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_exports
    ADD CONSTRAINT conference_exports_pkey PRIMARY KEY (id);


--
-- Name: conference_users conference_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_users
    ADD CONSTRAINT conference_users_pkey PRIMARY KEY (id);


--
-- Name: conferences conferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conferences
    ADD CONSTRAINT conferences_pkey PRIMARY KEY (id);


--
-- Name: conflicts conflicts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflicts
    ADD CONSTRAINT conflicts_pkey PRIMARY KEY (id);


--
-- Name: days days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_pkey PRIMARY KEY (id);


--
-- Name: event_attachments event_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_attachments
    ADD CONSTRAINT event_attachments_pkey PRIMARY KEY (id);


--
-- Name: event_classifiers event_classifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_classifiers
    ADD CONSTRAINT event_classifiers_pkey PRIMARY KEY (id);


--
-- Name: event_feedbacks event_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_feedbacks
    ADD CONSTRAINT event_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: event_people event_people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_people
    ADD CONSTRAINT event_people_pkey PRIMARY KEY (id);


--
-- Name: event_ratings event_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT event_ratings_pkey PRIMARY KEY (id);


--
-- Name: event_translations event_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_translations
    ADD CONSTRAINT event_translations_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: im_accounts im_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.im_accounts
    ADD CONSTRAINT im_accounts_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: mail_templates mail_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mail_templates
    ADD CONSTRAINT mail_templates_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: papers papers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: person_translations person_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_translations
    ADD CONSTRAINT person_translations_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: review_metrics review_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_metrics
    ADD CONSTRAINT review_metrics_pkey PRIMARY KEY (id);


--
-- Name: review_scores review_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_scores
    ADD CONSTRAINT review_scores_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: ticket_servers ticket_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_servers
    ADD CONSTRAINT ticket_servers_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: track_translations track_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations
    ADD CONSTRAINT track_translations_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: transport_needs transport_needs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_needs
    ADD CONSTRAINT transport_needs_pkey PRIMARY KEY (id);


--
-- Name: user_adapter user_adapter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_adapter
    ADD CONSTRAINT user_adapter_pkey PRIMARY KEY (id);


--
-- Name: user_adapters user_adapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_adapters
    ADD CONSTRAINT user_adapters_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: index_availabilities_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_availabilities_on_conference_id ON public.availabilities USING btree (conference_id);


--
-- Name: index_availabilities_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_availabilities_on_person_id ON public.availabilities USING btree (person_id);


--
-- Name: index_average_review_scores_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_average_review_scores_on_event_id ON public.average_review_scores USING btree (event_id);


--
-- Name: index_average_review_scores_on_event_id_and_review_metric_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_average_review_scores_on_event_id_and_review_metric_id ON public.average_review_scores USING btree (event_id, review_metric_id);


--
-- Name: index_average_review_scores_on_review_metric_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_average_review_scores_on_review_metric_id ON public.average_review_scores USING btree (review_metric_id);


--
-- Name: index_call_for_papers_on_dates; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_call_for_papers_on_dates ON public.call_for_participations USING btree (start_date, end_date);


--
-- Name: index_classifiers_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_classifiers_on_conference_id ON public.classifiers USING btree (conference_id);


--
-- Name: index_conference_exports_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conference_exports_on_conference_id ON public.conference_exports USING btree (conference_id);


--
-- Name: index_conference_users_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conference_users_on_conference_id ON public.conference_users USING btree (conference_id);


--
-- Name: index_conference_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conference_users_on_user_id ON public.conference_users USING btree (user_id);


--
-- Name: index_conferences_on_acronym; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conferences_on_acronym ON public.conferences USING btree (acronym);


--
-- Name: index_conferences_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conferences_on_parent_id ON public.conferences USING btree (parent_id);


--
-- Name: index_conflicts_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conflicts_on_event_id ON public.conflicts USING btree (event_id, conflicting_event_id);


--
-- Name: index_conflicts_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conflicts_on_person_id ON public.conflicts USING btree (person_id);


--
-- Name: index_days_on_conference; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_days_on_conference ON public.days USING btree (conference_id);


--
-- Name: index_event_attachments_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_attachments_on_event_id ON public.event_attachments USING btree (event_id);


--
-- Name: index_event_classifiers_on_classifier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_classifiers_on_classifier_id ON public.event_classifiers USING btree (classifier_id);


--
-- Name: index_event_classifiers_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_classifiers_on_event_id ON public.event_classifiers USING btree (event_id);


--
-- Name: index_event_feedbacks_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_feedbacks_on_event_id ON public.event_feedbacks USING btree (event_id);


--
-- Name: index_event_people_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_people_on_event_id ON public.event_people USING btree (event_id);


--
-- Name: index_event_people_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_people_on_person_id ON public.event_people USING btree (person_id);


--
-- Name: index_event_ratings_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_ratings_on_event_id ON public.event_ratings USING btree (event_id);


--
-- Name: index_event_ratings_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_ratings_on_person_id ON public.event_ratings USING btree (person_id);


--
-- Name: index_event_translations_on_event_id_and_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_event_translations_on_event_id_and_locale ON public.event_translations USING btree (event_id, locale);


--
-- Name: index_event_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_translations_on_locale ON public.event_translations USING btree (locale);


--
-- Name: index_events_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_conference_id ON public.events USING btree (conference_id);


--
-- Name: index_events_on_guid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_guid ON public.events USING btree (guid);


--
-- Name: index_events_on_invite_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_invite_token ON public.events USING btree (invite_token);


--
-- Name: index_events_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_state ON public.events USING btree (state);


--
-- Name: index_events_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_type ON public.events USING btree (event_type);


--
-- Name: index_expenses_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_expenses_on_conference_id ON public.expenses USING btree (conference_id);


--
-- Name: index_expenses_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_expenses_on_person_id ON public.expenses USING btree (person_id);


--
-- Name: index_im_accounts_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_im_accounts_on_person_id ON public.im_accounts USING btree (person_id);


--
-- Name: index_languages_on_attachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_languages_on_attachable_id ON public.languages USING btree (attachable_id);


--
-- Name: index_links_on_linkable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linkable_id ON public.links USING btree (linkable_id);


--
-- Name: index_mail_templates_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mail_templates_on_conference_id ON public.mail_templates USING btree (conference_id);


--
-- Name: index_people_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_email ON public.people USING btree (email);


--
-- Name: index_people_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_user_id ON public.people USING btree (user_id);


--
-- Name: index_person_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_person_translations_on_locale ON public.person_translations USING btree (locale);


--
-- Name: index_person_translations_on_person_id_and_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_person_translations_on_person_id_and_locale ON public.person_translations USING btree (person_id, locale);


--
-- Name: index_phone_numbers_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_phone_numbers_on_person_id ON public.phone_numbers USING btree (person_id);


--
-- Name: index_review_metrics_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_review_metrics_on_conference_id ON public.review_metrics USING btree (conference_id);


--
-- Name: index_review_metrics_on_name_and_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_review_metrics_on_name_and_conference_id ON public.review_metrics USING btree (name, conference_id);


--
-- Name: index_review_scores_on_event_rating_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_review_scores_on_event_rating_id ON public.review_scores USING btree (event_rating_id);


--
-- Name: index_review_scores_on_review_metric_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_review_scores_on_review_metric_id ON public.review_scores USING btree (review_metric_id);


--
-- Name: index_rooms_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rooms_on_conference_id ON public.rooms USING btree (conference_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_session_id ON public.sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_updated_at ON public.sessions USING btree (updated_at);


--
-- Name: index_tickets_on_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tickets_on_object_id ON public.tickets USING btree (object_id);


--
-- Name: index_track_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_track_translations_on_locale ON public.track_translations USING btree (locale);


--
-- Name: index_track_translations_on_track_id_and_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_track_translations_on_track_id_and_locale ON public.track_translations USING btree (track_id, locale);


--
-- Name: index_tracks_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tracks_on_conference_id ON public.tracks USING btree (conference_id);


--
-- Name: index_transport_needs_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transport_needs_on_conference_id ON public.transport_needs USING btree (conference_id);


--
-- Name: index_transport_needs_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transport_needs_on_person_id ON public.transport_needs USING btree (person_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: review_scores fk_rails_00219acb6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_scores
    ADD CONSTRAINT fk_rails_00219acb6b FOREIGN KEY (review_metric_id) REFERENCES public.review_metrics(id);


--
-- Name: review_metrics fk_rails_07d5b7fd35; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_metrics
    ADD CONSTRAINT fk_rails_07d5b7fd35 FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- Name: event_classifiers fk_rails_09a512c9c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_classifiers
    ADD CONSTRAINT fk_rails_09a512c9c4 FOREIGN KEY (classifier_id) REFERENCES public.classifiers(id);


--
-- Name: person_translations fk_rails_1e25922b3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_translations
    ADD CONSTRAINT fk_rails_1e25922b3b FOREIGN KEY (person_id) REFERENCES public.people(id);


--
-- Name: track_translations fk_rails_2b6e3a02c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations
    ADD CONSTRAINT fk_rails_2b6e3a02c0 FOREIGN KEY (track_id) REFERENCES public.tracks(id);


--
-- Name: classifiers fk_rails_46d7301c65; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classifiers
    ADD CONSTRAINT fk_rails_46d7301c65 FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- Name: event_classifiers fk_rails_4f07c18996; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_classifiers
    ADD CONSTRAINT fk_rails_4f07c18996 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_translations fk_rails_701fae2cdc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_translations
    ADD CONSTRAINT fk_rails_701fae2cdc FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: average_review_scores fk_rails_c64b4110e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.average_review_scores
    ADD CONSTRAINT fk_rails_c64b4110e5 FOREIGN KEY (review_metric_id) REFERENCES public.review_metrics(id);


--
-- Name: review_scores fk_rails_ca46ca83a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_scores
    ADD CONSTRAINT fk_rails_ca46ca83a6 FOREIGN KEY (event_rating_id) REFERENCES public.event_ratings(id);


--
-- Name: average_review_scores fk_rails_cc0342dd94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.average_review_scores
    ADD CONSTRAINT fk_rails_cc0342dd94 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- PostgreSQL database dump complete
--

