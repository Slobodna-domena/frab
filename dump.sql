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
1199	379	45	2026-08-03 10:35:52.916049	2026-08-03 10:35:52.916049	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1200	379	45	2026-08-03 10:35:52.923822	2026-08-03 10:35:52.923822	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1201	379	45	2026-08-03 10:35:52.998138	2026-08-03 10:35:52.998138	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1202	364	45	2026-08-03 10:35:53.004651	2026-08-03 10:35:53.004651	2026-08-02 08:00:00	2026-08-02 13:00:00	87
1203	364	45	2026-08-03 10:35:53.047221	2026-08-03 10:35:53.047221	2026-08-03 08:00:00	2026-08-03 13:00:00	88
1204	364	45	2026-08-03 10:35:53.130874	2026-08-03 10:35:53.130874	2026-08-04 08:00:00	2026-08-04 13:00:00	89
1205	371	45	2026-08-03 10:35:53.161051	2026-08-03 10:35:53.161051	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1206	371	45	2026-08-03 10:35:53.193316	2026-08-03 10:35:53.193316	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1207	371	45	2026-08-03 10:35:53.256809	2026-08-03 10:35:53.256809	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1214	360	45	2026-08-03 10:35:53.453014	2026-08-03 10:35:53.453014	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1215	360	45	2026-08-03 10:35:53.482121	2026-08-03 10:35:53.482121	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1216	361	45	2026-08-03 10:35:53.548471	2026-08-03 10:35:53.548471	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1217	361	45	2026-08-03 10:35:53.58957	2026-08-03 10:35:53.58957	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1218	361	45	2026-08-03 10:35:53.620402	2026-08-03 10:35:53.620402	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1219	362	45	2026-08-03 10:35:53.626837	2026-08-03 10:35:53.626837	2026-08-02 08:00:00	2026-08-02 13:00:00	87
1220	362	45	2026-08-03 10:35:53.655342	2026-08-03 10:35:53.655342	2026-08-03 08:00:00	2026-08-03 13:00:00	88
1221	362	45	2026-08-03 10:35:53.686411	2026-08-03 10:35:53.686411	2026-08-04 08:00:00	2026-08-04 13:00:00	89
1222	369	45	2026-08-03 10:35:53.693325	2026-08-03 10:35:53.693325	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1223	369	45	2026-08-03 10:35:53.726337	2026-08-03 10:35:53.726337	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1224	369	45	2026-08-03 10:35:53.733287	2026-08-03 10:35:53.733287	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1225	363	45	2026-08-03 10:35:53.799138	2026-08-03 10:35:53.799138	2026-08-02 07:00:00	2026-08-02 12:00:00	87
1226	363	45	2026-08-03 10:35:53.844488	2026-08-03 10:35:53.844488	2026-08-03 07:00:00	2026-08-03 12:00:00	88
1227	363	45	2026-08-03 10:35:53.851031	2026-08-03 10:35:53.851031	2026-08-04 07:00:00	2026-08-04 12:00:00	89
1228	365	45	2026-08-03 10:35:53.880054	2026-08-03 10:35:53.880054	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1229	365	45	2026-08-03 10:35:53.90764	2026-08-03 10:35:53.90764	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1230	365	45	2026-08-03 10:35:53.913998	2026-08-03 10:35:53.913998	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1231	366	45	2026-08-03 10:35:53.94266	2026-08-03 10:35:53.94266	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1232	366	45	2026-08-03 10:35:53.999796	2026-08-03 10:35:53.999796	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1233	367	45	2026-08-03 10:35:54.008818	2026-08-03 10:35:54.008818	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1234	367	45	2026-08-03 10:35:54.042754	2026-08-03 10:35:54.042754	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1235	367	45	2026-08-03 10:35:54.119925	2026-08-03 10:35:54.119925	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1236	372	45	2026-08-03 10:35:54.154213	2026-08-03 10:35:54.154213	2026-08-02 08:00:00	2026-08-02 13:00:00	87
1237	372	45	2026-08-03 10:35:54.182679	2026-08-03 10:35:54.182679	2026-08-03 08:00:00	2026-08-03 13:00:00	88
1238	372	45	2026-08-03 10:35:54.188796	2026-08-03 10:35:54.188796	2026-08-04 08:00:00	2026-08-04 13:00:00	89
1239	373	45	2026-08-03 10:35:54.217386	2026-08-03 10:35:54.217386	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1240	373	45	2026-08-03 10:35:54.281078	2026-08-03 10:35:54.281078	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1241	373	45	2026-08-03 10:35:54.287269	2026-08-03 10:35:54.287269	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1242	374	45	2026-08-03 10:35:54.31702	2026-08-03 10:35:54.31702	2026-08-02 07:00:00	2026-08-02 12:00:00	87
1243	374	45	2026-08-03 10:35:54.323743	2026-08-03 10:35:54.323743	2026-08-03 07:00:00	2026-08-03 12:00:00	88
1244	374	45	2026-08-03 10:35:54.350373	2026-08-03 10:35:54.350373	2026-08-04 07:00:00	2026-08-04 12:00:00	89
1245	375	45	2026-08-03 10:35:54.395976	2026-08-03 10:35:54.395976	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1246	375	45	2026-08-03 10:35:54.403031	2026-08-03 10:35:54.403031	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1247	375	45	2026-08-03 10:35:54.443327	2026-08-03 10:35:54.443327	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1248	376	45	2026-08-03 10:35:54.50184	2026-08-03 10:35:54.50184	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1249	376	45	2026-08-03 10:35:54.508795	2026-08-03 10:35:54.508795	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1250	377	45	2026-08-03 10:35:54.533111	2026-08-03 10:35:54.533111	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1251	377	45	2026-08-03 10:35:54.567942	2026-08-03 10:35:54.567942	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1252	377	45	2026-08-03 10:35:54.593485	2026-08-03 10:35:54.593485	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1253	378	45	2026-08-03 10:35:54.599799	2026-08-03 10:35:54.599799	2026-08-02 08:00:00	2026-08-02 13:00:00	87
1254	378	45	2026-08-03 10:35:54.605807	2026-08-03 10:35:54.605807	2026-08-03 08:00:00	2026-08-03 13:00:00	88
1255	378	45	2026-08-03 10:35:54.65891	2026-08-03 10:35:54.65891	2026-08-04 08:00:00	2026-08-04 13:00:00	89
1256	368	45	2026-08-03 10:35:54.664742	2026-08-03 10:35:54.664742	2026-08-02 07:00:00	2026-08-02 13:00:00	87
1257	368	45	2026-08-03 10:35:54.722101	2026-08-03 10:35:54.722101	2026-08-03 07:00:00	2026-08-03 13:00:00	88
1258	368	45	2026-08-03 10:35:54.72798	2026-08-03 10:35:54.72798	2026-08-04 07:00:00	2026-08-04 13:00:00	89
1259	370	45	2026-08-03 10:35:54.814094	2026-08-03 10:35:54.814094	2026-08-02 07:00:00	2026-08-02 12:00:00	87
1260	370	45	2026-08-03 10:35:54.850482	2026-08-03 10:35:54.850482	2026-08-03 07:00:00	2026-08-03 12:00:00	88
1261	370	45	2026-08-03 10:35:54.85673	2026-08-03 10:35:54.85673	2026-08-04 07:00:00	2026-08-04 12:00:00	89
1163	360	43	2026-08-03 10:34:51.316592	2026-08-03 10:34:51.316592	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1164	360	43	2026-08-03 10:34:51.335028	2026-08-03 10:34:51.335028	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1165	360	43	2026-08-03 10:34:51.338083	2026-08-03 10:34:51.338083	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1166	357	43	2026-08-03 10:34:51.34524	2026-08-03 10:34:51.34524	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1167	357	43	2026-08-03 10:34:51.381528	2026-08-03 10:34:51.381528	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1168	357	43	2026-08-03 10:34:51.409681	2026-08-03 10:34:51.409681	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1169	361	43	2026-08-03 10:34:51.452539	2026-08-03 10:34:51.452539	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1170	361	43	2026-08-03 10:34:51.45609	2026-08-03 10:34:51.45609	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1171	361	43	2026-08-03 10:34:51.474007	2026-08-03 10:34:51.474007	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1172	367	43	2026-08-03 10:34:51.48118	2026-08-03 10:34:51.48118	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1173	367	43	2026-08-03 10:34:51.485516	2026-08-03 10:34:51.485516	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1174	367	43	2026-08-03 10:34:51.502493	2026-08-03 10:34:51.502493	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1175	362	43	2026-08-03 10:34:51.532567	2026-08-03 10:34:51.532567	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1176	362	43	2026-08-03 10:34:51.53555	2026-08-03 10:34:51.53555	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1177	362	43	2026-08-03 10:34:51.538287	2026-08-03 10:34:51.538287	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1178	363	43	2026-08-03 10:34:51.570923	2026-08-03 10:34:51.570923	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1179	363	43	2026-08-03 10:34:51.586938	2026-08-03 10:34:51.586938	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1180	363	43	2026-08-03 10:34:51.589912	2026-08-03 10:34:51.589912	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1181	364	43	2026-08-03 10:34:51.597165	2026-08-03 10:34:51.597165	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1182	364	43	2026-08-03 10:34:51.600851	2026-08-03 10:34:51.600851	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1183	364	43	2026-08-03 10:34:51.617178	2026-08-03 10:34:51.617178	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1184	365	43	2026-08-03 10:34:51.623917	2026-08-03 10:34:51.623917	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1185	365	43	2026-08-03 10:34:51.62697	2026-08-03 10:34:51.62697	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1186	365	43	2026-08-03 10:34:51.629776	2026-08-03 10:34:51.629776	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1187	370	43	2026-08-03 10:34:51.659366	2026-08-03 10:34:51.659366	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1188	370	43	2026-08-03 10:34:51.664616	2026-08-03 10:34:51.664616	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1189	370	43	2026-08-03 10:34:51.669718	2026-08-03 10:34:51.669718	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1190	366	43	2026-08-03 10:34:51.714428	2026-08-03 10:34:51.714428	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1191	366	43	2026-08-03 10:34:51.732365	2026-08-03 10:34:51.732365	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1192	366	43	2026-08-03 10:34:51.735323	2026-08-03 10:34:51.735323	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1193	368	43	2026-08-03 10:34:51.746159	2026-08-03 10:34:51.746159	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1194	368	43	2026-08-03 10:34:51.749673	2026-08-03 10:34:51.749673	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1195	368	43	2026-08-03 10:34:51.752442	2026-08-03 10:34:51.752442	2026-08-26 07:00:00	2026-08-26 18:00:00	86
1196	373	43	2026-08-03 10:34:51.780682	2026-08-03 10:34:51.780682	2026-08-24 07:00:00	2026-08-24 18:00:00	84
1197	373	43	2026-08-03 10:34:51.783987	2026-08-03 10:34:51.783987	2026-08-25 07:00:00	2026-08-25 18:00:00	85
1198	373	43	2026-08-03 10:34:51.787582	2026-08-03 10:34:51.787582	2026-08-26 07:00:00	2026-08-26 18:00:00	86
\.


--
-- Data for Name: average_review_scores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.average_review_scores (id, event_id, review_metric_id, score) FROM stdin;
3104	1074	96	4.5
3105	1074	97	3
3106	1074	98	1.5
3068	1062	96	2.5
3069	1062	97	3.5
3070	1062	98	4.5
3071	1063	96	2.5
3072	1063	97	3.5
3073	1063	98	4.5
3074	1064	96	4
3075	1064	97	2.5
3076	1064	98	3.5
3077	1065	96	3
3078	1065	97	1.5
3079	1065	98	2.5
3080	1066	96	3
3081	1066	97	1.5
3082	1066	98	2.5
3083	1067	96	2
3084	1067	97	3
3085	1067	98	4
3086	1068	96	3.5
3087	1068	97	4.5
3088	1068	98	3
3089	1069	96	3.5
3090	1069	97	4.5
3091	1069	98	3
3092	1070	96	2.5
3093	1070	97	3.5
3094	1070	98	2
3095	1071	96	1.5
3096	1071	97	2.5
3097	1071	98	3.5
3098	1072	96	1.5
3099	1072	97	2.5
3100	1072	98	3.5
3101	1073	96	3
3102	1073	97	4
3103	1073	98	2.5
3107	1075	96	4.5
3108	1075	97	3
3109	1075	98	1.5
3110	1076	96	3.5
3111	1076	97	2
3112	1076	98	3
3113	1079	96	4
3114	1079	97	2.5
3115	1079	98	3.5
3116	1081	96	3
3117	1081	97	1.5
3118	1081	98	2.5
3119	1087	99	3
3120	1087	100	4
3121	1087	101	3.3333333333333335
3122	1087	102	2.6666666666666665
3123	1088	99	3
3124	1088	100	4
3125	1088	101	3.3333333333333335
3126	1088	102	2.6666666666666665
3129	1089	101	3
3127	1089	99	2.6666666666666665
3128	1089	100	3.6666666666666665
3130	1089	102	2.3333333333333335
3131	1090	99	2.3333333333333335
3132	1090	100	3.3333333333333335
3133	1090	101	2.6666666666666665
3134	1090	102	3.6666666666666665
3135	1091	99	2
3136	1091	100	3
3137	1091	101	4
3138	1091	102	3.3333333333333335
3139	1092	99	2
3140	1092	100	3
3141	1092	101	4
3142	1092	102	3.3333333333333335
3146	1093	102	3
3143	1093	99	3.3333333333333335
3144	1093	100	2.6666666666666665
3145	1093	101	3.6666666666666665
3147	1094	99	3
3148	1094	100	2.3333333333333335
3150	1094	102	2.6666666666666665
3151	1095	99	2.6666666666666665
3152	1095	100	2
3153	1095	101	3
3154	1095	102	4
3155	1096	99	2.6666666666666665
3156	1096	100	2
3157	1096	101	3
3158	1096	102	4
3159	1097	99	2.3333333333333335
3160	1097	100	3.3333333333333335
3161	1097	101	2.6666666666666665
3162	1097	102	3.6666666666666665
3163	1098	99	3.6666666666666665
3164	1098	100	3
3165	1098	101	2.3333333333333335
3166	1098	102	3.3333333333333335
3167	1099	99	3.3333333333333335
3168	1099	100	2.6666666666666665
3169	1099	101	2
3170	1099	102	3
3171	1100	99	3.3333333333333335
3172	1100	100	2.6666666666666665
3173	1100	101	2
3174	1100	102	3
3175	1101	99	3
3176	1101	100	2.3333333333333335
3177	1101	101	3.3333333333333335
3178	1101	102	2.6666666666666665
3179	1102	99	2.6666666666666665
3180	1102	100	3.6666666666666665
3149	1094	101	3.3333333333333335
3181	1102	101	3
3182	1102	102	2.3333333333333335
3183	1103	99	4
3184	1103	100	3.3333333333333335
3185	1103	101	2.6666666666666665
3186	1103	102	2
3187	1104	99	4
3188	1104	100	3.3333333333333335
3189	1104	101	2.6666666666666665
3190	1104	102	2
3192	1105	100	3
3191	1105	99	3.6666666666666665
3193	1105	101	2.3333333333333335
3194	1105	102	3.3333333333333335
3195	1106	99	3.3333333333333335
3196	1106	100	2.6666666666666665
3197	1106	101	3.6666666666666665
3198	1106	102	3
3199	1107	99	3
3200	1107	100	4
3201	1107	101	3.3333333333333335
3202	1107	102	2.6666666666666665
3203	1108	99	3
3204	1108	100	4
3205	1108	101	3.3333333333333335
3206	1108	102	2.6666666666666665
3209	1109	101	3
3207	1109	99	2.6666666666666665
3208	1109	100	3.6666666666666665
3210	1109	102	2.3333333333333335
3211	1110	99	2.3333333333333335
3212	1110	100	3.3333333333333335
3213	1110	101	2.6666666666666665
3214	1110	102	3.6666666666666665
3215	1111	99	2
3216	1111	100	3
3217	1111	101	4
3218	1111	102	3.3333333333333335
3243	1122	99	2.6666666666666665
3244	1122	100	3.6666666666666665
3245	1122	101	3
3246	1122	102	2.3333333333333335
3226	1113	102	3
3223	1113	99	3.3333333333333335
3224	1113	100	2.6666666666666665
3225	1113	101	3.6666666666666665
3227	1114	99	3
3228	1114	100	2.3333333333333335
3229	1114	101	3.3333333333333335
3230	1114	102	2.6666666666666665
3231	1115	99	2.6666666666666665
3232	1115	100	2
3233	1115	101	3
3234	1115	102	4
3247	1123	99	4
3248	1123	100	3.3333333333333335
3249	1123	101	2.6666666666666665
3235	1116	99	2.6666666666666665
3236	1116	100	2
3237	1116	101	3
3238	1116	102	4
3250	1123	102	2
3239	1121	99	3
3240	1121	100	2.3333333333333335
3241	1121	101	3.3333333333333335
3242	1121	102	2.6666666666666665
3251	1124	99	4
3252	1124	100	3.3333333333333335
3253	1124	101	2.6666666666666665
3254	1124	102	2
3256	1125	100	3
3255	1125	99	3.6666666666666665
3257	1125	101	2.3333333333333335
3258	1125	102	3.3333333333333335
3259	1126	99	3.3333333333333335
3260	1126	100	2.6666666666666665
3261	1126	101	3.6666666666666665
3262	1126	102	3
3263	1127	99	3
3264	1127	100	4
3265	1127	101	3.3333333333333335
3266	1127	102	2.6666666666666665
3267	1128	99	3
3268	1128	100	4
3269	1128	101	3.3333333333333335
3270	1128	102	2.6666666666666665
3273	1129	101	3
3271	1129	99	2.6666666666666665
3272	1129	100	3.6666666666666665
3274	1129	102	2.3333333333333335
3275	1130	99	2.3333333333333335
3276	1130	100	3.3333333333333335
3277	1130	101	2.6666666666666665
3278	1130	102	3.6666666666666665
3279	1131	99	2
3280	1131	100	3
3281	1131	101	4
3282	1131	102	3.3333333333333335
3283	1132	99	2
3284	1132	100	3
3285	1132	101	4
3286	1132	102	3.3333333333333335
3290	1133	102	3
3287	1133	99	3.3333333333333335
3288	1133	100	2.6666666666666665
3289	1133	101	3.6666666666666665
3291	1134	99	3
3292	1134	100	2.3333333333333335
3293	1134	101	3.3333333333333335
3294	1134	102	2.6666666666666665
3295	1135	99	2.6666666666666665
3296	1135	100	2
3297	1135	101	3
3298	1135	102	4
3299	1136	99	2.6666666666666665
3300	1136	100	2
3301	1136	101	3
3302	1136	102	4
3303	1137	99	2.3333333333333335
3304	1137	100	3.3333333333333335
3305	1137	101	2.6666666666666665
3306	1137	102	3.6666666666666665
3307	1138	99	3.6666666666666665
3308	1138	100	3
3309	1138	101	2.3333333333333335
3310	1138	102	3.3333333333333335
3311	1139	99	3.3333333333333335
3312	1139	100	2.6666666666666665
3313	1139	101	2
3314	1139	102	3
3315	1140	99	3.3333333333333335
3316	1140	100	2.6666666666666665
3317	1140	101	2
3318	1140	102	3
3319	1141	99	3
3320	1141	100	2.3333333333333335
3321	1141	101	3.3333333333333335
3322	1141	102	2.6666666666666665
3323	1142	99	2.6666666666666665
3324	1142	100	3.6666666666666665
3325	1142	101	3
3326	1142	102	2.3333333333333335
3327	1143	99	4
3328	1143	100	3.3333333333333335
3329	1143	101	2.6666666666666665
3330	1143	102	2
3331	1144	99	4
3332	1144	100	3.3333333333333335
3333	1144	101	2.6666666666666665
3334	1144	102	2
3336	1145	100	3
3335	1145	99	3.6666666666666665
3337	1145	101	2.3333333333333335
3338	1145	102	3.3333333333333335
3339	1146	99	3.3333333333333335
3340	1146	100	2.6666666666666665
3341	1146	101	3.6666666666666665
3342	1146	102	3
3343	1147	99	3
3344	1147	100	4
3345	1147	101	3.3333333333333335
3346	1147	102	2.6666666666666665
3347	1148	99	3
3348	1148	100	4
3349	1148	101	3.3333333333333335
3350	1148	102	2.6666666666666665
3353	1149	101	3
3351	1149	99	2.6666666666666665
3352	1149	100	3.6666666666666665
3354	1149	102	2.3333333333333335
3355	1150	99	2.3333333333333335
3356	1150	100	3.3333333333333335
3357	1150	101	2.6666666666666665
3358	1150	102	3.6666666666666665
3359	1151	99	2
3360	1151	100	3
3361	1151	101	4
3362	1151	102	3.3333333333333335
3363	1152	99	2
3364	1152	100	3
3365	1152	101	4
3366	1152	102	3.3333333333333335
3370	1153	102	3
3367	1153	99	3.3333333333333335
3368	1153	100	2.6666666666666665
3369	1153	101	3.6666666666666665
3371	1154	99	3
3372	1154	100	2.3333333333333335
3373	1154	101	3.3333333333333335
3374	1154	102	2.6666666666666665
3375	1155	99	2.6666666666666665
3376	1155	100	2
3377	1155	101	3
3378	1155	102	4
3379	1158	99	3.6666666666666665
3380	1158	100	3
3381	1158	101	2.3333333333333335
3382	1158	102	3.3333333333333335
3383	1159	99	3.3333333333333335
3384	1159	100	2.6666666666666665
3385	1159	101	2
3386	1159	102	3
3387	1160	99	3.3333333333333335
3388	1160	100	2.6666666666666665
3389	1160	101	2
3390	1160	102	3
3219	1112	99	3
3220	1112	100	3
3221	1112	101	3
3222	1112	102	3
3391	1161	99	3.5
3392	1161	100	3.5
3393	1161	101	3.5
3394	1161	102	3.5
3395	1162	99	4
3396	1162	100	4
3397	1162	101	4
3398	1162	102	4
3399	1163	99	4.5
3400	1163	100	4.5
3401	1163	101	4.5
3402	1163	102	4.5
3403	1164	99	4.166666666666667
3404	1164	100	4.166666666666667
3405	1164	101	4.166666666666667
3406	1164	102	4.166666666666667
3407	1165	99	3.8333333333333335
3408	1165	100	3.8333333333333335
3409	1165	101	3.8333333333333335
3410	1165	102	3.8333333333333335
3411	1166	99	3.5
3412	1166	100	3.5
3413	1166	101	3.5
3414	1166	102	3.5
3415	1167	99	4
3416	1167	100	4
3417	1167	101	4
3418	1167	102	4
3419	1168	99	4.75
3420	1168	100	4.75
3421	1168	101	4.75
3422	1168	102	4.75
3423	1169	99	4.166666666666667
3424	1169	100	4.166666666666667
3425	1169	101	4.166666666666667
3426	1169	102	4.166666666666667
3427	1170	99	3.8333333333333335
3428	1170	100	3.8333333333333335
3429	1170	101	3.8333333333333335
3430	1170	102	3.8333333333333335
3431	1171	99	4
3432	1171	100	4
3433	1171	101	4
3434	1171	102	4
3435	1172	99	2.75
3436	1172	100	3.75
3437	1172	101	3.5
3438	1172	102	3.25
3439	1173	99	4
3440	1173	100	3.3333333333333335
3441	1173	101	2.6666666666666665
3442	1173	102	2
\.


--
-- Data for Name: call_for_participations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.call_for_participations (id, start_date, end_date, hard_deadline, welcome_text, conference_id, created_at, updated_at, info_url, contact_email) FROM stdin;
43	2026-07-04	2026-08-13	2026-08-17	Welcome to the DemoConf 2026 Call for Participation!\n\nSubmit a talk, a workshop or a lightning talk. Everything you see here is demo data.	43	2026-08-03 10:34:47.539985	2026-08-03 10:34:47.539985	https://democonf.example.org/cfp	cfp@democonf.example.org
44	2026-07-14	2026-08-13	\N	The Ruby devroom is looking for short talks.	44	2026-08-03 10:34:51.863451	2026-08-03 10:34:51.863451	\N	\N
45	2026-06-04	2026-08-17	2026-08-24	Welcome to the DemoConf 2025 Call for Participation!\n\nWe are looking for lectures, workshops and lightning talks. Tell us what you want to talk about, how long you need and when you are available - the rest is up to the review team.\n\nEverything you see here is demo data.	45	2026-08-03 10:34:52.173657	2026-08-03 10:34:52.173657	https://democonf.example.org/cfp	cfp@democonf.example.org
\.


--
-- Data for Name: classifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.classifiers (id, name, description, conference_id, created_at, updated_at) FROM stdin;
68	Needs translation	Talk requires live translation	43	2026-08-03 10:34:47.56929	2026-08-03 10:34:47.56929
69	Streaming ok	Speaker agreed to live streaming	43	2026-08-03 10:34:47.572861	2026-08-03 10:34:47.572861
70	Needs translation	Talk requires live translation	45	2026-08-03 10:34:52.189056	2026-08-03 10:34:52.189056
71	Streaming ok	Speaker agreed to live streaming	45	2026-08-03 10:34:52.19067	2026-08-03 10:34:52.19067
72	Beginner friendly	No prior knowledge required	45	2026-08-03 10:34:52.19224	2026-08-03 10:34:52.19224
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
138	orga	356	43	2026-08-03 10:34:47.586514	2026-08-03 10:34:47.586514
139	coordinator	357	43	2026-08-03 10:34:47.587967	2026-08-03 10:34:47.587967
140	reviewer	358	43	2026-08-03 10:34:47.589197	2026-08-03 10:34:47.589197
141	reviewer	359	43	2026-08-03 10:34:47.590348	2026-08-03 10:34:47.590348
142	orga	356	44	2026-08-03 10:34:51.864784	2026-08-03 10:34:51.864784
143	reviewer	358	44	2026-08-03 10:34:51.865934	2026-08-03 10:34:51.865934
144	orga	356	45	2026-08-03 10:34:52.210772	2026-08-03 10:34:52.210772
145	coordinator	357	45	2026-08-03 10:34:52.211825	2026-08-03 10:34:52.211825
146	reviewer	358	45	2026-08-03 10:34:52.212776	2026-08-03 10:34:52.212776
147	reviewer	359	45	2026-08-03 10:34:52.213727	2026-08-03 10:34:52.213727
\.


--
-- Data for Name: conferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conferences (id, acronym, title, timezone, timeslot_duration, default_timeslots, max_timeslots, feedback_enabled, created_at, updated_at, email, program_export_base_url, schedule_version, schedule_public, color, ticket_type, event_state_visible, schedule_custom_css, schedule_html_intro, default_recording_license, expenses_enabled, transport_needs_enabled, parent_id, bulk_notification_enabled, logo_file_name, logo_content_type, logo_file_size, logo_updated_at, schedule_open, start_date, end_date, attachment_title_is_freeform, allowed_event_types, allowed_event_timeslots_csv, bcc_address, mail_sent) FROM stdin;
43	demo2026	DemoConf 2026	Berlin	15	4	16	t	2026-08-03 10:34:47.480627	2026-08-03 10:36:00.074409	info@democonf.example.org	\N	1.0	t	4a90d9	integrated	t	\N	<p>Welcome to the DemoConf 2026 schedule. This data was generated by <code>rails demo:seed</code>.</p>	CC BY-SA 4.0	t	t	\N	f	\N	\N	\N	\N	f	2026-08-24 07:00:00	2026-08-26 18:00:00	t	lecture;workshop;lightning_talk;podium;other	2,4,8	\N	{}
44	rubyroom	Ruby Devroom @ DemoConf 2026	Berlin	15	2	8	t	2026-08-03 10:34:51.85051	2026-08-03 10:34:51.85051	ruby@democonf.example.org	\N	\N	t	d0021b	integrated	t	\N	\N	\N	f	f	43	t	\N	\N	\N	\N	f	2026-08-24 07:00:00	2026-08-26 18:00:00	t	lecture;lightning_talk	2,4	\N	{}
45	demo2025	DemoConf 2025	Berlin	15	4	16	t	2026-08-03 10:34:52.137229	2026-08-03 10:36:00.099307	info@democonf.example.org	\N	1.4	t	7ed321	integrated	t	\N	<p>Welcome to the DemoConf 2025 schedule. All of this is demo data generated by <code>rails demo:seed</code>.</p>	CC BY-SA 4.0	t	t	\N	f	\N	\N	\N	\N	f	2026-08-02 07:00:00	2026-08-04 13:00:00	f	lecture;workshop;lightning_talk;podium;meeting;other;Paper Presentation;Special Session;Non-academic Session	2,4,6,8,12	archive@democonf.example.org	{}
\.


--
-- Data for Name: conflicts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conflicts (id, event_id, conflicting_event_id, person_id, conflict_type, severity, created_at, updated_at) FROM stdin;
2875	1137	\N	366	person_unavailable	warning	2026-08-03 10:35:52.540604	2026-08-03 10:35:52.540604
2931	1107	\N	380	person_has_no_availability	warning	2026-08-03 10:35:58.920326	2026-08-03 10:35:58.920326
2942	1106	1128	379	person_already_speaking	warning	2026-08-03 10:35:59.280336	2026-08-03 10:35:59.280336
2943	1128	1106	379	person_already_speaking	warning	2026-08-03 10:35:59.281595	2026-08-03 10:35:59.281595
2950	1129	\N	380	person_has_no_availability	warning	2026-08-03 10:35:59.381013	2026-08-03 10:35:59.381013
2958	1130	\N	381	person_has_no_availability	warning	2026-08-03 10:35:59.513507	2026-08-03 10:35:59.513507
2959	1135	\N	364	person_unavailable	warning	2026-08-03 10:35:59.845749	2026-08-03 10:35:59.845749
2960	1089	\N	362	person_unavailable	warning	2026-08-03 10:36:00.046749	2026-08-03 10:36:00.046749
\.


--
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.days (id, conference_id, start_date, end_date) FROM stdin;
84	43	2026-08-24 07:00:00	2026-08-24 18:00:00
85	43	2026-08-25 07:00:00	2026-08-25 18:00:00
86	43	2026-08-26 07:00:00	2026-08-26 18:00:00
87	45	2026-08-02 07:00:00	2026-08-02 13:00:00
88	45	2026-08-03 07:00:00	2026-08-03 13:00:00
89	45	2026-08-04 07:00:00	2026-08-04 13:00:00
\.


--
-- Data for Name: event_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_attachments (id, event_id, title, attachment_file_name, attachment_content_type, attachment_file_size, attachment_updated_at, created_at, updated_at, public) FROM stdin;
181	1087	proposal	demo_proposal.txt	text/plain	87	2026-08-03 10:34:52.271819	2026-08-03 10:34:52.283831	2026-08-03 10:34:52.283831	t
182	1091	media	demo_media.txt	text/plain	86	2026-08-03 10:34:52.8813	2026-08-03 10:34:52.893869	2026-08-03 10:34:52.893869	t
183	1095	poster	demo_poster.txt	text/plain	82	2026-08-03 10:34:53.246785	2026-08-03 10:34:53.258845	2026-08-03 10:34:53.258845	t
184	1099	video	demo_video.txt	text/plain	80	2026-08-03 10:34:53.662689	2026-08-03 10:34:53.67444	2026-08-03 10:34:53.67444	t
185	1103	slides	demo_slides.txt	text/plain	85	2026-08-03 10:34:54.131994	2026-08-03 10:34:54.142312	2026-08-03 10:34:54.142312	t
186	1107	other	demo_other.txt	text/plain	85	2026-08-03 10:34:54.470832	2026-08-03 10:34:54.485997	2026-08-03 10:34:54.485997	t
187	1111	handouts	demo_handouts.txt	text/plain	75	2026-08-03 10:34:54.923055	2026-08-03 10:34:54.935156	2026-08-03 10:34:54.935156	t
188	1115	proposal	demo_proposal.txt	text/plain	79	2026-08-03 10:34:55.310707	2026-08-03 10:34:55.327367	2026-08-03 10:34:55.327367	t
189	1119	media	demo_media.txt	text/plain	75	2026-08-03 10:34:55.49155	2026-08-03 10:34:55.501989	2026-08-03 10:34:55.501989	t
190	1123	poster	demo_poster.txt	text/plain	90	2026-08-03 10:34:55.738176	2026-08-03 10:34:55.749896	2026-08-03 10:34:55.749896	t
191	1127	video	demo_video.txt	text/plain	89	2026-08-03 10:34:56.259099	2026-08-03 10:34:56.270068	2026-08-03 10:34:56.270068	t
192	1131	slides	demo_slides.txt	text/plain	75	2026-08-03 10:34:56.573882	2026-08-03 10:34:56.583994	2026-08-03 10:34:56.583994	t
193	1135	other	demo_other.txt	text/plain	83	2026-08-03 10:34:56.901262	2026-08-03 10:34:56.910865	2026-08-03 10:34:56.910865	t
194	1139	handouts	demo_handouts.txt	text/plain	76	2026-08-03 10:34:57.209224	2026-08-03 10:34:57.220008	2026-08-03 10:34:57.220008	t
195	1143	proposal	demo_proposal.txt	text/plain	79	2026-08-03 10:34:57.523857	2026-08-03 10:34:57.534061	2026-08-03 10:34:57.534061	t
196	1147	media	demo_media.txt	text/plain	80	2026-08-03 10:34:57.893911	2026-08-03 10:34:57.905287	2026-08-03 10:34:57.905287	t
197	1151	poster	demo_poster.txt	text/plain	73	2026-08-03 10:34:58.275546	2026-08-03 10:34:58.286956	2026-08-03 10:34:58.286956	t
198	1155	video	demo_video.txt	text/plain	75	2026-08-03 10:34:58.509805	2026-08-03 10:34:58.520547	2026-08-03 10:34:58.520547	t
199	1159	slides	demo_slides.txt	text/plain	78	2026-08-03 10:34:58.726423	2026-08-03 10:34:58.737038	2026-08-03 10:34:58.737038	t
\.


--
-- Data for Name: event_classifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_classifiers (id, value, classifier_id, event_id, created_at, updated_at) FROM stdin;
2670	0	68	1062	2026-08-03 10:34:47.652242	2026-08-03 10:34:47.652242
2671	1	69	1062	2026-08-03 10:34:47.65674	2026-08-03 10:34:47.65674
2672	1	68	1063	2026-08-03 10:34:47.743288	2026-08-03 10:34:47.743288
2673	2	69	1063	2026-08-03 10:34:47.74719	2026-08-03 10:34:47.74719
2674	1	68	1064	2026-08-03 10:34:47.838978	2026-08-03 10:34:47.838978
2675	2	69	1064	2026-08-03 10:34:47.842408	2026-08-03 10:34:47.842408
2676	0	68	1065	2026-08-03 10:34:47.932698	2026-08-03 10:34:47.932698
2677	1	69	1065	2026-08-03 10:34:47.93552	2026-08-03 10:34:47.93552
2678	0	68	1066	2026-08-03 10:34:48.004929	2026-08-03 10:34:48.004929
2679	0	69	1066	2026-08-03 10:34:48.007078	2026-08-03 10:34:48.007078
2680	1	68	1067	2026-08-03 10:34:48.090254	2026-08-03 10:34:48.090254
2681	1	69	1067	2026-08-03 10:34:48.092952	2026-08-03 10:34:48.092952
2682	0	68	1068	2026-08-03 10:34:48.162746	2026-08-03 10:34:48.162746
2683	1	69	1068	2026-08-03 10:34:48.165093	2026-08-03 10:34:48.165093
2684	0	68	1069	2026-08-03 10:34:48.228931	2026-08-03 10:34:48.228931
2685	1	69	1069	2026-08-03 10:34:48.231846	2026-08-03 10:34:48.231846
2686	1	68	1070	2026-08-03 10:34:48.301069	2026-08-03 10:34:48.301069
2687	1	69	1070	2026-08-03 10:34:48.303119	2026-08-03 10:34:48.303119
2688	0	68	1071	2026-08-03 10:34:48.370943	2026-08-03 10:34:48.370943
2689	0	69	1071	2026-08-03 10:34:48.373101	2026-08-03 10:34:48.373101
2690	0	68	1072	2026-08-03 10:34:48.431874	2026-08-03 10:34:48.431874
2691	2	69	1072	2026-08-03 10:34:48.433985	2026-08-03 10:34:48.433985
2692	2	68	1073	2026-08-03 10:34:48.497615	2026-08-03 10:34:48.497615
2693	2	69	1073	2026-08-03 10:34:48.499727	2026-08-03 10:34:48.499727
2694	1	68	1074	2026-08-03 10:34:48.575138	2026-08-03 10:34:48.575138
2695	0	69	1074	2026-08-03 10:34:48.577268	2026-08-03 10:34:48.577268
2696	2	68	1075	2026-08-03 10:34:48.610139	2026-08-03 10:34:48.610139
2697	2	69	1075	2026-08-03 10:34:48.612487	2026-08-03 10:34:48.612487
2698	0	68	1076	2026-08-03 10:34:48.667869	2026-08-03 10:34:48.667869
2699	2	69	1076	2026-08-03 10:34:48.670054	2026-08-03 10:34:48.670054
2700	0	68	1077	2026-08-03 10:34:48.719228	2026-08-03 10:34:48.719228
2701	1	69	1077	2026-08-03 10:34:48.723149	2026-08-03 10:34:48.723149
2702	0	68	1078	2026-08-03 10:34:48.757127	2026-08-03 10:34:48.757127
2703	0	69	1078	2026-08-03 10:34:48.759508	2026-08-03 10:34:48.759508
2704	1	68	1079	2026-08-03 10:34:48.800167	2026-08-03 10:34:48.800167
2705	1	69	1079	2026-08-03 10:34:48.802281	2026-08-03 10:34:48.802281
2706	2	68	1080	2026-08-03 10:34:48.850081	2026-08-03 10:34:48.850081
2707	1	69	1080	2026-08-03 10:34:48.852392	2026-08-03 10:34:48.852392
2708	2	68	1081	2026-08-03 10:34:48.890472	2026-08-03 10:34:48.890472
2709	1	69	1081	2026-08-03 10:34:48.892971	2026-08-03 10:34:48.892971
2710	0	70	1087	2026-08-03 10:34:52.249662	2026-08-03 10:34:52.249662
2711	1	71	1087	2026-08-03 10:34:52.252744	2026-08-03 10:34:52.252744
2712	2	72	1087	2026-08-03 10:34:52.256454	2026-08-03 10:34:52.256454
2713	1	70	1088	2026-08-03 10:34:52.363432	2026-08-03 10:34:52.363432
2714	2	71	1088	2026-08-03 10:34:52.365565	2026-08-03 10:34:52.365565
2715	0	72	1088	2026-08-03 10:34:52.367528	2026-08-03 10:34:52.367528
2716	2	70	1089	2026-08-03 10:34:52.505084	2026-08-03 10:34:52.505084
2717	0	71	1089	2026-08-03 10:34:52.514041	2026-08-03 10:34:52.514041
2718	1	72	1089	2026-08-03 10:34:52.523138	2026-08-03 10:34:52.523138
2719	0	70	1090	2026-08-03 10:34:52.706171	2026-08-03 10:34:52.706171
2720	1	71	1090	2026-08-03 10:34:52.712544	2026-08-03 10:34:52.712544
2721	2	72	1090	2026-08-03 10:34:52.718241	2026-08-03 10:34:52.718241
2722	1	70	1091	2026-08-03 10:34:52.865228	2026-08-03 10:34:52.865228
2723	2	71	1091	2026-08-03 10:34:52.868153	2026-08-03 10:34:52.868153
2724	0	72	1091	2026-08-03 10:34:52.871163	2026-08-03 10:34:52.871163
2725	2	70	1092	2026-08-03 10:34:52.976911	2026-08-03 10:34:52.976911
2726	0	71	1092	2026-08-03 10:34:52.980186	2026-08-03 10:34:52.980186
2727	1	72	1092	2026-08-03 10:34:52.982553	2026-08-03 10:34:52.982553
2728	0	70	1093	2026-08-03 10:34:53.075704	2026-08-03 10:34:53.075704
2729	1	71	1093	2026-08-03 10:34:53.07963	2026-08-03 10:34:53.07963
2730	2	72	1093	2026-08-03 10:34:53.082646	2026-08-03 10:34:53.082646
2731	1	70	1094	2026-08-03 10:34:53.164435	2026-08-03 10:34:53.164435
2732	2	71	1094	2026-08-03 10:34:53.167079	2026-08-03 10:34:53.167079
2733	0	72	1094	2026-08-03 10:34:53.169544	2026-08-03 10:34:53.169544
2734	2	70	1095	2026-08-03 10:34:53.232755	2026-08-03 10:34:53.232755
2735	0	71	1095	2026-08-03 10:34:53.235083	2026-08-03 10:34:53.235083
2736	1	72	1095	2026-08-03 10:34:53.237219	2026-08-03 10:34:53.237219
2737	0	70	1096	2026-08-03 10:34:53.341304	2026-08-03 10:34:53.341304
2738	1	71	1096	2026-08-03 10:34:53.344182	2026-08-03 10:34:53.344182
2739	2	72	1096	2026-08-03 10:34:53.34656	2026-08-03 10:34:53.34656
2740	1	70	1097	2026-08-03 10:34:53.429152	2026-08-03 10:34:53.429152
2741	2	71	1097	2026-08-03 10:34:53.431194	2026-08-03 10:34:53.431194
2742	0	72	1097	2026-08-03 10:34:53.433171	2026-08-03 10:34:53.433171
2743	2	70	1098	2026-08-03 10:34:53.525481	2026-08-03 10:34:53.525481
2744	0	71	1098	2026-08-03 10:34:53.528486	2026-08-03 10:34:53.528486
2745	1	72	1098	2026-08-03 10:34:53.530817	2026-08-03 10:34:53.530817
2746	0	70	1099	2026-08-03 10:34:53.647048	2026-08-03 10:34:53.647048
2747	1	71	1099	2026-08-03 10:34:53.649615	2026-08-03 10:34:53.649615
2748	2	72	1099	2026-08-03 10:34:53.651922	2026-08-03 10:34:53.651922
2749	1	70	1100	2026-08-03 10:34:53.797609	2026-08-03 10:34:53.797609
2750	2	71	1100	2026-08-03 10:34:53.803457	2026-08-03 10:34:53.803457
2751	0	72	1100	2026-08-03 10:34:53.808102	2026-08-03 10:34:53.808102
2752	2	70	1101	2026-08-03 10:34:53.916992	2026-08-03 10:34:53.916992
2753	0	71	1101	2026-08-03 10:34:53.925115	2026-08-03 10:34:53.925115
2754	1	72	1101	2026-08-03 10:34:53.931627	2026-08-03 10:34:53.931627
2755	0	70	1102	2026-08-03 10:34:54.031626	2026-08-03 10:34:54.031626
2756	1	71	1102	2026-08-03 10:34:54.034063	2026-08-03 10:34:54.034063
2757	2	72	1102	2026-08-03 10:34:54.036129	2026-08-03 10:34:54.036129
2758	1	70	1103	2026-08-03 10:34:54.118073	2026-08-03 10:34:54.118073
2759	2	71	1103	2026-08-03 10:34:54.120694	2026-08-03 10:34:54.120694
2760	0	72	1103	2026-08-03 10:34:54.122878	2026-08-03 10:34:54.122878
2761	2	70	1104	2026-08-03 10:34:54.202009	2026-08-03 10:34:54.202009
2762	0	71	1104	2026-08-03 10:34:54.204265	2026-08-03 10:34:54.204265
2763	1	72	1104	2026-08-03 10:34:54.206177	2026-08-03 10:34:54.206177
2764	0	70	1105	2026-08-03 10:34:54.273929	2026-08-03 10:34:54.273929
2765	1	71	1105	2026-08-03 10:34:54.276453	2026-08-03 10:34:54.276453
2766	2	72	1105	2026-08-03 10:34:54.27846	2026-08-03 10:34:54.27846
2767	1	70	1106	2026-08-03 10:34:54.358055	2026-08-03 10:34:54.358055
2768	2	71	1106	2026-08-03 10:34:54.36034	2026-08-03 10:34:54.36034
2769	0	72	1106	2026-08-03 10:34:54.36234	2026-08-03 10:34:54.36234
2770	2	70	1107	2026-08-03 10:34:54.449009	2026-08-03 10:34:54.449009
2771	0	71	1107	2026-08-03 10:34:54.452855	2026-08-03 10:34:54.452855
2772	1	72	1107	2026-08-03 10:34:54.455821	2026-08-03 10:34:54.455821
2773	0	70	1108	2026-08-03 10:34:54.607702	2026-08-03 10:34:54.607702
2774	1	71	1108	2026-08-03 10:34:54.611684	2026-08-03 10:34:54.611684
2775	2	72	1108	2026-08-03 10:34:54.615842	2026-08-03 10:34:54.615842
2776	1	70	1109	2026-08-03 10:34:54.701432	2026-08-03 10:34:54.701432
2777	2	71	1109	2026-08-03 10:34:54.704929	2026-08-03 10:34:54.704929
2778	0	72	1109	2026-08-03 10:34:54.709142	2026-08-03 10:34:54.709142
2779	2	70	1110	2026-08-03 10:34:54.783677	2026-08-03 10:34:54.783677
2780	0	71	1110	2026-08-03 10:34:54.78676	2026-08-03 10:34:54.78676
2781	1	72	1110	2026-08-03 10:34:54.790275	2026-08-03 10:34:54.790275
2782	0	70	1111	2026-08-03 10:34:54.900778	2026-08-03 10:34:54.900778
2783	1	71	1111	2026-08-03 10:34:54.906203	2026-08-03 10:34:54.906203
2784	2	72	1111	2026-08-03 10:34:54.910975	2026-08-03 10:34:54.910975
2785	1	70	1112	2026-08-03 10:34:55.030305	2026-08-03 10:34:55.030305
2786	2	71	1112	2026-08-03 10:34:55.03304	2026-08-03 10:34:55.03304
2787	0	72	1112	2026-08-03 10:34:55.035895	2026-08-03 10:34:55.035895
2788	2	70	1113	2026-08-03 10:34:55.109635	2026-08-03 10:34:55.109635
2789	0	71	1113	2026-08-03 10:34:55.116047	2026-08-03 10:34:55.116047
2790	1	72	1113	2026-08-03 10:34:55.12519	2026-08-03 10:34:55.12519
2791	0	70	1114	2026-08-03 10:34:55.214456	2026-08-03 10:34:55.214456
2792	1	71	1114	2026-08-03 10:34:55.218088	2026-08-03 10:34:55.218088
2793	2	72	1114	2026-08-03 10:34:55.22184	2026-08-03 10:34:55.22184
2794	1	70	1115	2026-08-03 10:34:55.289998	2026-08-03 10:34:55.289998
2795	2	71	1115	2026-08-03 10:34:55.294461	2026-08-03 10:34:55.294461
2796	0	72	1115	2026-08-03 10:34:55.298202	2026-08-03 10:34:55.298202
2797	2	70	1116	2026-08-03 10:34:55.365368	2026-08-03 10:34:55.365368
2798	0	71	1116	2026-08-03 10:34:55.367721	2026-08-03 10:34:55.367721
2799	1	72	1116	2026-08-03 10:34:55.369715	2026-08-03 10:34:55.369715
2800	0	70	1117	2026-08-03 10:34:55.409559	2026-08-03 10:34:55.409559
2801	1	71	1117	2026-08-03 10:34:55.411919	2026-08-03 10:34:55.411919
2802	2	72	1117	2026-08-03 10:34:55.414167	2026-08-03 10:34:55.414167
2803	1	70	1118	2026-08-03 10:34:55.446843	2026-08-03 10:34:55.446843
2804	2	71	1118	2026-08-03 10:34:55.449809	2026-08-03 10:34:55.449809
2805	0	72	1118	2026-08-03 10:34:55.452651	2026-08-03 10:34:55.452651
2806	2	70	1119	2026-08-03 10:34:55.476914	2026-08-03 10:34:55.476914
2807	0	71	1119	2026-08-03 10:34:55.479964	2026-08-03 10:34:55.479964
2808	1	72	1119	2026-08-03 10:34:55.482036	2026-08-03 10:34:55.482036
2809	0	70	1120	2026-08-03 10:34:55.537762	2026-08-03 10:34:55.537762
2810	1	71	1120	2026-08-03 10:34:55.540525	2026-08-03 10:34:55.540525
2811	2	72	1120	2026-08-03 10:34:55.542701	2026-08-03 10:34:55.542701
2812	1	70	1121	2026-08-03 10:34:55.573972	2026-08-03 10:34:55.573972
2813	2	71	1121	2026-08-03 10:34:55.576443	2026-08-03 10:34:55.576443
2814	0	72	1121	2026-08-03 10:34:55.579227	2026-08-03 10:34:55.579227
2815	2	70	1122	2026-08-03 10:34:55.637775	2026-08-03 10:34:55.637775
2816	0	71	1122	2026-08-03 10:34:55.641528	2026-08-03 10:34:55.641528
2817	1	72	1122	2026-08-03 10:34:55.644582	2026-08-03 10:34:55.644582
2818	0	70	1123	2026-08-03 10:34:55.719897	2026-08-03 10:34:55.719897
2819	1	71	1123	2026-08-03 10:34:55.724095	2026-08-03 10:34:55.724095
2820	2	72	1123	2026-08-03 10:34:55.727473	2026-08-03 10:34:55.727473
2821	1	70	1124	2026-08-03 10:34:55.874246	2026-08-03 10:34:55.874246
2822	2	71	1124	2026-08-03 10:34:55.88057	2026-08-03 10:34:55.88057
2823	0	72	1124	2026-08-03 10:34:55.888704	2026-08-03 10:34:55.888704
2824	2	70	1125	2026-08-03 10:34:55.968731	2026-08-03 10:34:55.968731
2825	0	71	1125	2026-08-03 10:34:55.974832	2026-08-03 10:34:55.974832
2826	1	72	1125	2026-08-03 10:34:55.982904	2026-08-03 10:34:55.982904
2827	0	70	1126	2026-08-03 10:34:56.098074	2026-08-03 10:34:56.098074
2828	1	71	1126	2026-08-03 10:34:56.104151	2026-08-03 10:34:56.104151
2829	2	72	1126	2026-08-03 10:34:56.107911	2026-08-03 10:34:56.107911
2830	1	70	1127	2026-08-03 10:34:56.243986	2026-08-03 10:34:56.243986
2831	2	71	1127	2026-08-03 10:34:56.246681	2026-08-03 10:34:56.246681
2832	0	72	1127	2026-08-03 10:34:56.249379	2026-08-03 10:34:56.249379
2833	2	70	1128	2026-08-03 10:34:56.347707	2026-08-03 10:34:56.347707
2834	0	71	1128	2026-08-03 10:34:56.350434	2026-08-03 10:34:56.350434
2835	1	72	1128	2026-08-03 10:34:56.352535	2026-08-03 10:34:56.352535
2836	0	70	1129	2026-08-03 10:34:56.414777	2026-08-03 10:34:56.414777
2837	1	71	1129	2026-08-03 10:34:56.416724	2026-08-03 10:34:56.416724
2838	2	72	1129	2026-08-03 10:34:56.41881	2026-08-03 10:34:56.41881
2839	1	70	1130	2026-08-03 10:34:56.48597	2026-08-03 10:34:56.48597
2840	2	71	1130	2026-08-03 10:34:56.488736	2026-08-03 10:34:56.488736
2841	0	72	1130	2026-08-03 10:34:56.490993	2026-08-03 10:34:56.490993
2842	2	70	1131	2026-08-03 10:34:56.559817	2026-08-03 10:34:56.559817
2843	0	71	1131	2026-08-03 10:34:56.562022	2026-08-03 10:34:56.562022
2844	1	72	1131	2026-08-03 10:34:56.564175	2026-08-03 10:34:56.564175
2845	0	70	1132	2026-08-03 10:34:56.677414	2026-08-03 10:34:56.677414
2846	1	71	1132	2026-08-03 10:34:56.679686	2026-08-03 10:34:56.679686
2847	2	72	1132	2026-08-03 10:34:56.681979	2026-08-03 10:34:56.681979
2848	1	70	1133	2026-08-03 10:34:56.752974	2026-08-03 10:34:56.752974
2849	2	71	1133	2026-08-03 10:34:56.756273	2026-08-03 10:34:56.756273
2850	0	72	1133	2026-08-03 10:34:56.759177	2026-08-03 10:34:56.759177
2851	2	70	1134	2026-08-03 10:34:56.818986	2026-08-03 10:34:56.818986
2852	0	71	1134	2026-08-03 10:34:56.821243	2026-08-03 10:34:56.821243
2853	1	72	1134	2026-08-03 10:34:56.824447	2026-08-03 10:34:56.824447
2854	0	70	1135	2026-08-03 10:34:56.886539	2026-08-03 10:34:56.886539
2855	1	71	1135	2026-08-03 10:34:56.888757	2026-08-03 10:34:56.888757
2856	2	72	1135	2026-08-03 10:34:56.891009	2026-08-03 10:34:56.891009
2857	1	70	1136	2026-08-03 10:34:56.98294	2026-08-03 10:34:56.98294
2858	2	71	1136	2026-08-03 10:34:56.985078	2026-08-03 10:34:56.985078
2859	0	72	1136	2026-08-03 10:34:56.987042	2026-08-03 10:34:56.987042
2860	2	70	1137	2026-08-03 10:34:57.047348	2026-08-03 10:34:57.047348
2861	0	71	1137	2026-08-03 10:34:57.049971	2026-08-03 10:34:57.049971
2862	1	72	1137	2026-08-03 10:34:57.05265	2026-08-03 10:34:57.05265
2863	0	70	1138	2026-08-03 10:34:57.116243	2026-08-03 10:34:57.116243
2864	1	71	1138	2026-08-03 10:34:57.118391	2026-08-03 10:34:57.118391
2865	2	72	1138	2026-08-03 10:34:57.120525	2026-08-03 10:34:57.120525
2866	1	70	1139	2026-08-03 10:34:57.193516	2026-08-03 10:34:57.193516
2867	2	71	1139	2026-08-03 10:34:57.196832	2026-08-03 10:34:57.196832
2868	0	72	1139	2026-08-03 10:34:57.199152	2026-08-03 10:34:57.199152
2869	2	70	1140	2026-08-03 10:34:57.295628	2026-08-03 10:34:57.295628
2870	0	71	1140	2026-08-03 10:34:57.297864	2026-08-03 10:34:57.297864
2871	1	72	1140	2026-08-03 10:34:57.299889	2026-08-03 10:34:57.299889
2872	0	70	1141	2026-08-03 10:34:57.362458	2026-08-03 10:34:57.362458
2873	1	71	1141	2026-08-03 10:34:57.364999	2026-08-03 10:34:57.364999
2874	2	72	1141	2026-08-03 10:34:57.367446	2026-08-03 10:34:57.367446
2875	1	70	1142	2026-08-03 10:34:57.431942	2026-08-03 10:34:57.431942
2876	2	71	1142	2026-08-03 10:34:57.434505	2026-08-03 10:34:57.434505
2877	0	72	1142	2026-08-03 10:34:57.436987	2026-08-03 10:34:57.436987
2878	2	70	1143	2026-08-03 10:34:57.501786	2026-08-03 10:34:57.501786
2879	0	71	1143	2026-08-03 10:34:57.504213	2026-08-03 10:34:57.504213
2880	1	72	1143	2026-08-03 10:34:57.513417	2026-08-03 10:34:57.513417
2881	0	70	1144	2026-08-03 10:34:57.601568	2026-08-03 10:34:57.601568
2882	1	71	1144	2026-08-03 10:34:57.604555	2026-08-03 10:34:57.604555
2883	2	72	1144	2026-08-03 10:34:57.606917	2026-08-03 10:34:57.606917
2884	1	70	1145	2026-08-03 10:34:57.69524	2026-08-03 10:34:57.69524
2885	2	71	1145	2026-08-03 10:34:57.69763	2026-08-03 10:34:57.69763
2886	0	72	1145	2026-08-03 10:34:57.700136	2026-08-03 10:34:57.700136
2887	2	70	1146	2026-08-03 10:34:57.785174	2026-08-03 10:34:57.785174
2888	0	71	1146	2026-08-03 10:34:57.788608	2026-08-03 10:34:57.788608
2889	1	72	1146	2026-08-03 10:34:57.79074	2026-08-03 10:34:57.79074
2890	0	70	1147	2026-08-03 10:34:57.877763	2026-08-03 10:34:57.877763
2891	1	71	1147	2026-08-03 10:34:57.881113	2026-08-03 10:34:57.881113
2892	2	72	1147	2026-08-03 10:34:57.883676	2026-08-03 10:34:57.883676
2893	1	70	1148	2026-08-03 10:34:57.983108	2026-08-03 10:34:57.983108
2894	2	71	1148	2026-08-03 10:34:57.98543	2026-08-03 10:34:57.98543
2895	0	72	1148	2026-08-03 10:34:57.98793	2026-08-03 10:34:57.98793
2896	2	70	1149	2026-08-03 10:34:58.094068	2026-08-03 10:34:58.094068
2897	0	71	1149	2026-08-03 10:34:58.096728	2026-08-03 10:34:58.096728
2898	1	72	1149	2026-08-03 10:34:58.09884	2026-08-03 10:34:58.09884
2899	0	70	1150	2026-08-03 10:34:58.187405	2026-08-03 10:34:58.187405
2900	1	71	1150	2026-08-03 10:34:58.190022	2026-08-03 10:34:58.190022
2901	2	72	1150	2026-08-03 10:34:58.192368	2026-08-03 10:34:58.192368
2902	1	70	1151	2026-08-03 10:34:58.260432	2026-08-03 10:34:58.260432
2903	2	71	1151	2026-08-03 10:34:58.263336	2026-08-03 10:34:58.263336
2904	0	72	1151	2026-08-03 10:34:58.266008	2026-08-03 10:34:58.266008
2905	2	70	1152	2026-08-03 10:34:58.350013	2026-08-03 10:34:58.350013
2906	0	71	1152	2026-08-03 10:34:58.35212	2026-08-03 10:34:58.35212
2907	1	72	1152	2026-08-03 10:34:58.354213	2026-08-03 10:34:58.354213
2908	0	70	1153	2026-08-03 10:34:58.414713	2026-08-03 10:34:58.414713
2909	1	71	1153	2026-08-03 10:34:58.417667	2026-08-03 10:34:58.417667
2910	2	72	1153	2026-08-03 10:34:58.420126	2026-08-03 10:34:58.420126
2911	1	70	1154	2026-08-03 10:34:58.455584	2026-08-03 10:34:58.455584
2912	2	71	1154	2026-08-03 10:34:58.45819	2026-08-03 10:34:58.45819
2913	0	72	1154	2026-08-03 10:34:58.460243	2026-08-03 10:34:58.460243
2914	2	70	1155	2026-08-03 10:34:58.494864	2026-08-03 10:34:58.494864
2915	0	71	1155	2026-08-03 10:34:58.497738	2026-08-03 10:34:58.497738
2916	1	72	1155	2026-08-03 10:34:58.500159	2026-08-03 10:34:58.500159
2917	0	70	1156	2026-08-03 10:34:58.576179	2026-08-03 10:34:58.576179
2918	1	71	1156	2026-08-03 10:34:58.578817	2026-08-03 10:34:58.578817
2919	2	72	1156	2026-08-03 10:34:58.581339	2026-08-03 10:34:58.581339
2920	1	70	1157	2026-08-03 10:34:58.614362	2026-08-03 10:34:58.614362
2921	2	71	1157	2026-08-03 10:34:58.616777	2026-08-03 10:34:58.616777
2922	0	72	1157	2026-08-03 10:34:58.619169	2026-08-03 10:34:58.619169
2923	2	70	1158	2026-08-03 10:34:58.649695	2026-08-03 10:34:58.649695
2924	0	71	1158	2026-08-03 10:34:58.6521	2026-08-03 10:34:58.6521
2925	1	72	1158	2026-08-03 10:34:58.654338	2026-08-03 10:34:58.654338
2926	0	70	1159	2026-08-03 10:34:58.710658	2026-08-03 10:34:58.710658
2927	1	71	1159	2026-08-03 10:34:58.713796	2026-08-03 10:34:58.713796
2928	2	72	1159	2026-08-03 10:34:58.716469	2026-08-03 10:34:58.716469
2929	1	70	1160	2026-08-03 10:34:58.789387	2026-08-03 10:34:58.789387
2930	2	71	1160	2026-08-03 10:34:58.791975	2026-08-03 10:34:58.791975
2931	0	72	1160	2026-08-03 10:34:58.794045	2026-08-03 10:34:58.794045
\.


--
-- Data for Name: event_feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_feedbacks (id, event_id, rating, comment, created_at, updated_at) FROM stdin;
1277	1087	3	Really useful, thanks!	2026-08-03 10:35:54.922383	2026-08-03 10:35:54.922383
1278	1087	4	A bit too fast for me.	2026-08-03 10:35:54.949855	2026-08-03 10:35:54.949855
1279	1087	5	Best talk of the day.	2026-08-03 10:35:54.971745	2026-08-03 10:35:54.971745
1280	1087	4.5	Good content, the room was too small.	2026-08-03 10:35:54.991611	2026-08-03 10:35:54.991611
1281	1088	4	A bit too fast for me.	2026-08-03 10:35:55.011585	2026-08-03 10:35:55.011585
1282	1088	5	Best talk of the day.	2026-08-03 10:35:55.044318	2026-08-03 10:35:55.044318
1283	1088	4.5	Good content, the room was too small.	2026-08-03 10:35:55.075101	2026-08-03 10:35:55.075101
1284	1088	2.5	\N	2026-08-03 10:35:55.105243	2026-08-03 10:35:55.105243
1285	1088	5	I would have liked more live demos.	2026-08-03 10:35:55.135778	2026-08-03 10:35:55.135778
1286	1089	5	Best talk of the day.	2026-08-03 10:35:55.190307	2026-08-03 10:35:55.190307
1287	1089	4.5	Good content, the room was too small.	2026-08-03 10:35:55.245434	2026-08-03 10:35:55.245434
1288	1089	2.5	\N	2026-08-03 10:35:55.292505	2026-08-03 10:35:55.292505
1289	1089	5	I would have liked more live demos.	2026-08-03 10:35:55.316492	2026-08-03 10:35:55.316492
1290	1089	4	Great speaker, clear slides.	2026-08-03 10:35:55.34117	2026-08-03 10:35:55.34117
1291	1089	3	Really useful, thanks!	2026-08-03 10:35:55.363527	2026-08-03 10:35:55.363527
1292	1090	4.5	Good content, the room was too small.	2026-08-03 10:35:55.386169	2026-08-03 10:35:55.386169
1293	1090	2.5	\N	2026-08-03 10:35:55.410555	2026-08-03 10:35:55.410555
1294	1090	5	I would have liked more live demos.	2026-08-03 10:35:55.430767	2026-08-03 10:35:55.430767
1295	1090	4	Great speaker, clear slides.	2026-08-03 10:35:55.451168	2026-08-03 10:35:55.451168
1296	1090	3	Really useful, thanks!	2026-08-03 10:35:55.473903	2026-08-03 10:35:55.473903
1297	1090	4	A bit too fast for me.	2026-08-03 10:35:55.495104	2026-08-03 10:35:55.495104
1298	1090	5	Best talk of the day.	2026-08-03 10:35:55.517282	2026-08-03 10:35:55.517282
1299	1091	2.5	\N	2026-08-03 10:35:55.541556	2026-08-03 10:35:55.541556
1300	1091	5	I would have liked more live demos.	2026-08-03 10:35:55.57562	2026-08-03 10:35:55.57562
1301	1091	4	Great speaker, clear slides.	2026-08-03 10:35:55.612091	2026-08-03 10:35:55.612091
1302	1091	3	Really useful, thanks!	2026-08-03 10:35:55.650842	2026-08-03 10:35:55.650842
1303	1091	4	A bit too fast for me.	2026-08-03 10:35:55.700912	2026-08-03 10:35:55.700912
1304	1091	5	Best talk of the day.	2026-08-03 10:35:55.727274	2026-08-03 10:35:55.727274
1305	1091	4.5	Good content, the room was too small.	2026-08-03 10:35:55.751197	2026-08-03 10:35:55.751197
1306	1091	2.5	\N	2026-08-03 10:35:55.778339	2026-08-03 10:35:55.778339
1307	1092	5	I would have liked more live demos.	2026-08-03 10:35:55.811198	2026-08-03 10:35:55.811198
1308	1092	4	Great speaker, clear slides.	2026-08-03 10:35:55.84533	2026-08-03 10:35:55.84533
1309	1092	3	Really useful, thanks!	2026-08-03 10:35:55.868832	2026-08-03 10:35:55.868832
1310	1092	4	A bit too fast for me.	2026-08-03 10:35:55.900419	2026-08-03 10:35:55.900419
1311	1093	4	Great speaker, clear slides.	2026-08-03 10:35:55.920008	2026-08-03 10:35:55.920008
1312	1093	3	Really useful, thanks!	2026-08-03 10:35:55.952243	2026-08-03 10:35:55.952243
1313	1093	4	A bit too fast for me.	2026-08-03 10:35:55.987396	2026-08-03 10:35:55.987396
1314	1093	5	Best talk of the day.	2026-08-03 10:35:56.02039	2026-08-03 10:35:56.02039
1315	1093	4.5	Good content, the room was too small.	2026-08-03 10:35:56.057972	2026-08-03 10:35:56.057972
1316	1094	3	Really useful, thanks!	2026-08-03 10:35:56.098666	2026-08-03 10:35:56.098666
1317	1094	4	A bit too fast for me.	2026-08-03 10:35:56.125116	2026-08-03 10:35:56.125116
1318	1094	5	Best talk of the day.	2026-08-03 10:35:56.152094	2026-08-03 10:35:56.152094
1319	1094	4.5	Good content, the room was too small.	2026-08-03 10:35:56.179778	2026-08-03 10:35:56.179778
1320	1094	2.5	\N	2026-08-03 10:35:56.210241	2026-08-03 10:35:56.210241
1321	1094	5	I would have liked more live demos.	2026-08-03 10:35:56.23893	2026-08-03 10:35:56.23893
1322	1095	4	A bit too fast for me.	2026-08-03 10:35:56.264241	2026-08-03 10:35:56.264241
1323	1095	5	Best talk of the day.	2026-08-03 10:35:56.295508	2026-08-03 10:35:56.295508
1324	1095	4.5	Good content, the room was too small.	2026-08-03 10:35:56.323335	2026-08-03 10:35:56.323335
1325	1095	2.5	\N	2026-08-03 10:35:56.350656	2026-08-03 10:35:56.350656
1326	1095	5	I would have liked more live demos.	2026-08-03 10:35:56.378384	2026-08-03 10:35:56.378384
1327	1095	4	Great speaker, clear slides.	2026-08-03 10:35:56.406914	2026-08-03 10:35:56.406914
1328	1095	3	Really useful, thanks!	2026-08-03 10:35:56.442957	2026-08-03 10:35:56.442957
1329	1096	5	Best talk of the day.	2026-08-03 10:35:56.469703	2026-08-03 10:35:56.469703
1330	1096	4.5	Good content, the room was too small.	2026-08-03 10:35:56.499001	2026-08-03 10:35:56.499001
1331	1096	2.5	\N	2026-08-03 10:35:56.52149	2026-08-03 10:35:56.52149
1332	1096	5	I would have liked more live demos.	2026-08-03 10:35:56.555733	2026-08-03 10:35:56.555733
1333	1096	4	Great speaker, clear slides.	2026-08-03 10:35:56.580652	2026-08-03 10:35:56.580652
1334	1096	3	Really useful, thanks!	2026-08-03 10:35:56.605886	2026-08-03 10:35:56.605886
1335	1096	4	A bit too fast for me.	2026-08-03 10:35:56.630416	2026-08-03 10:35:56.630416
1336	1096	5	Best talk of the day.	2026-08-03 10:35:56.653303	2026-08-03 10:35:56.653303
1337	1097	4.5	Good content, the room was too small.	2026-08-03 10:35:56.678068	2026-08-03 10:35:56.678068
1338	1097	2.5	\N	2026-08-03 10:35:56.715114	2026-08-03 10:35:56.715114
1339	1097	5	I would have liked more live demos.	2026-08-03 10:35:56.767734	2026-08-03 10:35:56.767734
1340	1097	4	Great speaker, clear slides.	2026-08-03 10:35:56.819079	2026-08-03 10:35:56.819079
1341	1098	2.5	\N	2026-08-03 10:35:56.853779	2026-08-03 10:35:56.853779
1342	1098	5	I would have liked more live demos.	2026-08-03 10:35:56.882428	2026-08-03 10:35:56.882428
1343	1098	4	Great speaker, clear slides.	2026-08-03 10:35:56.911523	2026-08-03 10:35:56.911523
1344	1098	3	Really useful, thanks!	2026-08-03 10:35:56.934214	2026-08-03 10:35:56.934214
1345	1098	4	A bit too fast for me.	2026-08-03 10:35:56.963388	2026-08-03 10:35:56.963388
1346	1099	5	I would have liked more live demos.	2026-08-03 10:35:56.994018	2026-08-03 10:35:56.994018
1347	1099	4	Great speaker, clear slides.	2026-08-03 10:35:57.052639	2026-08-03 10:35:57.052639
1348	1099	3	Really useful, thanks!	2026-08-03 10:35:57.104102	2026-08-03 10:35:57.104102
1349	1099	4	A bit too fast for me.	2026-08-03 10:35:57.154151	2026-08-03 10:35:57.154151
1350	1099	5	Best talk of the day.	2026-08-03 10:35:57.189646	2026-08-03 10:35:57.189646
1351	1099	4.5	Good content, the room was too small.	2026-08-03 10:35:57.21753	2026-08-03 10:35:57.21753
1352	1100	4	Great speaker, clear slides.	2026-08-03 10:35:57.242214	2026-08-03 10:35:57.242214
1353	1100	3	Really useful, thanks!	2026-08-03 10:35:57.270475	2026-08-03 10:35:57.270475
1354	1100	4	A bit too fast for me.	2026-08-03 10:35:57.297742	2026-08-03 10:35:57.297742
1355	1100	5	Best talk of the day.	2026-08-03 10:35:57.325092	2026-08-03 10:35:57.325092
1356	1100	4.5	Good content, the room was too small.	2026-08-03 10:35:57.350575	2026-08-03 10:35:57.350575
1357	1100	2.5	\N	2026-08-03 10:35:57.390676	2026-08-03 10:35:57.390676
1358	1100	5	I would have liked more live demos.	2026-08-03 10:35:57.439475	2026-08-03 10:35:57.439475
1359	1101	3	Really useful, thanks!	2026-08-03 10:35:57.465458	2026-08-03 10:35:57.465458
1360	1101	4	A bit too fast for me.	2026-08-03 10:35:57.490938	2026-08-03 10:35:57.490938
1361	1101	5	Best talk of the day.	2026-08-03 10:35:57.516385	2026-08-03 10:35:57.516385
1362	1101	4.5	Good content, the room was too small.	2026-08-03 10:35:57.546531	2026-08-03 10:35:57.546531
1363	1101	2.5	\N	2026-08-03 10:35:57.582632	2026-08-03 10:35:57.582632
1364	1101	5	I would have liked more live demos.	2026-08-03 10:35:57.617548	2026-08-03 10:35:57.617548
1365	1101	4	Great speaker, clear slides.	2026-08-03 10:35:57.657441	2026-08-03 10:35:57.657441
1366	1101	3	Really useful, thanks!	2026-08-03 10:35:57.691949	2026-08-03 10:35:57.691949
1367	1102	4	A bit too fast for me.	2026-08-03 10:35:57.746932	2026-08-03 10:35:57.746932
1368	1102	5	Best talk of the day.	2026-08-03 10:35:57.7956	2026-08-03 10:35:57.7956
1369	1102	4.5	Good content, the room was too small.	2026-08-03 10:35:57.848795	2026-08-03 10:35:57.848795
1370	1102	2.5	\N	2026-08-03 10:35:57.89257	2026-08-03 10:35:57.89257
1371	1103	5	Best talk of the day.	2026-08-03 10:35:57.928824	2026-08-03 10:35:57.928824
1372	1103	4.5	Good content, the room was too small.	2026-08-03 10:35:57.950798	2026-08-03 10:35:57.950798
1373	1103	2.5	\N	2026-08-03 10:35:57.974446	2026-08-03 10:35:57.974446
1374	1103	5	I would have liked more live demos.	2026-08-03 10:35:57.998558	2026-08-03 10:35:57.998558
1375	1103	4	Great speaker, clear slides.	2026-08-03 10:35:58.022504	2026-08-03 10:35:58.022504
1376	1104	4.5	Good content, the room was too small.	2026-08-03 10:35:58.043389	2026-08-03 10:35:58.043389
1377	1104	2.5	\N	2026-08-03 10:35:58.072123	2026-08-03 10:35:58.072123
1378	1104	5	I would have liked more live demos.	2026-08-03 10:35:58.110962	2026-08-03 10:35:58.110962
1379	1104	4	Great speaker, clear slides.	2026-08-03 10:35:58.149978	2026-08-03 10:35:58.149978
1380	1104	3	Really useful, thanks!	2026-08-03 10:35:58.179117	2026-08-03 10:35:58.179117
1381	1104	4	A bit too fast for me.	2026-08-03 10:35:58.204715	2026-08-03 10:35:58.204715
1382	1105	2.5	\N	2026-08-03 10:35:58.229487	2026-08-03 10:35:58.229487
1383	1105	5	I would have liked more live demos.	2026-08-03 10:35:58.258743	2026-08-03 10:35:58.258743
1384	1105	4	Great speaker, clear slides.	2026-08-03 10:35:58.285001	2026-08-03 10:35:58.285001
1385	1105	3	Really useful, thanks!	2026-08-03 10:35:58.328612	2026-08-03 10:35:58.328612
1386	1105	4	A bit too fast for me.	2026-08-03 10:35:58.357434	2026-08-03 10:35:58.357434
1387	1105	5	Best talk of the day.	2026-08-03 10:35:58.379262	2026-08-03 10:35:58.379262
1388	1105	4.5	Good content, the room was too small.	2026-08-03 10:35:58.408799	2026-08-03 10:35:58.408799
1389	1106	5	I would have liked more live demos.	2026-08-03 10:35:58.432616	2026-08-03 10:35:58.432616
1390	1106	4	Great speaker, clear slides.	2026-08-03 10:35:58.483732	2026-08-03 10:35:58.483732
1391	1106	3	Really useful, thanks!	2026-08-03 10:35:58.5421	2026-08-03 10:35:58.5421
1392	1106	4	A bit too fast for me.	2026-08-03 10:35:58.58996	2026-08-03 10:35:58.58996
1393	1106	5	Best talk of the day.	2026-08-03 10:35:58.654272	2026-08-03 10:35:58.654272
1394	1106	4.5	Good content, the room was too small.	2026-08-03 10:35:58.709496	2026-08-03 10:35:58.709496
1395	1106	2.5	\N	2026-08-03 10:35:58.758665	2026-08-03 10:35:58.758665
1396	1106	5	I would have liked more live demos.	2026-08-03 10:35:58.811713	2026-08-03 10:35:58.811713
1397	1107	4	Great speaker, clear slides.	2026-08-03 10:35:58.864855	2026-08-03 10:35:58.864855
1398	1107	3	Really useful, thanks!	2026-08-03 10:35:58.880766	2026-08-03 10:35:58.880766
1399	1107	4	A bit too fast for me.	2026-08-03 10:35:58.893268	2026-08-03 10:35:58.893268
1400	1107	5	Best talk of the day.	2026-08-03 10:35:58.907781	2026-08-03 10:35:58.907781
1401	1127	3	Really useful, thanks!	2026-08-03 10:35:58.922793	2026-08-03 10:35:58.922793
1402	1127	4	A bit too fast for me.	2026-08-03 10:35:58.96599	2026-08-03 10:35:58.96599
1403	1127	5	Best talk of the day.	2026-08-03 10:35:58.995543	2026-08-03 10:35:58.995543
1404	1127	4.5	Good content, the room was too small.	2026-08-03 10:35:59.039844	2026-08-03 10:35:59.039844
1405	1127	2.5	\N	2026-08-03 10:35:59.086808	2026-08-03 10:35:59.086808
1406	1128	4	A bit too fast for me.	2026-08-03 10:35:59.121937	2026-08-03 10:35:59.121937
1407	1128	5	Best talk of the day.	2026-08-03 10:35:59.153266	2026-08-03 10:35:59.153266
1408	1128	4.5	Good content, the room was too small.	2026-08-03 10:35:59.180143	2026-08-03 10:35:59.180143
1409	1128	2.5	\N	2026-08-03 10:35:59.204315	2026-08-03 10:35:59.204315
1410	1128	5	I would have liked more live demos.	2026-08-03 10:35:59.229587	2026-08-03 10:35:59.229587
1411	1128	4	Great speaker, clear slides.	2026-08-03 10:35:59.259452	2026-08-03 10:35:59.259452
1412	1129	5	Best talk of the day.	2026-08-03 10:35:59.282879	2026-08-03 10:35:59.282879
1413	1129	4.5	Good content, the room was too small.	2026-08-03 10:35:59.297654	2026-08-03 10:35:59.297654
1414	1129	2.5	\N	2026-08-03 10:35:59.311342	2026-08-03 10:35:59.311342
1415	1129	5	I would have liked more live demos.	2026-08-03 10:35:59.324263	2026-08-03 10:35:59.324263
1416	1129	4	Great speaker, clear slides.	2026-08-03 10:35:59.337399	2026-08-03 10:35:59.337399
1417	1129	3	Really useful, thanks!	2026-08-03 10:35:59.350906	2026-08-03 10:35:59.350906
1418	1129	4	A bit too fast for me.	2026-08-03 10:35:59.366578	2026-08-03 10:35:59.366578
1419	1130	4.5	Good content, the room was too small.	2026-08-03 10:35:59.382289	2026-08-03 10:35:59.382289
1420	1130	2.5	\N	2026-08-03 10:35:59.398977	2026-08-03 10:35:59.398977
1421	1130	5	I would have liked more live demos.	2026-08-03 10:35:59.413834	2026-08-03 10:35:59.413834
1422	1130	4	Great speaker, clear slides.	2026-08-03 10:35:59.428916	2026-08-03 10:35:59.428916
1423	1130	3	Really useful, thanks!	2026-08-03 10:35:59.445789	2026-08-03 10:35:59.445789
1424	1130	4	A bit too fast for me.	2026-08-03 10:35:59.461276	2026-08-03 10:35:59.461276
1425	1130	5	Best talk of the day.	2026-08-03 10:35:59.476416	2026-08-03 10:35:59.476416
1426	1130	4.5	Good content, the room was too small.	2026-08-03 10:35:59.499169	2026-08-03 10:35:59.499169
\.


--
-- Data for Name: event_people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_people (id, event_id, person_id, event_role, role_state, comment, created_at, updated_at, confirmation_token, notification_subject, notification_body) FROM stdin;
3108	1064	367	speaker	confirmed	\N	2026-08-03 10:34:47.824065	2026-08-03 10:34:47.853713	0wR76BSyQ4wj8-w3_sAdb	\N	\N
3107	1064	362	speaker	confirmed	\N	2026-08-03 10:34:47.813138	2026-08-03 10:34:47.86733	fYq1YLc5DcExpPAKliomb	\N	\N
3100	1062	360	submitter	\N	\N	2026-08-03 10:34:47.621425	2026-08-03 10:34:47.621425	\N	\N	\N
3109	1064	357	coordinator	\N	\N	2026-08-03 10:34:47.878142	2026-08-03 10:34:47.878142	\N	\N	\N
3101	1062	360	speaker	confirmed	\N	2026-08-03 10:34:47.633728	2026-08-03 10:34:47.669226	j58vr2BHmPwVIFoBr20Jb	\N	\N
3102	1062	357	coordinator	\N	\N	2026-08-03 10:34:47.681756	2026-08-03 10:34:47.681756	\N	\N	\N
3103	1063	361	submitter	\N	\N	2026-08-03 10:34:47.72205	2026-08-03 10:34:47.72205	\N	\N	\N
3104	1063	361	speaker	confirmed	\N	2026-08-03 10:34:47.732935	2026-08-03 10:34:47.756811	WxxhfM-y0VeTP6dt2Tlxb	\N	\N
3105	1063	357	coordinator	\N	\N	2026-08-03 10:34:47.768041	2026-08-03 10:34:47.768041	\N	\N	\N
3106	1064	362	submitter	\N	\N	2026-08-03 10:34:47.802826	2026-08-03 10:34:47.802826	\N	\N	\N
3110	1065	363	submitter	\N	\N	2026-08-03 10:34:47.9106	2026-08-03 10:34:47.9106	\N	\N	\N
3111	1065	363	speaker	confirmed	\N	2026-08-03 10:34:47.921005	2026-08-03 10:34:47.944809	HVIMpFpGYYqiJ0H0BeO1b	\N	\N
3112	1065	357	coordinator	\N	\N	2026-08-03 10:34:47.953471	2026-08-03 10:34:47.953471	\N	\N	\N
3113	1066	364	submitter	\N	\N	2026-08-03 10:34:47.984249	2026-08-03 10:34:47.984249	\N	\N	\N
3114	1066	364	speaker	confirmed	\N	2026-08-03 10:34:47.993249	2026-08-03 10:34:48.015881	OZvqbQPJx_KgtEQ8WNblb	\N	\N
3115	1066	357	coordinator	\N	\N	2026-08-03 10:34:48.024905	2026-08-03 10:34:48.024905	\N	\N	\N
3116	1067	365	submitter	\N	\N	2026-08-03 10:34:48.051341	2026-08-03 10:34:48.051341	\N	\N	\N
3117	1067	365	speaker	confirmed	\N	2026-08-03 10:34:48.070766	2026-08-03 10:34:48.100663	k9kQ3wrZ7n1W020jV8I2b	\N	\N
3118	1067	370	speaker	confirmed	\N	2026-08-03 10:34:48.079154	2026-08-03 10:34:48.110074	GLhhL5ZospKss8r7jUZwb	\N	\N
3119	1067	357	coordinator	\N	\N	2026-08-03 10:34:48.119814	2026-08-03 10:34:48.119814	\N	\N	\N
3120	1068	366	submitter	\N	\N	2026-08-03 10:34:48.145404	2026-08-03 10:34:48.145404	\N	\N	\N
3121	1068	366	speaker	confirmed	\N	2026-08-03 10:34:48.152467	2026-08-03 10:34:48.173069	7MXZod4Gs2TN7yxu7gowb	\N	\N
3122	1068	357	coordinator	\N	\N	2026-08-03 10:34:48.18185	2026-08-03 10:34:48.18185	\N	\N	\N
3123	1069	367	submitter	\N	\N	2026-08-03 10:34:48.212298	2026-08-03 10:34:48.212298	\N	\N	\N
3124	1069	367	speaker	confirmed	\N	2026-08-03 10:34:48.219519	2026-08-03 10:34:48.240259	arMapYZJlv3FD5C-ne9Vb	\N	\N
3125	1069	357	coordinator	\N	\N	2026-08-03 10:34:48.249907	2026-08-03 10:34:48.249907	\N	\N	\N
3126	1070	368	submitter	\N	\N	2026-08-03 10:34:48.274806	2026-08-03 10:34:48.274806	\N	\N	\N
3127	1070	368	speaker	confirmed	\N	2026-08-03 10:34:48.281556	2026-08-03 10:34:48.311193	r3vdwC-g3q3avLkSeWrjb	\N	\N
3128	1070	373	speaker	confirmed	\N	2026-08-03 10:34:48.289212	2026-08-03 10:34:48.320404	-NjnGmI5-6dYKCDYtl0kb	\N	\N
3129	1070	357	coordinator	\N	\N	2026-08-03 10:34:48.329491	2026-08-03 10:34:48.329491	\N	\N	\N
3130	1071	369	submitter	\N	\N	2026-08-03 10:34:48.354902	2026-08-03 10:34:48.354902	\N	\N	\N
3131	1071	369	speaker	confirmed	\N	2026-08-03 10:34:48.362109	2026-08-03 10:34:48.380487	xxRPK71lkney6OPorWdab	\N	\N
3132	1071	357	coordinator	\N	\N	2026-08-03 10:34:48.388125	2026-08-03 10:34:48.388125	\N	\N	\N
3133	1072	370	submitter	\N	\N	2026-08-03 10:34:48.41045	2026-08-03 10:34:48.41045	\N	\N	\N
3134	1072	370	speaker	confirmed	\N	2026-08-03 10:34:48.419694	2026-08-03 10:34:48.442177	Sf3lwozwzrebbU6VMvdNb	\N	\N
3135	1072	357	coordinator	\N	\N	2026-08-03 10:34:48.452117	2026-08-03 10:34:48.452117	\N	\N	\N
3136	1073	371	submitter	\N	\N	2026-08-03 10:34:48.473652	2026-08-03 10:34:48.473652	\N	\N	\N
3137	1073	371	speaker	confirmed	\N	2026-08-03 10:34:48.481026	2026-08-03 10:34:48.507036	NCAibZFLi-f-Mrfz9Kq_b	\N	\N
3138	1073	376	speaker	confirmed	\N	2026-08-03 10:34:48.488911	2026-08-03 10:34:48.515412	J2EXENF63Z4C7cxdjJQJb	\N	\N
3139	1073	357	coordinator	\N	\N	2026-08-03 10:34:48.523165	2026-08-03 10:34:48.523165	\N	\N	\N
3140	1074	372	submitter	\N	\N	2026-08-03 10:34:48.55599	2026-08-03 10:34:48.55599	\N	\N	\N
3141	1074	372	speaker	confirmed	\N	2026-08-03 10:34:48.564553	2026-08-03 10:34:48.564553	\N	\N	\N
3142	1075	373	submitter	\N	\N	2026-08-03 10:34:48.593671	2026-08-03 10:34:48.593671	\N	\N	\N
3143	1075	373	speaker	confirmed	\N	2026-08-03 10:34:48.601049	2026-08-03 10:34:48.601049	\N	\N	\N
3144	1076	374	submitter	\N	\N	2026-08-03 10:34:48.631403	2026-08-03 10:34:48.631403	\N	\N	\N
3145	1076	374	speaker	confirmed	\N	2026-08-03 10:34:48.640463	2026-08-03 10:34:48.640463	\N	\N	\N
3146	1076	379	speaker	confirmed	\N	2026-08-03 10:34:48.654908	2026-08-03 10:34:48.654908	\N	\N	\N
3147	1077	375	submitter	\N	\N	2026-08-03 10:34:48.69043	2026-08-03 10:34:48.69043	\N	\N	\N
3148	1077	375	speaker	confirmed	\N	2026-08-03 10:34:48.706372	2026-08-03 10:34:48.706372	\N	\N	\N
3149	1078	376	submitter	\N	\N	2026-08-03 10:34:48.737028	2026-08-03 10:34:48.737028	\N	\N	\N
3150	1078	376	speaker	confirmed	\N	2026-08-03 10:34:48.744856	2026-08-03 10:34:48.744856	\N	\N	\N
3151	1079	377	submitter	\N	\N	2026-08-03 10:34:48.773133	2026-08-03 10:34:48.773133	\N	\N	\N
3152	1079	377	speaker	confirmed	\N	2026-08-03 10:34:48.781698	2026-08-03 10:34:48.781698	\N	\N	\N
3153	1079	360	speaker	confirmed	\N	2026-08-03 10:34:48.790384	2026-08-03 10:34:48.790384	\N	\N	\N
3154	1079	357	coordinator	\N	\N	2026-08-03 10:34:48.80872	2026-08-03 10:34:48.80872	\N	\N	\N
3155	1080	378	submitter	\N	\N	2026-08-03 10:34:48.830878	2026-08-03 10:34:48.830878	\N	\N	\N
3156	1080	378	speaker	confirmed	\N	2026-08-03 10:34:48.83899	2026-08-03 10:34:48.83899	\N	\N	\N
3157	1081	379	submitter	\N	\N	2026-08-03 10:34:48.872842	2026-08-03 10:34:48.872842	\N	\N	\N
3158	1081	379	speaker	confirmed	\N	2026-08-03 10:34:48.880557	2026-08-03 10:34:48.901182	Pw6huSuMjAOegYTxpeceb	\N	\N
3159	1081	357	coordinator	\N	\N	2026-08-03 10:34:48.910146	2026-08-03 10:34:48.910146	\N	\N	\N
3160	1082	360	submitter	\N	\N	2026-08-03 10:34:51.878183	2026-08-03 10:34:51.878183	\N	\N	\N
3161	1082	360	speaker	confirmed	\N	2026-08-03 10:34:51.887642	2026-08-03 10:34:51.912847	FAapLLZUhCqhkWYE4OBPb	\N	\N
3162	1082	357	coordinator	\N	\N	2026-08-03 10:34:51.924807	2026-08-03 10:34:51.924807	\N	\N	\N
3163	1083	361	submitter	\N	\N	2026-08-03 10:34:51.950631	2026-08-03 10:34:51.950631	\N	\N	\N
3164	1083	361	speaker	confirmed	\N	2026-08-03 10:34:51.958804	2026-08-03 10:34:51.975112	ocZaxFsb5srsHHFZkjiKb	\N	\N
3186	1091	364	submitter	\N	\N	2026-08-03 10:34:52.826284	2026-08-03 10:34:52.826284	\N	\N	\N
3165	1083	357	coordinator	\N	\N	2026-08-03 10:34:51.983339	2026-08-03 10:34:51.983339	\N	\N	\N
3166	1084	362	submitter	\N	\N	2026-08-03 10:34:52.010677	2026-08-03 10:34:52.010677	\N	\N	\N
3167	1084	362	speaker	confirmed	\N	2026-08-03 10:34:52.021063	2026-08-03 10:34:52.021063	\N	\N	\N
3168	1084	357	coordinator	\N	\N	2026-08-03 10:34:52.04709	2026-08-03 10:34:52.04709	\N	\N	\N
3169	1085	363	submitter	\N	\N	2026-08-03 10:34:52.072951	2026-08-03 10:34:52.072951	\N	\N	\N
3170	1085	363	speaker	confirmed	\N	2026-08-03 10:34:52.082622	2026-08-03 10:34:52.082622	\N	\N	\N
3187	1091	364	speaker	confirmed	\N	2026-08-03 10:34:52.84764	2026-08-03 10:34:52.904721	NlKKkwvkpBcmoYJKlAVkb	\N	\N
3171	1086	364	submitter	\N	\N	2026-08-03 10:34:52.113539	2026-08-03 10:34:52.113539	\N	\N	\N
3172	1086	364	speaker	confirmed	\N	2026-08-03 10:34:52.12444	2026-08-03 10:34:52.12444	\N	\N	\N
3188	1091	357	coordinator	\N	\N	2026-08-03 10:34:52.915508	2026-08-03 10:34:52.915508	\N	\N	\N
3189	1092	365	submitter	\N	\N	2026-08-03 10:34:52.95129	2026-08-03 10:34:52.95129	\N	\N	\N
3173	1087	360	submitter	\N	\N	2026-08-03 10:34:52.228007	2026-08-03 10:34:52.228007	\N	\N	\N
3174	1087	360	speaker	confirmed	\N	2026-08-03 10:34:52.236466	2026-08-03 10:34:52.297488	HyI7Ms_-TFlLIBXR-y77b	\N	\N
3175	1087	357	coordinator	\N	\N	2026-08-03 10:34:52.308425	2026-08-03 10:34:52.308425	\N	\N	\N
3191	1092	357	coordinator	\N	\N	2026-08-03 10:34:53.004176	2026-08-03 10:34:53.004176	\N	\N	\N
3176	1088	361	submitter	\N	\N	2026-08-03 10:34:52.336637	2026-08-03 10:34:52.336637	\N	\N	\N
3192	1093	366	submitter	\N	\N	2026-08-03 10:34:53.036934	2026-08-03 10:34:53.036934	\N	\N	\N
3179	1088	357	coordinator	\N	\N	2026-08-03 10:34:52.39611	2026-08-03 10:34:52.39611	\N	\N	\N
3180	1089	362	submitter	\N	\N	2026-08-03 10:34:52.451503	2026-08-03 10:34:52.451503	\N	\N	\N
3181	1089	362	speaker	confirmed	\N	2026-08-03 10:34:52.474728	2026-08-03 10:34:52.549315	6Y9ITQdn2KcNOWan8H9Ob	\N	\N
3182	1089	357	coordinator	\N	\N	2026-08-03 10:34:52.576292	2026-08-03 10:34:52.576292	\N	\N	\N
3183	1090	363	submitter	\N	\N	2026-08-03 10:34:52.650516	2026-08-03 10:34:52.650516	\N	\N	\N
3185	1090	357	coordinator	\N	\N	2026-08-03 10:34:52.759406	2026-08-03 10:34:52.759406	\N	\N	\N
3193	1093	366	speaker	confirmed	\N	2026-08-03 10:34:53.047247	2026-08-03 10:34:53.093364	QDWyyfjI1JkG3_rTIaS2b	\N	\N
3194	1093	373	speaker	confirmed	\N	2026-08-03 10:34:53.05936	2026-08-03 10:34:53.10325	6dvV0NKoVPIiEDcqPI0zb	\N	\N
3195	1093	357	coordinator	\N	\N	2026-08-03 10:34:53.113089	2026-08-03 10:34:53.113089	\N	\N	\N
3196	1094	367	submitter	\N	\N	2026-08-03 10:34:53.145608	2026-08-03 10:34:53.145608	\N	\N	\N
3198	1094	357	coordinator	\N	\N	2026-08-03 10:34:53.18692	2026-08-03 10:34:53.18692	\N	\N	\N
3199	1095	368	submitter	\N	\N	2026-08-03 10:34:53.214566	2026-08-03 10:34:53.214566	\N	\N	\N
3200	1095	368	speaker	confirmed	\N	2026-08-03 10:34:53.222135	2026-08-03 10:34:53.271168	d0UCNolbUi4MmkzIoNGzb	\N	\N
3201	1095	357	coordinator	\N	\N	2026-08-03 10:34:53.280923	2026-08-03 10:34:53.280923	\N	\N	\N
3202	1096	369	submitter	\N	\N	2026-08-03 10:34:53.314457	2026-08-03 10:34:53.314457	\N	\N	\N
3204	1096	357	coordinator	\N	\N	2026-08-03 10:34:53.366289	2026-08-03 10:34:53.366289	\N	\N	\N
3205	1097	370	submitter	\N	\N	2026-08-03 10:34:53.402718	2026-08-03 10:34:53.402718	\N	\N	\N
3206	1097	370	speaker	confirmed	\N	2026-08-03 10:34:53.410861	2026-08-03 10:34:53.441087	sK3fH2Yj1MyKxsSFwQkab	\N	\N
3207	1097	377	speaker	confirmed	\N	2026-08-03 10:34:53.419168	2026-08-03 10:34:53.450519	b9psRVd3d01BjHtXeekcb	\N	\N
3208	1097	357	coordinator	\N	\N	2026-08-03 10:34:53.460763	2026-08-03 10:34:53.460763	\N	\N	\N
3209	1098	371	submitter	\N	\N	2026-08-03 10:34:53.500222	2026-08-03 10:34:53.500222	\N	\N	\N
3211	1098	357	coordinator	\N	\N	2026-08-03 10:34:53.564158	2026-08-03 10:34:53.564158	\N	\N	\N
3212	1099	372	submitter	\N	\N	2026-08-03 10:34:53.620488	2026-08-03 10:34:53.620488	\N	\N	\N
3213	1099	372	speaker	confirmed	\N	2026-08-03 10:34:53.632897	2026-08-03 10:34:53.689408	5H5mg9gBLnlQY8kJJymQb	\N	\N
3214	1099	357	coordinator	\N	\N	2026-08-03 10:34:53.704272	2026-08-03 10:34:53.704272	\N	\N	\N
3215	1100	373	submitter	\N	\N	2026-08-03 10:34:53.759299	2026-08-03 10:34:53.759299	\N	\N	\N
3217	1100	357	coordinator	\N	\N	2026-08-03 10:34:53.83542	2026-08-03 10:34:53.83542	\N	\N	\N
3218	1101	374	submitter	\N	\N	2026-08-03 10:34:53.880355	2026-08-03 10:34:53.880355	\N	\N	\N
3219	1101	374	speaker	confirmed	\N	2026-08-03 10:34:53.894935	2026-08-03 10:34:53.951248	OgnwKkMoH6wsJrK1zS1Kb	\N	\N
3220	1101	357	coordinator	\N	\N	2026-08-03 10:34:53.971027	2026-08-03 10:34:53.971027	\N	\N	\N
3221	1102	375	submitter	\N	\N	2026-08-03 10:34:54.000362	2026-08-03 10:34:54.000362	\N	\N	\N
3224	1102	357	coordinator	\N	\N	2026-08-03 10:34:54.071466	2026-08-03 10:34:54.071466	\N	\N	\N
3225	1103	376	submitter	\N	\N	2026-08-03 10:34:54.099056	2026-08-03 10:34:54.099056	\N	\N	\N
3226	1103	376	speaker	confirmed	\N	2026-08-03 10:34:54.108549	2026-08-03 10:34:54.152565	mUGiT3ETnVtnhOoRFGdub	\N	\N
3227	1103	357	coordinator	\N	\N	2026-08-03 10:34:54.160411	2026-08-03 10:34:54.160411	\N	\N	\N
3243	1108	381	speaker	confirmed	\N	2026-08-03 10:34:54.593486	2026-08-03 10:34:54.625587	7x47q46eYbaT0jlWyEEyb	\N	\N
3228	1104	377	submitter	\N	\N	2026-08-03 10:34:54.184848	2026-08-03 10:34:54.184848	\N	\N	\N
3244	1108	357	coordinator	\N	\N	2026-08-03 10:34:54.636594	2026-08-03 10:34:54.636594	\N	\N	\N
3245	1109	360	submitter	\N	\N	2026-08-03 10:34:54.668722	2026-08-03 10:34:54.668722	\N	\N	\N
3246	1109	360	speaker	confirmed	\N	2026-08-03 10:34:54.684571	2026-08-03 10:34:54.718948	rzm211khkyJ9SpBeojslb	\N	\N
3247	1109	357	coordinator	\N	\N	2026-08-03 10:34:54.730668	2026-08-03 10:34:54.730668	\N	\N	\N
3248	1110	361	submitter	\N	\N	2026-08-03 10:34:54.757968	2026-08-03 10:34:54.757968	\N	\N	\N
3249	1110	361	speaker	confirmed	\N	2026-08-03 10:34:54.769049	2026-08-03 10:34:54.80299	-I0-hFTrgvYOpXZS9XD6b	\N	\N
3250	1110	357	coordinator	\N	\N	2026-08-03 10:34:54.815479	2026-08-03 10:34:54.815479	\N	\N	\N
3251	1111	362	submitter	\N	\N	2026-08-03 10:34:54.845593	2026-08-03 10:34:54.845593	\N	\N	\N
3230	1104	357	coordinator	\N	\N	2026-08-03 10:34:54.221945	2026-08-03 10:34:54.221945	\N	\N	\N
3231	1105	378	submitter	\N	\N	2026-08-03 10:34:54.250769	2026-08-03 10:34:54.250769	\N	\N	\N
3232	1105	378	speaker	confirmed	\N	2026-08-03 10:34:54.262017	2026-08-03 10:34:54.286181	KTVCpiy2ahLkXTTtk59cb	\N	\N
3233	1105	357	coordinator	\N	\N	2026-08-03 10:34:54.29516	2026-08-03 10:34:54.29516	\N	\N	\N
3234	1106	379	submitter	\N	\N	2026-08-03 10:34:54.319491	2026-08-03 10:34:54.319491	\N	\N	\N
3238	1106	357	coordinator	\N	\N	2026-08-03 10:34:54.398882	2026-08-03 10:34:54.398882	\N	\N	\N
3239	1107	380	submitter	\N	\N	2026-08-03 10:34:54.425419	2026-08-03 10:34:54.425419	\N	\N	\N
3240	1107	380	speaker	confirmed	\N	2026-08-03 10:34:54.435508	2026-08-03 10:34:54.506836	W4Rrzu4NGAJEAy_LS0iOb	\N	\N
3241	1107	357	coordinator	\N	\N	2026-08-03 10:34:54.522701	2026-08-03 10:34:54.522701	\N	\N	\N
3242	1108	381	submitter	\N	\N	2026-08-03 10:34:54.580702	2026-08-03 10:34:54.580702	\N	\N	\N
3252	1111	362	speaker	unclear	\N	2026-08-03 10:34:54.857868	2026-08-03 10:34:54.952545	EBhDWe-_mLMxFMr-SoElb	\N	\N
3253	1111	369	speaker	confirmed	\N	2026-08-03 10:34:54.879553	2026-08-03 10:34:54.964945	adsVcz0gPIO2L0rc5zZOb	\N	\N
3254	1111	357	coordinator	\N	\N	2026-08-03 10:34:54.979641	2026-08-03 10:34:54.979641	\N	\N	\N
3255	1112	363	submitter	\N	\N	2026-08-03 10:34:55.004859	2026-08-03 10:34:55.004859	\N	\N	\N
3256	1112	363	speaker	offer	\N	2026-08-03 10:34:55.015896	2026-08-03 10:34:55.015896	\N	\N	\N
3257	1113	364	submitter	\N	\N	2026-08-03 10:34:55.072281	2026-08-03 10:34:55.072281	\N	\N	\N
3258	1113	364	speaker	offer	\N	2026-08-03 10:34:55.089083	2026-08-03 10:34:55.089083	\N	\N	\N
3259	1114	365	submitter	\N	\N	2026-08-03 10:34:55.175989	2026-08-03 10:34:55.175989	\N	\N	\N
3260	1114	365	speaker	offer	\N	2026-08-03 10:34:55.196794	2026-08-03 10:34:55.196794	\N	\N	\N
3261	1115	366	submitter	\N	\N	2026-08-03 10:34:55.254378	2026-08-03 10:34:55.254378	\N	\N	\N
3262	1115	366	speaker	offer	\N	2026-08-03 10:34:55.272964	2026-08-03 10:34:55.272964	\N	\N	\N
3263	1116	367	submitter	\N	\N	2026-08-03 10:34:55.346494	2026-08-03 10:34:55.346494	\N	\N	\N
3264	1116	367	speaker	offer	\N	2026-08-03 10:34:55.354682	2026-08-03 10:34:55.354682	\N	\N	\N
3265	1117	368	submitter	\N	\N	2026-08-03 10:34:55.384974	2026-08-03 10:34:55.384974	\N	\N	\N
3266	1117	368	speaker	offer	\N	2026-08-03 10:34:55.394389	2026-08-03 10:34:55.394389	\N	\N	\N
3267	1118	369	submitter	\N	\N	2026-08-03 10:34:55.427269	2026-08-03 10:34:55.427269	\N	\N	\N
3268	1118	369	speaker	offer	\N	2026-08-03 10:34:55.436581	2026-08-03 10:34:55.436581	\N	\N	\N
3269	1119	370	submitter	\N	\N	2026-08-03 10:34:55.467105	2026-08-03 10:34:55.467105	\N	\N	\N
3270	1120	371	submitter	\N	\N	2026-08-03 10:34:55.517386	2026-08-03 10:34:55.517386	\N	\N	\N
3271	1120	371	speaker	offer	\N	2026-08-03 10:34:55.52632	2026-08-03 10:34:55.52632	\N	\N	\N
3272	1121	372	submitter	\N	\N	2026-08-03 10:34:55.555674	2026-08-03 10:34:55.555674	\N	\N	\N
3273	1121	372	speaker	offer	\N	2026-08-03 10:34:55.564262	2026-08-03 10:34:55.564262	\N	\N	\N
3274	1121	357	coordinator	\N	\N	2026-08-03 10:34:55.58526	2026-08-03 10:34:55.58526	\N	\N	\N
3275	1122	373	submitter	\N	\N	2026-08-03 10:34:55.609689	2026-08-03 10:34:55.609689	\N	\N	\N
3276	1122	373	speaker	offer	\N	2026-08-03 10:34:55.620603	2026-08-03 10:34:55.620603	\N	\N	\N
3277	1122	357	coordinator	\N	\N	2026-08-03 10:34:55.653276	2026-08-03 10:34:55.653276	\N	\N	\N
3278	1123	374	submitter	\N	\N	2026-08-03 10:34:55.694199	2026-08-03 10:34:55.694199	\N	\N	\N
3279	1123	374	speaker	offer	\N	2026-08-03 10:34:55.704829	2026-08-03 10:34:55.704829	\N	\N	\N
3280	1123	357	coordinator	\N	\N	2026-08-03 10:34:55.764767	2026-08-03 10:34:55.764767	\N	\N	\N
3281	1124	375	submitter	\N	\N	2026-08-03 10:34:55.823561	2026-08-03 10:34:55.823561	\N	\N	\N
3282	1124	375	speaker	offer	\N	2026-08-03 10:34:55.852457	2026-08-03 10:34:55.852457	\N	\N	\N
3283	1125	376	submitter	\N	\N	2026-08-03 10:34:55.932839	2026-08-03 10:34:55.932839	\N	\N	\N
3284	1125	376	speaker	offer	\N	2026-08-03 10:34:55.945844	2026-08-03 10:34:55.945844	\N	\N	\N
3285	1126	377	submitter	\N	\N	2026-08-03 10:34:56.034104	2026-08-03 10:34:56.034104	\N	\N	\N
3286	1126	377	speaker	offer	\N	2026-08-03 10:34:56.063355	2026-08-03 10:34:56.123564	oilY04q9JFnsBBI3DS3ub	\N	\N
3287	1126	357	coordinator	\N	\N	2026-08-03 10:34:56.143167	2026-08-03 10:34:56.143167	\N	\N	\N
3288	1127	378	submitter	\N	\N	2026-08-03 10:34:56.215426	2026-08-03 10:34:56.215426	\N	\N	\N
3290	1127	357	coordinator	\N	\N	2026-08-03 10:34:56.301215	2026-08-03 10:34:56.301215	\N	\N	\N
3291	1128	379	submitter	\N	\N	2026-08-03 10:34:56.327314	2026-08-03 10:34:56.327314	\N	\N	\N
3292	1128	379	speaker	confirmed	\N	2026-08-03 10:34:56.336826	2026-08-03 10:34:56.362868	yXv8lHp9zeHKgrul0gUZb	\N	\N
3293	1128	357	coordinator	\N	\N	2026-08-03 10:34:56.37211	2026-08-03 10:34:56.37211	\N	\N	\N
3294	1129	380	submitter	\N	\N	2026-08-03 10:34:56.397455	2026-08-03 10:34:56.397455	\N	\N	\N
3296	1129	357	coordinator	\N	\N	2026-08-03 10:34:56.436855	2026-08-03 10:34:56.436855	\N	\N	\N
3297	1130	381	submitter	\N	\N	2026-08-03 10:34:56.467896	2026-08-03 10:34:56.467896	\N	\N	\N
3298	1130	381	speaker	confirmed	\N	2026-08-03 10:34:56.476345	2026-08-03 10:34:56.499331	bcCKSnhVaSb78ZBc_Iegb	\N	\N
3299	1130	357	coordinator	\N	\N	2026-08-03 10:34:56.50746	2026-08-03 10:34:56.50746	\N	\N	\N
3300	1131	360	submitter	\N	\N	2026-08-03 10:34:56.531627	2026-08-03 10:34:56.531627	\N	\N	\N
3321	1137	357	coordinator	\N	\N	2026-08-03 10:34:57.07109	2026-08-03 10:34:57.07109	\N	\N	\N
3322	1138	367	submitter	\N	\N	2026-08-03 10:34:57.096988	2026-08-03 10:34:57.096988	\N	\N	\N
3303	1131	357	coordinator	\N	\N	2026-08-03 10:34:56.62273	2026-08-03 10:34:56.62273	\N	\N	\N
3304	1132	361	submitter	\N	\N	2026-08-03 10:34:56.651222	2026-08-03 10:34:56.651222	\N	\N	\N
3305	1132	361	speaker	confirmed	\N	2026-08-03 10:34:56.660999	2026-08-03 10:34:56.692566	3O1k1vnFMSTQ0E5jPvTrb	\N	\N
3323	1138	367	speaker	confirmed	\N	2026-08-03 10:34:57.105072	2026-08-03 10:34:57.128695	sTbrdiLGkwvMNFAZYvdxb	\N	\N
3306	1132	357	coordinator	\N	\N	2026-08-03 10:34:56.707438	2026-08-03 10:34:56.707438	\N	\N	\N
3307	1133	362	submitter	\N	\N	2026-08-03 10:34:56.735571	2026-08-03 10:34:56.735571	\N	\N	\N
3324	1138	357	coordinator	\N	\N	2026-08-03 10:34:57.137351	2026-08-03 10:34:57.137351	\N	\N	\N
3325	1139	368	submitter	\N	\N	2026-08-03 10:34:57.164882	2026-08-03 10:34:57.164882	\N	\N	\N
3309	1133	357	coordinator	\N	\N	2026-08-03 10:34:56.774932	2026-08-03 10:34:56.774932	\N	\N	\N
3310	1134	363	submitter	\N	\N	2026-08-03 10:34:56.801013	2026-08-03 10:34:56.801013	\N	\N	\N
3311	1134	363	speaker	confirmed	\N	2026-08-03 10:34:56.809774	2026-08-03 10:34:56.833579	jf0NNI4S1UwZPwlcPnHrb	\N	\N
3312	1134	357	coordinator	\N	\N	2026-08-03 10:34:56.841775	2026-08-03 10:34:56.841775	\N	\N	\N
3313	1135	364	submitter	\N	\N	2026-08-03 10:34:56.86685	2026-08-03 10:34:56.86685	\N	\N	\N
3315	1135	357	coordinator	\N	\N	2026-08-03 10:34:56.939297	2026-08-03 10:34:56.939297	\N	\N	\N
3316	1136	365	submitter	\N	\N	2026-08-03 10:34:56.965359	2026-08-03 10:34:56.965359	\N	\N	\N
3317	1136	365	speaker	confirmed	\N	2026-08-03 10:34:56.973815	2026-08-03 10:34:56.994324	n-BfnyTt2TdSjvb6eKPDb	\N	\N
3318	1136	357	coordinator	\N	\N	2026-08-03 10:34:57.002853	2026-08-03 10:34:57.002853	\N	\N	\N
3319	1137	366	submitter	\N	\N	2026-08-03 10:34:57.027413	2026-08-03 10:34:57.027413	\N	\N	\N
3328	1139	357	coordinator	\N	\N	2026-08-03 10:34:57.255503	2026-08-03 10:34:57.255503	\N	\N	\N
3329	1140	369	submitter	\N	\N	2026-08-03 10:34:57.279129	2026-08-03 10:34:57.279129	\N	\N	\N
3330	1140	369	speaker	confirmed	\N	2026-08-03 10:34:57.286578	2026-08-03 10:34:57.307684	edWT2wQvmR0izGec5UmUb	\N	\N
3331	1140	357	coordinator	\N	\N	2026-08-03 10:34:57.315829	2026-08-03 10:34:57.315829	\N	\N	\N
3332	1141	370	submitter	\N	\N	2026-08-03 10:34:57.342832	2026-08-03 10:34:57.342832	\N	\N	\N
3334	1141	357	coordinator	\N	\N	2026-08-03 10:34:57.384479	2026-08-03 10:34:57.384479	\N	\N	\N
3335	1142	371	submitter	\N	\N	2026-08-03 10:34:57.410837	2026-08-03 10:34:57.410837	\N	\N	\N
3336	1142	371	speaker	confirmed	\N	2026-08-03 10:34:57.420163	2026-08-03 10:34:57.445272	um3P8iuNoTBetBsK3kCZb	\N	\N
3337	1142	357	coordinator	\N	\N	2026-08-03 10:34:57.454122	2026-08-03 10:34:57.454122	\N	\N	\N
3338	1143	372	submitter	\N	\N	2026-08-03 10:34:57.481687	2026-08-03 10:34:57.481687	\N	\N	\N
3340	1143	357	coordinator	\N	\N	2026-08-03 10:34:57.553817	2026-08-03 10:34:57.553817	\N	\N	\N
3341	1144	373	submitter	\N	\N	2026-08-03 10:34:57.580101	2026-08-03 10:34:57.580101	\N	\N	\N
3342	1144	373	speaker	confirmed	\N	2026-08-03 10:34:57.590089	2026-08-03 10:34:57.615879	vF2Csi5vO2D-4cBQQXu4b	\N	\N
3343	1144	357	coordinator	\N	\N	2026-08-03 10:34:57.625546	2026-08-03 10:34:57.625546	\N	\N	\N
3344	1145	374	submitter	\N	\N	2026-08-03 10:34:57.653759	2026-08-03 10:34:57.653759	\N	\N	\N
3347	1145	357	coordinator	\N	\N	2026-08-03 10:34:57.732544	2026-08-03 10:34:57.732544	\N	\N	\N
3348	1146	375	submitter	\N	\N	2026-08-03 10:34:57.765048	2026-08-03 10:34:57.765048	\N	\N	\N
3349	1146	375	speaker	confirmed	\N	2026-08-03 10:34:57.77406	2026-08-03 10:34:57.800436	TlbE1BAe8svLMVg_L_8mb	\N	\N
3350	1146	357	coordinator	\N	\N	2026-08-03 10:34:57.813862	2026-08-03 10:34:57.813862	\N	\N	\N
3351	1147	376	submitter	\N	\N	2026-08-03 10:34:57.850395	2026-08-03 10:34:57.850395	\N	\N	\N
3353	1147	357	coordinator	\N	\N	2026-08-03 10:34:57.929	2026-08-03 10:34:57.929	\N	\N	\N
3354	1148	377	submitter	\N	\N	2026-08-03 10:34:57.963022	2026-08-03 10:34:57.963022	\N	\N	\N
3355	1148	377	speaker	confirmed	\N	2026-08-03 10:34:57.972511	2026-08-03 10:34:58.002882	eudT43kN6I29-rEG8Y6Ib	\N	\N
3356	1148	357	coordinator	\N	\N	2026-08-03 10:34:58.018836	2026-08-03 10:34:58.018836	\N	\N	\N
3357	1149	378	submitter	\N	\N	2026-08-03 10:34:58.053028	2026-08-03 10:34:58.053028	\N	\N	\N
3389	1161	360	submitter	\N	\N	2026-08-03 10:35:33.91265	2026-08-03 10:35:33.91265	\N	\N	\N
3390	1161	360	speaker	confirmed	\N	2026-08-03 10:35:33.940981	2026-08-03 10:35:35.532453	3L2YME76-CrI0ZrN2DPib	\N	\N
3391	1161	357	coordinator	\N	\N	2026-08-03 10:35:35.548645	2026-08-03 10:35:35.548645	\N	\N	\N
3392	1162	363	submitter	\N	\N	2026-08-03 10:35:35.580351	2026-08-03 10:35:35.580351	\N	\N	\N
3393	1162	363	speaker	confirmed	\N	2026-08-03 10:35:35.59096	2026-08-03 10:35:36.757772	6k8J0CerKCmF_rRm_XaPb	\N	\N
3394	1162	357	coordinator	\N	\N	2026-08-03 10:35:36.77052	2026-08-03 10:35:36.77052	\N	\N	\N
3395	1163	366	submitter	\N	\N	2026-08-03 10:35:36.800168	2026-08-03 10:35:36.800168	\N	\N	\N
3396	1163	366	speaker	confirmed	\N	2026-08-03 10:35:36.809339	2026-08-03 10:35:37.5887	ZXT7oDaWii-fyDrCT4t1b	\N	\N
3361	1149	357	coordinator	\N	\N	2026-08-03 10:34:58.139162	2026-08-03 10:34:58.139162	\N	\N	\N
3362	1150	379	submitter	\N	\N	2026-08-03 10:34:58.165813	2026-08-03 10:34:58.165813	\N	\N	\N
3397	1163	357	coordinator	\N	\N	2026-08-03 10:35:37.600914	2026-08-03 10:35:37.600914	\N	\N	\N
3398	1164	369	submitter	\N	\N	2026-08-03 10:35:37.629044	2026-08-03 10:35:37.629044	\N	\N	\N
3369	1152	381	speaker	confirmed	\N	2026-08-03 10:34:58.339147	2026-08-03 10:34:58.362107	IskgK8m52EPZjdkepUuwb	\N	\N
3399	1164	369	speaker	confirmed	\N	2026-08-03 10:35:37.638757	2026-08-03 10:35:38.449227	9bL_jYQJwzqWk5GoaPZPb	\N	\N
3400	1164	357	coordinator	\N	\N	2026-08-03 10:35:38.461045	2026-08-03 10:35:38.461045	\N	\N	\N
3401	1165	372	submitter	\N	\N	2026-08-03 10:35:38.489423	2026-08-03 10:35:38.489423	\N	\N	\N
3370	1152	357	coordinator	\N	\N	2026-08-03 10:34:58.370525	2026-08-03 10:34:58.370525	\N	\N	\N
3402	1165	372	speaker	confirmed	\N	2026-08-03 10:35:38.50051	2026-08-03 10:35:38.50051	\N	\N	\N
3403	1166	375	submitter	\N	\N	2026-08-03 10:35:39.283552	2026-08-03 10:35:39.283552	\N	\N	\N
3404	1166	375	speaker	confirmed	\N	2026-08-03 10:35:39.296863	2026-08-03 10:35:39.296863	\N	\N	\N
3371	1153	360	submitter	\N	\N	2026-08-03 10:34:58.393473	2026-08-03 10:34:58.393473	\N	\N	\N
3405	1167	378	submitter	\N	\N	2026-08-03 10:35:40.320207	2026-08-03 10:35:40.320207	\N	\N	\N
3406	1167	378	speaker	confirmed	\N	2026-08-03 10:35:40.334106	2026-08-03 10:35:40.334106	\N	\N	\N
3407	1168	381	submitter	\N	\N	2026-08-03 10:35:41.151557	2026-08-03 10:35:41.151557	\N	\N	\N
3408	1168	381	speaker	confirmed	\N	2026-08-03 10:35:41.166047	2026-08-03 10:35:42.761043	VwecQRa7T9AFJtNjugLxb	\N	\N
3409	1168	357	coordinator	\N	\N	2026-08-03 10:35:42.789679	2026-08-03 10:35:42.789679	\N	\N	\N
3410	1169	362	submitter	\N	\N	2026-08-03 10:35:42.840424	2026-08-03 10:35:42.840424	\N	\N	\N
3411	1169	362	speaker	confirmed	\N	2026-08-03 10:35:42.86146	2026-08-03 10:35:44.161698	79NvVZTxMO_PSSvvpkbVb	\N	\N
3412	1169	357	coordinator	\N	\N	2026-08-03 10:35:44.176204	2026-08-03 10:35:44.176204	\N	\N	\N
3413	1170	365	submitter	\N	\N	2026-08-03 10:35:44.217198	2026-08-03 10:35:44.217198	\N	\N	\N
3414	1170	365	speaker	confirmed	\N	2026-08-03 10:35:44.237704	2026-08-03 10:35:44.237704	\N	\N	\N
3415	1171	368	submitter	\N	\N	2026-08-03 10:35:45.599016	2026-08-03 10:35:45.599016	\N	\N	\N
3416	1171	368	speaker	confirmed	\N	2026-08-03 10:35:45.627018	2026-08-03 10:35:45.627018	\N	\N	\N
3417	1171	357	coordinator	\N	\N	2026-08-03 10:35:47.551037	2026-08-03 10:35:47.551037	\N	\N	\N
3418	1172	371	submitter	\N	\N	2026-08-03 10:35:47.604175	2026-08-03 10:35:47.604175	\N	\N	\N
3419	1172	371	speaker	confirmed	\N	2026-08-03 10:35:47.625151	2026-08-03 10:35:49.201133	zkZTDelKInYJWJoTQW9vb	\N	\N
3420	1172	357	coordinator	\N	\N	2026-08-03 10:35:49.22689	2026-08-03 10:35:49.22689	\N	\N	\N
3372	1153	360	speaker	offer	\N	2026-08-03 10:34:58.4034	2026-08-03 10:34:58.4034	\N	\N	\N
3373	1154	361	submitter	\N	\N	2026-08-03 10:34:58.436565	2026-08-03 10:34:58.436565	\N	\N	\N
3374	1154	361	speaker	offer	\N	2026-08-03 10:34:58.445291	2026-08-03 10:34:58.445291	\N	\N	\N
3375	1155	362	submitter	\N	\N	2026-08-03 10:34:58.476284	2026-08-03 10:34:58.476284	\N	\N	\N
3421	1173	374	submitter	\N	\N	2026-08-03 10:35:49.263254	2026-08-03 10:35:49.263254	\N	\N	\N
3422	1173	374	speaker	confirmed	\N	2026-08-03 10:35:49.272136	2026-08-03 10:35:50.39278	UVoC7iTATM5lv6s76oqub	\N	\N
3423	1173	357	coordinator	\N	\N	2026-08-03 10:35:50.414242	2026-08-03 10:35:50.414242	\N	\N	\N
3352	1147	376	speaker	attending	\N	2026-08-03 10:34:57.860558	2026-08-03 10:35:51.734048	fqgDUK8tuq_wTPrkDYFWb	\N	\N
3358	1149	378	speaker	attending	\N	2026-08-03 10:34:58.063043	2026-08-03 10:35:51.749574	uQ5iUp4COYAlXN1_k0vdb	\N	\N
3359	1149	363	speaker	attending	\N	2026-08-03 10:34:58.07352	2026-08-03 10:35:51.769934	UimpyGolTEtNVvIY7Bxab	\N	\N
3360	1149	370	speaker	attending	\N	2026-08-03 10:34:58.08364	2026-08-03 10:35:51.78803	bioJK-g6m2AZTtC3KNkob	\N	\N
3177	1088	361	speaker	attending	\N	2026-08-03 10:34:52.345035	2026-08-03 10:35:51.802865	bVvNuYFo0PGTcFsMk4Nbb	\N	\N
3178	1088	368	speaker	attending	\N	2026-08-03 10:34:52.35381	2026-08-03 10:35:51.849934	UGlm_KeBlniby34OBZ0ib	\N	\N
3184	1090	363	speaker	attending	\N	2026-08-03 10:34:52.678089	2026-08-03 10:35:51.908216	_PqXHrp7oo3_Sjiwndjrb	\N	\N
3190	1092	365	speaker	attending	\N	2026-08-03 10:34:52.963851	2026-08-03 10:35:51.938593	_41b9EPOaBNCfGoH8SCHb	\N	\N
3197	1094	367	speaker	attending	\N	2026-08-03 10:34:53.155456	2026-08-03 10:35:51.968723	7HSJp85LHZucRSG3hTTJb	\N	\N
3203	1096	369	speaker	attending	\N	2026-08-03 10:34:53.327796	2026-08-03 10:35:52.00304	v2IJbRWN2rvbShoylgNob	\N	\N
3363	1150	379	speaker	confirmed	\N	2026-08-03 10:34:58.175432	2026-08-03 10:34:58.20788	-cg3Qh3_8C4Nm87Ld_ZOb	\N	\N
3364	1150	357	coordinator	\N	\N	2026-08-03 10:34:58.217573	2026-08-03 10:34:58.217573	\N	\N	\N
3365	1151	380	submitter	\N	\N	2026-08-03 10:34:58.24109	2026-08-03 10:34:58.24109	\N	\N	\N
3366	1151	380	speaker	confirmed	\N	2026-08-03 10:34:58.250433	2026-08-03 10:34:58.297977	sW42yDAnX88g3_Mt9A2gb	\N	\N
3367	1151	357	coordinator	\N	\N	2026-08-03 10:34:58.306627	2026-08-03 10:34:58.306627	\N	\N	\N
3368	1152	381	submitter	\N	\N	2026-08-03 10:34:58.330333	2026-08-03 10:34:58.330333	\N	\N	\N
3376	1155	362	speaker	offer	\N	2026-08-03 10:34:58.484588	2026-08-03 10:34:58.484588	\N	\N	\N
3377	1156	363	submitter	\N	\N	2026-08-03 10:34:58.544523	2026-08-03 10:34:58.544523	\N	\N	\N
3378	1156	363	speaker	offer	\N	2026-08-03 10:34:58.559967	2026-08-03 10:34:58.559967	\N	\N	\N
3379	1157	364	submitter	\N	\N	2026-08-03 10:34:58.593926	2026-08-03 10:34:58.593926	\N	\N	\N
3380	1157	364	speaker	offer	\N	2026-08-03 10:34:58.602931	2026-08-03 10:34:58.602931	\N	\N	\N
3381	1158	365	submitter	\N	\N	2026-08-03 10:34:58.631261	2026-08-03 10:34:58.631261	\N	\N	\N
3382	1158	365	speaker	offer	\N	2026-08-03 10:34:58.640012	2026-08-03 10:34:58.640012	\N	\N	\N
3383	1158	357	coordinator	\N	\N	2026-08-03 10:34:58.660939	2026-08-03 10:34:58.660939	\N	\N	\N
3384	1159	366	submitter	\N	\N	2026-08-03 10:34:58.687872	2026-08-03 10:34:58.687872	\N	\N	\N
3385	1159	366	speaker	offer	\N	2026-08-03 10:34:58.698828	2026-08-03 10:34:58.698828	\N	\N	\N
3386	1159	357	coordinator	\N	\N	2026-08-03 10:34:58.745685	2026-08-03 10:34:58.745685	\N	\N	\N
3387	1160	367	submitter	\N	\N	2026-08-03 10:34:58.76966	2026-08-03 10:34:58.76966	\N	\N	\N
3388	1160	367	speaker	offer	\N	2026-08-03 10:34:58.779461	2026-08-03 10:34:58.779461	\N	\N	\N
3210	1098	371	speaker	attending	\N	2026-08-03 10:34:53.513716	2026-08-03 10:35:52.032813	XnjsZkc2iNEgcRfvEgImb	\N	\N
3216	1100	373	speaker	attending	\N	2026-08-03 10:34:53.778814	2026-08-03 10:35:52.062263	OKARIbkWTGZQBHy8dRK8b	\N	\N
3222	1102	375	speaker	attending	\N	2026-08-03 10:34:54.010538	2026-08-03 10:35:52.099899	jtYFYPAhep42-jhBlqprb	\N	\N
3223	1102	360	speaker	attending	\N	2026-08-03 10:34:54.019568	2026-08-03 10:35:52.132175	-MulnhsaBjEprRjcIH2gb	\N	\N
3229	1104	377	speaker	attending	\N	2026-08-03 10:34:54.192832	2026-08-03 10:35:52.169193	I9OIDqt7BxYfZUGRnSQGb	\N	\N
3235	1106	379	speaker	attending	\N	2026-08-03 10:34:54.327713	2026-08-03 10:35:52.191412	ujltBLoLGIOIIAgNS6Dyb	\N	\N
3236	1106	364	speaker	attending	\N	2026-08-03 10:34:54.338248	2026-08-03 10:35:52.234182	I0c_H804eESScuQ7EJ4Ab	\N	\N
3237	1106	371	speaker	attending	\N	2026-08-03 10:34:54.348442	2026-08-03 10:35:52.281896	FS2QtsYpemVXX5KZBmOHb	\N	\N
3289	1127	378	speaker	attending	\N	2026-08-03 10:34:56.231271	2026-08-03 10:35:52.322803	LL9_p73kLeDcCJs4VAJCb	\N	\N
3295	1129	380	speaker	attending	\N	2026-08-03 10:34:56.404885	2026-08-03 10:35:52.346922	kqKAEyG8IeaS5NmZ0TXxb	\N	\N
3301	1131	360	speaker	attending	\N	2026-08-03 10:34:56.54083	2026-08-03 10:35:52.370931	6KWTod0WOGubRNy2W23Bb	\N	\N
3302	1131	367	speaker	attending	\N	2026-08-03 10:34:56.55041	2026-08-03 10:35:52.415182	HWBWIC6bfcCdM5ihxP0Lb	\N	\N
3308	1133	362	speaker	attending	\N	2026-08-03 10:34:56.744297	2026-08-03 10:35:52.460404	oZhYSYbP6RsiB6qoAvcXb	\N	\N
3314	1135	364	speaker	attending	\N	2026-08-03 10:34:56.874652	2026-08-03 10:35:52.492277	TchZzAxRsvySmwgfseW2b	\N	\N
3320	1137	366	speaker	attending	\N	2026-08-03 10:34:57.035646	2026-08-03 10:35:52.526764	6ftZUsY5iwZgsPcuv2CIb	\N	\N
3326	1139	368	speaker	attending	\N	2026-08-03 10:34:57.173502	2026-08-03 10:35:52.555311	7RhbLvEsB46U90FYs2fdb	\N	\N
3327	1139	375	speaker	attending	\N	2026-08-03 10:34:57.183282	2026-08-03 10:35:52.589442	GoelgQP5MOVTatAG8UIcb	\N	\N
3333	1141	370	speaker	attending	\N	2026-08-03 10:34:57.350931	2026-08-03 10:35:52.624427	P4RHOTWBk9aV_fcP8bcRb	\N	\N
3339	1143	372	speaker	attending	\N	2026-08-03 10:34:57.491557	2026-08-03 10:35:52.660155	-Vpbg3mYUsO29wlow5UNb	\N	\N
3345	1145	374	speaker	attending	\N	2026-08-03 10:34:57.665226	2026-08-03 10:35:52.688702	MZqlCKctlhReLQ4L19dAb	\N	\N
3346	1145	381	speaker	attending	\N	2026-08-03 10:34:57.680795	2026-08-03 10:35:52.7248	1rjoz2nmaCcqrShwejmvb	\N	\N
\.


--
-- Data for Name: event_ratings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_ratings (id, event_id, person_id, rating, comment, created_at, updated_at, peer) FROM stdin;
2761	1104	358	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:04.166854	2026-08-03 10:35:04.166854	f
2762	1104	359	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:04.283956	2026-08-03 10:35:04.283956	f
2763	1104	357	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:04.401395	2026-08-03 10:35:04.401395	f
2764	1105	358	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:04.534662	2026-08-03 10:35:04.534662	f
2765	1105	359	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:04.694282	2026-08-03 10:35:04.694282	f
2766	1105	356	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:04.798447	2026-08-03 10:35:04.798447	f
2767	1106	358	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:04.902758	2026-08-03 10:35:04.902758	f
2768	1106	357	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:05.019184	2026-08-03 10:35:05.019184	f
2769	1106	356	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:05.120119	2026-08-03 10:35:05.120119	f
2770	1107	359	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:05.230712	2026-08-03 10:35:05.230712	f
2771	1107	357	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:05.332371	2026-08-03 10:35:05.332371	f
2772	1107	356	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:05.413766	2026-08-03 10:35:05.413766	f
2773	1108	358	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:05.532804	2026-08-03 10:35:05.532804	f
2774	1108	359	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:05.642292	2026-08-03 10:35:05.642292	f
2775	1108	357	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:05.741684	2026-08-03 10:35:05.741684	f
2776	1109	358	2.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:05.887959	2026-08-03 10:35:05.887959	f
2777	1109	359	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:05.999246	2026-08-03 10:35:05.999246	f
2778	1109	356	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:06.10476	2026-08-03 10:35:06.10476	f
2779	1110	358	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:06.218993	2026-08-03 10:35:06.218993	f
2780	1110	357	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:06.321211	2026-08-03 10:35:06.321211	f
2781	1110	356	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:06.422821	2026-08-03 10:35:06.422821	f
2782	1111	359	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:06.536789	2026-08-03 10:35:06.536789	f
2783	1111	357	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:06.638254	2026-08-03 10:35:06.638254	f
2784	1111	356	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:06.76054	2026-08-03 10:35:06.76054	f
2788	1113	358	4.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:07.182935	2026-08-03 10:35:07.182935	f
2789	1113	359	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:07.288909	2026-08-03 10:35:07.288909	f
2790	1113	356	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:07.377385	2026-08-03 10:35:07.377385	f
2791	1114	358	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:07.496776	2026-08-03 10:35:07.496776	f
2792	1114	357	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:07.593457	2026-08-03 10:35:07.593457	f
2793	1114	356	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:07.698532	2026-08-03 10:35:07.698532	f
2794	1115	359	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:07.814926	2026-08-03 10:35:07.814926	f
2795	1115	357	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:07.922475	2026-08-03 10:35:07.922475	f
2796	1115	356	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:08.028824	2026-08-03 10:35:08.028824	f
2797	1116	358	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:08.161825	2026-08-03 10:35:08.161825	f
2798	1116	359	3	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:08.268647	2026-08-03 10:35:08.268647	f
2799	1116	357	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:08.406962	2026-08-03 10:35:08.406962	f
2800	1121	358	5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:08.541345	2026-08-03 10:35:08.541345	f
2801	1121	359	2	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:08.659383	2026-08-03 10:35:08.659383	f
2802	1121	356	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:08.768005	2026-08-03 10:35:08.768005	f
2803	1122	358	2	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:08.981918	2026-08-03 10:35:08.981918	f
2804	1122	357	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:09.098827	2026-08-03 10:35:09.098827	f
2805	1122	356	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:09.214729	2026-08-03 10:35:09.214729	f
2806	1123	359	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:09.345924	2026-08-03 10:35:09.345924	f
2807	1123	357	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:09.462647	2026-08-03 10:35:09.462647	f
2808	1123	356	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:09.577568	2026-08-03 10:35:09.577568	f
2809	1124	358	3	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:09.816267	2026-08-03 10:35:09.816267	f
2810	1124	359	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:09.97854	2026-08-03 10:35:09.97854	f
2811	1124	357	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:10.107129	2026-08-03 10:35:10.107129	f
2812	1125	358	3.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:10.24969	2026-08-03 10:35:10.24969	f
2813	1125	359	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:10.397584	2026-08-03 10:35:10.397584	f
2814	1125	356	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:10.548757	2026-08-03 10:35:10.548757	f
2815	1126	358	4	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:10.740865	2026-08-03 10:35:10.740865	f
2816	1126	357	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:10.923056	2026-08-03 10:35:10.923056	f
2817	1126	356	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:11.06181	2026-08-03 10:35:11.06181	f
2818	1127	359	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:11.216147	2026-08-03 10:35:11.216147	f
2819	1127	357	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:11.366351	2026-08-03 10:35:11.366351	f
2820	1127	356	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:11.510245	2026-08-03 10:35:11.510245	f
2821	1128	358	5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:11.642958	2026-08-03 10:35:11.642958	f
2822	1128	359	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:11.818935	2026-08-03 10:35:11.818935	f
2823	1128	357	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:11.925684	2026-08-03 10:35:11.925684	f
2824	1129	358	2	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:12.063876	2026-08-03 10:35:12.063876	f
2825	1129	359	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:12.192856	2026-08-03 10:35:12.192856	f
2826	1129	356	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:12.307264	2026-08-03 10:35:12.307264	f
2827	1130	358	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:12.48771	2026-08-03 10:35:12.48771	f
2828	1130	357	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:12.647616	2026-08-03 10:35:12.647616	f
2829	1130	356	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:12.821858	2026-08-03 10:35:12.821858	f
2830	1131	359	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:13.006433	2026-08-03 10:35:13.006433	f
2831	1131	357	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:13.18832	2026-08-03 10:35:13.18832	f
2832	1131	356	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:13.326102	2026-08-03 10:35:13.326102	f
2833	1132	358	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:13.47473	2026-08-03 10:35:13.47473	f
2834	1132	359	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:13.625545	2026-08-03 10:35:13.625545	f
2835	1132	357	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:13.790782	2026-08-03 10:35:13.790782	f
2836	1133	358	4	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:13.934073	2026-08-03 10:35:13.934073	f
2837	1133	359	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:14.06823	2026-08-03 10:35:14.06823	f
2838	1133	356	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:14.189124	2026-08-03 10:35:14.189124	f
2839	1134	358	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:14.334137	2026-08-03 10:35:14.334137	f
2840	1134	357	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:14.464807	2026-08-03 10:35:14.464807	f
2841	1134	356	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:14.627523	2026-08-03 10:35:14.627523	f
2842	1135	359	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:14.809945	2026-08-03 10:35:14.809945	f
2843	1135	357	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:14.996132	2026-08-03 10:35:14.996132	f
2844	1135	356	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:15.1272	2026-08-03 10:35:15.1272	f
2845	1136	358	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:15.34227	2026-08-03 10:35:15.34227	f
2846	1136	359	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:15.537137	2026-08-03 10:35:15.537137	f
2847	1136	357	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:15.659329	2026-08-03 10:35:15.659329	f
2848	1137	358	2.5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:15.847989	2026-08-03 10:35:15.847989	f
2849	1137	359	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:16.045381	2026-08-03 10:35:16.045381	f
2850	1137	356	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:16.198361	2026-08-03 10:35:16.198361	f
2851	1138	358	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:16.483678	2026-08-03 10:35:16.483678	f
2852	1138	357	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:16.83195	2026-08-03 10:35:16.83195	f
2853	1138	356	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:17.127272	2026-08-03 10:35:17.127272	f
2854	1139	359	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:17.348008	2026-08-03 10:35:17.348008	f
2855	1139	357	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:17.572071	2026-08-03 10:35:17.572071	f
2856	1139	356	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:17.830725	2026-08-03 10:35:17.830725	f
2857	1140	358	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:18.025264	2026-08-03 10:35:18.025264	f
2858	1140	359	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:18.206826	2026-08-03 10:35:18.206826	f
2859	1140	357	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:18.344927	2026-08-03 10:35:18.344927	f
2860	1141	358	4.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:18.515969	2026-08-03 10:35:18.515969	f
2861	1141	359	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:18.669991	2026-08-03 10:35:18.669991	f
2862	1141	356	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:18.858999	2026-08-03 10:35:18.858999	f
2863	1142	358	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:19.221975	2026-08-03 10:35:19.221975	f
2864	1142	357	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:19.483274	2026-08-03 10:35:19.483274	f
2865	1142	356	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:19.793292	2026-08-03 10:35:19.793292	f
2866	1143	359	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:20.079165	2026-08-03 10:35:20.079165	f
2867	1143	357	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:20.25528	2026-08-03 10:35:20.25528	f
2868	1143	356	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:20.384441	2026-08-03 10:35:20.384441	f
2869	1144	358	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:20.546814	2026-08-03 10:35:20.546814	f
2870	1144	359	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:20.775329	2026-08-03 10:35:20.775329	f
2871	1144	357	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:20.994351	2026-08-03 10:35:20.994351	f
2872	1145	358	3	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:21.243076	2026-08-03 10:35:21.243076	f
2873	1145	359	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:21.389367	2026-08-03 10:35:21.389367	f
2874	1145	356	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:21.554102	2026-08-03 10:35:21.554102	f
2875	1146	358	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:21.744263	2026-08-03 10:35:21.744263	f
2876	1146	357	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:21.90936	2026-08-03 10:35:21.90936	f
2877	1146	356	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:22.044398	2026-08-03 10:35:22.044398	f
2878	1147	359	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:22.284598	2026-08-03 10:35:22.284598	f
2879	1147	357	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:22.445239	2026-08-03 10:35:22.445239	f
2880	1147	356	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:22.655753	2026-08-03 10:35:22.655753	f
2881	1148	358	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:22.87026	2026-08-03 10:35:22.87026	f
2882	1148	359	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:23.007961	2026-08-03 10:35:23.007961	f
2883	1148	357	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:23.217815	2026-08-03 10:35:23.217815	f
2884	1149	358	5	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:23.443387	2026-08-03 10:35:23.443387	f
2885	1149	359	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:23.632331	2026-08-03 10:35:23.632331	f
2886	1149	356	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:23.867303	2026-08-03 10:35:23.867303	f
2887	1150	358	2	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:24.127961	2026-08-03 10:35:24.127961	f
2888	1150	357	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:24.283423	2026-08-03 10:35:24.283423	f
2889	1150	356	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:24.51653	2026-08-03 10:35:24.51653	f
2890	1151	359	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:24.825451	2026-08-03 10:35:24.825451	f
2891	1151	357	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:25.128819	2026-08-03 10:35:25.128819	f
2892	1151	356	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:25.428383	2026-08-03 10:35:25.428383	f
2893	1152	358	3	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:25.627217	2026-08-03 10:35:25.627217	f
2894	1152	359	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:25.786212	2026-08-03 10:35:25.786212	f
2895	1152	357	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:25.979048	2026-08-03 10:35:25.979048	f
2896	1153	358	3.5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:26.280712	2026-08-03 10:35:26.280712	f
2897	1153	359	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:26.51961	2026-08-03 10:35:26.51961	f
2898	1153	356	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:26.805053	2026-08-03 10:35:26.805053	f
2899	1154	358	4	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:27.036557	2026-08-03 10:35:27.036557	f
2900	1154	357	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:27.245796	2026-08-03 10:35:27.245796	f
2901	1154	356	2	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:27.492554	2026-08-03 10:35:27.492554	f
2902	1155	359	5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:27.684348	2026-08-03 10:35:27.684348	f
2903	1155	357	2	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:27.962645	2026-08-03 10:35:27.962645	f
2904	1155	356	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:28.366469	2026-08-03 10:35:28.366469	f
2905	1158	358	2.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:28.606596	2026-08-03 10:35:28.606596	f
2906	1158	357	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:28.934604	2026-08-03 10:35:28.934604	f
2907	1158	356	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:29.139995	2026-08-03 10:35:29.139995	f
2908	1159	359	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:29.493719	2026-08-03 10:35:29.493719	f
2909	1159	357	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:29.664635	2026-08-03 10:35:29.664635	f
2910	1159	356	4.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:29.858044	2026-08-03 10:35:29.858044	f
2911	1160	358	3.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:30.192943	2026-08-03 10:35:30.192943	f
2912	1160	359	4	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:30.54418	2026-08-03 10:35:30.54418	f
2913	1160	357	4.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:30.863331	2026-08-03 10:35:30.863331	f
2914	1087	379	3	Peer review: methodology is sound.	2026-08-03 10:35:31.444355	2026-08-03 10:35:31.444355	t
2915	1088	379	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.467511	2026-08-03 10:35:31.467511	t
2916	1089	379	4	Peer review: solid contribution, accept.	2026-08-03 10:35:31.491744	2026-08-03 10:35:31.491744	t
2917	1090	380	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.516051	2026-08-03 10:35:31.516051	t
2918	1091	380	4	Peer review: solid contribution, accept.	2026-08-03 10:35:31.527516	2026-08-03 10:35:31.527516	t
2919	1092	380	4.5	Peer review: methodology is sound.	2026-08-03 10:35:31.539592	2026-08-03 10:35:31.539592	t
2920	1093	381	4	Peer review: solid contribution, accept.	2026-08-03 10:35:31.555769	2026-08-03 10:35:31.555769	t
2921	1094	381	4.5	Peer review: methodology is sound.	2026-08-03 10:35:31.572549	2026-08-03 10:35:31.572549	t
2922	1095	381	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.586611	2026-08-03 10:35:31.586611	t
2923	1097	360	4.5	Peer review: methodology is sound.	2026-08-03 10:35:31.605354	2026-08-03 10:35:31.605354	t
2924	1098	360	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.619128	2026-08-03 10:35:31.619128	t
2925	1099	360	3	Peer review: solid contribution, accept.	2026-08-03 10:35:31.636201	2026-08-03 10:35:31.636201	t
2926	1100	361	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.660512	2026-08-03 10:35:31.660512	t
2927	1101	361	3	Peer review: solid contribution, accept.	2026-08-03 10:35:31.673119	2026-08-03 10:35:31.673119	t
2928	1102	361	3.5	Peer review: methodology is sound.	2026-08-03 10:35:31.683138	2026-08-03 10:35:31.683138	t
2929	1103	362	3	Peer review: solid contribution, accept.	2026-08-03 10:35:31.697145	2026-08-03 10:35:31.697145	t
2930	1104	362	3.5	Peer review: methodology is sound.	2026-08-03 10:35:31.70648	2026-08-03 10:35:31.70648	t
2931	1105	362	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.718722	2026-08-03 10:35:31.718722	t
2932	1106	363	3.5	Peer review: methodology is sound.	2026-08-03 10:35:31.73507	2026-08-03 10:35:31.73507	t
2933	1107	363	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.752501	2026-08-03 10:35:31.752501	t
2934	1108	363	4.5	Peer review: solid contribution, accept.	2026-08-03 10:35:31.769862	2026-08-03 10:35:31.769862	t
2935	1110	364	4	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.806037	2026-08-03 10:35:31.806037	t
2936	1111	364	4.5	Peer review: solid contribution, accept.	2026-08-03 10:35:31.836069	2026-08-03 10:35:31.836069	t
2939	1113	365	5	Peer review: methodology is sound.	2026-08-03 10:35:31.914121	2026-08-03 10:35:31.914121	t
2940	1115	365	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.927905	2026-08-03 10:35:31.927905	t
2941	1116	366	5	Peer review: methodology is sound.	2026-08-03 10:35:31.945732	2026-08-03 10:35:31.945732	t
2942	1117	366	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:31.958351	2026-08-03 10:35:31.958351	t
2943	1118	366	3.5	Peer review: solid contribution, accept.	2026-08-03 10:35:31.974775	2026-08-03 10:35:31.974775	t
2944	1119	367	3	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.00393	2026-08-03 10:35:32.00393	t
2945	1120	367	3.5	Peer review: solid contribution, accept.	2026-08-03 10:35:32.03733	2026-08-03 10:35:32.03733	t
2946	1121	367	4	Peer review: methodology is sound.	2026-08-03 10:35:32.070019	2026-08-03 10:35:32.070019	t
2947	1122	372	3.5	Peer review: solid contribution, accept.	2026-08-03 10:35:32.104052	2026-08-03 10:35:32.104052	t
2948	1123	372	4	Peer review: methodology is sound.	2026-08-03 10:35:32.126167	2026-08-03 10:35:32.126167	t
2949	1127	372	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.152874	2026-08-03 10:35:32.152874	t
2950	1129	373	4	Peer review: methodology is sound.	2026-08-03 10:35:32.1834	2026-08-03 10:35:32.1834	t
2951	1130	373	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.205829	2026-08-03 10:35:32.205829	t
2952	1131	373	5	Peer review: solid contribution, accept.	2026-08-03 10:35:32.229171	2026-08-03 10:35:32.229171	t
2953	1131	374	4.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.261872	2026-08-03 10:35:32.261872	t
2954	1132	374	5	Peer review: solid contribution, accept.	2026-08-03 10:35:32.285019	2026-08-03 10:35:32.285019	t
2955	1133	374	3	Peer review: methodology is sound.	2026-08-03 10:35:32.309339	2026-08-03 10:35:32.309339	t
2956	1133	375	5	Peer review: solid contribution, accept.	2026-08-03 10:35:32.341927	2026-08-03 10:35:32.341927	t
2957	1134	375	3	Peer review: methodology is sound.	2026-08-03 10:35:32.364409	2026-08-03 10:35:32.364409	t
2958	1135	375	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.389306	2026-08-03 10:35:32.389306	t
2959	1136	376	3	Peer review: methodology is sound.	2026-08-03 10:35:32.417001	2026-08-03 10:35:32.417001	t
2960	1137	376	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.438958	2026-08-03 10:35:32.438958	t
2961	1138	376	4	Peer review: solid contribution, accept.	2026-08-03 10:35:32.452168	2026-08-03 10:35:32.452168	t
2962	1140	377	3.5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.465152	2026-08-03 10:35:32.465152	t
2963	1141	377	4	Peer review: solid contribution, accept.	2026-08-03 10:35:32.472865	2026-08-03 10:35:32.472865	t
2964	1142	377	4.5	Peer review: methodology is sound.	2026-08-03 10:35:32.481961	2026-08-03 10:35:32.481961	t
2965	1143	378	4	Peer review: solid contribution, accept.	2026-08-03 10:35:32.494473	2026-08-03 10:35:32.494473	t
2966	1144	378	4.5	Peer review: methodology is sound.	2026-08-03 10:35:32.505378	2026-08-03 10:35:32.505378	t
2967	1145	378	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.513829	2026-08-03 10:35:32.513829	t
2968	1148	368	4.5	Peer review: methodology is sound.	2026-08-03 10:35:32.526167	2026-08-03 10:35:32.526167	t
2969	1149	368	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.535591	2026-08-03 10:35:32.535591	t
2970	1150	368	3	Peer review: solid contribution, accept.	2026-08-03 10:35:32.545865	2026-08-03 10:35:32.545865	t
2971	1151	369	5	Peer review: the argument holds, minor wording issues.	2026-08-03 10:35:32.559625	2026-08-03 10:35:32.559625	t
2972	1154	370	3	Peer review: solid contribution, accept.	2026-08-03 10:35:32.574703	2026-08-03 10:35:32.574703	t
2973	1157	371	3.5	Peer review: methodology is sound.	2026-08-03 10:35:32.595822	2026-08-03 10:35:32.595822	t
2974	1112	358	1	I do not think this fits at all.	2026-08-03 10:35:33.378071	2026-08-03 10:35:33.378071	f
2975	1112	359	5	I would put this in the main hall.	2026-08-03 10:35:33.594147	2026-08-03 10:35:33.594147	f
2976	1161	361	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:33.975838	2026-08-03 10:35:33.975838	t
2977	1161	365	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:34.47149	2026-08-03 10:35:34.47149	t
2978	1161	369	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:34.891878	2026-08-03 10:35:34.891878	t
2979	1161	358	3.5	Expert review: solid contribution, accept for the programme.	2026-08-03 10:35:35.176425	2026-08-03 10:35:35.176425	f
2980	1162	362	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:35.606695	2026-08-03 10:35:35.606695	t
2981	1162	366	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:35.857564	2026-08-03 10:35:35.857564	t
2982	1162	370	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:36.104239	2026-08-03 10:35:36.104239	t
2983	1162	359	4	Expert review: solid contribution, accept for the programme.	2026-08-03 10:35:36.404898	2026-08-03 10:35:36.404898	f
2984	1163	363	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:36.823167	2026-08-03 10:35:36.823167	t
2985	1163	367	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:37.036358	2026-08-03 10:35:37.036358	t
2986	1163	371	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:37.287004	2026-08-03 10:35:37.287004	t
2987	1164	364	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:37.651775	2026-08-03 10:35:37.651775	t
2988	1164	368	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:37.893957	2026-08-03 10:35:37.893957	t
2989	1164	372	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:38.139195	2026-08-03 10:35:38.139195	t
2990	1165	365	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:38.515235	2026-08-03 10:35:38.515235	t
2991	1165	369	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:38.740482	2026-08-03 10:35:38.740482	t
2992	1165	373	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:38.992737	2026-08-03 10:35:38.992737	t
2993	1166	366	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:39.310952	2026-08-03 10:35:39.310952	t
2994	1166	370	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:39.549181	2026-08-03 10:35:39.549181	t
2995	1166	374	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:39.91674	2026-08-03 10:35:39.91674	t
2996	1167	367	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:40.348	2026-08-03 10:35:40.348	t
2997	1167	371	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:40.61006	2026-08-03 10:35:40.61006	t
2998	1167	375	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:40.8617	2026-08-03 10:35:40.8617	t
2999	1168	368	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:41.187605	2026-08-03 10:35:41.187605	t
3000	1168	372	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:41.441575	2026-08-03 10:35:41.441575	t
3001	1168	376	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:41.871746	2026-08-03 10:35:41.871746	t
3002	1168	359	5	Expert review: solid contribution, accept for the programme.	2026-08-03 10:35:42.156678	2026-08-03 10:35:42.156678	f
3003	1169	369	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:42.889884	2026-08-03 10:35:42.889884	t
3004	1169	373	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:43.184666	2026-08-03 10:35:43.184666	t
3005	1169	377	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:43.751346	2026-08-03 10:35:43.751346	t
3006	1170	370	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:44.262088	2026-08-03 10:35:44.262088	t
3007	1170	374	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:44.617657	2026-08-03 10:35:44.617657	t
3008	1170	378	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:45.080583	2026-08-03 10:35:45.080583	t
3009	1171	371	3	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:45.660292	2026-08-03 10:35:45.660292	t
3010	1171	375	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:46.128995	2026-08-03 10:35:46.128995	t
3011	1171	379	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:46.675058	2026-08-03 10:35:46.675058	t
3012	1171	358	4.5	Expert review: solid contribution, accept for the programme.	2026-08-03 10:35:47.092124	2026-08-03 10:35:47.092124	f
3013	1172	372	3.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:47.644183	2026-08-03 10:35:47.644183	t
3014	1172	376	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:47.963493	2026-08-03 10:35:47.963493	t
3015	1172	380	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:48.340769	2026-08-03 10:35:48.340769	t
3016	1172	359	5	Expert review: solid contribution, accept for the programme.	2026-08-03 10:35:48.739159	2026-08-03 10:35:48.739159	f
3017	1173	373	4	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:49.284638	2026-08-03 10:35:49.284638	t
3018	1173	377	4.5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:49.567551	2026-08-03 10:35:49.567551	t
3019	1173	381	5	Peer review: the method is described well enough to replicate.	2026-08-03 10:35:49.82602	2026-08-03 10:35:49.82602	t
2739	1096	357	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:01.736844	2026-08-03 10:35:01.736844	f
2740	1097	358	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:01.838103	2026-08-03 10:35:01.838103	f
2741	1097	359	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:01.940504	2026-08-03 10:35:01.940504	f
2742	1097	356	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:02.021543	2026-08-03 10:35:02.021543	f
2743	1098	358	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:02.153016	2026-08-03 10:35:02.153016	f
2744	1098	357	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:02.261384	2026-08-03 10:35:02.261384	f
2745	1098	356	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:02.424456	2026-08-03 10:35:02.424456	f
2746	1099	359	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:02.552157	2026-08-03 10:35:02.552157	f
2747	1099	357	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:02.653348	2026-08-03 10:35:02.653348	f
2748	1099	356	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:02.750472	2026-08-03 10:35:02.750472	f
2749	1100	358	5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:02.84733	2026-08-03 10:35:02.84733	f
2750	1100	359	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:02.938792	2026-08-03 10:35:02.938792	f
2751	1100	357	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:03.042246	2026-08-03 10:35:03.042246	f
2752	1101	358	2	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:35:03.145797	2026-08-03 10:35:03.145797	f
2753	1101	359	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:03.247974	2026-08-03 10:35:03.247974	f
2754	1101	356	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:03.342045	2026-08-03 10:35:03.342045	f
2755	1102	358	2.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:03.443961	2026-08-03 10:35:03.443961	f
2756	1102	357	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:03.578981	2026-08-03 10:35:03.578981	f
2757	1102	356	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:03.691236	2026-08-03 10:35:03.691236	f
2758	1103	359	3.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:03.852822	2026-08-03 10:35:03.852822	f
2759	1103	357	4	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:03.951727	2026-08-03 10:35:03.951727	f
2760	1103	356	4.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:04.051681	2026-08-03 10:35:04.051681	f
2676	1062	359	2.5	Abstract is a bit thin.	2026-08-03 10:34:48.933141	2026-08-03 10:34:48.933141	f
2677	1062	357	3	Great fit for our audience.	2026-08-03 10:34:48.998453	2026-08-03 10:34:48.998453	f
2678	1063	358	2.5	Abstract is a bit thin.	2026-08-03 10:34:49.058103	2026-08-03 10:34:49.058103	f
2679	1063	359	3	Great fit for our audience.	2026-08-03 10:34:49.137537	2026-08-03 10:34:49.137537	f
2680	1064	358	3	Great fit for our audience.	2026-08-03 10:34:49.197009	2026-08-03 10:34:49.197009	f
2681	1064	357	4	Solid topic, would like to see it.	2026-08-03 10:34:49.261569	2026-08-03 10:34:49.261569	f
2682	1065	359	4	Solid topic, would like to see it.	2026-08-03 10:34:49.320569	2026-08-03 10:34:49.320569	f
2683	1065	357	4.5	Abstract is a bit thin.	2026-08-03 10:34:49.393254	2026-08-03 10:34:49.393254	f
2684	1066	358	4	Solid topic, would like to see it.	2026-08-03 10:34:49.462408	2026-08-03 10:34:49.462408	f
2685	1066	359	4.5	Abstract is a bit thin.	2026-08-03 10:34:49.528549	2026-08-03 10:34:49.528549	f
2686	1067	358	4.5	Abstract is a bit thin.	2026-08-03 10:34:49.591451	2026-08-03 10:34:49.591451	f
2687	1067	357	2	We had a similar talk last year.	2026-08-03 10:34:49.649347	2026-08-03 10:34:49.649347	f
2688	1068	359	2	We had a similar talk last year.	2026-08-03 10:34:49.709765	2026-08-03 10:34:49.709765	f
2689	1068	357	2.5	Solid topic, would like to see it.	2026-08-03 10:34:49.76781	2026-08-03 10:34:49.76781	f
2690	1069	358	2	We had a similar talk last year.	2026-08-03 10:34:49.819246	2026-08-03 10:34:49.819246	f
2691	1069	359	2.5	Solid topic, would like to see it.	2026-08-03 10:34:49.881539	2026-08-03 10:34:49.881539	f
2692	1070	358	2.5	Solid topic, would like to see it.	2026-08-03 10:34:49.953357	2026-08-03 10:34:49.953357	f
2693	1070	357	3.5	Great fit for our audience.	2026-08-03 10:34:50.024709	2026-08-03 10:34:50.024709	f
2694	1071	359	3.5	Great fit for our audience.	2026-08-03 10:34:50.082915	2026-08-03 10:34:50.082915	f
2695	1071	357	4	We had a similar talk last year.	2026-08-03 10:34:50.148159	2026-08-03 10:34:50.148159	f
2696	1072	358	3.5	Great fit for our audience.	2026-08-03 10:34:50.203158	2026-08-03 10:34:50.203158	f
2697	1072	359	4	We had a similar talk last year.	2026-08-03 10:34:50.266853	2026-08-03 10:34:50.266853	f
2698	1073	358	4	We had a similar talk last year.	2026-08-03 10:34:50.322066	2026-08-03 10:34:50.322066	f
2699	1073	357	5	Abstract is a bit thin.	2026-08-03 10:34:50.386575	2026-08-03 10:34:50.386575	f
2700	1074	359	5	Abstract is a bit thin.	2026-08-03 10:34:50.442524	2026-08-03 10:34:50.442524	f
2701	1074	357	2	Great fit for our audience.	2026-08-03 10:34:50.513972	2026-08-03 10:34:50.513972	f
2702	1075	358	5	Abstract is a bit thin.	2026-08-03 10:34:50.575625	2026-08-03 10:34:50.575625	f
2703	1075	359	2	Great fit for our audience.	2026-08-03 10:34:50.635719	2026-08-03 10:34:50.635719	f
2704	1076	358	2	Great fit for our audience.	2026-08-03 10:34:50.698754	2026-08-03 10:34:50.698754	f
2705	1076	357	3	Solid topic, would like to see it.	2026-08-03 10:34:50.776396	2026-08-03 10:34:50.776396	f
2706	1079	358	3.5	Abstract is a bit thin.	2026-08-03 10:34:50.834397	2026-08-03 10:34:50.834397	f
2707	1079	357	4.5	We had a similar talk last year.	2026-08-03 10:34:50.906637	2026-08-03 10:34:50.906637	f
2708	1081	358	4.5	We had a similar talk last year.	2026-08-03 10:34:50.994112	2026-08-03 10:34:50.994112	f
2709	1081	359	5	Solid topic, would like to see it.	2026-08-03 10:34:51.079991	2026-08-03 10:34:51.079991	f
2710	1087	359	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:34:58.803844	2026-08-03 10:34:58.803844	f
2711	1087	357	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:34:58.932865	2026-08-03 10:34:58.932865	f
2712	1087	356	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:34:59.064831	2026-08-03 10:34:59.064831	f
2713	1088	358	2.5	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:34:59.190434	2026-08-03 10:34:59.190434	f
2714	1088	359	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:34:59.300743	2026-08-03 10:34:59.300743	f
2715	1088	357	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:34:59.388514	2026-08-03 10:34:59.388514	f
2716	1089	358	3	Great fit for our audience, and the speaker is experienced.	2026-08-03 10:34:59.490774	2026-08-03 10:34:59.490774	f
2717	1089	359	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:34:59.581646	2026-08-03 10:34:59.581646	f
2718	1089	356	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:34:59.659296	2026-08-03 10:34:59.659296	f
2719	1090	358	3.5	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:34:59.7583	2026-08-03 10:34:59.7583	f
2720	1090	357	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:34:59.854561	2026-08-03 10:34:59.854561	f
2721	1090	356	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:34:59.939809	2026-08-03 10:34:59.939809	f
2722	1091	359	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:00.035269	2026-08-03 10:35:00.035269	f
2723	1091	357	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:00.125055	2026-08-03 10:35:00.125055	f
2724	1091	356	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:00.209169	2026-08-03 10:35:00.209169	f
2725	1092	358	4.5	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:00.31554	2026-08-03 10:35:00.31554	f
2726	1092	359	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:00.416909	2026-08-03 10:35:00.416909	f
2727	1092	357	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:00.523044	2026-08-03 10:35:00.523044	f
2728	1093	358	5	Solid topic, well written abstract. I would like to see this.	2026-08-03 10:35:00.650763	2026-08-03 10:35:00.650763	f
2729	1093	359	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:00.774557	2026-08-03 10:35:00.774557	f
2730	1093	356	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:00.861041	2026-08-03 10:35:00.861041	f
2731	1094	358	2	The abstract is a bit thin - I would ask for more detail before accepting.	2026-08-03 10:35:00.971195	2026-08-03 10:35:00.971195	f
2732	1094	357	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:01.07148	2026-08-03 10:35:01.07148	f
2733	1094	356	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:01.146184	2026-08-03 10:35:01.146184	f
2734	1095	359	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:01.247175	2026-08-03 10:35:01.247175	f
2735	1095	357	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:01.342723	2026-08-03 10:35:01.342723	f
2736	1095	356	4	Strong yes from me. This is exactly the kind of session people ask for.	2026-08-03 10:35:01.436964	2026-08-03 10:35:01.436964	f
2737	1096	358	3	We had a very similar talk last year. Maybe as a lightning talk?	2026-08-03 10:35:01.536754	2026-08-03 10:35:01.536754	f
2738	1096	359	3.5	Interesting, but it overlaps with another submission in the same track.	2026-08-03 10:35:01.629385	2026-08-03 10:35:01.629385	f
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
1109	45	Feature flags at scale	Cleaning up is the hard part	lecture	4	unconfirmed	de	\N	Feature flags at scale. Cleaning up is the hard part. This abstract is demo content generated by demo:seed.	A longer description for "Feature flags at scale".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-05-13 10:34:54.653782	2026-08-03 10:35:06.108223	3.1666666666666665	3	\N	\N	1	0	\N	6540c33d-5052-44f5-8f85-5c0a6a13ca58	f	CC BY-SA 4.0	\N	kgccvJUfnj3P8pNHwCMT1xFV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1114	45	Incident response on a shoestring	Two people, one pager	lecture	4	review	en	\N	Incident response on a shoestring. Two people, one pager. This abstract is demo content generated by demo:seed.	A longer description for "Incident response on a shoestring".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-05-18 10:34:55.154693	2026-08-03 10:35:07.702225	3.5	3	\N	\N	1	0	\N	800fe6f8-e480-467d-a963-1a33800e07b3	f	CC BY-SA 4.0	\N	72iVWHPLuYdVEFQtDag1KgJX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1124	45	Migrating 200 microservices	A long story	lecture	8	withdrawn	en	\N	Migrating 200 microservices. A long story. This abstract is demo content generated by demo:seed.	A longer description for "Migrating 200 microservices".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-05-28 10:34:55.795665	2026-08-03 10:35:10.11131	3.5	3	\N	\N	1	0	\N	1caab3c0-e2d2-44b5-987d-85fce3314c64	f	CC BY-SA 4.0	\N	VMM2Ck1t1BtJ13t7sYwXFwem	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1125	45	Kubernetes operators from scratch	Writing your own controller	workshop	8	withdrawn	en	\N	Kubernetes operators from scratch. Writing your own controller. This abstract is demo content generated by demo:seed.	A longer description for "Kubernetes operators from scratch".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-05-29 10:34:55.917436	2026-08-03 10:35:10.556064	4.166666666666667	3	Speaker changed employer.	\N	1	0	\N	269a0344-b123-46d5-9ebc-ab6aef844916	f	CC BY-SA 4.0	\N	KaRkxwiA6oE5JqBgf5BxB5a7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1126	45	Sponsor session: observability tooling	Vendor showcase	other	4	canceled	en	\N	Sponsor session: observability tooling. Vendor showcase. This abstract is demo content generated by demo:seed.	A longer description for "Sponsor session: observability tooling".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	\N	2026-05-30 10:34:56.010667	2026-08-03 10:35:11.066384	3.6666666666666665	3	Sponsor pulled out two weeks before the event.	\N	1	0	\N	d8970e2f-86f8-4bae-90bf-2e19f8f7e458	f	CC BY-SA 4.0	\N	Yr6g9X9YSAooLQuAWjETVgoD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	45	Lightning: our first hackathon	What we would change	lightning_talk	2	confirmed	en	\N	Lightning: our first hackathon. What we would change. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: our first hackathon".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-06-20 10:34:57.838382	2026-08-03 10:35:22.659881	3.8333333333333335	3	\N	\N	1	0	\N	142e876c-6f93-4be7-8612-76e7065c674e	f	CC BY-SA 4.0	\N	jRcdjBiPyGen84SyUxvA5QEZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	45	Cost control in the cloud	Reading the bill	lecture	4	unconfirmed	fr	\N	Cost control in the cloud. Reading the bill. This abstract is demo content generated by demo:seed.	A longer description for "Cost control in the cloud".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-06-25 10:34:58.321687	2026-08-03 10:35:25.986867	3.5	3	\N	Would prefer the second day.	1	0	\N	8eb39456-c25b-4b0f-bdf7-21ddc00c33b4	f	CC BY-SA 4.0	\N	XZifCUWq9VUsi6xhbP55w3X1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	45	Static analysis that developers keep	Tuning the noise down	lecture	4	review	en	\N	Static analysis that developers keep. Tuning the noise down. This abstract is demo content generated by demo:seed.	A longer description for "Static analysis that developers keep".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-06-26 10:34:58.383518	2026-08-03 10:35:26.812286	4.166666666666667	3	\N	\N	1	0	\N	98e3e33f-5e6c-4ba7-a9da-a4c51b248d4e	f	CC BY-SA 4.0	\N	Go8V7fesM7uasUVn7ZkQJZvM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1155	45	Running Postgres yourself	When managed is not an option	lecture	4	review	en	\N	Running Postgres yourself. When managed is not an option. This abstract is demo content generated by demo:seed.	A longer description for "Running Postgres yourself".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-06-28 10:34:58.467136	2026-08-03 10:35:28.376589	3.1666666666666665	3	\N	\N	1	0	\N	f7074b38-0810-46b8-8422-0b9681cd1418	f	CC BY-SA 4.0	\N	xwarU2gyruLQn4FAhZrRxAPS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1158	45	Our new JavaScript framework	You will love it	lecture	4	rejected	fr	\N	Our new JavaScript framework. You will love it. This abstract is demo content generated by demo:seed.	A longer description for "Our new JavaScript framework".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-07-01 10:34:58.622531	2026-08-03 10:35:29.144229	3.3333333333333335	3	\N	\N	1	0	\N	b03ed8f7-ca31-4b59-98fe-2de0f6f770ed	f	CC BY-SA 4.0	\N	wJCsCSCHa9STPiithkPFBYa1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1159	45	AI will replace conferences	A provocation	podium	4	rejected	en	\N	AI will replace conferences. A provocation. This abstract is demo content generated by demo:seed.	A longer description for "AI will replace conferences".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	\N	2026-07-02 10:34:58.67838	2026-08-03 10:35:29.863261	4	3	Programme committee voted this down unanimously.	\N	1	0	\N	ebbee757-1cc2-4704-8b65-b95b8e3c3f6f	f	CC BY-SA 4.0	\N	J2nc1W8G1X1vAAS2FSy3P4sz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1160	45	Scaling our support team	Not a technical talk	lecture	4	withdrawn	en	\N	Scaling our support team. Not a technical talk. This abstract is demo content generated by demo:seed.	A longer description for "Scaling our support team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-07-03 10:34:58.760814	2026-08-03 10:35:30.871613	4	3	\N	\N	1	0	\N	49de108b-c2f0-4f60-aa60-0c50bed97ced	f	CC BY-SA 4.0	\N	yGuTi58xP6SJ6SJ2ECpLxc6b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1110	45	Fine-tuning on a laptop	Small models, real results	workshop	8	unconfirmed	fr	\N	Fine-tuning on a laptop. Small models, real results. This abstract is demo content generated by demo:seed.	A longer description for "Fine-tuning on a laptop".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	\N	2026-05-14 10:34:54.747003	2026-08-03 10:35:31.817532	3.875	4	\N	Can only attend on the last day.	1	0	\N	4060bd91-ebbb-4aa3-9f82-a288acc0f3fd	f	CC BY-SA 4.0	\N	1FQ58SpUtgc9K45GEoZFMvPZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	45	Passkeys in production	Killing the password	lecture	4	unconfirmed	en	\N	Passkeys in production. Killing the password. This abstract is demo content generated by demo:seed.	A longer description for "Passkeys in production".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	\N	2026-05-15 10:34:54.833264	2026-08-03 10:35:31.850933	4.5	4	\N	\N	2	0	\N	7c341da3-bc1a-4af4-b6f1-23348b1fef59	f	CC BY-SA 4.0	\N	NsyRRqkAG8Z4TxMFm1MjZYok	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1115	45	Privacy engineering basics	GDPR for developers	lecture	6	review	de	\N	Privacy engineering basics. GDPR for developers. This abstract is demo content generated by demo:seed.	A longer description for "Privacy engineering basics".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	\N	2026-05-19 10:34:55.238056	2026-08-03 10:35:31.934747	3	4	\N	\N	1	0	\N	fe6e0904-f043-4b6c-981d-d3642b446036	f	CC BY-SA 4.0	\N	33vwSyWegK9ZaZgmPWB9AzRm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1117	45	Rewriting our search stack	Elastic, Postgres, or neither	lecture	4	new	en	\N	Rewriting our search stack. Elastic, Postgres, or neither. This abstract is demo content generated by demo:seed.	A longer description for "Rewriting our search stack".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-05-21 10:34:55.376599	2026-08-03 10:35:31.968141	3	1	\N	\N	1	0	\N	3a66be7d-4c11-4bb9-819d-d12e554f316f	f	CC BY-SA 4.0	\N	fK1dbXpDCjhBB8NPA5gnqour	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1118	45	A11y audits that developers act on	Reports nobody reads	lecture	4	new	en	\N	A11y audits that developers act on. Reports nobody reads. This abstract is demo content generated by demo:seed.	A longer description for "A11y audits that developers act on".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-05-22 10:34:55.417748	2026-08-03 10:35:31.983327	3.5	1	\N	\N	1	0	\N	77b7be59-dd87-4efd-8f2f-027f20999792	f	CC BY-SA 4.0	\N	fdNbA9nFpCsQsoSzTsUU7SWA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	45	Self-hosting your metrics	Prometheus on one box	lecture	4	new	en	\N	Self-hosting your metrics. Prometheus on one box. This abstract is demo content generated by demo:seed.	A longer description for "Self-hosting your metrics".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	\N	2026-05-23 10:34:55.45719	2026-08-03 10:35:32.021564	3	1	\N	\N	0	0	\N	cfd3e4be-6952-4a19-b156-312060c15ae4	f	CC BY-SA 4.0	\N	LogjCkWnVkfipuhrU8noVLEp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	45	Open data for city budgets	Scraping, cleaning, publishing	lecture	4	new	en	\N	Open data for city budgets. Scraping, cleaning, publishing. This abstract is demo content generated by demo:seed.	A longer description for "Open data for city budgets".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	\N	2026-05-24 10:34:55.507047	2026-08-03 10:35:32.056227	3.5	1	\N	First time speaker, would appreciate mentoring.	1	0	\N	7ff2cc94-8dfb-4ac2-bfdb-ce34859b5304	f	CC BY-SA 4.0	\N	36K7DBYVsQtmdRRD3j4fZeEo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1121	45	Why our startup failed	A cautionary tale	lecture	4	rejected	de	\N	Why our startup failed. A cautionary tale. This abstract is demo content generated by demo:seed.	A longer description for "Why our startup failed".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-05-25 10:34:55.545919	2026-08-03 10:35:32.078225	3.5	4	\N	\N	1	0	\N	d1ec4468-78e0-4296-9912-f6ece36c2483	f	CC BY-SA 4.0	\N	gkWamMDtHoJ6D6R97nAKzKJi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	45	Blockchain for conference tickets	A proposal	lecture	4	rejected	fr	\N	Blockchain for conference tickets. A proposal. This abstract is demo content generated by demo:seed.	A longer description for "Blockchain for conference tickets".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-05-26 10:34:55.600122	2026-08-03 10:35:32.113452	3	4	Off topic for this edition.	\N	1	0	\N	b5053d57-2fe0-4640-a55d-527b55dbf443	f	CC BY-SA 4.0	\N	1ntSuuDiM481EoJaL3o8W8dd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1123	45	Ten JavaScript frameworks in 40 minutes	A speedrun	lecture	4	rejected	en	\N	Ten JavaScript frameworks in 40 minutes. A speedrun. This abstract is demo content generated by demo:seed.	A longer description for "Ten JavaScript frameworks in 40 minutes".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-05-27 10:34:55.677117	2026-08-03 10:35:32.137841	3.625	4	\N	\N	1	0	\N	aebe1a0d-273c-4ffa-9d7a-479996ae463c	f	CC BY-SA 4.0	\N	LFqPQMHHXngyRK65A2rJY4PQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1080	43	Terraform anti-patterns	Modules gone wrong	lightning_talk	2	withdrawn	de	\N	Terraform anti-patterns. Modules gone wrong. This abstract is demo content generated by demo:seed.	A longer description for "Terraform anti-patterns".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	181	\N	2026-08-01 10:34:48.821417	2026-08-03 10:34:48.858353	\N	0	\N	Prefers a morning slot.	1	0	\N	fa8efb51-738e-4f6e-8295-ff2aa7baf75d	f	CC BY-SA 4.0	\N	XeX49qCeP5PJD3wYXJ91rf9i	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1077	43	Debugging production at 3am	War stories	lightning_talk	2	new	en	\N	Debugging production at 3am. War stories. This abstract is demo content generated by demo:seed.	A longer description for "Debugging production at 3am".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	179	\N	2026-07-29 10:34:48.678503	2026-08-03 10:34:48.710504	\N	0	\N	\N	1	0	\N	6aa51b00-f836-480b-ac58-19710aad7277	f	CC BY-SA 4.0	\N	CtWnR9n4CTe2tHNZkofh1WDF	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	43	Why we left microservices	And what we built instead	lecture	4	new	en	\N	Why we left microservices. And what we built instead. This abstract is demo content generated by demo:seed.	A longer description for "Why we left microservices".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	179	\N	2026-07-30 10:34:48.727064	2026-08-03 10:34:48.748388	\N	0	\N	Prefers a morning slot.	1	0	\N	08794fba-84ce-4a74-ab48-d1f1f177092b	f	CC BY-SA 4.0	\N	qLHtCfCArfV742Sotk41bMcm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1071	43	Supply chain attacks explained	How dependencies bite	lecture	4	unconfirmed	fr	\N	Supply chain attacks explained. How dependencies bite. This abstract is demo content generated by demo:seed.	A longer description for "Supply chain attacks explained".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	182	\N	2026-07-23 10:34:48.346697	2026-08-03 10:34:50.151628	3.75	2	\N	\N	1	0	\N	87f2ad41-1a96-4bf5-9f97-205461946c7e	f	CC BY-SA 4.0	\N	XHdvB8E7to4noPXEp4VsBKvK	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1072	43	Secrets management done right	Stop committing .env	lightning_talk	2	unconfirmed	en	\N	Secrets management done right. Stop committing .env. This abstract is demo content generated by demo:seed.	A longer description for "Secrets management done right".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	182	\N	2026-07-24 10:34:48.401396	2026-08-03 10:34:50.270444	3.75	2	\N	Prefers a morning slot.	1	0	\N	5ffc60a3-79bf-415c-8ddd-d97114f25de6	f	CC BY-SA 4.0	\N	hXcEhVKkr2txne2yDieiAj7E	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1073	43	Running a conference on frab	Lessons from the orga desk	lecture	4	unconfirmed	en	\N	Running a conference on frab. Lessons from the orga desk. This abstract is demo content generated by demo:seed.	A longer description for "Running a conference on frab".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	183	\N	2026-07-25 10:34:48.464612	2026-08-03 10:34:50.390209	4.5	2	\N	\N	2	0	\N	9fb526df-e31f-4f16-9045-51a7d5166174	f	CC BY-SA 4.0	\N	QNMi51PiQWE9vdkfRUmNoe7W	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1074	43	Growing a local user group	From 5 to 300 people	lecture	4	review	en	\N	Growing a local user group. From 5 to 300 people. This abstract is demo content generated by demo:seed.	A longer description for "Growing a local user group".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	183	\N	2026-07-26 10:34:48.538694	2026-08-03 10:34:50.51786	3.5	2	\N	Prefers a morning slot.	1	0	\N	b4899acd-2d70-4122-aaf2-f0b01e87c006	f	CC BY-SA 4.0	\N	zFy2sfAiHDyfWfMPD3us7c28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1075	43	Code of conduct enforcement	The unglamorous work	podium	4	review	de	\N	Code of conduct enforcement. The unglamorous work. This abstract is demo content generated by demo:seed.	A longer description for "Code of conduct enforcement".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	183	\N	2026-07-27 10:34:48.585109	2026-08-03 10:34:50.640065	3.5	2	\N	\N	1	0	\N	57ae12c6-742e-47ee-9323-abba952b7232	f	CC BY-SA 4.0	\N	NWTBXUajVppTbj3X7zboGs93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1076	43	My first open source contribution	A beginner story	lightning_talk	2	review	fr	\N	My first open source contribution. A beginner story. This abstract is demo content generated by demo:seed.	A longer description for "My first open source contribution".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	183	\N	2026-07-28 10:34:48.619255	2026-08-03 10:34:50.780497	2.5	2	\N	Prefers a morning slot.	2	0	\N	04df5493-49e9-4cfe-8e5d-67997c4632f7	t	CC BY-SA 4.0	\N	qmuW776Pbw7iCSBdr1AnEhHq	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1079	43	Accessibility is not optional	Testing with real users	lecture	4	rejected	en	\N	Accessibility is not optional. Testing with real users. This abstract is demo content generated by demo:seed.	A longer description for "Accessibility is not optional".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	180	\N	2026-07-31 10:34:48.763569	2026-08-03 10:34:50.911574	4	2	\N	\N	2	0	\N	264be874-6086-4f47-a7f7-cfe25b4afcd0	f	CC BY-SA 4.0	\N	B3Abu34gtmRng4La69KZ83eT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1081	43	Ask the organizers anything	Open Q&A	podium	8	canceled	fr	\N	Ask the organizers anything. Open Q&A. This abstract is demo content generated by demo:seed.	A longer description for "Ask the organizers anything".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	183	\N	2026-08-02 10:34:48.863211	2026-08-03 10:34:51.085435	4.75	2	\N	\N	1	0	\N	328e4e33-b96d-4e1a-8c64-aac79aedd2fb	f	CC BY-SA 4.0	\N	z3UXbxbdEiTe8deqjJ8xeGsM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1062	43	Scaling Rails to a million requests	What actually breaks first	lecture	4	confirmed	en	2026-08-24 07:00:00	Scaling Rails to a million requests. What actually breaks first. This abstract is demo content generated by demo:seed.	A longer description for "Scaling Rails to a million requests".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	179	132	2026-07-14 10:34:47.593886	2026-08-03 10:34:51.148208	2.75	2	\N	Prefers a morning slot.	1	0	\N	e2d428bb-8f56-48ae-905c-fda6793e360d	t	CC BY-SA 4.0	\N	g9nJPozy8nhvFzFqatq7c4rv	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1063	43	Postgres indexes you are not using	A practical tour	lecture	4	confirmed	en	2026-08-25 07:00:00	Postgres indexes you are not using. A practical tour. This abstract is demo content generated by demo:seed.	A longer description for "Postgres indexes you are not using".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	179	132	2026-07-15 10:34:47.708775	2026-08-03 10:34:51.159617	2.75	2	\N	\N	1	0	\N	e0974c9e-3324-4a1f-923c-1a48f86bcb2a	f	CC BY-SA 4.0	\N	UeDpdonZJWoANvQ416PdoFJm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1064	43	Hexagonal architecture in practice	Ports, adapters, regrets	lecture	4	confirmed	en	2026-08-26 07:00:00	Hexagonal architecture in practice. Ports, adapters, regrets. This abstract is demo content generated by demo:seed.	A longer description for "Hexagonal architecture in practice".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	179	132	2026-07-16 10:34:47.789914	2026-08-03 10:34:51.169812	3.5	2	\N	Prefers a morning slot.	2	0	\N	5c33b529-9b0f-47aa-b40c-aa8c581cfcec	f	CC BY-SA 4.0	\N	3opz3zaw6JVfn1hAzJntwCC6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1065	43	Building a design system from zero	Without a design team	workshop	8	confirmed	de	2026-08-24 07:00:00	Building a design system from zero. Without a design team. This abstract is demo content generated by demo:seed.	A longer description for "Building a design system from zero".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	180	133	2026-07-17 10:34:47.899414	2026-08-03 10:34:51.186608	4.25	2	\N	\N	1	0	\N	60d4e06b-c9d5-4f28-8dee-367374eb7477	f	CC BY-SA 4.0	\N	qqG3LDcWWFPErQcCrwNE4gE1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1083	44	Rewriting Sidekiq jobs	Ruby devroom talk	lecture	2	accepting	en	\N	Rewriting Sidekiq jobs. Demo submission for the Ruby devroom.	Demo description for "Rewriting Sidekiq jobs".	t	\N	\N	\N	\N	184	\N	2026-08-03 10:34:51.941808	2026-08-03 10:34:51.992861	\N	0	\N	\N	1	0	\N	07e0b934-0055-48e3-846e-b2392534bce8	f	\N	\N	ua1Kxc8DFenCCUSbb1y86ehb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1066	43	CSS layout in 2026	Grid, subgrid and beyond	lecture	4	confirmed	fr	2026-08-25 07:00:00	CSS layout in 2026. Grid, subgrid and beyond. This abstract is demo content generated by demo:seed.	A longer description for "CSS layout in 2026".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	180	133	2026-07-18 10:34:47.974501	2026-08-03 10:34:51.213171	4.25	2	\N	Prefers a morning slot.	1	0	\N	2bf2abd0-ed08-4ab3-a2d0-6b31c113ad46	f	CC BY-SA 4.0	\N	mNs53UZ3uRtXwzE78pkGqdN3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1067	43	Kubernetes without tears	An honest retrospective	lecture	4	confirmed	en	2026-08-26 07:00:00	Kubernetes without tears. An honest retrospective. This abstract is demo content generated by demo:seed.	A longer description for "Kubernetes without tears".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	181	133	2026-07-19 10:34:48.042095	2026-08-03 10:34:51.232524	3.25	2	\N	\N	2	0	\N	83f0e1b9-647b-4753-a2de-14bd273e4a09	f	CC BY-SA 4.0	\N	6R1tugupnCrydTNAXJWTwVEp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1068	43	Observability on a budget	Logs, metrics, traces	lecture	4	confirmed	en	2026-08-24 07:00:00	Observability on a budget. Logs, metrics, traces. This abstract is demo content generated by demo:seed.	A longer description for "Observability on a budget".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	181	134	2026-07-20 10:34:48.136681	2026-08-03 10:34:51.254348	2.25	2	\N	Prefers a morning slot.	1	0	\N	2e5e627d-a8dc-4fab-a3a6-eabf75cc2b8e	f	CC BY-SA 4.0	\N	QpuSTuK6vBoczxF6qpoEfaT8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1069	43	Zero downtime migrations	A hands-on workshop	workshop	8	confirmed	en	2026-08-25 07:00:00	Zero downtime migrations. A hands-on workshop. This abstract is demo content generated by demo:seed.	A longer description for "Zero downtime migrations".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	181	134	2026-07-21 10:34:48.201551	2026-08-03 10:34:51.27134	2.25	2	\N	\N	1	0	\N	7022ec51-d7e3-4996-ab9a-5ab275f990ae	t	CC BY-SA 4.0	\N	SkDVGrfdu6BstnTL171Q8vry	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1070	43	Threat modeling for small teams	Start on a whiteboard	lecture	4	confirmed	de	2026-08-26 07:00:00	Threat modeling for small teams. Start on a whiteboard. This abstract is demo content generated by demo:seed.	A longer description for "Threat modeling for small teams".\n\nIt covers the background, a live demo and a short Q&A at the end. All of this is generated demo data so you can click through frab.	t	\N	\N	\N	\N	182	134	2026-07-22 10:34:48.266733	2026-08-03 10:34:51.290718	3	2	\N	Prefers a morning slot.	2	0	\N	1045e173-3fc0-4614-84e1-462a9df4977f	f	CC BY-SA 4.0	\N	Pgy47TSzfHE4J3NRFpKjJqPP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1082	44	Ruby 4 in production	Ruby devroom talk	lecture	2	accepting	en	\N	Ruby 4 in production. Demo submission for the Ruby devroom.	Demo description for "Ruby 4 in production".	t	\N	\N	\N	\N	184	\N	2026-08-03 10:34:51.869118	2026-08-03 10:34:51.935254	\N	0	\N	\N	1	0	\N	0f6c361a-55ee-4122-84ed-89fa0784f947	f	\N	\N	SC8Ki9cAMzffkcN7R8g6nQix	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1084	44	Hanami vs Rails	Ruby devroom talk	lecture	2	rejecting	en	\N	Hanami vs Rails. Demo submission for the Ruby devroom.	Demo description for "Hanami vs Rails".	t	\N	\N	\N	\N	184	\N	2026-08-03 10:34:51.999215	2026-08-03 10:34:52.057147	\N	0	\N	\N	1	0	\N	65774909-fef5-402c-bbcb-5b57d61eb2cd	f	\N	\N	nxDSZnC5e3NvVLYPxgzDDay4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1085	44	Fibers for the impatient	Ruby devroom talk	lecture	2	review	en	\N	Fibers for the impatient. Demo submission for the Ruby devroom.	Demo description for "Fibers for the impatient".	t	\N	\N	\N	\N	184	\N	2026-08-03 10:34:52.063615	2026-08-03 10:34:52.093998	\N	0	\N	\N	1	0	\N	c0b2b71e-4acb-4bbe-99d1-7c6ac54b44e1	f	\N	\N	ek15TaZ9gDZ4kug7wTFbR9Gb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1086	44	My gem has 12 downloads	Ruby devroom talk	lecture	2	new	en	\N	My gem has 12 downloads. Demo submission for the Ruby devroom.	Demo description for "My gem has 12 downloads".	t	\N	\N	\N	\N	184	\N	2026-08-03 10:34:52.100001	2026-08-03 10:34:52.127957	\N	0	\N	\N	1	0	\N	b51ac1eb-ffb2-4dc4-96bf-883ca2b160e9	f	\N	\N	AYJNnPgYTSXVG4zqHMyXSyBF	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1156	45	A grammar of graphics for the web	Charts without a framework	lecture	4	new	en	\N	A grammar of graphics for the web. Charts without a framework. This abstract is demo content generated by demo:seed.	A longer description for "A grammar of graphics for the web".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	\N	2026-06-29 10:34:58.530904	2026-08-03 10:34:58.564664	\N	0	\N	\N	1	0	\N	3100c2ed-a3a5-47c0-812d-60bd6664f28f	f	CC BY-SA 4.0	\N	KZGzRhyK4qpL4KsZw1g5UoYU	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1148	45	Volunteer coordination in practice	Shifts, radios and coffee	meeting	4	confirmed	en	\N	Volunteer coordination in practice. Shifts, radios and coffee. This abstract is demo content generated by demo:seed.	A longer description for "Volunteer coordination in practice".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-06-21 10:34:57.95093	2026-08-03 10:35:32.530141	4	4	\N	\N	1	0	\N	00939020-6700-4eb4-933e-97dba5cb2b5f	f	CC BY-SA 4.0	\N	Qw7Rtu9czLRcD8BcZFqheTXb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	45	Ask the schedule team anything	Open session	podium	4	confirmed	en	\N	Ask the schedule team anything. Open session. This abstract is demo content generated by demo:seed.	A longer description for "Ask the schedule team anything".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-06-22 10:34:58.042992	2026-08-03 10:35:32.540643	3.75	4	\N	\N	3	0	\N	4c83434c-9430-4f1e-936e-17f4930ec27f	f	CC BY-SA 4.0	\N	94esvpeiVDngYkhogMkaCmLj	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1150	45	Building a plugin system	Extension points done right	lecture	4	unconfirmed	en	\N	Building a plugin system. Extension points done right. This abstract is demo content generated by demo:seed.	A longer description for "Building a plugin system".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-06-23 10:34:58.156562	2026-08-03 10:35:32.549856	2.875	4	\N	\N	1	0	\N	79173e4a-e7f5-4b53-87f3-8ed053ffa3ee	f	CC BY-SA 4.0	\N	zY3i9XF8CUyKgn81gaaqiZpp	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	45	Offline-first web apps	Sync is the hard part	lecture	4	unconfirmed	de	\N	Offline-first web apps. Sync is the hard part. This abstract is demo content generated by demo:seed.	A longer description for "Offline-first web apps".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-06-24 10:34:58.231835	2026-08-03 10:35:32.564595	3.875	4	\N	\N	1	0	\N	f81555f5-80d1-43a3-a597-6110e64affcf	f	CC BY-SA 4.0	\N	Cg29H2CHF7G9shrRo1GukLSW	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1154	45	Dark mode is an accessibility feature	Contrast in both themes	lecture	4	review	en	\N	Dark mode is an accessibility feature. Contrast in both themes. This abstract is demo content generated by demo:seed.	A longer description for "Dark mode is an accessibility feature".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-06-27 10:34:58.427464	2026-08-03 10:35:32.582339	3.5	4	\N	\N	1	0	\N	a6f37bc5-b2e3-4f0d-a682-af3ee34936d0	f	CC BY-SA 4.0	\N	zVyHaNt3WdvhQ9YddXC26aed	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1157	45	Mentoring junior developers	Structure beats good intentions	lecture	4	new	de	\N	Mentoring junior developers. Structure beats good intentions. This abstract is demo content generated by demo:seed.	A longer description for "Mentoring junior developers".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-06-30 10:34:58.584576	2026-08-03 10:35:32.604002	3.5	1	\N	\N	1	0	\N	4d5694dd-1c10-40fb-832b-53b5fdeca3a5	f	CC BY-SA 4.0	\N	aQymyCQ9ze9Wz5ZbmQ3VavTD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	45	Reproducibility in empirical software engineering	Paper Presentation	Paper Presentation	1	accepting	en	\N	Reproducibility in empirical software engineering. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Reproducibility in empirical software engineering".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-24 10:35:33.899527	2026-08-03 10:35:35.562346	3.5	4	\N	\N	1	0	\N	40b19b41-7872-4609-97da-24d415f69458	f	CC BY-SA 4.0	\N	9DghwLSQkknfoHPbjUHVMTB4	\N	\N	coauthor1@example.org	\N	\N	\N	\N	Elena	Sokolova	\N	\N	\N	\N	\N	\N	\N	\N
1162	45	A longitudinal study of code review latency	Paper Presentation	Paper Presentation	1	accepting	en	\N	A longitudinal study of code review latency. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "A longitudinal study of code review latency".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-25 10:35:35.569057	2026-08-03 10:35:36.781885	4	4	\N	\N	1	0	\N	6cfcbb04-c952-450f-a2dc-e4dccefe06e6	f	CC BY-SA 4.0	\N	ceYBNzgfgXrehWXPhKkQ3wAg	\N	\N	coauthor2@example.org	\N	\N	\N	\N	Diego	Fernandez	\N	\N	\N	\N	\N	\N	\N	\N
1163	45	Measuring onboarding cost in open source projects	Paper Presentation	Paper Presentation	1	accepting	en	\N	Measuring onboarding cost in open source projects. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Measuring onboarding cost in open source projects".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-26 10:35:36.788569	2026-08-03 10:35:37.61099	4.5	3	\N	\N	1	0	\N	a6639da3-c60e-4307-af62-a06acd5896cc	f	CC BY-SA 4.0	\N	4yS7cJfUPWQNypbjdVUHQBaW	\N	\N	coauthor3@example.org	\N	\N	\N	\N	Amara	Okafor	\N	\N	\N	\N	\N	\N	\N	\N
1164	45	Energy consumption of container workloads	Paper Presentation	Paper Presentation	1	accepting	en	\N	Energy consumption of container workloads. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Energy consumption of container workloads".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-27 10:35:37.618024	2026-08-03 10:35:38.471697	4.166666666666667	3	\N	\N	1	0	\N	d508eaca-aae8-47d0-901b-3d69850385d5	f	CC BY-SA 4.0	\N	ofJxtarqfbgzvoib8pKBwCgH	\N	\N	coauthor4@example.org	\N	\N	\N	\N	Jonas	Lindqvist	\N	\N	\N	\N	\N	\N	\N	\N
1165	45	Static analysis adoption: a survey of 40 teams	Paper Presentation	Paper Presentation	1	review	en	\N	Static analysis adoption: a survey of 40 teams. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Static analysis adoption: a survey of 40 teams".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-28 10:35:38.479431	2026-08-03 10:35:39.266427	3.8333333333333335	3	\N	\N	1	0	\N	1818002c-cb54-4c64-95b0-b26eefefba28	f	CC BY-SA 4.0	\N	EGDuwrgZdwmAC2VCxXiB6sfi	\N	\N	coauthor5@example.org	\N	\N	\N	\N	Priya	Raman	\N	\N	\N	\N	\N	\N	\N	\N
1166	45	Technical debt and defect density revisited	Paper Presentation	Paper Presentation	1	review	en	\N	Technical debt and defect density revisited. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Technical debt and defect density revisited".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-29 10:35:39.272272	2026-08-03 10:35:40.296783	3.5	3	\N	\N	1	0	\N	5330cff1-3b83-4549-9f0e-99ce09a96e34	f	CC BY-SA 4.0	\N	VPi56thUKNf3wT6zDjcuhD4j	\N	\N	coauthor6@example.org	\N	\N	\N	\N	Mehmet	Yilmaz	\N	\N	\N	\N	\N	\N	\N	\N
1167	45	Teaching distributed systems with simulations	Paper Presentation	Paper Presentation	1	new	en	\N	Teaching distributed systems with simulations. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Teaching distributed systems with simulations".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-06-30 10:35:40.302995	2026-08-03 10:35:40.867969	4	3	\N	\N	1	0	\N	eae43fce-96c9-40c4-bbe8-6789eedfce7a	f	CC BY-SA 4.0	\N	kkAetSTDVCyQNTpbNFnhW3H7	\N	\N	coauthor7@example.org	\N	\N	\N	\N	Elena	Sokolova	\N	\N	\N	\N	\N	\N	\N	\N
1168	45	Special session: open data in public administration	Special Session	Special Session	6	accepting	en	\N	Special session: open data in public administration. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Special session: open data in public administration".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-01 10:35:41.137081	2026-08-03 10:35:42.807952	4.75	4	\N	\N	1	0	\N	9087a0d3-d9c0-4e31-b054-2e3fc8f9e639	f	CC BY-SA 4.0	\N	Wn1mE5shnudfwBjkzVVCyYqG	\N	\N	coauthor8@example.org	\N	\N	\N	\N	Diego	Fernandez	\N	\N	\N	\N	\N	\N	\N	\N
1169	45	Special session: research software engineering	Special Session	Special Session	6	accepting	en	\N	Special session: research software engineering. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Special session: research software engineering".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-02 10:35:42.820146	2026-08-03 10:35:44.19039	4.166666666666667	3	\N	\N	1	0	\N	44d54ff8-2acd-401b-b120-9f28239a1858	f	CC BY-SA 4.0	\N	HTip3xAd3j9yCfHgkNNHyeEm	\N	\N	coauthor9@example.org	\N	\N	\N	\N	Amara	Okafor	\N	\N	\N	\N	\N	\N	\N	\N
1170	45	Special session: replication studies	Special Session	Special Session	6	review	en	\N	Special session: replication studies. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Special session: replication studies".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-03 10:35:44.199311	2026-08-03 10:35:45.555107	3.8333333333333335	3	\N	\N	1	0	\N	5ec58672-0d25-4820-b362-6dcda50ce3f5	f	CC BY-SA 4.0	\N	Dwe8SW2iNnfpsszdf2ExUVXb	\N	\N	coauthor10@example.org	\N	\N	\N	\N	Jonas	Lindqvist	\N	\N	\N	\N	\N	\N	\N	\N
1171	45	Special session: metrics that mislead	Special Session	Special Session	6	rejecting	en	\N	Special session: metrics that mislead. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Special session: metrics that mislead".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-04 10:35:45.571644	2026-08-03 10:35:47.56918	4	4	\N	\N	1	0	\N	f0356521-edc1-4c46-b6eb-832eda1f35b7	f	CC BY-SA 4.0	\N	3dy15LG4FsgpqDvw37m4RrSt	\N	\N	coauthor11@example.org	\N	\N	\N	\N	Priya	Raman	\N	\N	\N	\N	\N	\N	\N	\N
1172	45	Industry track: migrating a national registry	Non-academic Session	Non-academic Session	6	accepting	en	\N	Industry track: migrating a national registry. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Industry track: migrating a national registry".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-05 10:35:47.582784	2026-08-03 10:35:49.245228	4.25	4	\N	\N	1	0	\N	dd5ff4a4-47de-45f4-a862-0c6e2c1290a0	f	CC BY-SA 4.0	\N	SNYgKA7zbE7wdT9h3u4gKAyq	\N	\N	coauthor12@example.org	\N	\N	\N	\N	Mehmet	Yilmaz	\N	\N	\N	\N	\N	\N	\N	\N
1173	45	Industry track: accessibility in public services	Non-academic Session	Non-academic Session	6	accepting	en	\N	Industry track: accessibility in public services. Demo abstract for an academic submission generated by demo:seed.	Full paper description for "Industry track: accessibility in public services".\n\nBackground, method, results and threats to validity - all of it demo content.	t	\N	\N	\N	\N	190	\N	2026-07-06 10:35:49.252923	2026-08-03 10:35:50.428606	4.5	3	\N	\N	1	0	\N	28b4b902-b817-4e28-8aa5-3341cae4d847	f	CC BY-SA 4.0	\N	rf9RNBo8sd5FrSf1Y2XBGXyS	\N	\N	coauthor13@example.org	\N	\N	\N	\N	Elena	Sokolova	\N	\N	\N	\N	\N	\N	\N	\N
1137	45	Infrastructure as code reviews	What to look for	lecture	4	confirmed	en	2026-08-04 07:00:00	Infrastructure as code reviews. What to look for. This abstract is demo content generated by demo:seed.	A longer description for "Infrastructure as code reviews".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	140	2026-06-10 10:34:57.018878	2026-08-03 10:35:51.369754	3.25	4	\N	\N	1	0	\N	66d928a9-8052-4869-8f5a-230889ccc383	f	CC BY-SA 4.0	\N	8u7sfSc7MP2ka3jGvV9c9kwy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1138	45	Backups you have actually restored	A checklist	lecture	4	confirmed	en	2026-08-04 08:15:00	Backups you have actually restored. A checklist. This abstract is demo content generated by demo:seed.	A longer description for "Backups you have actually restored".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	137	2026-06-11 10:34:57.087923	2026-08-03 10:35:51.387839	3.875	4	\N	\N	1	0	\N	565ff523-bf9c-4fd3-b4ff-cca692efb97a	f	CC BY-SA 4.0	Terminal font must be readable from the back row.	PzZP3PNBVeiW5hpCR2Hmdh6s	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1139	45	On-call without burnout	Rotations that work	lecture	4	confirmed	de	2026-08-04 08:15:00	On-call without burnout. Rotations that work. This abstract is demo content generated by demo:seed.	A longer description for "On-call without burnout".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	138	2026-06-12 10:34:57.154109	2026-08-03 10:35:51.40851	4.5	3	\N	\N	2	0	\N	1997e8b5-136a-40a3-b8d3-44ecf67fcb48	f	CC BY-SA 4.0	\N	U2cERRxS5XiiVjXpiey9ri49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1140	45	Hardening a small fleet	Ten changes that matter	lecture	4	confirmed	fr	2026-08-04 08:15:00	Hardening a small fleet. Ten changes that matter. This abstract is demo content generated by demo:seed.	A longer description for "Hardening a small fleet".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	140	2026-06-13 10:34:57.271339	2026-08-03 10:35:51.432535	4.25	4	\N	\N	1	0	\N	f45cc6ce-eb01-463e-a522-1c01c98db2a5	f	CC BY-SA 4.0	\N	gheEcCPsjX8ktbDbAwBec3sk	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	45	Security reviews for feature teams	A lightweight process	lecture	4	confirmed	en	2026-08-04 09:15:00	Security reviews for feature teams. A lightweight process. This abstract is demo content generated by demo:seed.	A longer description for "Security reviews for feature teams".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	139	2026-06-14 10:34:57.333721	2026-08-03 10:35:51.444592	4	4	\N	\N	1	0	\N	1ce7ba14-9b8d-452b-883c-86fb97cc93bf	f	CC BY-SA 4.0	\N	eeohpN5j1m5JT4oJkErdXfHS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1142	45	Lightning: rotate your keys	Three minutes of nagging	lightning_talk	2	confirmed	en	2026-08-04 09:30:00	Lightning: rotate your keys. Three minutes of nagging. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: rotate your keys".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	137	2026-06-15 10:34:57.401916	2026-08-03 10:35:51.46784	3.75	4	\N	\N	1	0	\N	76f3ad24-590a-46d9-ab35-6b7c0534df97	f	CC BY-SA 4.0	\N	m4x9pZ38Z5UBM919xUsvhdng	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	45	Cleaning messy public data	Pandas, but carefully	workshop	8	confirmed	en	2026-08-04 09:30:00	Cleaning messy public data. Pandas, but carefully. This abstract is demo content generated by demo:seed.	A longer description for "Cleaning messy public data".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	138	2026-06-16 10:34:57.471754	2026-08-03 10:35:51.482368	3.25	4	\N	\N	1	0	\N	63686593-4f4d-4cfe-aee6-ec2ad51199f9	f	CC BY-SA 4.0	\N	2CooPFeN5VY8yUhGzNTZD5sn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1144	45	Recommendations without creepiness	Useful and boring	lecture	4	confirmed	en	2026-08-04 09:30:00	Recommendations without creepiness. Useful and boring. This abstract is demo content generated by demo:seed.	A longer description for "Recommendations without creepiness".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	140	2026-06-17 10:34:57.570874	2026-08-03 10:35:51.498126	3.375	4	\N	\N	1	0	\N	963f2bf0-84df-4582-a7db-27e6779c6fa6	f	CC BY-SA 4.0	\N	Vk3ouLx3mArNSXCBJyqW7vHy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	45	Running a code of conduct team	Process, not vibes	lecture	4	confirmed	de	2026-08-04 10:15:00	Running a code of conduct team. Process, not vibes. This abstract is demo content generated by demo:seed.	A longer description for "Running a code of conduct team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	137	2026-06-18 10:34:57.64373	2026-08-03 10:35:51.520861	4	4	\N	\N	2	0	\N	b7bd57cf-2885-4d3d-9acd-bf9ab52245fd	f	CC BY-SA 4.0	\N	mSNbRPVoKmNDTbT2VFNxcFD9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	45	Sponsorship without selling out	How we fund this	lecture	4	confirmed	fr	2026-08-04 10:30:00	Sponsorship without selling out. How we fund this. This abstract is demo content generated by demo:seed.	A longer description for "Sponsorship without selling out".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	139	2026-06-19 10:34:57.752955	2026-08-03 10:35:51.540192	4.333333333333333	3	\N	\N	1	0	\N	94206787-de50-4374-af8f-407638194747	f	CC BY-SA 4.0	\N	AT6uyYhNqUwtEb8VCeYh3xye	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1090	45	Postgres query plans explained	Reading EXPLAIN without fear	lecture	4	confirmed	en	2026-08-02 07:00:00	Postgres query plans explained. Reading EXPLAIN without fear. This abstract is demo content generated by demo:seed.	A longer description for "Postgres query plans explained".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	140	2026-04-24 10:34:52.619406	2026-08-03 10:35:55.39008	4.125	4	\N	\N	1	7	4.5	7f9b6954-c9de-49b4-bae0-34a633a9360e	f	CC BY-SA 4.0	\N	HW7d2pX432Pthad5njbtt7kE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1091	45	Background jobs that never lose work	Idempotency in practice	lecture	4	confirmed	de	2026-08-02 08:15:00	Background jobs that never lose work. Idempotency in practice. This abstract is demo content generated by demo:seed.	A longer description for "Background jobs that never lose work".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	137	2026-04-25 10:34:52.795188	2026-08-03 10:35:55.54813	3.875	4	\N	\N	1	8	2.5	b7db1121-66b6-40d6-bf0d-93d888f94949	t	CC BY-SA 4.0	\N	XeFo1XHmcVav8pkYbeg3bbgV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1092	45	Continuous deployment for teams of one	Ship on Friday anyway	lecture	4	confirmed	fr	2026-08-02 08:15:00	Continuous deployment for teams of one. Ship on Friday anyway. This abstract is demo content generated by demo:seed.	A longer description for "Continuous deployment for teams of one".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	138	2026-04-26 10:34:52.938135	2026-08-03 10:35:55.81581	4	4	\N	\N	1	4	5	786fe08a-b5a3-4fc0-b1cf-32e609899a26	f	CC BY-SA 4.0	\N	pP8JpfUW2QCTXq76uJz4f7z4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1093	45	The art of the postmortem	Blameless, but useful	lecture	4	confirmed	en	2026-08-02 08:15:00	The art of the postmortem. Blameless, but useful. This abstract is demo content generated by demo:seed.	A longer description for "The art of the postmortem".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	139	2026-04-27 10:34:53.026532	2026-08-03 10:35:55.923738	3.5	4	Coordinate with the SRE track next year.	\N	2	5	4	a3a80207-e9b6-4024-8abe-37827ff2d6d2	f	CC BY-SA 4.0	\N	txhBV1MMcFhp8qBvbR1Zrng3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1094	45	Zero downtime database migrations	Hands-on workshop	workshop	8	confirmed	en	2026-08-02 08:15:00	Zero downtime database migrations. Hands-on workshop. This abstract is demo content generated by demo:seed.	A longer description for "Zero downtime database migrations".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	140	2026-04-28 10:34:53.134815	2026-08-03 10:35:56.103219	3.25	4	\N	\N	1	6	3	bac3887e-e303-418d-bd53-154206dc700b	f	CC BY-SA 4.0	Power strips for 20 laptops, whiteboard.	uRBbeyc4rBgQWuAswdRyjo49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	45	Threat modeling for small teams	Start on a whiteboard	lecture	4	confirmed	en	2026-08-02 09:30:00	Threat modeling for small teams. Start on a whiteboard. This abstract is demo content generated by demo:seed.	A longer description for "Threat modeling for small teams".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	137	2026-04-29 10:34:53.206335	2026-08-03 10:35:56.269722	3.875	4	\N	\N	1	7	4	027a2181-6dee-4ceb-a74b-fec3c5a532d0	f	CC BY-SA 4.0	\N	Vrwr1F4JssbagBYLFC5V3gyR	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1096	45	Supply chain attacks explained	How your dependencies bite	lecture	4	confirmed	en	2026-08-02 09:30:00	Supply chain attacks explained. How your dependencies bite. This abstract is demo content generated by demo:seed.	A longer description for "Supply chain attacks explained".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	138	2026-04-30 10:34:53.303132	2026-08-03 10:35:56.474025	3.5	3	\N	\N	1	8	5	b70b13d9-0ea6-4133-8a03-b9bc9f12e681	f	CC BY-SA 4.0	\N	RABdeqWRZobJxnKgSxQij8HG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1097	45	Designing for accessibility	Testing with real users	lecture	4	confirmed	de	2026-08-02 09:30:00	Designing for accessibility. Testing with real users. This abstract is demo content generated by demo:seed.	A longer description for "Designing for accessibility".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	139	2026-05-01 10:34:53.386294	2026-08-03 10:35:56.682053	4.25	4	\N	\N	2	4	4.5	8df2ea28-6396-4b7c-81af-d6fd38ef771c	f	CC BY-SA 4.0	\N	YQMDmy7LMTJwci4ANoFzv5pJ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1098	45	CSS layout, the calm parts	Grid, subgrid and container queries	lecture	4	confirmed	fr	2026-08-02 10:30:00	CSS layout, the calm parts. Grid, subgrid and container queries. This abstract is demo content generated by demo:seed.	A longer description for "CSS layout, the calm parts".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	140	2026-05-02 10:34:53.484729	2026-08-03 10:35:56.858136	4	4	\N	\N	1	5	2.5	cdc7fcc4-70fd-43c2-9d45-f1facad2887a	f	CC BY-SA 4.0	\N	EaPmNYSsMyn894SP9m91AaW5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1099	45	Documentation that people read	Writing for tired humans	lecture	4	confirmed	en	2026-08-02 10:45:00	Documentation that people read. Writing for tired humans. This abstract is demo content generated by demo:seed.	A longer description for "Documentation that people read".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	137	2026-05-03 10:34:53.607486	2026-08-03 10:35:57.002709	3.125	4	\N	\N	1	6	5	4336d6d9-be13-41e6-b54b-c390f1dbe7c8	f	CC BY-SA 4.0	\N	1Qui1vDBHShFrcdkNrZByew5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1100	45	Onboarding new contributors	The first pull request	lecture	4	confirmed	en	2026-08-02 10:45:00	Onboarding new contributors. The first pull request. This abstract is demo content generated by demo:seed.	A longer description for "Onboarding new contributors".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	138	2026-05-04 10:34:53.73972	2026-08-03 10:35:57.246646	3.625	4	\N	\N	1	7	4	28238925-c854-4859-b53d-545fcbd70bc9	f	CC BY-SA 4.0	\N	TxfveduYpFmJeeVCWLtBtvDn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1101	45	Vector databases without the hype	What they are actually good at	lecture	4	confirmed	en	2026-08-03 08:00:00	Vector databases without the hype. What they are actually good at. This abstract is demo content generated by demo:seed.	A longer description for "Vector databases without the hype".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	137	2026-05-05 10:34:53.86093	2026-08-03 10:35:57.472315	2.75	4	\N	\N	1	8	3	07e12f37-c678-4928-85e0-54c3562bc19b	f	CC BY-SA 4.0	\N	tXFMXHCdCqf96oNHaNqVKgir	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1102	45	Evaluating LLM output	Metrics you can defend	lecture	4	confirmed	en	2026-08-03 08:00:00	Evaluating LLM output. Metrics you can defend. This abstract is demo content generated by demo:seed.	A longer description for "Evaluating LLM output".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	190	138	2026-05-06 10:34:53.991137	2026-08-03 10:35:57.751621	3.375	4	\N	\N	2	4	4	36f21d1b-8030-467e-8749-2dd089cf208e	f	CC BY-SA 4.0	\N	auiuqPSaa2bP2VGPZcNjuwN5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1103	45	Lightning: my gem has 12 downloads	And I am proud of it	lightning_talk	2	confirmed	de	2026-08-03 08:00:00	Lightning: my gem has 12 downloads. And I am proud of it. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: my gem has 12 downloads".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	139	2026-05-07 10:34:54.089674	2026-08-03 10:35:57.932296	3.75	4	\N	\N	1	5	5	624fade1-f325-4692-ae26-9636748fb7e6	f	CC BY-SA 4.0	\N	BMcVNuGuUNa1Pq5mqXjHcGJK	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1104	45	Lightning: stop committing .env	Secrets management in five minutes	lightning_talk	2	confirmed	fr	2026-08-03 08:00:00	Lightning: stop committing .env. Secrets management in five minutes. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: stop committing .env".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	189	140	2026-05-08 10:34:54.17623	2026-08-03 10:35:58.047875	3.875	4	\N	\N	1	6	4.5	7877e5b4-ac35-4539-b2b0-dd5bb9d8eade	f	CC BY-SA 4.0	\N	y14qSkBGppFRTE8QdbxvxnTf	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1105	45	Lightning: Terraform anti-patterns	Modules gone wrong	lightning_talk	2	confirmed	en	2026-08-03 08:45:00	Lightning: Terraform anti-patterns. Modules gone wrong. This abstract is demo content generated by demo:seed.	A longer description for "Lightning: Terraform anti-patterns".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	188	139	2026-05-09 10:34:54.240195	2026-08-03 10:35:58.234748	3.625	4	\N	\N	1	7	2.5	bd3b81f5-2d26-4019-be39-0f87e271cd7e	f	CC BY-SA 4.0	\N	bWKmQGmFTn2Hfg3MHxYdAdn4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1106	45	Closing panel: the next ten years	Open discussion	podium	8	confirmed	en	2026-08-03 08:45:00	Closing panel: the next ten years. Open discussion. This abstract is demo content generated by demo:seed.	A longer description for "Closing panel: the next ten years".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	185	140	2026-05-10 10:34:54.311159	2026-08-03 10:35:58.437006	3.125	4	\N	\N	3	8	5	1c829c98-66c1-4a00-a49a-924d2b92ec8c	f	CC BY-SA 4.0	Four lapel microphones, four bar stools.	NQcsCYHNcBo9mHvM6UbufcQ6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1107	45	Community meetup: local user groups	Bring your own agenda	meeting	4	confirmed	en	2026-08-03 09:15:00	Community meetup: local user groups. Bring your own agenda. This abstract is demo content generated by demo:seed.	A longer description for "Community meetup: local user groups".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	f	\N	\N	\N	\N	191	137	2026-05-11 10:34:54.415759	2026-08-03 10:35:58.868684	2.875	4	\N	\N	1	4	4	0eaf33f5-a62f-4fe7-8cad-96e656a20eb1	f	CC BY-SA 4.0	\N	xLsmK684bAed4ZZhb6118A9E	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	45	Day 2 keynote: software we can maintain	A talk about restraint	lecture	4	confirmed	de	2026-08-03 09:15:00	Day 2 keynote: software we can maintain. A talk about restraint. This abstract is demo content generated by demo:seed.	A longer description for "Day 2 keynote: software we can maintain".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	185	138	2026-05-31 10:34:56.195647	2026-08-03 10:35:58.930024	3.5	4	\N	\N	1	5	3	9218c986-eceb-483c-8654-274303f0a0f5	f	CC BY-SA 4.0	\N	VMs4ik2fAP1t5XgtE9KZWxLD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1128	45	Day 3 keynote: the people problem	Teams beat tools	lecture	4	confirmed	fr	2026-08-03 09:30:00	Day 3 keynote: the people problem. Teams beat tools. This abstract is demo content generated by demo:seed.	A longer description for "Day 3 keynote: the people problem".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	185	139	2026-06-01 10:34:56.317954	2026-08-03 10:35:59.127681	3.1666666666666665	3	\N	\N	1	6	4	1d5a94fa-1df5-474d-ba8a-de4940e53bc1	f	CC BY-SA 4.0	\N	DTvF2GCpV5AnSr81rY5uQWLo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	45	Caching strategies that survive contact	Invalidate this	lecture	4	confirmed	en	2026-08-03 10:30:00	Caching strategies that survive contact. Invalidate this. This abstract is demo content generated by demo:seed.	A longer description for "Caching strategies that survive contact".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	137	2026-06-02 10:34:56.388968	2026-08-03 10:35:59.286553	3	4	\N	\N	1	7	5	c96c3deb-b142-47f7-87f1-fedf933844c9	f	CC BY-SA 4.0	\N	677Q6mjBAo1fddTZT1kZPAmF	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	45	Typed Ruby in a legacy codebase	Sorbet, one file at a time	lecture	4	confirmed	en	2026-08-03 10:30:00	Typed Ruby in a legacy codebase. Sorbet, one file at a time. This abstract is demo content generated by demo:seed.	A longer description for "Typed Ruby in a legacy codebase".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	138	2026-06-03 10:34:56.457319	2026-08-03 10:35:59.385802	3.625	4	\N	\N	1	8	4.5	bc7e1825-9934-4509-996e-2e05b354578b	f	CC BY-SA 4.0	\N	SUh6aDUiKQuHuBYuoCr2WTBx	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	45	Rate limiting for humans	Fair queues and honest errors	lecture	4	scheduled	en	2026-08-03 10:45:00	Rate limiting for humans. Fair queues and honest errors. This abstract is demo content generated by demo:seed.	A longer description for "Rate limiting for humans".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	139	2026-06-04 10:34:56.522718	2026-08-03 10:35:59.58719	4.3	5	\N	\N	2	0	\N	d2a99e6a-53d2-4d81-91ee-c61a4b2de12a	f	CC BY-SA 4.0	\N	gbnFUimaP5K8mBMD3ntJKGn2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1132	45	Testing what actually breaks	A pragmatic pyramid	workshop	8	scheduled	en	2026-08-03 11:00:00	Testing what actually breaks. A pragmatic pyramid. This abstract is demo content generated by demo:seed.	A longer description for "Testing what actually breaks".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	140	2026-06-05 10:34:56.642329	2026-08-03 10:35:59.648958	4.25	4	\N	\N	1	0	\N	16ea798b-9ca8-4ea8-b036-78b9c0bb1282	f	CC BY-SA 4.0	\N	jWLgxcD56o24m1hMtEjuSR7o	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1133	45	Progressive enhancement is back	Less JavaScript, more product	lecture	4	scheduled	de	2026-08-03 11:45:00	Progressive enhancement is back. Less JavaScript, more product. This abstract is demo content generated by demo:seed.	A longer description for "Progressive enhancement is back".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	137	2026-06-06 10:34:56.727181	2026-08-03 10:35:59.697648	3.7	5	\N	\N	1	0	\N	2b585c57-d61f-4c24-a37a-ecf450bcebd4	f	CC BY-SA 4.0	\N	pt8tD1Ts2NoFH12dE2f7yyQQ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1134	45	Component libraries that survive	Versioning and deprecation	lecture	4	scheduled	fr	2026-08-04 07:00:00	Component libraries that survive. Versioning and deprecation. This abstract is demo content generated by demo:seed.	A longer description for "Component libraries that survive".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	137	2026-06-07 10:34:56.790637	2026-08-03 10:35:59.756921	3	4	\N	\N	1	0	\N	d14d8c70-22af-4e7a-9057-c9f25d5113be	f	CC BY-SA 4.0	\N	Q6C2TPePvFdFEoSpidRm5pz7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1135	45	Web performance for content sites	Core Web Vitals in practice	lecture	4	scheduled	en	2026-08-04 07:00:00	Web performance for content sites. Core Web Vitals in practice. This abstract is demo content generated by demo:seed.	A longer description for "Web performance for content sites".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	138	2026-06-08 10:34:56.858509	2026-08-03 10:35:59.823711	2.75	4	\N	\N	1	0	\N	dc5b8bb0-3620-49d6-8b69-475c6eadcbbc	f	CC BY-SA 4.0	\N	qxVABXqqkLfmeCdmn5egE6bE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1136	45	Forms nobody hates	Validation, errors and focus	workshop	8	scheduled	en	2026-08-04 07:00:00	Forms nobody hates. Validation, errors and focus. This abstract is demo content generated by demo:seed.	A longer description for "Forms nobody hates".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	139	2026-06-09 10:34:56.956698	2026-08-03 10:35:59.885098	2.625	4	\N	\N	1	0	\N	6c49bf7f-49df-46bf-a887-8cb84b65fc24	f	CC BY-SA 4.0	\N	zUqxFxFxE7zzgmWMyKhe3miE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1087	45	Opening keynote: ten years of frab	What we learned running conferences	lecture	4	confirmed	en	2026-08-02 07:00:00	Opening keynote: ten years of frab. What we learned running conferences. This abstract is demo content generated by demo:seed.	A longer description for "Opening keynote: ten years of frab".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	185	137	2026-04-21 10:34:52.217114	2026-08-03 10:35:59.912343	3	4	Confirmed by phone, speaker will bring their own laptop.	\N	1	4	3	846cd117-ebc0-4da6-96f3-d48fdf6a2fb2	f	CC BY-SA 4.0	Wireless handheld microphone, HDMI, clicker.	kpQULDsjqfLDjRjopH9zpNok	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1088	45	Refactoring legacy Rails	A field guide	lecture	4	confirmed	en	2026-08-02 07:00:00	Refactoring legacy Rails. A field guide. This abstract is demo content generated by demo:seed.	A longer description for "Refactoring legacy Rails".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	138	2026-04-22 10:34:52.325601	2026-08-03 10:35:59.948307	3.125	4	\N	\N	2	5	4	1c6faea5-e30e-4681-89da-dd8f1ba1fa8e	t	CC BY-SA 4.0	\N	uVo6YyDKkG3BXUPZ4qxcy7bC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1112	45	WebAssembly for backend developers	A tour without the buzzwords	lecture	4	review	en	\N	WebAssembly for backend developers. A tour without the buzzwords. This abstract is demo content generated by demo:seed.	A longer description for "WebAssembly for backend developers".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-05-16 10:34:54.994469	2026-08-03 10:36:00.005244	\N	2	\N	Asked the speaker for a longer abstract.	1	0	\N	e314b15c-3e3a-4ad6-a486-2955dd85a62a	f	CC BY-SA 4.0	\N	xwridHci6hpg4MTFnmKhM696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1108	45	Event sourcing, one year later	Would we do it again?	lecture	4	unconfirmed	en	\N	Event sourcing, one year later. Would we do it again?. This abstract is demo content generated by demo:seed.	A longer description for "Event sourcing, one year later".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	\N	2026-05-12 10:34:54.555068	2026-08-03 10:36:00.016252	3	4	Reminder sent, waiting for confirmation.	\N	1	0	\N	09c5bdd0-71a8-4f57-99f8-45223425dd56	f	CC BY-SA 4.0	\N	hzLM1oJ8nQW7N4kWTxCfMpht	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1089	45	From monolith to modules	Without a big bang rewrite	lecture	4	confirmed	en	2026-08-02 07:00:00	From monolith to modules. Without a big bang rewrite. This abstract is demo content generated by demo:seed.	A longer description for "From monolith to modules".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	186	139	2026-04-23 10:34:52.428855	2026-08-03 10:36:00.028313	3.75	4	\N	Prefers a morning slot.	1	6	5	159cf045-35df-4041-8092-54b4ed107827	f	CC BY-SA 4.0	Needs a second screen for the notes view.	nqhtKv1Mh6dDBXe9dXK55zCm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1113	45	Design tokens in a small team		lecture	4	review	en	\N	Design tokens in a small team. One source of truth. This abstract is demo content generated by demo:seed.	A longer description for "Design tokens in a small team".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	187	\N	2026-05-17 10:34:55.050687	2026-08-03 10:35:31.921709	4.25	4	\N	\N	1	0	\N	51b188ed-6daf-4b49-ae20-05b1a20cf8d4	f	CC BY-SA 4.0	\N	KScb7bMnitFnc1FQZvuNKn9M	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1116	45	Teaching kids to code	Lessons from a school club	lecture	4	review	fr	\N		A longer description for "Teaching kids to code".\n\nThe session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.	t	\N	\N	\N	\N	191	\N	2026-05-20 10:34:55.337372	2026-08-03 10:35:31.950279	3.5	4	\N	\N	1	0	\N	1146690f-7792-4707-b73f-1af8d3848688	f	CC BY-SA 4.0	\N	GuKbRCBxTot7GA59E599EJDr	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, name, value, reimbursed, person_id, conference_id, created_at, updated_at) FROM stdin;
231	Train ticket	45.5000	t	360	43	2026-08-03 10:34:51.825074	2026-08-03 10:34:51.825074
232	Hotel, 2 nights	180.0000	f	361	43	2026-08-03 10:34:51.829066	2026-08-03 10:34:51.829066
233	Flight	320.0000	t	362	43	2026-08-03 10:34:51.833422	2026-08-03 10:34:51.833422
234	Taxi	22.0000	f	363	43	2026-08-03 10:34:51.837353	2026-08-03 10:34:51.837353
235	Dinner	35.0000	t	364	43	2026-08-03 10:34:51.840617	2026-08-03 10:34:51.840617
236	Train ticket, return	78.4000	t	376	45	2026-08-03 10:35:51.666716	2026-08-03 10:35:51.666716
237	Hotel, 2 nights	210.0000	f	377	45	2026-08-03 10:35:51.680267	2026-08-03 10:35:51.680267
238	Taxi from the airport	28.5000	f	363	45	2026-08-03 10:35:51.684489	2026-08-03 10:35:51.684489
239	Speaker dinner	45.0000	t	370	45	2026-08-03 10:35:51.688216	2026-08-03 10:35:51.688216
240	Train ticket	52.1000	t	361	45	2026-08-03 10:35:51.691905	2026-08-03 10:35:51.691905
241	Train ticket, return	78.4000	f	368	45	2026-08-03 10:35:51.69484	2026-08-03 10:35:51.69484
242	Flight	340.0000	f	364	45	2026-08-03 10:35:51.697513	2026-08-03 10:35:51.697513
243	Taxi from the airport	28.5000	t	365	45	2026-08-03 10:35:51.700094	2026-08-03 10:35:51.700094
244	Conference visa fee	80.0000	t	373	45	2026-08-03 10:35:51.702602	2026-08-03 10:35:51.702602
245	Train ticket	52.1000	f	367	45	2026-08-03 10:35:51.706778	2026-08-03 10:35:51.706778
246	Hotel, 2 nights	210.0000	f	371	45	2026-08-03 10:35:51.710909	2026-08-03 10:35:51.710909
247	Flight	340.0000	t	372	45	2026-08-03 10:35:51.713999	2026-08-03 10:35:51.713999
248	Speaker dinner	45.0000	t	375	45	2026-08-03 10:35:51.71685	2026-08-03 10:35:51.71685
249	Conference visa fee	80.0000	f	379	45	2026-08-03 10:35:51.719406	2026-08-03 10:35:51.719406
250	Train ticket, return	78.4000	f	381	45	2026-08-03 10:35:51.722508	2026-08-03 10:35:51.722508
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
97	en	43	Conference	2026-08-03 10:34:47.527237	2026-08-03 10:34:47.527237
98	de	43	Conference	2026-08-03 10:34:47.531697	2026-08-03 10:34:47.531697
99	fr	43	Conference	2026-08-03 10:34:47.535949	2026-08-03 10:34:47.535949
100	en	44	Conference	2026-08-03 10:34:51.8566	2026-08-03 10:34:51.8566
101	en	45	Conference	2026-08-03 10:34:52.168091	2026-08-03 10:34:52.168091
102	de	45	Conference	2026-08-03 10:34:52.169763	2026-08-03 10:34:52.169763
103	fr	45	Conference	2026-08-03 10:34:52.171016	2026-08-03 10:34:52.171016
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, title, url, linkable_id, linkable_type, created_at, updated_at) FROM stdin;
569	Slides	https://example.org/slides	1153	Event	2026-08-03 10:34:58.411737	2026-08-03 10:34:58.411737
570	Slides	https://example.org/slides	1156	Event	2026-08-03 10:34:58.573357	2026-08-03 10:34:58.573357
571	Project homepage	https://example.org/project	1157	Event	2026-08-03 10:34:58.611657	2026-08-03 10:34:58.611657
572	Slides	https://example.org/slides	1159	Event	2026-08-03 10:34:58.708014	2026-08-03 10:34:58.708014
523	Slides	https://example.org/slides	1062	Event	2026-08-03 10:34:47.646205	2026-08-03 10:34:47.646205
524	Slides	https://example.org/slides	1064	Event	2026-08-03 10:34:47.836335	2026-08-03 10:34:47.836335
525	Slides	https://example.org/slides	1066	Event	2026-08-03 10:34:48.002051	2026-08-03 10:34:48.002051
526	Slides	https://example.org/slides	1068	Event	2026-08-03 10:34:48.160182	2026-08-03 10:34:48.160182
527	Slides	https://example.org/slides	1070	Event	2026-08-03 10:34:48.298499	2026-08-03 10:34:48.298499
528	Slides	https://example.org/slides	1072	Event	2026-08-03 10:34:48.429066	2026-08-03 10:34:48.429066
529	Slides	https://example.org/slides	1074	Event	2026-08-03 10:34:48.572456	2026-08-03 10:34:48.572456
530	Slides	https://example.org/slides	1076	Event	2026-08-03 10:34:48.665205	2026-08-03 10:34:48.665205
531	Slides	https://example.org/slides	1078	Event	2026-08-03 10:34:48.754222	2026-08-03 10:34:48.754222
532	Slides	https://example.org/slides	1080	Event	2026-08-03 10:34:48.847597	2026-08-03 10:34:48.847597
533	Slides	https://example.org/slides	1087	Event	2026-08-03 10:34:52.244654	2026-08-03 10:34:52.244654
534	Project homepage	https://example.org/project	1087	Event	2026-08-03 10:34:52.246001	2026-08-03 10:34:52.246001
535	Slides	https://example.org/slides	1090	Event	2026-08-03 10:34:52.699974	2026-08-03 10:34:52.699974
536	Project homepage	https://example.org/project	1092	Event	2026-08-03 10:34:52.973643	2026-08-03 10:34:52.973643
537	Slides	https://example.org/slides	1093	Event	2026-08-03 10:34:53.071262	2026-08-03 10:34:53.071262
538	Slides	https://example.org/slides	1096	Event	2026-08-03 10:34:53.337813	2026-08-03 10:34:53.337813
539	Project homepage	https://example.org/project	1097	Event	2026-08-03 10:34:53.426703	2026-08-03 10:34:53.426703
540	Slides	https://example.org/slides	1099	Event	2026-08-03 10:34:53.643537	2026-08-03 10:34:53.643537
541	Slides	https://example.org/slides	1102	Event	2026-08-03 10:34:54.028006	2026-08-03 10:34:54.028006
542	Project homepage	https://example.org/project	1102	Event	2026-08-03 10:34:54.029416	2026-08-03 10:34:54.029416
543	Slides	https://example.org/slides	1105	Event	2026-08-03 10:34:54.271064	2026-08-03 10:34:54.271064
544	Project homepage	https://example.org/project	1107	Event	2026-08-03 10:34:54.445791	2026-08-03 10:34:54.445791
545	Slides	https://example.org/slides	1108	Event	2026-08-03 10:34:54.603972	2026-08-03 10:34:54.603972
546	Slides	https://example.org/slides	1111	Event	2026-08-03 10:34:54.895766	2026-08-03 10:34:54.895766
547	Project homepage	https://example.org/project	1112	Event	2026-08-03 10:34:55.027072	2026-08-03 10:34:55.027072
548	Slides	https://example.org/slides	1114	Event	2026-08-03 10:34:55.210647	2026-08-03 10:34:55.210647
549	Slides	https://example.org/slides	1117	Event	2026-08-03 10:34:55.404973	2026-08-03 10:34:55.404973
550	Project homepage	https://example.org/project	1117	Event	2026-08-03 10:34:55.406509	2026-08-03 10:34:55.406509
551	Slides	https://example.org/slides	1120	Event	2026-08-03 10:34:55.535003	2026-08-03 10:34:55.535003
552	Project homepage	https://example.org/project	1122	Event	2026-08-03 10:34:55.634649	2026-08-03 10:34:55.634649
553	Slides	https://example.org/slides	1123	Event	2026-08-03 10:34:55.717081	2026-08-03 10:34:55.717081
554	Slides	https://example.org/slides	1126	Event	2026-08-03 10:34:56.090674	2026-08-03 10:34:56.090674
555	Project homepage	https://example.org/project	1127	Event	2026-08-03 10:34:56.241236	2026-08-03 10:34:56.241236
556	Slides	https://example.org/slides	1129	Event	2026-08-03 10:34:56.412436	2026-08-03 10:34:56.412436
557	Slides	https://example.org/slides	1132	Event	2026-08-03 10:34:56.673111	2026-08-03 10:34:56.673111
558	Project homepage	https://example.org/project	1132	Event	2026-08-03 10:34:56.674871	2026-08-03 10:34:56.674871
559	Slides	https://example.org/slides	1135	Event	2026-08-03 10:34:56.884053	2026-08-03 10:34:56.884053
560	Project homepage	https://example.org/project	1137	Event	2026-08-03 10:34:57.044087	2026-08-03 10:34:57.044087
561	Slides	https://example.org/slides	1138	Event	2026-08-03 10:34:57.113758	2026-08-03 10:34:57.113758
562	Slides	https://example.org/slides	1141	Event	2026-08-03 10:34:57.359485	2026-08-03 10:34:57.359485
563	Project homepage	https://example.org/project	1142	Event	2026-08-03 10:34:57.429224	2026-08-03 10:34:57.429224
564	Slides	https://example.org/slides	1144	Event	2026-08-03 10:34:57.598882	2026-08-03 10:34:57.598882
565	Slides	https://example.org/slides	1147	Event	2026-08-03 10:34:57.872852	2026-08-03 10:34:57.872852
566	Project homepage	https://example.org/project	1147	Event	2026-08-03 10:34:57.874699	2026-08-03 10:34:57.874699
567	Slides	https://example.org/slides	1150	Event	2026-08-03 10:34:58.184568	2026-08-03 10:34:58.184568
568	Project homepage	https://example.org/project	1152	Event	2026-08-03 10:34:58.347559	2026-08-03 10:34:58.347559
\.


--
-- Data for Name: mail_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mail_templates (id, conference_id, name, subject, content, created_at, updated_at) FROM stdin;
121	43	Speaker reminder	[%{conference}] Reminder for %{event}	Hi %{public_name},\n\njust a reminder that your talk "%{event}" is part of %{conference}.\n\nCheers,\nthe orga team	2026-08-03 10:34:47.582183	2026-08-03 10:34:47.582183
122	43	Call for volunteers	[%{conference}] We need helpers	Hi %{forename},\n\nwe are still looking for volunteers at %{conference}.\n\nThanks!	2026-08-03 10:34:47.584067	2026-08-03 10:34:47.584067
123	45	Speaker reminder	[%{conference}] Reminder for %{event}	Hi %{public_name},\n\njust a reminder that your talk "%{event}" is part of %{conference}.\n\nCheers,\nthe orga team	2026-08-03 10:34:52.198845	2026-08-03 10:34:52.198845
124	45	Call for volunteers	[%{conference}] We need helpers	Hi %{forename},\n\nwe are still looking for volunteers at %{conference}.\n\nThanks!	2026-08-03 10:34:52.200823	2026-08-03 10:34:52.200823
125	45	Confirm your talk	[%{conference}] Please confirm "%{event}"	Hi %{public_name},\n\nyour submission "%{event}" (%{type}, %{duration}) was accepted for %{conference}.\n\nPlease confirm that you will be there:\n%{link}\n\nIf you cannot make it, just tell us - no hard feelings.\n\nThe %{conference} programme team	2026-08-03 10:34:52.202688	2026-08-03 10:34:52.202688
126	45	Schedule announcement	[%{conference}] Your slot: %{date} %{time}	Hi %{public_name},\n\nthe schedule is public. "%{event}" is on %{date} at %{time} in %{room}.\n\nPlease be at the room 15 minutes early so the video team can wire you up.\n\nSee you soon!	2026-08-03 10:34:52.205206	2026-08-03 10:34:52.205206
127	45	Technical check reminder	[%{conference}] Tech check for "%{event}"	Hi %{forename},\n\nplease come to %{room} on %{date} at least 30 minutes before %{time} for a short technical check (audio, video, your laptop).\n\nIf you need an adapter, tell us now and we will bring one.\n\nThe %{conference} tech team	2026-08-03 10:34:52.206795	2026-08-03 10:34:52.206795
128	45	Slides and recording	[%{conference}] Slides for "%{event}"	Hi %{public_name},\n\nthank you for your talk at %{conference}!\n\nCould you upload your slides to your submission (%{event_id}) so we can publish them together with the recording?\n\nThank you,\nthe %{conference} team	2026-08-03 10:34:52.208539	2026-08-03 10:34:52.208539
129	45	Invite a co-speaker	[%{conference}] Join "%{event}" as co-speaker	Hi,\n\n%{public_name} would like you to join the session "%{event}" at %{conference} as a co-speaker.\n\nUse this link to join:\n%{joinlink}\n\nThe %{conference} team	2026-08-03 10:34:52.209676	2026-08-03 10:34:52.209676
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, created_at, updated_at, locale, accept_subject, reject_subject, accept_body, reject_body, conference_id, schedule_subject, schedule_body) FROM stdin;
85	2026-08-03 10:34:47.577957	2026-08-03 10:34:47.577957	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	43	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
86	2026-08-03 10:34:47.580292	2026-08-03 10:34:47.580292	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	43	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
87	2026-08-03 10:34:51.860316	2026-08-03 10:34:51.860316	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	44	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
88	2026-08-03 10:34:51.861914	2026-08-03 10:34:51.861914	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	44	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
89	2026-08-03 10:34:52.195428	2026-08-03 10:34:52.195428	en	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	45	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
90	2026-08-03 10:34:52.19711	2026-08-03 10:34:52.19711	de	[%{conference}] Your talk was accepted	[%{conference}] About your submission	Hi %{public_name},\n\nwe are happy to accept your submission "%{event}" (%{type}, %{duration}).\n\nPlease confirm here: %{link}\n\nSee you at %{conference}!	Hi %{public_name},\n\nunfortunately we could not fit "%{event}" into the program of %{conference}.\n\nThanks for submitting!	45	[%{conference}] Your slot in the schedule	Hi %{public_name},\n\n"%{event}" is scheduled for %{date} at %{time} in %{room}.\n\nSee you there!
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
1062	1062	2026-08-03 10:34:47.611624	2026-08-03 10:34:47.611624
1063	1063	2026-08-03 10:34:47.715728	2026-08-03 10:34:47.715728
1064	1064	2026-08-03 10:34:47.797228	2026-08-03 10:34:47.797228
1065	1065	2026-08-03 10:34:47.903861	2026-08-03 10:34:47.903861
1066	1066	2026-08-03 10:34:47.979349	2026-08-03 10:34:47.979349
1067	1067	2026-08-03 10:34:48.046156	2026-08-03 10:34:48.046156
1068	1068	2026-08-03 10:34:48.140546	2026-08-03 10:34:48.140546
1069	1069	2026-08-03 10:34:48.207495	2026-08-03 10:34:48.207495
1070	1070	2026-08-03 10:34:48.270804	2026-08-03 10:34:48.270804
1071	1071	2026-08-03 10:34:48.350753	2026-08-03 10:34:48.350753
1072	1072	2026-08-03 10:34:48.405612	2026-08-03 10:34:48.405612
1073	1073	2026-08-03 10:34:48.469254	2026-08-03 10:34:48.469254
1074	1074	2026-08-03 10:34:48.543621	2026-08-03 10:34:48.543621
1075	1075	2026-08-03 10:34:48.589083	2026-08-03 10:34:48.589083
1076	1076	2026-08-03 10:34:48.624967	2026-08-03 10:34:48.624967
1077	1077	2026-08-03 10:34:48.682935	2026-08-03 10:34:48.682935
1078	1078	2026-08-03 10:34:48.732101	2026-08-03 10:34:48.732101
1079	1079	2026-08-03 10:34:48.768042	2026-08-03 10:34:48.768042
1080	1080	2026-08-03 10:34:48.826134	2026-08-03 10:34:48.826134
1081	1081	2026-08-03 10:34:48.867207	2026-08-03 10:34:48.867207
1082	1082	2026-08-03 10:34:51.872284	2026-08-03 10:34:51.872284
1083	1083	2026-08-03 10:34:51.945044	2026-08-03 10:34:51.945044
1084	1084	2026-08-03 10:34:52.004163	2026-08-03 10:34:52.004163
1085	1085	2026-08-03 10:34:52.067313	2026-08-03 10:34:52.067313
1086	1086	2026-08-03 10:34:52.104146	2026-08-03 10:34:52.104146
1087	1087	2026-08-03 10:34:52.222365	2026-08-03 10:34:52.222365
1088	1088	2026-08-03 10:34:52.330379	2026-08-03 10:34:52.330379
1089	1089	2026-08-03 10:34:52.437219	2026-08-03 10:34:52.437219
1090	1090	2026-08-03 10:34:52.633463	2026-08-03 10:34:52.633463
1091	1091	2026-08-03 10:34:52.802385	2026-08-03 10:34:52.802385
1092	1092	2026-08-03 10:34:52.944018	2026-08-03 10:34:52.944018
1093	1093	2026-08-03 10:34:53.031759	2026-08-03 10:34:53.031759
1094	1094	2026-08-03 10:34:53.140738	2026-08-03 10:34:53.140738
1095	1095	2026-08-03 10:34:53.210506	2026-08-03 10:34:53.210506
1096	1096	2026-08-03 10:34:53.308532	2026-08-03 10:34:53.308532
1097	1097	2026-08-03 10:34:53.390622	2026-08-03 10:34:53.390622
1098	1098	2026-08-03 10:34:53.49153	2026-08-03 10:34:53.49153
1099	1099	2026-08-03 10:34:53.613434	2026-08-03 10:34:53.613434
1100	1100	2026-08-03 10:34:53.749575	2026-08-03 10:34:53.749575
1101	1101	2026-08-03 10:34:53.86795	2026-08-03 10:34:53.86795
1102	1102	2026-08-03 10:34:53.995956	2026-08-03 10:34:53.995956
1103	1103	2026-08-03 10:34:54.094478	2026-08-03 10:34:54.094478
1104	1104	2026-08-03 10:34:54.180524	2026-08-03 10:34:54.180524
1105	1105	2026-08-03 10:34:54.244687	2026-08-03 10:34:54.244687
1106	1106	2026-08-03 10:34:54.31534	2026-08-03 10:34:54.31534
1107	1107	2026-08-03 10:34:54.420225	2026-08-03 10:34:54.420225
1108	1108	2026-08-03 10:34:54.564429	2026-08-03 10:34:54.564429
1109	1109	2026-08-03 10:34:54.660353	2026-08-03 10:34:54.660353
1110	1110	2026-08-03 10:34:54.751622	2026-08-03 10:34:54.751622
1111	1111	2026-08-03 10:34:54.83844	2026-08-03 10:34:54.83844
1112	1112	2026-08-03 10:34:54.999203	2026-08-03 10:34:54.999203
1113	1113	2026-08-03 10:34:55.060802	2026-08-03 10:34:55.060802
1114	1114	2026-08-03 10:34:55.164893	2026-08-03 10:34:55.164893
1115	1115	2026-08-03 10:34:55.246938	2026-08-03 10:34:55.246938
1116	1116	2026-08-03 10:34:55.342037	2026-08-03 10:34:55.342037
1117	1117	2026-08-03 10:34:55.38102	2026-08-03 10:34:55.38102
1118	1118	2026-08-03 10:34:55.421869	2026-08-03 10:34:55.421869
1119	1119	2026-08-03 10:34:55.46196	2026-08-03 10:34:55.46196
1120	1120	2026-08-03 10:34:55.512292	2026-08-03 10:34:55.512292
1121	1121	2026-08-03 10:34:55.550502	2026-08-03 10:34:55.550502
1122	1122	2026-08-03 10:34:55.604779	2026-08-03 10:34:55.604779
1123	1123	2026-08-03 10:34:55.684891	2026-08-03 10:34:55.684891
1124	1124	2026-08-03 10:34:55.805568	2026-08-03 10:34:55.805568
1125	1125	2026-08-03 10:34:55.924893	2026-08-03 10:34:55.924893
1126	1126	2026-08-03 10:34:56.022824	2026-08-03 10:34:56.022824
1127	1127	2026-08-03 10:34:56.204661	2026-08-03 10:34:56.204661
1128	1128	2026-08-03 10:34:56.322171	2026-08-03 10:34:56.322171
1129	1129	2026-08-03 10:34:56.393162	2026-08-03 10:34:56.393162
1130	1130	2026-08-03 10:34:56.462193	2026-08-03 10:34:56.462193
1131	1131	2026-08-03 10:34:56.527398	2026-08-03 10:34:56.527398
1132	1132	2026-08-03 10:34:56.646435	2026-08-03 10:34:56.646435
1133	1133	2026-08-03 10:34:56.731333	2026-08-03 10:34:56.731333
1134	1134	2026-08-03 10:34:56.79588	2026-08-03 10:34:56.79588
1135	1135	2026-08-03 10:34:56.862809	2026-08-03 10:34:56.862809
1136	1136	2026-08-03 10:34:56.961006	2026-08-03 10:34:56.961006
1137	1137	2026-08-03 10:34:57.022999	2026-08-03 10:34:57.022999
1138	1138	2026-08-03 10:34:57.092253	2026-08-03 10:34:57.092253
1139	1139	2026-08-03 10:34:57.159225	2026-08-03 10:34:57.159225
1140	1140	2026-08-03 10:34:57.275227	2026-08-03 10:34:57.275227
1141	1141	2026-08-03 10:34:57.337941	2026-08-03 10:34:57.337941
1142	1142	2026-08-03 10:34:57.405987	2026-08-03 10:34:57.405987
1143	1143	2026-08-03 10:34:57.476141	2026-08-03 10:34:57.476141
1144	1144	2026-08-03 10:34:57.575394	2026-08-03 10:34:57.575394
1145	1145	2026-08-03 10:34:57.648681	2026-08-03 10:34:57.648681
1146	1146	2026-08-03 10:34:57.758761	2026-08-03 10:34:57.758761
1147	1147	2026-08-03 10:34:57.844035	2026-08-03 10:34:57.844035
1148	1148	2026-08-03 10:34:57.956918	2026-08-03 10:34:57.956918
1149	1149	2026-08-03 10:34:58.047792	2026-08-03 10:34:58.047792
1150	1150	2026-08-03 10:34:58.16079	2026-08-03 10:34:58.16079
1151	1151	2026-08-03 10:34:58.236564	2026-08-03 10:34:58.236564
1152	1152	2026-08-03 10:34:58.325722	2026-08-03 10:34:58.325722
1153	1153	2026-08-03 10:34:58.38775	2026-08-03 10:34:58.38775
1154	1154	2026-08-03 10:34:58.432093	2026-08-03 10:34:58.432093
1155	1155	2026-08-03 10:34:58.471439	2026-08-03 10:34:58.471439
1156	1156	2026-08-03 10:34:58.537458	2026-08-03 10:34:58.537458
1157	1157	2026-08-03 10:34:58.588918	2026-08-03 10:34:58.588918
1158	1158	2026-08-03 10:34:58.626762	2026-08-03 10:34:58.626762
1159	1159	2026-08-03 10:34:58.682788	2026-08-03 10:34:58.682788
1160	1160	2026-08-03 10:34:58.765123	2026-08-03 10:34:58.765123
1161	1161	2026-08-03 10:35:33.90533	2026-08-03 10:35:33.90533
1162	1162	2026-08-03 10:35:35.573582	2026-08-03 10:35:35.573582
1163	1163	2026-08-03 10:35:36.793828	2026-08-03 10:35:36.793828
1164	1164	2026-08-03 10:35:37.622986	2026-08-03 10:35:37.622986
1165	1165	2026-08-03 10:35:38.483737	2026-08-03 10:35:38.483737
1166	1166	2026-08-03 10:35:39.276975	2026-08-03 10:35:39.276975
1167	1167	2026-08-03 10:35:40.308409	2026-08-03 10:35:40.308409
1168	1168	2026-08-03 10:35:41.143078	2026-08-03 10:35:41.143078
1169	1169	2026-08-03 10:35:42.829315	2026-08-03 10:35:42.829315
1170	1170	2026-08-03 10:35:44.205753	2026-08-03 10:35:44.205753
1171	1171	2026-08-03 10:35:45.584204	2026-08-03 10:35:45.584204
1172	1172	2026-08-03 10:35:47.592667	2026-08-03 10:35:47.592667
1173	1173	2026-08-03 10:35:49.257838	2026-08-03 10:35:49.257838
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.people (id, first_name, last_name, public_name, email, email_public, gender, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, abstract, description, created_at, updated_at, user_id, note, include_in_mailings, use_gravatar) FROM stdin;
1	admin	admin	admin_127	admin@example.org	t	\N	\N	\N	\N	\N	\N	\N	2026-07-30 08:01:41.474648	2026-07-30 08:01:41.671514	1	\N	f	f
356	Olivia	Orga	Olivia Orga	orga@example.org	t	\N	\N	\N	\N	\N	Olivia Orga is a demo speaker created by demo:seed.	Longer demo biography for Olivia Orga. Works on APIs and speaks at conferences.	2026-08-03 10:34:43.688951	2026-08-03 10:34:43.688951	356	\N	t	f
357	Karlo	Koordinator	Karlo Koordinator	coordinator@example.org	t	\N	\N	\N	\N	\N	Karlo Koordinator is a demo speaker created by demo:seed.	Longer demo biography for Karlo Koordinator. Works on APIs and speaks at conferences.	2026-08-03 10:34:43.846949	2026-08-03 10:34:43.846949	357	\N	t	f
358	Rina	Recenzent	Rina Recenzent	reviewer@example.org	t	\N	\N	\N	\N	\N	Rina Recenzent is a demo speaker created by demo:seed.	Longer demo biography for Rina Recenzent. Works on design and speaks at conferences.	2026-08-03 10:34:44.003222	2026-08-03 10:34:44.003222	358	\N	t	f
359	Robert	Recenzent	Robert Recenzent	reviewer2@example.org	t	\N	\N	\N	\N	\N	Robert Recenzent is a demo speaker created by demo:seed.	Longer demo biography for Robert Recenzent. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:44.152834	2026-08-03 10:34:44.152834	359	\N	t	f
360	Ana	Horvat	Ana Horvat	speaker1@example.org	t	female	\N	\N	\N	\N	Ana Horvat is a demo speaker created by demo:seed.	Longer demo biography for Ana Horvat. Works on APIs and speaks at conferences.	2026-08-03 10:34:44.307015	2026-08-03 10:34:44.307015	360	\N	t	f
361	Marko	Kovac	Marko Kovac	speaker2@example.org	t	male	\N	\N	\N	\N	Marko Kovac is a demo speaker created by demo:seed.	Longer demo biography for Marko Kovac. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:44.45722	2026-08-03 10:34:44.45722	361	\N	t	f
362	Ivana	Novak	Ivana Novak	speaker3@example.org	t	female	\N	\N	\N	\N	Ivana Novak is a demo speaker created by demo:seed.	Longer demo biography for Ivana Novak. Works on APIs and speaks at conferences.	2026-08-03 10:34:44.611546	2026-08-03 10:34:44.615218	362	Needs a wheelchair accessible room.	t	f
363	Petar	Babic	Petar Babic	speaker4@example.org	t	male	\N	\N	\N	\N	Petar Babic is a demo speaker created by demo:seed.	Longer demo biography for Petar Babic. Works on testing and speaks at conferences.	2026-08-03 10:34:44.773099	2026-08-03 10:34:44.773099	363	\N	t	f
364	Lucija	Maric	Lucija Maric	speaker5@example.org	t	female	\N	\N	\N	\N	Lucija Maric is a demo speaker created by demo:seed.	Longer demo biography for Lucija Maric. Works on design and speaks at conferences.	2026-08-03 10:34:44.925828	2026-08-03 10:34:44.925828	364	\N	t	f
365	Tomislav	Juric	Tomislav Juric	speaker6@example.org	t	male	\N	\N	\N	\N	Tomislav Juric is a demo speaker created by demo:seed.	Longer demo biography for Tomislav Juric. Works on APIs and speaks at conferences.	2026-08-03 10:34:45.072965	2026-08-03 10:34:45.072965	365	\N	t	f
366	Sara	Vukovic	Sara Vukovic	speaker7@example.org	t	female	\N	\N	\N	\N	Sara Vukovic is a demo speaker created by demo:seed.	Longer demo biography for Sara Vukovic. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:45.213693	2026-08-03 10:34:45.213693	366	\N	t	f
367	Filip	Knezevic	Filip Knezevic	speaker8@example.org	t	male	\N	\N	\N	\N	Filip Knezevic is a demo speaker created by demo:seed.	Longer demo biography for Filip Knezevic. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:45.355266	2026-08-03 10:34:45.357203	367	Invited speaker - travel is paid by us.	t	f
368	Maja	Petrovic	Maja Petrovic	speaker9@example.org	t	female	\N	\N	\N	\N	Maja Petrovic is a demo speaker created by demo:seed.	Longer demo biography for Maja Petrovic. Works on APIs and speaks at conferences.	2026-08-03 10:34:45.498032	2026-08-03 10:34:45.498032	368	\N	t	f
369	Luka	Matic	Luka Matic	speaker10@example.org	t	male	\N	\N	\N	\N	Luka Matic is a demo speaker created by demo:seed.	Longer demo biography for Luka Matic. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:45.640619	2026-08-03 10:34:45.640619	369	\N	t	f
370	Nina	Radic	Nina Radic	speaker11@example.org	t	female	\N	\N	\N	\N	Nina Radic is a demo speaker created by demo:seed.	Longer demo biography for Nina Radic. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:45.786997	2026-08-03 10:34:45.786997	370	\N	t	f
371	Josip	Bozic	Josip Bozic	speaker12@example.org	t	male	\N	\N	\N	\N	Josip Bozic is a demo speaker created by demo:seed.	Longer demo biography for Josip Bozic. Works on APIs and speaks at conferences.	2026-08-03 10:34:45.942261	2026-08-03 10:34:45.942261	371	\N	t	f
372	Elena	Sokolova	Elena Sokolova	speaker13@example.org	t	female	\N	\N	\N	\N	Elena Sokolova is a demo speaker created by demo:seed.	Longer demo biography for Elena Sokolova. Works on design and speaks at conferences.	2026-08-03 10:34:46.089422	2026-08-03 10:34:46.089422	372	\N	t	f
373	Diego	Fernandez	Diego Fernandez	speaker14@example.org	t	male	\N	\N	\N	\N	Diego Fernandez is a demo speaker created by demo:seed.	Longer demo biography for Diego Fernandez. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:46.240344	2026-08-03 10:34:46.243588	373	Asked to not be scheduled before 12:00.	t	f
374	Amara	Okafor	Amara Okafor	speaker15@example.org	t	female	\N	\N	\N	\N	Amara Okafor is a demo speaker created by demo:seed.	Longer demo biography for Amara Okafor. Works on design and speaks at conferences.	2026-08-03 10:34:46.389651	2026-08-03 10:34:46.389651	374	\N	t	f
375	Jonas	Lindqvist	Jonas Lindqvist	speaker16@example.org	t	male	\N	\N	\N	\N	Jonas Lindqvist is a demo speaker created by demo:seed.	Longer demo biography for Jonas Lindqvist. Works on design and speaks at conferences.	2026-08-03 10:34:46.53744	2026-08-03 10:34:46.53744	375	\N	t	f
376	Priya	Raman	Priya Raman	speaker17@example.org	t	female	\N	\N	\N	\N	Priya Raman is a demo speaker created by demo:seed.	Longer demo biography for Priya Raman. Works on APIs and speaks at conferences.	2026-08-03 10:34:46.692916	2026-08-03 10:34:46.692916	376	\N	t	f
377	Mehmet	Yilmaz	Mehmet Yilmaz	speaker18@example.org	t	male	\N	\N	\N	\N	Mehmet Yilmaz is a demo speaker created by demo:seed.	Longer demo biography for Mehmet Yilmaz. Works on infrastructure and speaks at conferences.	2026-08-03 10:34:46.853865	2026-08-03 10:34:46.853865	377	\N	t	f
378	Clara	Dubois	Clara Dubois	speaker19@example.org	t	female	\N	\N	\N	\N	Clara Dubois is a demo speaker created by demo:seed.	Longer demo biography for Clara Dubois. Works on testing and speaks at conferences.	2026-08-03 10:34:47.006665	2026-08-03 10:34:47.006665	378	\N	t	f
379	Kenji	Tanaka	Kenji Tanaka	speaker20@example.org	t	male	\N	\N	\N	\N	Kenji Tanaka is a demo speaker created by demo:seed.	Longer demo biography for Kenji Tanaka. Works on design and speaks at conferences.	2026-08-03 10:34:47.157647	2026-08-03 10:34:47.157647	379	\N	t	f
380	Robin	Vermeer	Robin Vermeer	speaker21@example.org	t	other	\N	\N	\N	\N	Robin Vermeer is a demo speaker created by demo:seed.	Longer demo biography for Robin Vermeer. Works on APIs and speaks at conferences.	2026-08-03 10:34:47.311896	2026-08-03 10:34:47.311896	380	\N	t	f
381	Sofia	Rossi	Sofia Rossi	speaker22@example.org	t	female	\N	\N	\N	\N	Sofia Rossi is a demo speaker created by demo:seed.	Longer demo biography for Sofia Rossi. Works on testing and speaks at conferences.	2026-08-03 10:34:47.465602	2026-08-03 10:34:47.465602	381	\N	t	f
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
96	Content quality	Is the topic well prepared and relevant?	43	2026-08-03 10:34:47.550276	2026-08-03 10:34:47.550276
97	Speaker experience	Has the speaker presented before?	43	2026-08-03 10:34:47.558635	2026-08-03 10:34:47.558635
98	Audience fit	Does this match our audience?	43	2026-08-03 10:34:47.565462	2026-08-03 10:34:47.565462
99	Content quality	Is the topic well prepared, correct and relevant?	45	2026-08-03 10:34:52.176747	2026-08-03 10:34:52.176747
100	Speaker experience	Has the speaker presented before, and how well?	45	2026-08-03 10:34:52.180508	2026-08-03 10:34:52.180508
101	Audience fit	Does this match the audience we expect?	45	2026-08-03 10:34:52.183954	2026-08-03 10:34:52.183954
102	Originality	Have we (or another conference) seen this talk already?	45	2026-08-03 10:34:52.187364	2026-08-03 10:34:52.187364
\.


--
-- Data for Name: review_scores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.review_scores (id, event_rating_id, review_metric_id, score, created_at, updated_at) FROM stdin;
8799	2760	102	3	2026-08-03 10:35:04.124889	2026-08-03 10:35:04.124889
8800	2761	99	3	2026-08-03 10:35:04.17689	2026-08-03 10:35:04.17689
8801	2761	100	4	2026-08-03 10:35:04.20324	2026-08-03 10:35:04.20324
8802	2761	101	5	2026-08-03 10:35:04.224742	2026-08-03 10:35:04.224742
8803	2761	102	1	2026-08-03 10:35:04.252779	2026-08-03 10:35:04.252779
8804	2762	99	4	2026-08-03 10:35:04.296402	2026-08-03 10:35:04.296402
8805	2762	100	5	2026-08-03 10:35:04.337272	2026-08-03 10:35:04.337272
8806	2762	101	1	2026-08-03 10:35:04.363638	2026-08-03 10:35:04.363638
8807	2762	102	2	2026-08-03 10:35:04.383626	2026-08-03 10:35:04.383626
8808	2763	99	5	2026-08-03 10:35:04.408887	2026-08-03 10:35:04.408887
8809	2763	100	1	2026-08-03 10:35:04.429921	2026-08-03 10:35:04.429921
8810	2763	101	2	2026-08-03 10:35:04.455459	2026-08-03 10:35:04.455459
8811	2763	102	3	2026-08-03 10:35:04.48521	2026-08-03 10:35:04.48521
8812	2764	99	4	2026-08-03 10:35:04.5488	2026-08-03 10:35:04.5488
8813	2764	100	5	2026-08-03 10:35:04.596491	2026-08-03 10:35:04.596491
8814	2764	101	1	2026-08-03 10:35:04.620401	2026-08-03 10:35:04.620401
8815	2764	102	2	2026-08-03 10:35:04.647697	2026-08-03 10:35:04.647697
8816	2765	99	5	2026-08-03 10:35:04.705813	2026-08-03 10:35:04.705813
8817	2765	100	1	2026-08-03 10:35:04.729741	2026-08-03 10:35:04.729741
8818	2765	101	2	2026-08-03 10:35:04.749654	2026-08-03 10:35:04.749654
8819	2765	102	3	2026-08-03 10:35:04.771937	2026-08-03 10:35:04.771937
8820	2766	99	2	2026-08-03 10:35:04.806126	2026-08-03 10:35:04.806126
8821	2766	100	3	2026-08-03 10:35:04.826196	2026-08-03 10:35:04.826196
8822	2766	101	4	2026-08-03 10:35:04.84631	2026-08-03 10:35:04.84631
8823	2766	102	5	2026-08-03 10:35:04.866986	2026-08-03 10:35:04.866986
8824	2767	99	5	2026-08-03 10:35:04.912666	2026-08-03 10:35:04.912666
8825	2767	100	1	2026-08-03 10:35:04.941448	2026-08-03 10:35:04.941448
8826	2767	101	2	2026-08-03 10:35:04.962594	2026-08-03 10:35:04.962594
8827	2767	102	3	2026-08-03 10:35:04.986855	2026-08-03 10:35:04.986855
8828	2768	99	2	2026-08-03 10:35:05.028082	2026-08-03 10:35:05.028082
8829	2768	100	3	2026-08-03 10:35:05.054567	2026-08-03 10:35:05.054567
8830	2768	101	4	2026-08-03 10:35:05.076498	2026-08-03 10:35:05.076498
8831	2768	102	5	2026-08-03 10:35:05.101408	2026-08-03 10:35:05.101408
8832	2769	99	3	2026-08-03 10:35:05.127466	2026-08-03 10:35:05.127466
8833	2769	100	4	2026-08-03 10:35:05.149541	2026-08-03 10:35:05.149541
8834	2769	101	5	2026-08-03 10:35:05.172305	2026-08-03 10:35:05.172305
8835	2769	102	1	2026-08-03 10:35:05.192464	2026-08-03 10:35:05.192464
8836	2770	99	2	2026-08-03 10:35:05.240953	2026-08-03 10:35:05.240953
8837	2770	100	3	2026-08-03 10:35:05.268906	2026-08-03 10:35:05.268906
8838	2770	101	4	2026-08-03 10:35:05.288691	2026-08-03 10:35:05.288691
8839	2770	102	5	2026-08-03 10:35:05.313215	2026-08-03 10:35:05.313215
8840	2771	99	3	2026-08-03 10:35:05.339843	2026-08-03 10:35:05.339843
8841	2771	100	4	2026-08-03 10:35:05.358481	2026-08-03 10:35:05.358481
8842	2771	101	5	2026-08-03 10:35:05.376518	2026-08-03 10:35:05.376518
8843	2771	102	1	2026-08-03 10:35:05.394653	2026-08-03 10:35:05.394653
8844	2772	99	4	2026-08-03 10:35:05.422443	2026-08-03 10:35:05.422443
8845	2772	100	5	2026-08-03 10:35:05.44383	2026-08-03 10:35:05.44383
8846	2772	101	1	2026-08-03 10:35:05.466538	2026-08-03 10:35:05.466538
8847	2772	102	2	2026-08-03 10:35:05.490666	2026-08-03 10:35:05.490666
8848	2773	99	2	2026-08-03 10:35:05.54459	2026-08-03 10:35:05.54459
8849	2773	100	3	2026-08-03 10:35:05.575351	2026-08-03 10:35:05.575351
8850	2773	101	4	2026-08-03 10:35:05.598436	2026-08-03 10:35:05.598436
8851	2773	102	5	2026-08-03 10:35:05.620506	2026-08-03 10:35:05.620506
8852	2774	99	3	2026-08-03 10:35:05.651956	2026-08-03 10:35:05.651956
8853	2774	100	4	2026-08-03 10:35:05.676247	2026-08-03 10:35:05.676247
8854	2774	101	5	2026-08-03 10:35:05.698934	2026-08-03 10:35:05.698934
8855	2774	102	1	2026-08-03 10:35:05.720336	2026-08-03 10:35:05.720336
8856	2775	99	4	2026-08-03 10:35:05.750802	2026-08-03 10:35:05.750802
8857	2775	100	5	2026-08-03 10:35:05.78318	2026-08-03 10:35:05.78318
8858	2775	101	1	2026-08-03 10:35:05.811613	2026-08-03 10:35:05.811613
8859	2775	102	2	2026-08-03 10:35:05.834356	2026-08-03 10:35:05.834356
8860	2776	99	3	2026-08-03 10:35:05.899983	2026-08-03 10:35:05.899983
8861	2776	100	4	2026-08-03 10:35:05.931392	2026-08-03 10:35:05.931392
8862	2776	101	5	2026-08-03 10:35:05.955356	2026-08-03 10:35:05.955356
8863	2776	102	1	2026-08-03 10:35:05.977354	2026-08-03 10:35:05.977354
8864	2777	99	4	2026-08-03 10:35:06.008891	2026-08-03 10:35:06.008891
8865	2777	100	5	2026-08-03 10:35:06.036623	2026-08-03 10:35:06.036623
8866	2777	101	1	2026-08-03 10:35:06.064354	2026-08-03 10:35:06.064354
8867	2777	102	2	2026-08-03 10:35:06.085773	2026-08-03 10:35:06.085773
8868	2778	99	1	2026-08-03 10:35:06.112462	2026-08-03 10:35:06.112462
8869	2778	100	2	2026-08-03 10:35:06.133712	2026-08-03 10:35:06.133712
8870	2778	101	3	2026-08-03 10:35:06.155259	2026-08-03 10:35:06.155259
8871	2778	102	4	2026-08-03 10:35:06.175428	2026-08-03 10:35:06.175428
8872	2779	99	4	2026-08-03 10:35:06.229743	2026-08-03 10:35:06.229743
8873	2779	100	5	2026-08-03 10:35:06.258212	2026-08-03 10:35:06.258212
8874	2779	101	1	2026-08-03 10:35:06.279351	2026-08-03 10:35:06.279351
8875	2779	102	2	2026-08-03 10:35:06.299852	2026-08-03 10:35:06.299852
8876	2780	99	1	2026-08-03 10:35:06.330201	2026-08-03 10:35:06.330201
8877	2780	100	2	2026-08-03 10:35:06.353491	2026-08-03 10:35:06.353491
8878	2780	101	3	2026-08-03 10:35:06.375007	2026-08-03 10:35:06.375007
8879	2780	102	4	2026-08-03 10:35:06.402799	2026-08-03 10:35:06.402799
8880	2781	99	2	2026-08-03 10:35:06.430588	2026-08-03 10:35:06.430588
8881	2781	100	3	2026-08-03 10:35:06.453958	2026-08-03 10:35:06.453958
8882	2781	101	4	2026-08-03 10:35:06.476073	2026-08-03 10:35:06.476073
8883	2781	102	5	2026-08-03 10:35:06.496998	2026-08-03 10:35:06.496998
8884	2782	99	1	2026-08-03 10:35:06.548146	2026-08-03 10:35:06.548146
8885	2782	100	2	2026-08-03 10:35:06.576381	2026-08-03 10:35:06.576381
8886	2782	101	3	2026-08-03 10:35:06.596866	2026-08-03 10:35:06.596866
8887	2782	102	4	2026-08-03 10:35:06.616973	2026-08-03 10:35:06.616973
8888	2783	99	2	2026-08-03 10:35:06.646539	2026-08-03 10:35:06.646539
8889	2783	100	3	2026-08-03 10:35:06.673918	2026-08-03 10:35:06.673918
8890	2783	101	4	2026-08-03 10:35:06.704974	2026-08-03 10:35:06.704974
8891	2783	102	5	2026-08-03 10:35:06.731014	2026-08-03 10:35:06.731014
8892	2784	99	3	2026-08-03 10:35:06.769039	2026-08-03 10:35:06.769039
8893	2784	100	4	2026-08-03 10:35:06.791601	2026-08-03 10:35:06.791601
8894	2784	101	5	2026-08-03 10:35:06.812794	2026-08-03 10:35:06.812794
8895	2784	102	1	2026-08-03 10:35:06.833306	2026-08-03 10:35:06.833306
8908	2788	99	2	2026-08-03 10:35:07.192306	2026-08-03 10:35:07.192306
8909	2788	100	3	2026-08-03 10:35:07.218037	2026-08-03 10:35:07.218037
8910	2788	101	4	2026-08-03 10:35:07.238239	2026-08-03 10:35:07.238239
8911	2788	102	5	2026-08-03 10:35:07.264724	2026-08-03 10:35:07.264724
8912	2789	99	3	2026-08-03 10:35:07.297424	2026-08-03 10:35:07.297424
8913	2789	100	4	2026-08-03 10:35:07.317412	2026-08-03 10:35:07.317412
8914	2789	101	5	2026-08-03 10:35:07.336317	2026-08-03 10:35:07.336317
8915	2789	102	1	2026-08-03 10:35:07.35761	2026-08-03 10:35:07.35761
8916	2790	99	5	2026-08-03 10:35:07.384541	2026-08-03 10:35:07.384541
8917	2790	100	1	2026-08-03 10:35:07.406431	2026-08-03 10:35:07.406431
8918	2790	101	2	2026-08-03 10:35:07.435384	2026-08-03 10:35:07.435384
8919	2790	102	3	2026-08-03 10:35:07.4592	2026-08-03 10:35:07.4592
8920	2791	99	3	2026-08-03 10:35:07.506019	2026-08-03 10:35:07.506019
8921	2791	100	4	2026-08-03 10:35:07.531591	2026-08-03 10:35:07.531591
8922	2791	101	5	2026-08-03 10:35:07.551993	2026-08-03 10:35:07.551993
8923	2791	102	1	2026-08-03 10:35:07.574142	2026-08-03 10:35:07.574142
8924	2792	99	5	2026-08-03 10:35:07.601747	2026-08-03 10:35:07.601747
8925	2792	100	1	2026-08-03 10:35:07.624492	2026-08-03 10:35:07.624492
8926	2792	101	2	2026-08-03 10:35:07.648075	2026-08-03 10:35:07.648075
8927	2792	102	3	2026-08-03 10:35:07.673355	2026-08-03 10:35:07.673355
8928	2793	99	1	2026-08-03 10:35:07.706737	2026-08-03 10:35:07.706737
8929	2793	100	2	2026-08-03 10:35:07.72912	2026-08-03 10:35:07.72912
8930	2793	101	3	2026-08-03 10:35:07.751878	2026-08-03 10:35:07.751878
8931	2793	102	4	2026-08-03 10:35:07.773368	2026-08-03 10:35:07.773368
8932	2794	99	5	2026-08-03 10:35:07.825396	2026-08-03 10:35:07.825396
8933	2794	100	1	2026-08-03 10:35:07.850761	2026-08-03 10:35:07.850761
8934	2794	101	2	2026-08-03 10:35:07.873488	2026-08-03 10:35:07.873488
8935	2794	102	3	2026-08-03 10:35:07.899923	2026-08-03 10:35:07.899923
8936	2795	99	1	2026-08-03 10:35:07.931043	2026-08-03 10:35:07.931043
8937	2795	100	2	2026-08-03 10:35:07.962704	2026-08-03 10:35:07.962704
8938	2795	101	3	2026-08-03 10:35:07.984871	2026-08-03 10:35:07.984871
8939	2795	102	4	2026-08-03 10:35:08.005587	2026-08-03 10:35:08.005587
8940	2796	99	2	2026-08-03 10:35:08.037073	2026-08-03 10:35:08.037073
8941	2796	100	3	2026-08-03 10:35:08.063369	2026-08-03 10:35:08.063369
8942	2796	101	4	2026-08-03 10:35:08.088404	2026-08-03 10:35:08.088404
8943	2796	102	5	2026-08-03 10:35:08.119657	2026-08-03 10:35:08.119657
8944	2797	99	5	2026-08-03 10:35:08.171513	2026-08-03 10:35:08.171513
8945	2797	100	1	2026-08-03 10:35:08.197374	2026-08-03 10:35:08.197374
8946	2797	101	2	2026-08-03 10:35:08.21641	2026-08-03 10:35:08.21641
8947	2797	102	3	2026-08-03 10:35:08.235932	2026-08-03 10:35:08.235932
8948	2798	99	1	2026-08-03 10:35:08.283388	2026-08-03 10:35:08.283388
8949	2798	100	2	2026-08-03 10:35:08.316009	2026-08-03 10:35:08.316009
8950	2798	101	3	2026-08-03 10:35:08.3457	2026-08-03 10:35:08.3457
8951	2798	102	4	2026-08-03 10:35:08.378888	2026-08-03 10:35:08.378888
8952	2799	99	2	2026-08-03 10:35:08.41584	2026-08-03 10:35:08.41584
8953	2799	100	3	2026-08-03 10:35:08.4427	2026-08-03 10:35:08.4427
8954	2799	101	4	2026-08-03 10:35:08.470718	2026-08-03 10:35:08.470718
8955	2799	102	5	2026-08-03 10:35:08.495171	2026-08-03 10:35:08.495171
8956	2800	99	5	2026-08-03 10:35:08.559441	2026-08-03 10:35:08.559441
8957	2800	100	1	2026-08-03 10:35:08.592144	2026-08-03 10:35:08.592144
8958	2800	101	2	2026-08-03 10:35:08.614389	2026-08-03 10:35:08.614389
8959	2800	102	3	2026-08-03 10:35:08.63795	2026-08-03 10:35:08.63795
8960	2801	99	1	2026-08-03 10:35:08.67011	2026-08-03 10:35:08.67011
8961	2801	100	2	2026-08-03 10:35:08.6988	2026-08-03 10:35:08.6988
8962	2801	101	3	2026-08-03 10:35:08.725901	2026-08-03 10:35:08.725901
8963	2801	102	4	2026-08-03 10:35:08.74748	2026-08-03 10:35:08.74748
8964	2802	99	3	2026-08-03 10:35:08.7759	2026-08-03 10:35:08.7759
8965	2802	100	4	2026-08-03 10:35:08.826088	2026-08-03 10:35:08.826088
8966	2802	101	5	2026-08-03 10:35:08.886868	2026-08-03 10:35:08.886868
8967	2802	102	1	2026-08-03 10:35:08.935359	2026-08-03 10:35:08.935359
8968	2803	99	1	2026-08-03 10:35:08.992911	2026-08-03 10:35:08.992911
8969	2803	100	2	2026-08-03 10:35:09.025656	2026-08-03 10:35:09.025656
8970	2803	101	3	2026-08-03 10:35:09.050616	2026-08-03 10:35:09.050616
8971	2803	102	4	2026-08-03 10:35:09.075949	2026-08-03 10:35:09.075949
8972	2804	99	3	2026-08-03 10:35:09.108238	2026-08-03 10:35:09.108238
8973	2804	100	4	2026-08-03 10:35:09.13567	2026-08-03 10:35:09.13567
8974	2804	101	5	2026-08-03 10:35:09.161731	2026-08-03 10:35:09.161731
8975	2804	102	1	2026-08-03 10:35:09.185965	2026-08-03 10:35:09.185965
8976	2805	99	4	2026-08-03 10:35:09.224492	2026-08-03 10:35:09.224492
8977	2805	100	5	2026-08-03 10:35:09.249655	2026-08-03 10:35:09.249655
8978	2805	101	1	2026-08-03 10:35:09.275347	2026-08-03 10:35:09.275347
8979	2805	102	2	2026-08-03 10:35:09.300587	2026-08-03 10:35:09.300587
8980	2806	99	3	2026-08-03 10:35:09.357691	2026-08-03 10:35:09.357691
8981	2806	100	4	2026-08-03 10:35:09.390149	2026-08-03 10:35:09.390149
8982	2806	101	5	2026-08-03 10:35:09.415557	2026-08-03 10:35:09.415557
8983	2806	102	1	2026-08-03 10:35:09.43801	2026-08-03 10:35:09.43801
8984	2807	99	4	2026-08-03 10:35:09.473037	2026-08-03 10:35:09.473037
8985	2807	100	5	2026-08-03 10:35:09.498057	2026-08-03 10:35:09.498057
8986	2807	101	1	2026-08-03 10:35:09.521342	2026-08-03 10:35:09.521342
8987	2807	102	2	2026-08-03 10:35:09.546418	2026-08-03 10:35:09.546418
8988	2808	99	5	2026-08-03 10:35:09.589873	2026-08-03 10:35:09.589873
8989	2808	100	1	2026-08-03 10:35:09.647124	2026-08-03 10:35:09.647124
8990	2808	101	2	2026-08-03 10:35:09.696298	2026-08-03 10:35:09.696298
8991	2808	102	3	2026-08-03 10:35:09.741529	2026-08-03 10:35:09.741529
8992	2809	99	3	2026-08-03 10:35:09.841866	2026-08-03 10:35:09.841866
8993	2809	100	4	2026-08-03 10:35:09.879489	2026-08-03 10:35:09.879489
8994	2809	101	5	2026-08-03 10:35:09.904808	2026-08-03 10:35:09.904808
8995	2809	102	1	2026-08-03 10:35:09.939533	2026-08-03 10:35:09.939533
8996	2810	99	4	2026-08-03 10:35:09.988397	2026-08-03 10:35:09.988397
8997	2810	100	5	2026-08-03 10:35:10.023245	2026-08-03 10:35:10.023245
8998	2810	101	1	2026-08-03 10:35:10.049481	2026-08-03 10:35:10.049481
8999	2810	102	2	2026-08-03 10:35:10.082248	2026-08-03 10:35:10.082248
9000	2811	99	5	2026-08-03 10:35:10.115697	2026-08-03 10:35:10.115697
9001	2811	100	1	2026-08-03 10:35:10.145774	2026-08-03 10:35:10.145774
9002	2811	101	2	2026-08-03 10:35:10.172043	2026-08-03 10:35:10.172043
9003	2811	102	3	2026-08-03 10:35:10.196944	2026-08-03 10:35:10.196944
9004	2812	99	4	2026-08-03 10:35:10.261667	2026-08-03 10:35:10.261667
9005	2812	100	5	2026-08-03 10:35:10.298472	2026-08-03 10:35:10.298472
9006	2812	101	1	2026-08-03 10:35:10.327225	2026-08-03 10:35:10.327225
9007	2812	102	2	2026-08-03 10:35:10.369332	2026-08-03 10:35:10.369332
9008	2813	99	5	2026-08-03 10:35:10.406653	2026-08-03 10:35:10.406653
9009	2813	100	1	2026-08-03 10:35:10.431834	2026-08-03 10:35:10.431834
9010	2813	101	2	2026-08-03 10:35:10.46058	2026-08-03 10:35:10.46058
9011	2813	102	3	2026-08-03 10:35:10.494684	2026-08-03 10:35:10.494684
9012	2814	99	2	2026-08-03 10:35:10.566077	2026-08-03 10:35:10.566077
9013	2814	100	3	2026-08-03 10:35:10.613435	2026-08-03 10:35:10.613435
9014	2814	101	4	2026-08-03 10:35:10.641667	2026-08-03 10:35:10.641667
9015	2814	102	5	2026-08-03 10:35:10.681567	2026-08-03 10:35:10.681567
9016	2815	99	5	2026-08-03 10:35:10.756165	2026-08-03 10:35:10.756165
9017	2815	100	1	2026-08-03 10:35:10.819025	2026-08-03 10:35:10.819025
9018	2815	101	2	2026-08-03 10:35:10.846029	2026-08-03 10:35:10.846029
9019	2815	102	3	2026-08-03 10:35:10.88809	2026-08-03 10:35:10.88809
9020	2816	99	2	2026-08-03 10:35:10.935827	2026-08-03 10:35:10.935827
9021	2816	100	3	2026-08-03 10:35:10.96232	2026-08-03 10:35:10.96232
9022	2816	101	4	2026-08-03 10:35:10.994919	2026-08-03 10:35:10.994919
9023	2816	102	5	2026-08-03 10:35:11.025965	2026-08-03 10:35:11.025965
9024	2817	99	3	2026-08-03 10:35:11.072714	2026-08-03 10:35:11.072714
9025	2817	100	4	2026-08-03 10:35:11.105111	2026-08-03 10:35:11.105111
9026	2817	101	5	2026-08-03 10:35:11.132874	2026-08-03 10:35:11.132874
9027	2817	102	1	2026-08-03 10:35:11.165544	2026-08-03 10:35:11.165544
9028	2818	99	2	2026-08-03 10:35:11.226949	2026-08-03 10:35:11.226949
9029	2818	100	3	2026-08-03 10:35:11.261518	2026-08-03 10:35:11.261518
9030	2818	101	4	2026-08-03 10:35:11.293558	2026-08-03 10:35:11.293558
9031	2818	102	5	2026-08-03 10:35:11.322272	2026-08-03 10:35:11.322272
9032	2819	99	3	2026-08-03 10:35:11.388296	2026-08-03 10:35:11.388296
9033	2819	100	4	2026-08-03 10:35:11.437511	2026-08-03 10:35:11.437511
9034	2819	101	5	2026-08-03 10:35:11.464312	2026-08-03 10:35:11.464312
9035	2819	102	1	2026-08-03 10:35:11.488145	2026-08-03 10:35:11.488145
9036	2820	99	4	2026-08-03 10:35:11.518573	2026-08-03 10:35:11.518573
9037	2820	100	5	2026-08-03 10:35:11.543079	2026-08-03 10:35:11.543079
9038	2820	101	1	2026-08-03 10:35:11.567515	2026-08-03 10:35:11.567515
9039	2820	102	2	2026-08-03 10:35:11.591945	2026-08-03 10:35:11.591945
9040	2821	99	2	2026-08-03 10:35:11.653112	2026-08-03 10:35:11.653112
9041	2821	100	3	2026-08-03 10:35:11.698133	2026-08-03 10:35:11.698133
9042	2821	101	4	2026-08-03 10:35:11.743912	2026-08-03 10:35:11.743912
9043	2821	102	5	2026-08-03 10:35:11.793541	2026-08-03 10:35:11.793541
9044	2822	99	3	2026-08-03 10:35:11.827733	2026-08-03 10:35:11.827733
9045	2822	100	4	2026-08-03 10:35:11.855259	2026-08-03 10:35:11.855259
9046	2822	101	5	2026-08-03 10:35:11.880261	2026-08-03 10:35:11.880261
9047	2822	102	1	2026-08-03 10:35:11.904329	2026-08-03 10:35:11.904329
9048	2823	99	4	2026-08-03 10:35:11.935586	2026-08-03 10:35:11.935586
9049	2823	100	5	2026-08-03 10:35:11.962184	2026-08-03 10:35:11.962184
9050	2823	101	1	2026-08-03 10:35:11.988027	2026-08-03 10:35:11.988027
9051	2823	102	2	2026-08-03 10:35:12.011477	2026-08-03 10:35:12.011477
9052	2824	99	3	2026-08-03 10:35:12.077837	2026-08-03 10:35:12.077837
9053	2824	100	4	2026-08-03 10:35:12.114086	2026-08-03 10:35:12.114086
9054	2824	101	5	2026-08-03 10:35:12.138103	2026-08-03 10:35:12.138103
9055	2824	102	1	2026-08-03 10:35:12.163031	2026-08-03 10:35:12.163031
9056	2825	99	4	2026-08-03 10:35:12.201518	2026-08-03 10:35:12.201518
9057	2825	100	5	2026-08-03 10:35:12.227659	2026-08-03 10:35:12.227659
9058	2825	101	1	2026-08-03 10:35:12.250527	2026-08-03 10:35:12.250527
9059	2825	102	2	2026-08-03 10:35:12.281278	2026-08-03 10:35:12.281278
9060	2826	99	1	2026-08-03 10:35:12.315902	2026-08-03 10:35:12.315902
9061	2826	100	2	2026-08-03 10:35:12.343599	2026-08-03 10:35:12.343599
9062	2826	101	3	2026-08-03 10:35:12.370573	2026-08-03 10:35:12.370573
9063	2826	102	4	2026-08-03 10:35:12.400479	2026-08-03 10:35:12.400479
9064	2827	99	4	2026-08-03 10:35:12.509738	2026-08-03 10:35:12.509738
9065	2827	100	5	2026-08-03 10:35:12.55694	2026-08-03 10:35:12.55694
9066	2827	101	1	2026-08-03 10:35:12.590471	2026-08-03 10:35:12.590471
9067	2827	102	2	2026-08-03 10:35:12.620309	2026-08-03 10:35:12.620309
9068	2828	99	1	2026-08-03 10:35:12.658171	2026-08-03 10:35:12.658171
9069	2828	100	2	2026-08-03 10:35:12.709681	2026-08-03 10:35:12.709681
9070	2828	101	3	2026-08-03 10:35:12.764219	2026-08-03 10:35:12.764219
9071	2828	102	4	2026-08-03 10:35:12.798015	2026-08-03 10:35:12.798015
9072	2829	99	2	2026-08-03 10:35:12.83225	2026-08-03 10:35:12.83225
9073	2829	100	3	2026-08-03 10:35:12.864423	2026-08-03 10:35:12.864423
9074	2829	101	4	2026-08-03 10:35:12.904348	2026-08-03 10:35:12.904348
9075	2829	102	5	2026-08-03 10:35:12.95304	2026-08-03 10:35:12.95304
9076	2830	99	1	2026-08-03 10:35:13.018161	2026-08-03 10:35:13.018161
9077	2830	100	2	2026-08-03 10:35:13.054857	2026-08-03 10:35:13.054857
9078	2830	101	3	2026-08-03 10:35:13.099251	2026-08-03 10:35:13.099251
9079	2830	102	4	2026-08-03 10:35:13.157275	2026-08-03 10:35:13.157275
9080	2831	99	2	2026-08-03 10:35:13.197637	2026-08-03 10:35:13.197637
9081	2831	100	3	2026-08-03 10:35:13.232361	2026-08-03 10:35:13.232361
9082	2831	101	4	2026-08-03 10:35:13.260269	2026-08-03 10:35:13.260269
9083	2831	102	5	2026-08-03 10:35:13.293794	2026-08-03 10:35:13.293794
9084	2832	99	3	2026-08-03 10:35:13.335639	2026-08-03 10:35:13.335639
9085	2832	100	4	2026-08-03 10:35:13.36755	2026-08-03 10:35:13.36755
9086	2832	101	5	2026-08-03 10:35:13.395673	2026-08-03 10:35:13.395673
9087	2832	102	1	2026-08-03 10:35:13.425667	2026-08-03 10:35:13.425667
9088	2833	99	1	2026-08-03 10:35:13.487899	2026-08-03 10:35:13.487899
9089	2833	100	2	2026-08-03 10:35:13.530269	2026-08-03 10:35:13.530269
9090	2833	101	3	2026-08-03 10:35:13.565773	2026-08-03 10:35:13.565773
9091	2833	102	4	2026-08-03 10:35:13.597829	2026-08-03 10:35:13.597829
9092	2834	99	2	2026-08-03 10:35:13.636439	2026-08-03 10:35:13.636439
9093	2834	100	3	2026-08-03 10:35:13.666855	2026-08-03 10:35:13.666855
9094	2834	101	4	2026-08-03 10:35:13.706293	2026-08-03 10:35:13.706293
9095	2834	102	5	2026-08-03 10:35:13.757114	2026-08-03 10:35:13.757114
9096	2835	99	3	2026-08-03 10:35:13.798952	2026-08-03 10:35:13.798952
9097	2835	100	4	2026-08-03 10:35:13.824573	2026-08-03 10:35:13.824573
9098	2835	101	5	2026-08-03 10:35:13.852048	2026-08-03 10:35:13.852048
9099	2835	102	1	2026-08-03 10:35:13.879548	2026-08-03 10:35:13.879548
9100	2836	99	2	2026-08-03 10:35:13.947596	2026-08-03 10:35:13.947596
9101	2836	100	3	2026-08-03 10:35:13.986184	2026-08-03 10:35:13.986184
9102	2836	101	4	2026-08-03 10:35:14.012868	2026-08-03 10:35:14.012868
9103	2836	102	5	2026-08-03 10:35:14.040308	2026-08-03 10:35:14.040308
9104	2837	99	3	2026-08-03 10:35:14.077797	2026-08-03 10:35:14.077797
9105	2837	100	4	2026-08-03 10:35:14.103818	2026-08-03 10:35:14.103818
9106	2837	101	5	2026-08-03 10:35:14.130639	2026-08-03 10:35:14.130639
9107	2837	102	1	2026-08-03 10:35:14.160089	2026-08-03 10:35:14.160089
9108	2838	99	5	2026-08-03 10:35:14.198277	2026-08-03 10:35:14.198277
9109	2838	100	1	2026-08-03 10:35:14.232748	2026-08-03 10:35:14.232748
9110	2838	101	2	2026-08-03 10:35:14.259224	2026-08-03 10:35:14.259224
9111	2838	102	3	2026-08-03 10:35:14.285014	2026-08-03 10:35:14.285014
9112	2839	99	3	2026-08-03 10:35:14.34522	2026-08-03 10:35:14.34522
9113	2839	100	4	2026-08-03 10:35:14.378209	2026-08-03 10:35:14.378209
9114	2839	101	5	2026-08-03 10:35:14.405772	2026-08-03 10:35:14.405772
9115	2839	102	1	2026-08-03 10:35:14.437122	2026-08-03 10:35:14.437122
9116	2840	99	5	2026-08-03 10:35:14.479538	2026-08-03 10:35:14.479538
9117	2840	100	1	2026-08-03 10:35:14.527256	2026-08-03 10:35:14.527256
9118	2840	101	2	2026-08-03 10:35:14.56166	2026-08-03 10:35:14.56166
9119	2840	102	3	2026-08-03 10:35:14.589942	2026-08-03 10:35:14.589942
9120	2841	99	1	2026-08-03 10:35:14.645253	2026-08-03 10:35:14.645253
9121	2841	100	2	2026-08-03 10:35:14.693787	2026-08-03 10:35:14.693787
9122	2841	101	3	2026-08-03 10:35:14.722179	2026-08-03 10:35:14.722179
9123	2841	102	4	2026-08-03 10:35:14.749821	2026-08-03 10:35:14.749821
9124	2842	99	5	2026-08-03 10:35:14.822222	2026-08-03 10:35:14.822222
9125	2842	100	1	2026-08-03 10:35:14.86225	2026-08-03 10:35:14.86225
9126	2842	101	2	2026-08-03 10:35:14.902189	2026-08-03 10:35:14.902189
9127	2842	102	3	2026-08-03 10:35:14.958058	2026-08-03 10:35:14.958058
9128	2843	99	1	2026-08-03 10:35:15.006606	2026-08-03 10:35:15.006606
9129	2843	100	2	2026-08-03 10:35:15.037499	2026-08-03 10:35:15.037499
9130	2843	101	3	2026-08-03 10:35:15.068003	2026-08-03 10:35:15.068003
9131	2843	102	4	2026-08-03 10:35:15.100002	2026-08-03 10:35:15.100002
9132	2844	99	2	2026-08-03 10:35:15.136619	2026-08-03 10:35:15.136619
9133	2844	100	3	2026-08-03 10:35:15.169565	2026-08-03 10:35:15.169565
9134	2844	101	4	2026-08-03 10:35:15.205657	2026-08-03 10:35:15.205657
9135	2844	102	5	2026-08-03 10:35:15.268338	2026-08-03 10:35:15.268338
9136	2845	99	5	2026-08-03 10:35:15.352489	2026-08-03 10:35:15.352489
9137	2845	100	1	2026-08-03 10:35:15.397614	2026-08-03 10:35:15.397614
9138	2845	101	2	2026-08-03 10:35:15.437502	2026-08-03 10:35:15.437502
9139	2845	102	3	2026-08-03 10:35:15.488543	2026-08-03 10:35:15.488543
9140	2846	99	1	2026-08-03 10:35:15.548148	2026-08-03 10:35:15.548148
9141	2846	100	2	2026-08-03 10:35:15.576268	2026-08-03 10:35:15.576268
9142	2846	101	3	2026-08-03 10:35:15.601835	2026-08-03 10:35:15.601835
9143	2846	102	4	2026-08-03 10:35:15.630381	2026-08-03 10:35:15.630381
9144	2847	99	2	2026-08-03 10:35:15.667879	2026-08-03 10:35:15.667879
9145	2847	100	3	2026-08-03 10:35:15.700195	2026-08-03 10:35:15.700195
9146	2847	101	4	2026-08-03 10:35:15.735106	2026-08-03 10:35:15.735106
9147	2847	102	5	2026-08-03 10:35:15.790725	2026-08-03 10:35:15.790725
9148	2848	99	1	2026-08-03 10:35:15.866791	2026-08-03 10:35:15.866791
9149	2848	100	2	2026-08-03 10:35:15.939533	2026-08-03 10:35:15.939533
9150	2848	101	3	2026-08-03 10:35:15.981285	2026-08-03 10:35:15.981285
9151	2848	102	4	2026-08-03 10:35:16.014883	2026-08-03 10:35:16.014883
9152	2849	99	2	2026-08-03 10:35:16.057261	2026-08-03 10:35:16.057261
9153	2849	100	3	2026-08-03 10:35:16.091277	2026-08-03 10:35:16.091277
9154	2849	101	4	2026-08-03 10:35:16.125517	2026-08-03 10:35:16.125517
9155	2849	102	5	2026-08-03 10:35:16.158011	2026-08-03 10:35:16.158011
9156	2850	99	4	2026-08-03 10:35:16.212665	2026-08-03 10:35:16.212665
9157	2850	100	5	2026-08-03 10:35:16.255578	2026-08-03 10:35:16.255578
9158	2850	101	1	2026-08-03 10:35:16.299232	2026-08-03 10:35:16.299232
9159	2850	102	2	2026-08-03 10:35:16.385107	2026-08-03 10:35:16.385107
9160	2851	99	2	2026-08-03 10:35:16.498325	2026-08-03 10:35:16.498325
9161	2851	100	3	2026-08-03 10:35:16.597144	2026-08-03 10:35:16.597144
9162	2851	101	4	2026-08-03 10:35:16.667679	2026-08-03 10:35:16.667679
9163	2851	102	5	2026-08-03 10:35:16.753561	2026-08-03 10:35:16.753561
9164	2852	99	4	2026-08-03 10:35:16.868988	2026-08-03 10:35:16.868988
9165	2852	100	5	2026-08-03 10:35:16.95509	2026-08-03 10:35:16.95509
9166	2852	101	1	2026-08-03 10:35:17.015487	2026-08-03 10:35:17.015487
9167	2852	102	2	2026-08-03 10:35:17.080404	2026-08-03 10:35:17.080404
9168	2853	99	5	2026-08-03 10:35:17.142165	2026-08-03 10:35:17.142165
9169	2853	100	1	2026-08-03 10:35:17.180219	2026-08-03 10:35:17.180219
9170	2853	101	2	2026-08-03 10:35:17.219182	2026-08-03 10:35:17.219182
9171	2853	102	3	2026-08-03 10:35:17.259994	2026-08-03 10:35:17.259994
9172	2854	99	4	2026-08-03 10:35:17.368466	2026-08-03 10:35:17.368466
9173	2854	100	5	2026-08-03 10:35:17.422797	2026-08-03 10:35:17.422797
9174	2854	101	1	2026-08-03 10:35:17.465608	2026-08-03 10:35:17.465608
9175	2854	102	2	2026-08-03 10:35:17.508217	2026-08-03 10:35:17.508217
9176	2855	99	5	2026-08-03 10:35:17.595978	2026-08-03 10:35:17.595978
9177	2855	100	1	2026-08-03 10:35:17.686773	2026-08-03 10:35:17.686773
9178	2855	101	2	2026-08-03 10:35:17.766815	2026-08-03 10:35:17.766815
9179	2855	102	3	2026-08-03 10:35:17.798767	2026-08-03 10:35:17.798767
9180	2856	99	1	2026-08-03 10:35:17.840396	2026-08-03 10:35:17.840396
9181	2856	100	2	2026-08-03 10:35:17.872082	2026-08-03 10:35:17.872082
9182	2856	101	3	2026-08-03 10:35:17.913282	2026-08-03 10:35:17.913282
9183	2856	102	4	2026-08-03 10:35:17.951625	2026-08-03 10:35:17.951625
9184	2857	99	4	2026-08-03 10:35:18.038937	2026-08-03 10:35:18.038937
9185	2857	100	5	2026-08-03 10:35:18.109154	2026-08-03 10:35:18.109154
9186	2857	101	1	2026-08-03 10:35:18.144875	2026-08-03 10:35:18.144875
9187	2857	102	2	2026-08-03 10:35:18.176472	2026-08-03 10:35:18.176472
9188	2858	99	5	2026-08-03 10:35:18.21768	2026-08-03 10:35:18.21768
9189	2858	100	1	2026-08-03 10:35:18.254136	2026-08-03 10:35:18.254136
9190	2858	101	2	2026-08-03 10:35:18.287175	2026-08-03 10:35:18.287175
9191	2858	102	3	2026-08-03 10:35:18.316874	2026-08-03 10:35:18.316874
9192	2859	99	1	2026-08-03 10:35:18.353745	2026-08-03 10:35:18.353745
9193	2859	100	2	2026-08-03 10:35:18.382473	2026-08-03 10:35:18.382473
9194	2859	101	3	2026-08-03 10:35:18.412658	2026-08-03 10:35:18.412658
9195	2859	102	4	2026-08-03 10:35:18.453729	2026-08-03 10:35:18.453729
9196	2860	99	5	2026-08-03 10:35:18.528429	2026-08-03 10:35:18.528429
9197	2860	100	1	2026-08-03 10:35:18.565591	2026-08-03 10:35:18.565591
9198	2860	101	2	2026-08-03 10:35:18.600946	2026-08-03 10:35:18.600946
9199	2860	102	3	2026-08-03 10:35:18.635016	2026-08-03 10:35:18.635016
9200	2861	99	1	2026-08-03 10:35:18.680209	2026-08-03 10:35:18.680209
9201	2861	100	2	2026-08-03 10:35:18.734956	2026-08-03 10:35:18.734956
9202	2861	101	3	2026-08-03 10:35:18.779278	2026-08-03 10:35:18.779278
9203	2861	102	4	2026-08-03 10:35:18.816878	2026-08-03 10:35:18.816878
9204	2862	99	3	2026-08-03 10:35:18.881293	2026-08-03 10:35:18.881293
9205	2862	100	4	2026-08-03 10:35:18.942575	2026-08-03 10:35:18.942575
9206	2862	101	5	2026-08-03 10:35:18.985534	2026-08-03 10:35:18.985534
9207	2862	102	1	2026-08-03 10:35:19.06669	2026-08-03 10:35:19.06669
9208	2863	99	1	2026-08-03 10:35:19.248256	2026-08-03 10:35:19.248256
9209	2863	100	2	2026-08-03 10:35:19.296204	2026-08-03 10:35:19.296204
9210	2863	101	3	2026-08-03 10:35:19.354629	2026-08-03 10:35:19.354629
9211	2863	102	4	2026-08-03 10:35:19.426011	2026-08-03 10:35:19.426011
9212	2864	99	3	2026-08-03 10:35:19.504322	2026-08-03 10:35:19.504322
9213	2864	100	4	2026-08-03 10:35:19.594909	2026-08-03 10:35:19.594909
9214	2864	101	5	2026-08-03 10:35:19.662245	2026-08-03 10:35:19.662245
9215	2864	102	1	2026-08-03 10:35:19.748709	2026-08-03 10:35:19.748709
9216	2865	99	4	2026-08-03 10:35:19.802406	2026-08-03 10:35:19.802406
9217	2865	100	5	2026-08-03 10:35:19.838967	2026-08-03 10:35:19.838967
9218	2865	101	1	2026-08-03 10:35:19.89541	2026-08-03 10:35:19.89541
9219	2865	102	2	2026-08-03 10:35:19.957585	2026-08-03 10:35:19.957585
9220	2866	99	3	2026-08-03 10:35:20.102827	2026-08-03 10:35:20.102827
9221	2866	100	4	2026-08-03 10:35:20.157303	2026-08-03 10:35:20.157303
9222	2866	101	5	2026-08-03 10:35:20.188828	2026-08-03 10:35:20.188828
9223	2866	102	1	2026-08-03 10:35:20.220011	2026-08-03 10:35:20.220011
9224	2867	99	4	2026-08-03 10:35:20.26476	2026-08-03 10:35:20.26476
9225	2867	100	5	2026-08-03 10:35:20.295762	2026-08-03 10:35:20.295762
9226	2867	101	1	2026-08-03 10:35:20.326399	2026-08-03 10:35:20.326399
9227	2867	102	2	2026-08-03 10:35:20.35529	2026-08-03 10:35:20.35529
9228	2868	99	5	2026-08-03 10:35:20.393591	2026-08-03 10:35:20.393591
9229	2868	100	1	2026-08-03 10:35:20.423542	2026-08-03 10:35:20.423542
9230	2868	101	2	2026-08-03 10:35:20.459867	2026-08-03 10:35:20.459867
9231	2868	102	3	2026-08-03 10:35:20.49109	2026-08-03 10:35:20.49109
9232	2869	99	3	2026-08-03 10:35:20.561298	2026-08-03 10:35:20.561298
9233	2869	100	4	2026-08-03 10:35:20.619682	2026-08-03 10:35:20.619682
9234	2869	101	5	2026-08-03 10:35:20.689442	2026-08-03 10:35:20.689442
9235	2869	102	1	2026-08-03 10:35:20.734574	2026-08-03 10:35:20.734574
9236	2870	99	4	2026-08-03 10:35:20.787819	2026-08-03 10:35:20.787819
9237	2870	100	5	2026-08-03 10:35:20.828269	2026-08-03 10:35:20.828269
9238	2870	101	1	2026-08-03 10:35:20.872432	2026-08-03 10:35:20.872432
9239	2870	102	2	2026-08-03 10:35:20.920431	2026-08-03 10:35:20.920431
9240	2871	99	5	2026-08-03 10:35:21.013252	2026-08-03 10:35:21.013252
9241	2871	100	1	2026-08-03 10:35:21.067664	2026-08-03 10:35:21.067664
9242	2871	101	2	2026-08-03 10:35:21.117199	2026-08-03 10:35:21.117199
9243	2871	102	3	2026-08-03 10:35:21.164203	2026-08-03 10:35:21.164203
9244	2872	99	4	2026-08-03 10:35:21.25439	2026-08-03 10:35:21.25439
9245	2872	100	5	2026-08-03 10:35:21.299902	2026-08-03 10:35:21.299902
9246	2872	101	1	2026-08-03 10:35:21.331275	2026-08-03 10:35:21.331275
9247	2872	102	2	2026-08-03 10:35:21.360469	2026-08-03 10:35:21.360469
9248	2873	99	5	2026-08-03 10:35:21.398783	2026-08-03 10:35:21.398783
9249	2873	100	1	2026-08-03 10:35:21.436209	2026-08-03 10:35:21.436209
9250	2873	101	2	2026-08-03 10:35:21.481168	2026-08-03 10:35:21.481168
9251	2873	102	3	2026-08-03 10:35:21.523922	2026-08-03 10:35:21.523922
9252	2874	99	2	2026-08-03 10:35:21.565385	2026-08-03 10:35:21.565385
9253	2874	100	3	2026-08-03 10:35:21.60772	2026-08-03 10:35:21.60772
9254	2874	101	4	2026-08-03 10:35:21.638588	2026-08-03 10:35:21.638588
9255	2874	102	5	2026-08-03 10:35:21.67528	2026-08-03 10:35:21.67528
9256	2875	99	5	2026-08-03 10:35:21.76803	2026-08-03 10:35:21.76803
9257	2875	100	1	2026-08-03 10:35:21.810212	2026-08-03 10:35:21.810212
9258	2875	101	2	2026-08-03 10:35:21.842072	2026-08-03 10:35:21.842072
9259	2875	102	3	2026-08-03 10:35:21.874337	2026-08-03 10:35:21.874337
9260	2876	99	2	2026-08-03 10:35:21.91963	2026-08-03 10:35:21.91963
9261	2876	100	3	2026-08-03 10:35:21.951935	2026-08-03 10:35:21.951935
9262	2876	101	4	2026-08-03 10:35:21.98194	2026-08-03 10:35:21.98194
9263	2876	102	5	2026-08-03 10:35:22.01561	2026-08-03 10:35:22.01561
9264	2877	99	3	2026-08-03 10:35:22.052799	2026-08-03 10:35:22.052799
9265	2877	100	4	2026-08-03 10:35:22.08662	2026-08-03 10:35:22.08662
9266	2877	101	5	2026-08-03 10:35:22.116099	2026-08-03 10:35:22.116099
9267	2877	102	1	2026-08-03 10:35:22.165792	2026-08-03 10:35:22.165792
9268	2878	99	2	2026-08-03 10:35:22.306075	2026-08-03 10:35:22.306075
9269	2878	100	3	2026-08-03 10:35:22.345113	2026-08-03 10:35:22.345113
9270	2878	101	4	2026-08-03 10:35:22.375534	2026-08-03 10:35:22.375534
9271	2878	102	5	2026-08-03 10:35:22.406404	2026-08-03 10:35:22.406404
9272	2879	99	3	2026-08-03 10:35:22.462832	2026-08-03 10:35:22.462832
9273	2879	100	4	2026-08-03 10:35:22.510346	2026-08-03 10:35:22.510346
9274	2879	101	5	2026-08-03 10:35:22.572358	2026-08-03 10:35:22.572358
9275	2879	102	1	2026-08-03 10:35:22.62252	2026-08-03 10:35:22.62252
9276	2880	99	4	2026-08-03 10:35:22.664649	2026-08-03 10:35:22.664649
9277	2880	100	5	2026-08-03 10:35:22.701395	2026-08-03 10:35:22.701395
9278	2880	101	1	2026-08-03 10:35:22.754675	2026-08-03 10:35:22.754675
9279	2880	102	2	2026-08-03 10:35:22.815317	2026-08-03 10:35:22.815317
9280	2881	99	2	2026-08-03 10:35:22.880764	2026-08-03 10:35:22.880764
9281	2881	100	3	2026-08-03 10:35:22.919492	2026-08-03 10:35:22.919492
9282	2881	101	4	2026-08-03 10:35:22.949232	2026-08-03 10:35:22.949232
9283	2881	102	5	2026-08-03 10:35:22.978584	2026-08-03 10:35:22.978584
9284	2882	99	3	2026-08-03 10:35:23.019847	2026-08-03 10:35:23.019847
9285	2882	100	4	2026-08-03 10:35:23.05373	2026-08-03 10:35:23.05373
9286	2882	101	5	2026-08-03 10:35:23.087663	2026-08-03 10:35:23.087663
9287	2882	102	1	2026-08-03 10:35:23.150633	2026-08-03 10:35:23.150633
9288	2883	99	4	2026-08-03 10:35:23.234893	2026-08-03 10:35:23.234893
9289	2883	100	5	2026-08-03 10:35:23.272949	2026-08-03 10:35:23.272949
9290	2883	101	1	2026-08-03 10:35:23.310442	2026-08-03 10:35:23.310442
9291	2883	102	2	2026-08-03 10:35:23.350679	2026-08-03 10:35:23.350679
9292	2884	99	3	2026-08-03 10:35:23.4721	2026-08-03 10:35:23.4721
9293	2884	100	4	2026-08-03 10:35:23.523134	2026-08-03 10:35:23.523134
9294	2884	101	5	2026-08-03 10:35:23.559211	2026-08-03 10:35:23.559211
9295	2884	102	1	2026-08-03 10:35:23.595094	2026-08-03 10:35:23.595094
9296	2885	99	4	2026-08-03 10:35:23.643049	2026-08-03 10:35:23.643049
9297	2885	100	5	2026-08-03 10:35:23.680758	2026-08-03 10:35:23.680758
9298	2885	101	1	2026-08-03 10:35:23.751298	2026-08-03 10:35:23.751298
9299	2885	102	2	2026-08-03 10:35:23.819274	2026-08-03 10:35:23.819274
9300	2886	99	1	2026-08-03 10:35:23.884306	2026-08-03 10:35:23.884306
9301	2886	100	2	2026-08-03 10:35:23.956713	2026-08-03 10:35:23.956713
9302	2886	101	3	2026-08-03 10:35:24.0029	2026-08-03 10:35:24.0029
9303	2886	102	4	2026-08-03 10:35:24.044555	2026-08-03 10:35:24.044555
9304	2887	99	4	2026-08-03 10:35:24.140406	2026-08-03 10:35:24.140406
9305	2887	100	5	2026-08-03 10:35:24.181689	2026-08-03 10:35:24.181689
9306	2887	101	1	2026-08-03 10:35:24.213581	2026-08-03 10:35:24.213581
9307	2887	102	2	2026-08-03 10:35:24.248043	2026-08-03 10:35:24.248043
9308	2888	99	1	2026-08-03 10:35:24.294801	2026-08-03 10:35:24.294801
9309	2888	100	2	2026-08-03 10:35:24.340972	2026-08-03 10:35:24.340972
9310	2888	101	3	2026-08-03 10:35:24.398232	2026-08-03 10:35:24.398232
9311	2888	102	4	2026-08-03 10:35:24.459265	2026-08-03 10:35:24.459265
9312	2889	99	2	2026-08-03 10:35:24.532274	2026-08-03 10:35:24.532274
9313	2889	100	3	2026-08-03 10:35:24.597546	2026-08-03 10:35:24.597546
9314	2889	101	4	2026-08-03 10:35:24.664285	2026-08-03 10:35:24.664285
9315	2889	102	5	2026-08-03 10:35:24.736355	2026-08-03 10:35:24.736355
9316	2890	99	1	2026-08-03 10:35:24.842327	2026-08-03 10:35:24.842327
9317	2890	100	2	2026-08-03 10:35:24.922068	2026-08-03 10:35:24.922068
9318	2890	101	3	2026-08-03 10:35:25.002568	2026-08-03 10:35:25.002568
9319	2890	102	4	2026-08-03 10:35:25.073802	2026-08-03 10:35:25.073802
9320	2891	99	2	2026-08-03 10:35:25.143533	2026-08-03 10:35:25.143533
9321	2891	100	3	2026-08-03 10:35:25.196569	2026-08-03 10:35:25.196569
9322	2891	101	4	2026-08-03 10:35:25.269492	2026-08-03 10:35:25.269492
9323	2891	102	5	2026-08-03 10:35:25.356916	2026-08-03 10:35:25.356916
9324	2892	99	3	2026-08-03 10:35:25.449571	2026-08-03 10:35:25.449571
9325	2892	100	4	2026-08-03 10:35:25.488789	2026-08-03 10:35:25.488789
9326	2892	101	5	2026-08-03 10:35:25.523871	2026-08-03 10:35:25.523871
9327	2892	102	1	2026-08-03 10:35:25.557565	2026-08-03 10:35:25.557565
9328	2893	99	1	2026-08-03 10:35:25.644447	2026-08-03 10:35:25.644447
9329	2893	100	2	2026-08-03 10:35:25.680404	2026-08-03 10:35:25.680404
9330	2893	101	3	2026-08-03 10:35:25.715137	2026-08-03 10:35:25.715137
9331	2893	102	4	2026-08-03 10:35:25.75291	2026-08-03 10:35:25.75291
9332	2894	99	2	2026-08-03 10:35:25.794546	2026-08-03 10:35:25.794546
9333	2894	100	3	2026-08-03 10:35:25.828607	2026-08-03 10:35:25.828607
9334	2894	101	4	2026-08-03 10:35:25.869111	2026-08-03 10:35:25.869111
9335	2894	102	5	2026-08-03 10:35:25.919637	2026-08-03 10:35:25.919637
9336	2895	99	3	2026-08-03 10:35:25.995117	2026-08-03 10:35:25.995117
9337	2895	100	4	2026-08-03 10:35:26.034462	2026-08-03 10:35:26.034462
9338	2895	101	5	2026-08-03 10:35:26.101105	2026-08-03 10:35:26.101105
9339	2895	102	1	2026-08-03 10:35:26.167109	2026-08-03 10:35:26.167109
9340	2896	99	2	2026-08-03 10:35:26.30432	2026-08-03 10:35:26.30432
9341	2896	100	3	2026-08-03 10:35:26.352139	2026-08-03 10:35:26.352139
9342	2896	101	4	2026-08-03 10:35:26.408611	2026-08-03 10:35:26.408611
9343	2896	102	5	2026-08-03 10:35:26.480201	2026-08-03 10:35:26.480201
9344	2897	99	3	2026-08-03 10:35:26.533764	2026-08-03 10:35:26.533764
9345	2897	100	4	2026-08-03 10:35:26.603225	2026-08-03 10:35:26.603225
9346	2897	101	5	2026-08-03 10:35:26.671116	2026-08-03 10:35:26.671116
9347	2897	102	1	2026-08-03 10:35:26.732261	2026-08-03 10:35:26.732261
9348	2898	99	5	2026-08-03 10:35:26.81855	2026-08-03 10:35:26.81855
9349	2898	100	1	2026-08-03 10:35:26.880333	2026-08-03 10:35:26.880333
9350	2898	101	2	2026-08-03 10:35:26.940801	2026-08-03 10:35:26.940801
9351	2898	102	3	2026-08-03 10:35:26.973041	2026-08-03 10:35:26.973041
9352	2899	99	3	2026-08-03 10:35:27.049192	2026-08-03 10:35:27.049192
9353	2899	100	4	2026-08-03 10:35:27.112135	2026-08-03 10:35:27.112135
9354	2899	101	5	2026-08-03 10:35:27.182381	2026-08-03 10:35:27.182381
9355	2899	102	1	2026-08-03 10:35:27.21522	2026-08-03 10:35:27.21522
9356	2900	99	5	2026-08-03 10:35:27.25393	2026-08-03 10:35:27.25393
9357	2900	100	1	2026-08-03 10:35:27.294497	2026-08-03 10:35:27.294497
9358	2900	101	2	2026-08-03 10:35:27.359003	2026-08-03 10:35:27.359003
9359	2900	102	3	2026-08-03 10:35:27.428028	2026-08-03 10:35:27.428028
9360	2901	99	1	2026-08-03 10:35:27.510027	2026-08-03 10:35:27.510027
9361	2901	100	2	2026-08-03 10:35:27.559264	2026-08-03 10:35:27.559264
9362	2901	101	3	2026-08-03 10:35:27.59049	2026-08-03 10:35:27.59049
9363	2901	102	4	2026-08-03 10:35:27.621053	2026-08-03 10:35:27.621053
9364	2902	99	5	2026-08-03 10:35:27.703753	2026-08-03 10:35:27.703753
9365	2902	100	1	2026-08-03 10:35:27.761216	2026-08-03 10:35:27.761216
9366	2902	101	2	2026-08-03 10:35:27.823435	2026-08-03 10:35:27.823435
9367	2902	102	3	2026-08-03 10:35:27.887206	2026-08-03 10:35:27.887206
9368	2903	99	1	2026-08-03 10:35:27.980151	2026-08-03 10:35:27.980151
9369	2903	100	2	2026-08-03 10:35:28.076586	2026-08-03 10:35:28.076586
9370	2903	101	3	2026-08-03 10:35:28.173557	2026-08-03 10:35:28.173557
9371	2903	102	4	2026-08-03 10:35:28.274669	2026-08-03 10:35:28.274669
9372	2904	99	2	2026-08-03 10:35:28.390025	2026-08-03 10:35:28.390025
9373	2904	100	3	2026-08-03 10:35:28.448057	2026-08-03 10:35:28.448057
9374	2904	101	4	2026-08-03 10:35:28.481913	2026-08-03 10:35:28.481913
9375	2904	102	5	2026-08-03 10:35:28.514848	2026-08-03 10:35:28.514848
9376	2905	99	2	2026-08-03 10:35:28.629341	2026-08-03 10:35:28.629341
9377	2905	100	3	2026-08-03 10:35:28.707149	2026-08-03 10:35:28.707149
9378	2905	101	4	2026-08-03 10:35:28.790663	2026-08-03 10:35:28.790663
9379	2905	102	5	2026-08-03 10:35:28.866478	2026-08-03 10:35:28.866478
9380	2906	99	4	2026-08-03 10:35:28.947022	2026-08-03 10:35:28.947022
9381	2906	100	5	2026-08-03 10:35:29.005327	2026-08-03 10:35:29.005327
9382	2906	101	1	2026-08-03 10:35:29.07078	2026-08-03 10:35:29.07078
9383	2906	102	2	2026-08-03 10:35:29.105612	2026-08-03 10:35:29.105612
9384	2907	99	5	2026-08-03 10:35:29.1493	2026-08-03 10:35:29.1493
9385	2907	100	1	2026-08-03 10:35:29.218282	2026-08-03 10:35:29.218282
9386	2907	101	2	2026-08-03 10:35:29.30081	2026-08-03 10:35:29.30081
9387	2907	102	3	2026-08-03 10:35:29.362609	2026-08-03 10:35:29.362609
9388	2908	99	4	2026-08-03 10:35:29.506405	2026-08-03 10:35:29.506405
9389	2908	100	5	2026-08-03 10:35:29.55462	2026-08-03 10:35:29.55462
9390	2908	101	1	2026-08-03 10:35:29.593744	2026-08-03 10:35:29.593744
9391	2908	102	2	2026-08-03 10:35:29.628065	2026-08-03 10:35:29.628065
9392	2909	99	5	2026-08-03 10:35:29.673008	2026-08-03 10:35:29.673008
9393	2909	100	1	2026-08-03 10:35:29.720292	2026-08-03 10:35:29.720292
9394	2909	101	2	2026-08-03 10:35:29.769904	2026-08-03 10:35:29.769904
9395	2909	102	3	2026-08-03 10:35:29.808333	2026-08-03 10:35:29.808333
9396	2910	99	1	2026-08-03 10:35:29.87196	2026-08-03 10:35:29.87196
9397	2910	100	2	2026-08-03 10:35:29.925278	2026-08-03 10:35:29.925278
9398	2910	101	3	2026-08-03 10:35:29.984844	2026-08-03 10:35:29.984844
9399	2910	102	4	2026-08-03 10:35:30.034245	2026-08-03 10:35:30.034245
9400	2911	99	4	2026-08-03 10:35:30.222285	2026-08-03 10:35:30.222285
9401	2911	100	5	2026-08-03 10:35:30.326592	2026-08-03 10:35:30.326592
9402	2911	101	1	2026-08-03 10:35:30.426566	2026-08-03 10:35:30.426566
9403	2911	102	2	2026-08-03 10:35:30.469466	2026-08-03 10:35:30.469466
9404	2912	99	5	2026-08-03 10:35:30.567875	2026-08-03 10:35:30.567875
9405	2912	100	1	2026-08-03 10:35:30.650002	2026-08-03 10:35:30.650002
9406	2912	101	2	2026-08-03 10:35:30.707436	2026-08-03 10:35:30.707436
9407	2912	102	3	2026-08-03 10:35:30.805987	2026-08-03 10:35:30.805987
9408	2913	99	1	2026-08-03 10:35:30.881187	2026-08-03 10:35:30.881187
9409	2913	100	2	2026-08-03 10:35:30.931008	2026-08-03 10:35:30.931008
9410	2913	101	3	2026-08-03 10:35:30.992876	2026-08-03 10:35:30.992876
9411	2913	102	4	2026-08-03 10:35:31.044326	2026-08-03 10:35:31.044326
9412	2974	99	1	2026-08-03 10:35:33.389748	2026-08-03 10:35:33.389748
9413	2974	100	1	2026-08-03 10:35:33.445878	2026-08-03 10:35:33.445878
9414	2974	101	1	2026-08-03 10:35:33.492651	2026-08-03 10:35:33.492651
9415	2974	102	1	2026-08-03 10:35:33.534589	2026-08-03 10:35:33.534589
9416	2975	99	5	2026-08-03 10:35:33.607939	2026-08-03 10:35:33.607939
9417	2975	100	5	2026-08-03 10:35:33.650479	2026-08-03 10:35:33.650479
9418	2975	101	5	2026-08-03 10:35:33.701097	2026-08-03 10:35:33.701097
9419	2975	102	5	2026-08-03 10:35:33.791291	2026-08-03 10:35:33.791291
9420	2976	99	1	2026-08-03 10:35:34.009053	2026-08-03 10:35:34.009053
9421	2976	100	2	2026-08-03 10:35:34.109428	2026-08-03 10:35:34.109428
9422	2976	101	3	2026-08-03 10:35:34.237922	2026-08-03 10:35:34.237922
9423	2976	102	4	2026-08-03 10:35:34.364877	2026-08-03 10:35:34.364877
9424	2977	99	2	2026-08-03 10:35:34.496202	2026-08-03 10:35:34.496202
9425	2977	100	3	2026-08-03 10:35:34.592025	2026-08-03 10:35:34.592025
9426	2977	101	4	2026-08-03 10:35:34.66813	2026-08-03 10:35:34.66813
9427	2977	102	5	2026-08-03 10:35:34.780547	2026-08-03 10:35:34.780547
9428	2978	99	3	2026-08-03 10:35:34.903842	2026-08-03 10:35:34.903842
9429	2978	100	4	2026-08-03 10:35:35.004203	2026-08-03 10:35:35.004203
9430	2978	101	5	2026-08-03 10:35:35.061266	2026-08-03 10:35:35.061266
9431	2978	102	1	2026-08-03 10:35:35.112916	2026-08-03 10:35:35.112916
9432	2979	99	1	2026-08-03 10:35:35.191461	2026-08-03 10:35:35.191461
9433	2979	100	2	2026-08-03 10:35:35.255165	2026-08-03 10:35:35.255165
9434	2979	101	3	2026-08-03 10:35:35.33933	2026-08-03 10:35:35.33933
9435	2979	102	4	2026-08-03 10:35:35.427928	2026-08-03 10:35:35.427928
9436	2980	99	2	2026-08-03 10:35:35.618892	2026-08-03 10:35:35.618892
9437	2980	100	3	2026-08-03 10:35:35.687445	2026-08-03 10:35:35.687445
9438	2980	101	4	2026-08-03 10:35:35.75176	2026-08-03 10:35:35.75176
9439	2980	102	5	2026-08-03 10:35:35.809029	2026-08-03 10:35:35.809029
9440	2981	99	3	2026-08-03 10:35:35.867864	2026-08-03 10:35:35.867864
9441	2981	100	4	2026-08-03 10:35:35.920437	2026-08-03 10:35:35.920437
9442	2981	101	5	2026-08-03 10:35:35.981165	2026-08-03 10:35:35.981165
9443	2981	102	1	2026-08-03 10:35:36.044201	2026-08-03 10:35:36.044201
9444	2982	99	4	2026-08-03 10:35:36.119049	2026-08-03 10:35:36.119049
9445	2982	100	5	2026-08-03 10:35:36.178964	2026-08-03 10:35:36.178964
9446	2982	101	1	2026-08-03 10:35:36.22193	2026-08-03 10:35:36.22193
9447	2982	102	2	2026-08-03 10:35:36.307175	2026-08-03 10:35:36.307175
9448	2983	99	2	2026-08-03 10:35:36.424384	2026-08-03 10:35:36.424384
9449	2983	100	3	2026-08-03 10:35:36.527965	2026-08-03 10:35:36.527965
9450	2983	101	4	2026-08-03 10:35:36.596543	2026-08-03 10:35:36.596543
9451	2983	102	5	2026-08-03 10:35:36.650148	2026-08-03 10:35:36.650148
9452	2984	99	3	2026-08-03 10:35:36.833842	2026-08-03 10:35:36.833842
9453	2984	100	4	2026-08-03 10:35:36.892266	2026-08-03 10:35:36.892266
9454	2984	101	5	2026-08-03 10:35:36.939999	2026-08-03 10:35:36.939999
9455	2984	102	1	2026-08-03 10:35:36.989342	2026-08-03 10:35:36.989342
9456	2985	99	4	2026-08-03 10:35:37.047467	2026-08-03 10:35:37.047467
9457	2985	100	5	2026-08-03 10:35:37.100664	2026-08-03 10:35:37.100664
9458	2985	101	1	2026-08-03 10:35:37.150179	2026-08-03 10:35:37.150179
9459	2985	102	2	2026-08-03 10:35:37.208744	2026-08-03 10:35:37.208744
9460	2986	99	5	2026-08-03 10:35:37.301204	2026-08-03 10:35:37.301204
9461	2986	100	1	2026-08-03 10:35:37.375593	2026-08-03 10:35:37.375593
9462	2986	101	2	2026-08-03 10:35:37.425511	2026-08-03 10:35:37.425511
9463	2986	102	3	2026-08-03 10:35:37.478801	2026-08-03 10:35:37.478801
9464	2987	99	4	2026-08-03 10:35:37.662987	2026-08-03 10:35:37.662987
9465	2987	100	5	2026-08-03 10:35:37.721306	2026-08-03 10:35:37.721306
9466	2987	101	1	2026-08-03 10:35:37.779288	2026-08-03 10:35:37.779288
9467	2987	102	2	2026-08-03 10:35:37.841284	2026-08-03 10:35:37.841284
9468	2988	99	5	2026-08-03 10:35:37.907224	2026-08-03 10:35:37.907224
9469	2988	100	1	2026-08-03 10:35:37.966126	2026-08-03 10:35:37.966126
9470	2988	101	2	2026-08-03 10:35:38.023234	2026-08-03 10:35:38.023234
9471	2988	102	3	2026-08-03 10:35:38.074472	2026-08-03 10:35:38.074472
9472	2989	99	1	2026-08-03 10:35:38.158427	2026-08-03 10:35:38.158427
9473	2989	100	2	2026-08-03 10:35:38.230127	2026-08-03 10:35:38.230127
9474	2989	101	3	2026-08-03 10:35:38.279125	2026-08-03 10:35:38.279125
9475	2989	102	4	2026-08-03 10:35:38.329008	2026-08-03 10:35:38.329008
9476	2990	99	5	2026-08-03 10:35:38.527646	2026-08-03 10:35:38.527646
9477	2990	100	1	2026-08-03 10:35:38.588004	2026-08-03 10:35:38.588004
9478	2990	101	2	2026-08-03 10:35:38.637395	2026-08-03 10:35:38.637395
9479	2990	102	3	2026-08-03 10:35:38.687772	2026-08-03 10:35:38.687772
9480	2991	99	1	2026-08-03 10:35:38.753897	2026-08-03 10:35:38.753897
9481	2991	100	2	2026-08-03 10:35:38.811964	2026-08-03 10:35:38.811964
9482	2991	101	3	2026-08-03 10:35:38.873091	2026-08-03 10:35:38.873091
9483	2991	102	4	2026-08-03 10:35:38.922334	2026-08-03 10:35:38.922334
9484	2992	99	2	2026-08-03 10:35:39.004893	2026-08-03 10:35:39.004893
9485	2992	100	3	2026-08-03 10:35:39.071771	2026-08-03 10:35:39.071771
9486	2992	101	4	2026-08-03 10:35:39.121795	2026-08-03 10:35:39.121795
9487	2992	102	5	2026-08-03 10:35:39.182773	2026-08-03 10:35:39.182773
9488	2993	99	1	2026-08-03 10:35:39.320724	2026-08-03 10:35:39.320724
9489	2993	100	2	2026-08-03 10:35:39.390114	2026-08-03 10:35:39.390114
9490	2993	101	3	2026-08-03 10:35:39.448345	2026-08-03 10:35:39.448345
9491	2993	102	4	2026-08-03 10:35:39.499271	2026-08-03 10:35:39.499271
9492	2994	99	2	2026-08-03 10:35:39.56213	2026-08-03 10:35:39.56213
9493	2994	100	3	2026-08-03 10:35:39.699545	2026-08-03 10:35:39.699545
9494	2994	101	4	2026-08-03 10:35:39.776134	2026-08-03 10:35:39.776134
9495	2994	102	5	2026-08-03 10:35:39.842767	2026-08-03 10:35:39.842767
9496	2995	99	3	2026-08-03 10:35:39.927904	2026-08-03 10:35:39.927904
9497	2995	100	4	2026-08-03 10:35:40.000648	2026-08-03 10:35:40.000648
9498	2995	101	5	2026-08-03 10:35:40.094621	2026-08-03 10:35:40.094621
9499	2995	102	1	2026-08-03 10:35:40.189243	2026-08-03 10:35:40.189243
9500	2996	99	2	2026-08-03 10:35:40.361521	2026-08-03 10:35:40.361521
9501	2996	100	3	2026-08-03 10:35:40.435011	2026-08-03 10:35:40.435011
9502	2996	101	4	2026-08-03 10:35:40.487334	2026-08-03 10:35:40.487334
9503	2996	102	5	2026-08-03 10:35:40.552554	2026-08-03 10:35:40.552554
9504	2997	99	3	2026-08-03 10:35:40.63115	2026-08-03 10:35:40.63115
9505	2997	100	4	2026-08-03 10:35:40.691788	2026-08-03 10:35:40.691788
9506	2997	101	5	2026-08-03 10:35:40.747356	2026-08-03 10:35:40.747356
9507	2997	102	1	2026-08-03 10:35:40.798884	2026-08-03 10:35:40.798884
9508	2998	99	4	2026-08-03 10:35:40.873921	2026-08-03 10:35:40.873921
9509	2998	100	5	2026-08-03 10:35:40.927689	2026-08-03 10:35:40.927689
9510	2998	101	1	2026-08-03 10:35:40.980152	2026-08-03 10:35:40.980152
9511	2998	102	2	2026-08-03 10:35:41.035172	2026-08-03 10:35:41.035172
9512	2999	99	3	2026-08-03 10:35:41.202126	2026-08-03 10:35:41.202126
9513	2999	100	4	2026-08-03 10:35:41.26634	2026-08-03 10:35:41.26634
9514	2999	101	5	2026-08-03 10:35:41.317378	2026-08-03 10:35:41.317378
9515	2999	102	1	2026-08-03 10:35:41.369248	2026-08-03 10:35:41.369248
9516	3000	99	4	2026-08-03 10:35:41.460015	2026-08-03 10:35:41.460015
9517	3000	100	5	2026-08-03 10:35:41.543802	2026-08-03 10:35:41.543802
9518	3000	101	1	2026-08-03 10:35:41.621086	2026-08-03 10:35:41.621086
9519	3000	102	2	2026-08-03 10:35:41.760474	2026-08-03 10:35:41.760474
9520	3001	99	5	2026-08-03 10:35:41.886066	2026-08-03 10:35:41.886066
9521	3001	100	1	2026-08-03 10:35:41.935865	2026-08-03 10:35:41.935865
9522	3001	101	2	2026-08-03 10:35:41.985265	2026-08-03 10:35:41.985265
9523	3001	102	3	2026-08-03 10:35:42.035935	2026-08-03 10:35:42.035935
9524	3002	99	3	2026-08-03 10:35:42.182989	2026-08-03 10:35:42.182989
9525	3002	100	4	2026-08-03 10:35:42.31414	2026-08-03 10:35:42.31414
9526	3002	101	5	2026-08-03 10:35:42.452304	2026-08-03 10:35:42.452304
9527	3002	102	1	2026-08-03 10:35:42.572099	2026-08-03 10:35:42.572099
9528	3003	99	4	2026-08-03 10:35:42.917064	2026-08-03 10:35:42.917064
9529	3003	100	5	2026-08-03 10:35:43.015776	2026-08-03 10:35:43.015776
9530	3003	101	1	2026-08-03 10:35:43.076465	2026-08-03 10:35:43.076465
9531	3003	102	2	2026-08-03 10:35:43.125406	2026-08-03 10:35:43.125406
9532	3004	99	5	2026-08-03 10:35:43.211342	2026-08-03 10:35:43.211342
9533	3004	100	1	2026-08-03 10:35:43.36678	2026-08-03 10:35:43.36678
9534	3004	101	2	2026-08-03 10:35:43.488023	2026-08-03 10:35:43.488023
9535	3004	102	3	2026-08-03 10:35:43.620878	2026-08-03 10:35:43.620878
9536	3005	99	1	2026-08-03 10:35:43.774348	2026-08-03 10:35:43.774348
9537	3005	100	2	2026-08-03 10:35:43.855813	2026-08-03 10:35:43.855813
9538	3005	101	3	2026-08-03 10:35:43.931494	2026-08-03 10:35:43.931494
9539	3005	102	4	2026-08-03 10:35:43.995322	2026-08-03 10:35:43.995322
9540	3006	99	5	2026-08-03 10:35:44.283779	2026-08-03 10:35:44.283779
9541	3006	100	1	2026-08-03 10:35:44.409925	2026-08-03 10:35:44.409925
9542	3006	101	2	2026-08-03 10:35:44.47104	2026-08-03 10:35:44.47104
9543	3006	102	3	2026-08-03 10:35:44.546287	2026-08-03 10:35:44.546287
9544	3007	99	1	2026-08-03 10:35:44.644579	2026-08-03 10:35:44.644579
9545	3007	100	2	2026-08-03 10:35:44.759354	2026-08-03 10:35:44.759354
9546	3007	101	3	2026-08-03 10:35:44.828143	2026-08-03 10:35:44.828143
9547	3007	102	4	2026-08-03 10:35:44.936383	2026-08-03 10:35:44.936383
8596	2710	99	2	2026-08-03 10:34:58.813785	2026-08-03 10:34:58.813785
8597	2710	100	3	2026-08-03 10:34:58.850534	2026-08-03 10:34:58.850534
8598	2710	101	4	2026-08-03 10:34:58.879428	2026-08-03 10:34:58.879428
8599	2710	102	5	2026-08-03 10:34:58.904411	2026-08-03 10:34:58.904411
8600	2711	99	3	2026-08-03 10:34:58.946891	2026-08-03 10:34:58.946891
8601	2711	100	4	2026-08-03 10:34:58.981448	2026-08-03 10:34:58.981448
8602	2711	101	5	2026-08-03 10:34:59.011133	2026-08-03 10:34:59.011133
8603	2711	102	1	2026-08-03 10:34:59.037731	2026-08-03 10:34:59.037731
8604	2712	99	4	2026-08-03 10:34:59.074527	2026-08-03 10:34:59.074527
8605	2712	100	5	2026-08-03 10:34:59.098843	2026-08-03 10:34:59.098843
8606	2712	101	1	2026-08-03 10:34:59.125364	2026-08-03 10:34:59.125364
8607	2712	102	2	2026-08-03 10:34:59.150444	2026-08-03 10:34:59.150444
8608	2713	99	2	2026-08-03 10:34:59.202255	2026-08-03 10:34:59.202255
8609	2713	100	3	2026-08-03 10:34:59.235129	2026-08-03 10:34:59.235129
8610	2713	101	4	2026-08-03 10:34:59.256344	2026-08-03 10:34:59.256344
8611	2713	102	5	2026-08-03 10:34:59.279757	2026-08-03 10:34:59.279757
8612	2714	99	3	2026-08-03 10:34:59.310275	2026-08-03 10:34:59.310275
8613	2714	100	4	2026-08-03 10:34:59.331778	2026-08-03 10:34:59.331778
8614	2714	101	5	2026-08-03 10:34:59.349994	2026-08-03 10:34:59.349994
8615	2714	102	1	2026-08-03 10:34:59.368973	2026-08-03 10:34:59.368973
8616	2715	99	4	2026-08-03 10:34:59.397339	2026-08-03 10:34:59.397339
8617	2715	100	5	2026-08-03 10:34:59.419058	2026-08-03 10:34:59.419058
8618	2715	101	1	2026-08-03 10:34:59.444275	2026-08-03 10:34:59.444275
8619	2715	102	2	2026-08-03 10:34:59.461779	2026-08-03 10:34:59.461779
8620	2716	99	3	2026-08-03 10:34:59.499807	2026-08-03 10:34:59.499807
8621	2716	100	4	2026-08-03 10:34:59.52648	2026-08-03 10:34:59.52648
8622	2716	101	5	2026-08-03 10:34:59.545384	2026-08-03 10:34:59.545384
8623	2716	102	1	2026-08-03 10:34:59.564305	2026-08-03 10:34:59.564305
8624	2717	99	4	2026-08-03 10:34:59.589028	2026-08-03 10:34:59.589028
8625	2717	100	5	2026-08-03 10:34:59.606439	2026-08-03 10:34:59.606439
8626	2717	101	1	2026-08-03 10:34:59.62605	2026-08-03 10:34:59.62605
8627	2717	102	2	2026-08-03 10:34:59.642887	2026-08-03 10:34:59.642887
8628	2718	99	1	2026-08-03 10:34:59.667758	2026-08-03 10:34:59.667758
8629	2718	100	2	2026-08-03 10:34:59.687053	2026-08-03 10:34:59.687053
8630	2718	101	3	2026-08-03 10:34:59.706177	2026-08-03 10:34:59.706177
8631	2718	102	4	2026-08-03 10:34:59.724821	2026-08-03 10:34:59.724821
8632	2719	99	4	2026-08-03 10:34:59.770405	2026-08-03 10:34:59.770405
8633	2719	100	5	2026-08-03 10:34:59.797488	2026-08-03 10:34:59.797488
8634	2719	101	1	2026-08-03 10:34:59.816142	2026-08-03 10:34:59.816142
8635	2719	102	2	2026-08-03 10:34:59.835408	2026-08-03 10:34:59.835408
8636	2720	99	1	2026-08-03 10:34:59.862996	2026-08-03 10:34:59.862996
8637	2720	100	2	2026-08-03 10:34:59.88182	2026-08-03 10:34:59.88182
8638	2720	101	3	2026-08-03 10:34:59.899843	2026-08-03 10:34:59.899843
8639	2720	102	4	2026-08-03 10:34:59.922984	2026-08-03 10:34:59.922984
8640	2721	99	2	2026-08-03 10:34:59.947524	2026-08-03 10:34:59.947524
8641	2721	100	3	2026-08-03 10:34:59.967734	2026-08-03 10:34:59.967734
8642	2721	101	4	2026-08-03 10:34:59.984964	2026-08-03 10:34:59.984964
8643	2721	102	5	2026-08-03 10:35:00.001632	2026-08-03 10:35:00.001632
8644	2722	99	1	2026-08-03 10:35:00.045678	2026-08-03 10:35:00.045678
8645	2722	100	2	2026-08-03 10:35:00.070783	2026-08-03 10:35:00.070783
8646	2722	101	3	2026-08-03 10:35:00.088959	2026-08-03 10:35:00.088959
8647	2722	102	4	2026-08-03 10:35:00.108644	2026-08-03 10:35:00.108644
8648	2723	99	2	2026-08-03 10:35:00.132486	2026-08-03 10:35:00.132486
8649	2723	100	3	2026-08-03 10:35:00.151207	2026-08-03 10:35:00.151207
8650	2723	101	4	2026-08-03 10:35:00.170839	2026-08-03 10:35:00.170839
8651	2723	102	5	2026-08-03 10:35:00.191076	2026-08-03 10:35:00.191076
8652	2724	99	3	2026-08-03 10:35:00.217324	2026-08-03 10:35:00.217324
8653	2724	100	4	2026-08-03 10:35:00.239291	2026-08-03 10:35:00.239291
8654	2724	101	5	2026-08-03 10:35:00.257467	2026-08-03 10:35:00.257467
8655	2724	102	1	2026-08-03 10:35:00.277376	2026-08-03 10:35:00.277376
8656	2725	99	1	2026-08-03 10:35:00.328337	2026-08-03 10:35:00.328337
8657	2725	100	2	2026-08-03 10:35:00.354181	2026-08-03 10:35:00.354181
8658	2725	101	3	2026-08-03 10:35:00.373806	2026-08-03 10:35:00.373806
8659	2725	102	4	2026-08-03 10:35:00.397935	2026-08-03 10:35:00.397935
8660	2726	99	2	2026-08-03 10:35:00.42803	2026-08-03 10:35:00.42803
8661	2726	100	3	2026-08-03 10:35:00.454199	2026-08-03 10:35:00.454199
8662	2726	101	4	2026-08-03 10:35:00.479896	2026-08-03 10:35:00.479896
8663	2726	102	5	2026-08-03 10:35:00.501212	2026-08-03 10:35:00.501212
8664	2727	99	3	2026-08-03 10:35:00.532891	2026-08-03 10:35:00.532891
8665	2727	100	4	2026-08-03 10:35:00.558139	2026-08-03 10:35:00.558139
8666	2727	101	5	2026-08-03 10:35:00.585305	2026-08-03 10:35:00.585305
8667	2727	102	1	2026-08-03 10:35:00.606653	2026-08-03 10:35:00.606653
8668	2728	99	2	2026-08-03 10:35:00.667959	2026-08-03 10:35:00.667959
8669	2728	100	3	2026-08-03 10:35:00.711175	2026-08-03 10:35:00.711175
8670	2728	101	4	2026-08-03 10:35:00.736272	2026-08-03 10:35:00.736272
8671	2728	102	5	2026-08-03 10:35:00.758542	2026-08-03 10:35:00.758542
8672	2729	99	3	2026-08-03 10:35:00.782194	2026-08-03 10:35:00.782194
8673	2729	100	4	2026-08-03 10:35:00.800433	2026-08-03 10:35:00.800433
8674	2729	101	5	2026-08-03 10:35:00.819104	2026-08-03 10:35:00.819104
8675	2729	102	1	2026-08-03 10:35:00.837563	2026-08-03 10:35:00.837563
8676	2730	99	5	2026-08-03 10:35:00.870635	2026-08-03 10:35:00.870635
8677	2730	100	1	2026-08-03 10:35:00.890514	2026-08-03 10:35:00.890514
8678	2730	101	2	2026-08-03 10:35:00.908667	2026-08-03 10:35:00.908667
8679	2730	102	3	2026-08-03 10:35:00.928818	2026-08-03 10:35:00.928818
8680	2731	99	3	2026-08-03 10:35:00.98385	2026-08-03 10:35:00.98385
8681	2731	100	4	2026-08-03 10:35:01.011891	2026-08-03 10:35:01.011891
8682	2731	101	5	2026-08-03 10:35:01.030696	2026-08-03 10:35:01.030696
8683	2731	102	1	2026-08-03 10:35:01.051934	2026-08-03 10:35:01.051934
8684	2732	99	5	2026-08-03 10:35:01.079889	2026-08-03 10:35:01.079889
8685	2732	100	1	2026-08-03 10:35:01.097725	2026-08-03 10:35:01.097725
8686	2732	101	2	2026-08-03 10:35:01.114606	2026-08-03 10:35:01.114606
8687	2732	102	3	2026-08-03 10:35:01.130715	2026-08-03 10:35:01.130715
8688	2733	99	1	2026-08-03 10:35:01.153277	2026-08-03 10:35:01.153277
8689	2733	100	2	2026-08-03 10:35:01.171596	2026-08-03 10:35:01.171596
8690	2733	101	3	2026-08-03 10:35:01.190032	2026-08-03 10:35:01.190032
8691	2733	102	4	2026-08-03 10:35:01.207848	2026-08-03 10:35:01.207848
8692	2734	99	5	2026-08-03 10:35:01.258537	2026-08-03 10:35:01.258537
8693	2734	100	1	2026-08-03 10:35:01.285794	2026-08-03 10:35:01.285794
8694	2734	101	2	2026-08-03 10:35:01.305616	2026-08-03 10:35:01.305616
8695	2734	102	3	2026-08-03 10:35:01.324378	2026-08-03 10:35:01.324378
8696	2735	99	1	2026-08-03 10:35:01.351037	2026-08-03 10:35:01.351037
8697	2735	100	2	2026-08-03 10:35:01.370922	2026-08-03 10:35:01.370922
8698	2735	101	3	2026-08-03 10:35:01.389579	2026-08-03 10:35:01.389579
8494	2676	96	2	2026-08-03 10:34:48.944836	2026-08-03 10:34:48.944836
8495	2676	97	3	2026-08-03 10:34:48.967345	2026-08-03 10:34:48.967345
8496	2676	98	4	2026-08-03 10:34:48.983058	2026-08-03 10:34:48.983058
8497	2677	96	3	2026-08-03 10:34:49.008116	2026-08-03 10:34:49.008116
8498	2677	97	4	2026-08-03 10:34:49.027704	2026-08-03 10:34:49.027704
8499	2677	98	5	2026-08-03 10:34:49.043451	2026-08-03 10:34:49.043451
8500	2678	96	2	2026-08-03 10:34:49.0811	2026-08-03 10:34:49.0811
8501	2678	97	3	2026-08-03 10:34:49.103126	2026-08-03 10:34:49.103126
8502	2678	98	4	2026-08-03 10:34:49.118929	2026-08-03 10:34:49.118929
8503	2679	96	3	2026-08-03 10:34:49.146609	2026-08-03 10:34:49.146609
8504	2679	97	4	2026-08-03 10:34:49.16325	2026-08-03 10:34:49.16325
8505	2679	98	5	2026-08-03 10:34:49.180328	2026-08-03 10:34:49.180328
8506	2680	96	3	2026-08-03 10:34:49.208366	2026-08-03 10:34:49.208366
8507	2680	97	4	2026-08-03 10:34:49.230782	2026-08-03 10:34:49.230782
8508	2680	98	5	2026-08-03 10:34:49.246837	2026-08-03 10:34:49.246837
8509	2681	96	5	2026-08-03 10:34:49.270496	2026-08-03 10:34:49.270496
8510	2681	97	1	2026-08-03 10:34:49.288177	2026-08-03 10:34:49.288177
8511	2681	98	2	2026-08-03 10:34:49.304947	2026-08-03 10:34:49.304947
8512	2682	96	5	2026-08-03 10:34:49.333389	2026-08-03 10:34:49.333389
8513	2682	97	1	2026-08-03 10:34:49.357099	2026-08-03 10:34:49.357099
8514	2682	98	2	2026-08-03 10:34:49.376484	2026-08-03 10:34:49.376484
8515	2683	96	1	2026-08-03 10:34:49.40321	2026-08-03 10:34:49.40321
8516	2683	97	2	2026-08-03 10:34:49.423701	2026-08-03 10:34:49.423701
8517	2683	98	3	2026-08-03 10:34:49.444632	2026-08-03 10:34:49.444632
8518	2684	96	5	2026-08-03 10:34:49.476162	2026-08-03 10:34:49.476162
8519	2684	97	1	2026-08-03 10:34:49.497747	2026-08-03 10:34:49.497747
8520	2684	98	2	2026-08-03 10:34:49.513074	2026-08-03 10:34:49.513074
8521	2685	96	1	2026-08-03 10:34:49.537909	2026-08-03 10:34:49.537909
8522	2685	97	2	2026-08-03 10:34:49.561542	2026-08-03 10:34:49.561542
8523	2685	98	3	2026-08-03 10:34:49.578142	2026-08-03 10:34:49.578142
8524	2686	96	1	2026-08-03 10:34:49.601407	2026-08-03 10:34:49.601407
8525	2686	97	2	2026-08-03 10:34:49.619521	2026-08-03 10:34:49.619521
8526	2686	98	3	2026-08-03 10:34:49.633934	2026-08-03 10:34:49.633934
8527	2687	96	3	2026-08-03 10:34:49.658948	2026-08-03 10:34:49.658948
8528	2687	97	4	2026-08-03 10:34:49.675585	2026-08-03 10:34:49.675585
8529	2687	98	5	2026-08-03 10:34:49.695597	2026-08-03 10:34:49.695597
8530	2688	96	3	2026-08-03 10:34:49.720224	2026-08-03 10:34:49.720224
8531	2688	97	4	2026-08-03 10:34:49.73898	2026-08-03 10:34:49.73898
8532	2688	98	5	2026-08-03 10:34:49.752955	2026-08-03 10:34:49.752955
8533	2689	96	4	2026-08-03 10:34:49.774822	2026-08-03 10:34:49.774822
8534	2689	97	5	2026-08-03 10:34:49.790831	2026-08-03 10:34:49.790831
8535	2689	98	1	2026-08-03 10:34:49.805474	2026-08-03 10:34:49.805474
8536	2690	96	3	2026-08-03 10:34:49.830573	2026-08-03 10:34:49.830573
8537	2690	97	4	2026-08-03 10:34:49.850841	2026-08-03 10:34:49.850841
8538	2690	98	5	2026-08-03 10:34:49.866966	2026-08-03 10:34:49.866966
8539	2691	96	4	2026-08-03 10:34:49.890946	2026-08-03 10:34:49.890946
8540	2691	97	5	2026-08-03 10:34:49.909874	2026-08-03 10:34:49.909874
8541	2691	98	1	2026-08-03 10:34:49.932793	2026-08-03 10:34:49.932793
8542	2692	96	4	2026-08-03 10:34:49.964215	2026-08-03 10:34:49.964215
8543	2692	97	5	2026-08-03 10:34:49.985248	2026-08-03 10:34:49.985248
8544	2692	98	1	2026-08-03 10:34:50.002368	2026-08-03 10:34:50.002368
8545	2693	96	1	2026-08-03 10:34:50.033356	2026-08-03 10:34:50.033356
8546	2693	97	2	2026-08-03 10:34:50.05004	2026-08-03 10:34:50.05004
8547	2693	98	3	2026-08-03 10:34:50.067224	2026-08-03 10:34:50.067224
8548	2694	96	1	2026-08-03 10:34:50.09485	2026-08-03 10:34:50.09485
8549	2694	97	2	2026-08-03 10:34:50.117203	2026-08-03 10:34:50.117203
8550	2694	98	3	2026-08-03 10:34:50.133164	2026-08-03 10:34:50.133164
8551	2695	96	2	2026-08-03 10:34:50.156294	2026-08-03 10:34:50.156294
8552	2695	97	3	2026-08-03 10:34:50.171763	2026-08-03 10:34:50.171763
8553	2695	98	4	2026-08-03 10:34:50.186892	2026-08-03 10:34:50.186892
8554	2696	96	1	2026-08-03 10:34:50.214182	2026-08-03 10:34:50.214182
8555	2696	97	2	2026-08-03 10:34:50.236486	2026-08-03 10:34:50.236486
8556	2696	98	3	2026-08-03 10:34:50.252693	2026-08-03 10:34:50.252693
8557	2697	96	2	2026-08-03 10:34:50.274496	2026-08-03 10:34:50.274496
8558	2697	97	3	2026-08-03 10:34:50.289992	2026-08-03 10:34:50.289992
8559	2697	98	4	2026-08-03 10:34:50.306562	2026-08-03 10:34:50.306562
8560	2698	96	2	2026-08-03 10:34:50.333676	2026-08-03 10:34:50.333676
8561	2698	97	3	2026-08-03 10:34:50.355694	2026-08-03 10:34:50.355694
8562	2698	98	4	2026-08-03 10:34:50.372207	2026-08-03 10:34:50.372207
8563	2699	96	4	2026-08-03 10:34:50.395151	2026-08-03 10:34:50.395151
8564	2699	97	5	2026-08-03 10:34:50.410858	2026-08-03 10:34:50.410858
8565	2699	98	1	2026-08-03 10:34:50.427564	2026-08-03 10:34:50.427564
8566	2700	96	4	2026-08-03 10:34:50.460844	2026-08-03 10:34:50.460844
8567	2700	97	5	2026-08-03 10:34:50.484983	2026-08-03 10:34:50.484983
8568	2700	98	1	2026-08-03 10:34:50.500489	2026-08-03 10:34:50.500489
8569	2701	96	5	2026-08-03 10:34:50.522435	2026-08-03 10:34:50.522435
8570	2701	97	1	2026-08-03 10:34:50.541652	2026-08-03 10:34:50.541652
8571	2701	98	2	2026-08-03 10:34:50.558909	2026-08-03 10:34:50.558909
8572	2702	96	4	2026-08-03 10:34:50.586885	2026-08-03 10:34:50.586885
8573	2702	97	5	2026-08-03 10:34:50.609509	2026-08-03 10:34:50.609509
8574	2702	98	1	2026-08-03 10:34:50.62342	2026-08-03 10:34:50.62342
8575	2703	96	5	2026-08-03 10:34:50.647224	2026-08-03 10:34:50.647224
8576	2703	97	1	2026-08-03 10:34:50.667627	2026-08-03 10:34:50.667627
8577	2703	98	2	2026-08-03 10:34:50.683551	2026-08-03 10:34:50.683551
8578	2704	96	5	2026-08-03 10:34:50.709792	2026-08-03 10:34:50.709792
8579	2704	97	1	2026-08-03 10:34:50.737066	2026-08-03 10:34:50.737066
8580	2704	98	2	2026-08-03 10:34:50.757802	2026-08-03 10:34:50.757802
8581	2705	96	2	2026-08-03 10:34:50.785775	2026-08-03 10:34:50.785775
8582	2705	97	3	2026-08-03 10:34:50.802143	2026-08-03 10:34:50.802143
8583	2705	98	4	2026-08-03 10:34:50.817517	2026-08-03 10:34:50.817517
8584	2706	96	3	2026-08-03 10:34:50.846379	2026-08-03 10:34:50.846379
8585	2706	97	4	2026-08-03 10:34:50.868374	2026-08-03 10:34:50.868374
8586	2706	98	5	2026-08-03 10:34:50.885444	2026-08-03 10:34:50.885444
8587	2707	96	5	2026-08-03 10:34:50.916994	2026-08-03 10:34:50.916994
8588	2707	97	1	2026-08-03 10:34:50.948601	2026-08-03 10:34:50.948601
8589	2707	98	2	2026-08-03 10:34:50.971936	2026-08-03 10:34:50.971936
8590	2708	96	5	2026-08-03 10:34:51.010293	2026-08-03 10:34:51.010293
8591	2708	97	1	2026-08-03 10:34:51.039723	2026-08-03 10:34:51.039723
8592	2708	98	2	2026-08-03 10:34:51.06175	2026-08-03 10:34:51.06175
8593	2709	96	1	2026-08-03 10:34:51.089773	2026-08-03 10:34:51.089773
8594	2709	97	2	2026-08-03 10:34:51.112095	2026-08-03 10:34:51.112095
8595	2709	98	3	2026-08-03 10:34:51.128844	2026-08-03 10:34:51.128844
8699	2735	102	4	2026-08-03 10:35:01.410559	2026-08-03 10:35:01.410559
8700	2736	99	2	2026-08-03 10:35:01.445104	2026-08-03 10:35:01.445104
8701	2736	100	3	2026-08-03 10:35:01.465673	2026-08-03 10:35:01.465673
8702	2736	101	4	2026-08-03 10:35:01.484273	2026-08-03 10:35:01.484273
8703	2736	102	5	2026-08-03 10:35:01.502444	2026-08-03 10:35:01.502444
8704	2737	99	5	2026-08-03 10:35:01.547143	2026-08-03 10:35:01.547143
8705	2737	100	1	2026-08-03 10:35:01.570947	2026-08-03 10:35:01.570947
8706	2737	101	2	2026-08-03 10:35:01.590603	2026-08-03 10:35:01.590603
8707	2737	102	3	2026-08-03 10:35:01.6101	2026-08-03 10:35:01.6101
8708	2738	99	1	2026-08-03 10:35:01.637053	2026-08-03 10:35:01.637053
8709	2738	100	2	2026-08-03 10:35:01.655747	2026-08-03 10:35:01.655747
8710	2738	101	3	2026-08-03 10:35:01.686834	2026-08-03 10:35:01.686834
8711	2738	102	4	2026-08-03 10:35:01.714033	2026-08-03 10:35:01.714033
8712	2739	99	2	2026-08-03 10:35:01.744975	2026-08-03 10:35:01.744975
8713	2739	100	3	2026-08-03 10:35:01.76621	2026-08-03 10:35:01.76621
8714	2739	101	4	2026-08-03 10:35:01.786067	2026-08-03 10:35:01.786067
8715	2739	102	5	2026-08-03 10:35:01.804292	2026-08-03 10:35:01.804292
8716	2740	99	1	2026-08-03 10:35:01.848504	2026-08-03 10:35:01.848504
8717	2740	100	2	2026-08-03 10:35:01.876727	2026-08-03 10:35:01.876727
8718	2740	101	3	2026-08-03 10:35:01.897379	2026-08-03 10:35:01.897379
8719	2740	102	4	2026-08-03 10:35:01.916815	2026-08-03 10:35:01.916815
8720	2741	99	2	2026-08-03 10:35:01.948286	2026-08-03 10:35:01.948286
8721	2741	100	3	2026-08-03 10:35:01.96878	2026-08-03 10:35:01.96878
8722	2741	101	4	2026-08-03 10:35:01.98713	2026-08-03 10:35:01.98713
8723	2741	102	5	2026-08-03 10:35:02.005503	2026-08-03 10:35:02.005503
8724	2742	99	4	2026-08-03 10:35:02.030347	2026-08-03 10:35:02.030347
8725	2742	100	5	2026-08-03 10:35:02.055386	2026-08-03 10:35:02.055386
8726	2742	101	1	2026-08-03 10:35:02.089214	2026-08-03 10:35:02.089214
8727	2742	102	2	2026-08-03 10:35:02.117056	2026-08-03 10:35:02.117056
8728	2743	99	2	2026-08-03 10:35:02.163099	2026-08-03 10:35:02.163099
8729	2743	100	3	2026-08-03 10:35:02.189792	2026-08-03 10:35:02.189792
8730	2743	101	4	2026-08-03 10:35:02.214699	2026-08-03 10:35:02.214699
8731	2743	102	5	2026-08-03 10:35:02.239088	2026-08-03 10:35:02.239088
8732	2744	99	4	2026-08-03 10:35:02.276321	2026-08-03 10:35:02.276321
8733	2744	100	5	2026-08-03 10:35:02.314428	2026-08-03 10:35:02.314428
8734	2744	101	1	2026-08-03 10:35:02.352257	2026-08-03 10:35:02.352257
8735	2744	102	2	2026-08-03 10:35:02.383989	2026-08-03 10:35:02.383989
8736	2745	99	5	2026-08-03 10:35:02.43774	2026-08-03 10:35:02.43774
8737	2745	100	1	2026-08-03 10:35:02.463409	2026-08-03 10:35:02.463409
8738	2745	101	2	2026-08-03 10:35:02.484604	2026-08-03 10:35:02.484604
8739	2745	102	3	2026-08-03 10:35:02.506085	2026-08-03 10:35:02.506085
8740	2746	99	4	2026-08-03 10:35:02.562922	2026-08-03 10:35:02.562922
8741	2746	100	5	2026-08-03 10:35:02.59031	2026-08-03 10:35:02.59031
8742	2746	101	1	2026-08-03 10:35:02.609363	2026-08-03 10:35:02.609363
8743	2746	102	2	2026-08-03 10:35:02.633519	2026-08-03 10:35:02.633519
8744	2747	99	5	2026-08-03 10:35:02.664388	2026-08-03 10:35:02.664388
8745	2747	100	1	2026-08-03 10:35:02.690283	2026-08-03 10:35:02.690283
8746	2747	101	2	2026-08-03 10:35:02.712734	2026-08-03 10:35:02.712734
8747	2747	102	3	2026-08-03 10:35:02.731911	2026-08-03 10:35:02.731911
8748	2748	99	1	2026-08-03 10:35:02.75921	2026-08-03 10:35:02.75921
8749	2748	100	2	2026-08-03 10:35:02.778546	2026-08-03 10:35:02.778546
8750	2748	101	3	2026-08-03 10:35:02.796887	2026-08-03 10:35:02.796887
8751	2748	102	4	2026-08-03 10:35:02.814633	2026-08-03 10:35:02.814633
8752	2749	99	4	2026-08-03 10:35:02.858499	2026-08-03 10:35:02.858499
8753	2749	100	5	2026-08-03 10:35:02.884701	2026-08-03 10:35:02.884701
8754	2749	101	1	2026-08-03 10:35:02.903209	2026-08-03 10:35:02.903209
8755	2749	102	2	2026-08-03 10:35:02.921115	2026-08-03 10:35:02.921115
8756	2750	99	5	2026-08-03 10:35:02.947247	2026-08-03 10:35:02.947247
8757	2750	100	1	2026-08-03 10:35:02.969822	2026-08-03 10:35:02.969822
8758	2750	101	2	2026-08-03 10:35:02.993175	2026-08-03 10:35:02.993175
8759	2750	102	3	2026-08-03 10:35:03.015326	2026-08-03 10:35:03.015326
8760	2751	99	1	2026-08-03 10:35:03.051973	2026-08-03 10:35:03.051973
8761	2751	100	2	2026-08-03 10:35:03.072695	2026-08-03 10:35:03.072695
8762	2751	101	3	2026-08-03 10:35:03.094303	2026-08-03 10:35:03.094303
8763	2751	102	4	2026-08-03 10:35:03.113774	2026-08-03 10:35:03.113774
8764	2752	99	5	2026-08-03 10:35:03.157101	2026-08-03 10:35:03.157101
8765	2752	100	1	2026-08-03 10:35:03.185815	2026-08-03 10:35:03.185815
8766	2752	101	2	2026-08-03 10:35:03.204681	2026-08-03 10:35:03.204681
8767	2752	102	3	2026-08-03 10:35:03.224313	2026-08-03 10:35:03.224313
8768	2753	99	1	2026-08-03 10:35:03.256543	2026-08-03 10:35:03.256543
8769	2753	100	2	2026-08-03 10:35:03.277391	2026-08-03 10:35:03.277391
8770	2753	101	3	2026-08-03 10:35:03.298276	2026-08-03 10:35:03.298276
8771	2753	102	4	2026-08-03 10:35:03.322129	2026-08-03 10:35:03.322129
8772	2754	99	3	2026-08-03 10:35:03.351029	2026-08-03 10:35:03.351029
8773	2754	100	4	2026-08-03 10:35:03.371273	2026-08-03 10:35:03.371273
8774	2754	101	5	2026-08-03 10:35:03.390625	2026-08-03 10:35:03.390625
8775	2754	102	1	2026-08-03 10:35:03.40979	2026-08-03 10:35:03.40979
8776	2755	99	1	2026-08-03 10:35:03.453595	2026-08-03 10:35:03.453595
8777	2755	100	2	2026-08-03 10:35:03.481129	2026-08-03 10:35:03.481129
8778	2755	101	3	2026-08-03 10:35:03.514809	2026-08-03 10:35:03.514809
8779	2755	102	4	2026-08-03 10:35:03.545568	2026-08-03 10:35:03.545568
8780	2756	99	3	2026-08-03 10:35:03.588385	2026-08-03 10:35:03.588385
8781	2756	100	4	2026-08-03 10:35:03.608948	2026-08-03 10:35:03.608948
8782	2756	101	5	2026-08-03 10:35:03.629044	2026-08-03 10:35:03.629044
8783	2756	102	1	2026-08-03 10:35:03.65254	2026-08-03 10:35:03.65254
8784	2757	99	4	2026-08-03 10:35:03.705665	2026-08-03 10:35:03.705665
8785	2757	100	5	2026-08-03 10:35:03.739478	2026-08-03 10:35:03.739478
8786	2757	101	1	2026-08-03 10:35:03.774727	2026-08-03 10:35:03.774727
8787	2757	102	2	2026-08-03 10:35:03.812018	2026-08-03 10:35:03.812018
8788	2758	99	3	2026-08-03 10:35:03.864415	2026-08-03 10:35:03.864415
8789	2758	100	4	2026-08-03 10:35:03.892453	2026-08-03 10:35:03.892453
8790	2758	101	5	2026-08-03 10:35:03.913706	2026-08-03 10:35:03.913706
8791	2758	102	1	2026-08-03 10:35:03.934656	2026-08-03 10:35:03.934656
8792	2759	99	4	2026-08-03 10:35:03.959192	2026-08-03 10:35:03.959192
8793	2759	100	5	2026-08-03 10:35:03.978424	2026-08-03 10:35:03.978424
8794	2759	101	1	2026-08-03 10:35:03.998653	2026-08-03 10:35:03.998653
8795	2759	102	2	2026-08-03 10:35:04.030416	2026-08-03 10:35:04.030416
8796	2760	99	5	2026-08-03 10:35:04.061412	2026-08-03 10:35:04.061412
8797	2760	100	1	2026-08-03 10:35:04.082551	2026-08-03 10:35:04.082551
8798	2760	101	2	2026-08-03 10:35:04.103366	2026-08-03 10:35:04.103366
9548	3008	99	2	2026-08-03 10:35:45.108139	2026-08-03 10:35:45.108139
9549	3008	100	3	2026-08-03 10:35:45.191163	2026-08-03 10:35:45.191163
9550	3008	101	4	2026-08-03 10:35:45.242823	2026-08-03 10:35:45.242823
9551	3008	102	5	2026-08-03 10:35:45.337181	2026-08-03 10:35:45.337181
9552	3009	99	1	2026-08-03 10:35:45.692495	2026-08-03 10:35:45.692495
9553	3009	100	2	2026-08-03 10:35:45.826011	2026-08-03 10:35:45.826011
9554	3009	101	3	2026-08-03 10:35:45.964031	2026-08-03 10:35:45.964031
9555	3009	102	4	2026-08-03 10:35:46.031392	2026-08-03 10:35:46.031392
9556	3010	99	2	2026-08-03 10:35:46.145378	2026-08-03 10:35:46.145378
9557	3010	100	3	2026-08-03 10:35:46.277369	2026-08-03 10:35:46.277369
9558	3010	101	4	2026-08-03 10:35:46.414657	2026-08-03 10:35:46.414657
9559	3010	102	5	2026-08-03 10:35:46.559076	2026-08-03 10:35:46.559076
9560	3011	99	3	2026-08-03 10:35:46.687006	2026-08-03 10:35:46.687006
9561	3011	100	4	2026-08-03 10:35:46.792594	2026-08-03 10:35:46.792594
9562	3011	101	5	2026-08-03 10:35:46.910461	2026-08-03 10:35:46.910461
9563	3011	102	1	2026-08-03 10:35:47.003562	2026-08-03 10:35:47.003562
9564	3012	99	1	2026-08-03 10:35:47.104183	2026-08-03 10:35:47.104183
9565	3012	100	2	2026-08-03 10:35:47.235872	2026-08-03 10:35:47.235872
9566	3012	101	3	2026-08-03 10:35:47.322629	2026-08-03 10:35:47.322629
9567	3012	102	4	2026-08-03 10:35:47.396983	2026-08-03 10:35:47.396983
9568	3013	99	2	2026-08-03 10:35:47.656888	2026-08-03 10:35:47.656888
9569	3013	100	3	2026-08-03 10:35:47.744729	2026-08-03 10:35:47.744729
9570	3013	101	4	2026-08-03 10:35:47.807613	2026-08-03 10:35:47.807613
9571	3013	102	5	2026-08-03 10:35:47.909305	2026-08-03 10:35:47.909305
9572	3014	99	3	2026-08-03 10:35:47.977179	2026-08-03 10:35:47.977179
9573	3014	100	4	2026-08-03 10:35:48.06213	2026-08-03 10:35:48.06213
9574	3014	101	5	2026-08-03 10:35:48.153365	2026-08-03 10:35:48.153365
9575	3014	102	1	2026-08-03 10:35:48.215958	2026-08-03 10:35:48.215958
9576	3015	99	4	2026-08-03 10:35:48.358718	2026-08-03 10:35:48.358718
9577	3015	100	5	2026-08-03 10:35:48.492254	2026-08-03 10:35:48.492254
9578	3015	101	1	2026-08-03 10:35:48.57409	2026-08-03 10:35:48.57409
9579	3015	102	2	2026-08-03 10:35:48.642414	2026-08-03 10:35:48.642414
9580	3016	99	2	2026-08-03 10:35:48.757141	2026-08-03 10:35:48.757141
9581	3016	100	3	2026-08-03 10:35:48.819319	2026-08-03 10:35:48.819319
9582	3016	101	4	2026-08-03 10:35:48.8886	2026-08-03 10:35:48.8886
9583	3016	102	5	2026-08-03 10:35:48.989376	2026-08-03 10:35:48.989376
9584	3017	99	3	2026-08-03 10:35:49.2942	2026-08-03 10:35:49.2942
9585	3017	100	4	2026-08-03 10:35:49.348432	2026-08-03 10:35:49.348432
9586	3017	101	5	2026-08-03 10:35:49.416234	2026-08-03 10:35:49.416234
9587	3017	102	1	2026-08-03 10:35:49.500525	2026-08-03 10:35:49.500525
9588	3018	99	4	2026-08-03 10:35:49.579422	2026-08-03 10:35:49.579422
9589	3018	100	5	2026-08-03 10:35:49.629074	2026-08-03 10:35:49.629074
9590	3018	101	1	2026-08-03 10:35:49.686038	2026-08-03 10:35:49.686038
9591	3018	102	2	2026-08-03 10:35:49.733686	2026-08-03 10:35:49.733686
9592	3019	99	5	2026-08-03 10:35:49.850492	2026-08-03 10:35:49.850492
9593	3019	100	1	2026-08-03 10:35:49.983155	2026-08-03 10:35:49.983155
9594	3019	101	2	2026-08-03 10:35:50.092134	2026-08-03 10:35:50.092134
9595	3019	102	3	2026-08-03 10:35:50.192368	2026-08-03 10:35:50.192368
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rooms (id, conference_id, name, size, created_at, updated_at, rank) FROM stdin;
132	43	Main Hall	500	2026-08-03 10:34:47.500266	2026-08-03 10:34:47.500266	1
133	43	Room B	150	2026-08-03 10:34:47.502102	2026-08-03 10:34:47.502102	2
134	43	Workshop Lab	40	2026-08-03 10:34:47.503505	2026-08-03 10:34:47.503505	3
135	43	Lightning Stage	80	2026-08-03 10:34:47.504725	2026-08-03 10:34:47.504725	4
136	44	Ruby Room	60	2026-08-03 10:34:51.852539	2026-08-03 10:34:51.852539	1
137	45	Main Hall	400	2026-08-03 10:34:52.148621	2026-08-03 10:34:52.148621	1
138	45	Room B	120	2026-08-03 10:34:52.150053	2026-08-03 10:34:52.150053	2
140	45	Lightning Stage	80	2026-08-03 10:34:52.152618	2026-08-03 10:34:52.152618	4
139	45	Workshop Lab	45	2026-08-03 10:34:52.151321	2026-08-03 10:35:59.996436	3
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
179	43	Backend	2026-08-03 10:34:47.509276	2026-08-03 10:34:47.509276	4a90d9
180	43	Frontend	2026-08-03 10:34:47.512351	2026-08-03 10:34:47.512351	7ed321
181	43	DevOps	2026-08-03 10:34:47.516152	2026-08-03 10:34:47.516152	f5a623
182	43	Security	2026-08-03 10:34:47.519657	2026-08-03 10:34:47.519657	d0021b
183	43	Community	2026-08-03 10:34:47.522789	2026-08-03 10:34:47.522789	9013fe
184	44	Ruby	2026-08-03 10:34:51.854979	2026-08-03 10:34:51.854979	d0021b
185	45	Keynotes	2026-08-03 10:34:52.154885	2026-08-03 10:34:52.154885	111111
186	45	Backend	2026-08-03 10:34:52.156932	2026-08-03 10:34:52.156932	4a90d9
187	45	Frontend	2026-08-03 10:34:52.158883	2026-08-03 10:34:52.158883	7ed321
188	45	DevOps	2026-08-03 10:34:52.16105	2026-08-03 10:34:52.16105	f5a623
189	45	Security	2026-08-03 10:34:52.163115	2026-08-03 10:34:52.163115	d0021b
190	45	Data & AI	2026-08-03 10:34:52.165056	2026-08-03 10:34:52.165056	9013fe
191	45	Community	2026-08-03 10:34:52.166624	2026-08-03 10:34:52.166624	50e3c2
\.


--
-- Data for Name: transport_needs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_needs (id, person_id, conference_id, at, transport_type, seats, booked, note, created_at, updated_at) FROM stdin;
231	360	43	2026-08-24 05:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:34:51.827233	2026-08-03 10:34:51.827233
232	361	43	2026-08-24 05:00:00	plane	1	f	Arrives the evening before.	2026-08-03 10:34:51.831423	2026-08-03 10:34:51.831423
233	362	43	2026-08-24 05:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:34:51.83552	2026-08-03 10:34:51.83552
234	363	43	2026-08-24 05:00:00	train	1	f	Arrives the evening before.	2026-08-03 10:34:51.839064	2026-08-03 10:34:51.839064
235	364	43	2026-08-24 05:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:34:51.842196	2026-08-03 10:34:51.842196
236	376	45	2026-08-02 07:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:35:51.677806	2026-08-03 10:35:51.677806
237	377	45	2026-08-02 06:00:00	plane	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.682329	2026-08-03 10:35:51.682329
238	363	45	2026-08-02 04:00:00	bus	1	t	Arrives the evening before.	2026-08-03 10:35:51.686335	2026-08-03 10:35:51.686335
239	370	45	2026-08-02 03:00:00	train	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.690129	2026-08-03 10:35:51.690129
240	361	45	2026-08-02 06:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:35:51.693407	2026-08-03 10:35:51.693407
241	368	45	2026-08-02 05:00:00	bus	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.696256	2026-08-03 10:35:51.696256
242	364	45	2026-08-02 03:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:35:51.698776	2026-08-03 10:35:51.698776
243	365	45	2026-08-02 07:00:00	car	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.701277	2026-08-03 10:35:51.701277
244	373	45	2026-08-02 05:00:00	train	1	t	Arrives the evening before.	2026-08-03 10:35:51.704839	2026-08-03 10:35:51.704839
245	367	45	2026-08-02 04:00:00	plane	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.7088	2026-08-03 10:35:51.7088
246	371	45	2026-08-02 07:00:00	bus	1	t	Arrives the evening before.	2026-08-03 10:35:51.712556	2026-08-03 10:35:51.712556
247	372	45	2026-08-02 06:00:00	train	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.715531	2026-08-03 10:35:51.715531
248	375	45	2026-08-02 04:00:00	car	1	t	Arrives the evening before.	2026-08-03 10:35:51.718194	2026-08-03 10:35:51.718194
249	379	45	2026-08-02 03:00:00	bus	1	f	Needs a pickup at the station.	2026-08-03 10:35:51.720722	2026-08-03 10:35:51.720722
250	381	45	2026-08-02 06:00:00	plane	1	t	Arrives the evening before.	2026-08-03 10:35:51.724414	2026-08-03 10:35:51.724414
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
364	speaker5@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:44.918587	\N	2026-08-03 10:34:44.923118	2026-08-03 10:34:44.923118	submitter	$2a$11$S7OBi6GFW381GCQX7i715Om7w5lf1xZ8jskI7gCrqYai803K/e.2q	\N	\N	0	\N	\N	\N	\N	t
365	speaker6@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.067467	\N	2026-08-03 10:34:45.07126	2026-08-03 10:34:45.07126	submitter	$2a$11$JCMX5pyxkXzfAPoODVI6Eu2vVEUukw/PmdlOQU6zKvVdImo2h5vZG	\N	\N	0	\N	\N	\N	\N	t
1	admin@example.org	\N	\N	\N	1	2026-08-03 07:40:26.858628	2026-08-03 07:40:26.858628	127.0.0.1	127.0.0.1	\N	2026-07-30 08:01:41.657703	\N	2026-07-30 08:01:41.669081	2026-08-03 07:40:26.859051	admin	$2a$11$vcpqe6RYd95ihK1cZdLBR.LEuRHVKHDsqy7DBJmjfR31Xo0o1RJR.	\N	\N	2	\N	\N	\N	\N	t
366	speaker7@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.20887	\N	2026-08-03 10:34:45.212044	2026-08-03 10:34:45.212044	submitter	$2a$11$Css1u/YDxlTmzHTLXTDCa.VeXFM8dSiCcTUHW7zVVGIj/pe91qBXy	\N	\N	0	\N	\N	\N	\N	t
367	speaker8@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.35015	\N	2026-08-03 10:34:45.353389	2026-08-03 10:34:45.353389	submitter	$2a$11$y4xzF6qYy7afRyRO9XReU.P7dnSke9NviLjmb4.0ZN00dLdI7yfmK	\N	\N	0	\N	\N	\N	\N	t
357	coordinator@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:43.83675	\N	2026-08-03 10:34:43.842124	2026-08-03 10:34:43.842124	crew	$2a$11$.XMNtXIr.ygYCF7jxAP8Reo88BoOdQnvfVVeSyjDd0wlqNZDXXhHy	\N	\N	0	\N	\N	\N	\N	t
359	reviewer2@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:44.14718	\N	2026-08-03 10:34:44.150284	2026-08-03 10:34:44.150284	crew	$2a$11$umpM5gTQjEoKMNm76/cat.byr6.Yd0uji5fS3qepXIHuxVOUIxl7C	\N	\N	0	\N	\N	\N	\N	t
360	speaker1@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:44.298987	\N	2026-08-03 10:34:44.304192	2026-08-03 10:34:44.304192	submitter	$2a$11$Rwct6m8UDk1dOehJoEs.c..XgWmr08e.U7YuaqISi2y3gyxayTu42	\N	\N	0	\N	\N	\N	\N	t
362	speaker3@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:44.603618	\N	2026-08-03 10:34:44.608039	2026-08-03 10:34:44.608039	submitter	$2a$11$Sojx4Ry1NB7x5gvRK7fkiO7SDHjLIh.iWrybqlWgKPgL5rege9xqK	\N	\N	0	\N	\N	\N	\N	t
363	speaker4@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:44.763833	\N	2026-08-03 10:34:44.770025	2026-08-03 10:34:44.770025	submitter	$2a$11$IlNXGn6vJuL2tS/NeVKiw.W39PkrMMxoVUsYKKJqCt1vC6kD7wrMu	\N	\N	0	\N	\N	\N	\N	t
368	speaker9@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.493162	\N	2026-08-03 10:34:45.496441	2026-08-03 10:34:45.496441	submitter	$2a$11$rBJqkfwNi2YyN7lXX0TMAOPfQGpwXUf0achcPsN4Cq4Ld5Kcw0ohS	\N	\N	0	\N	\N	\N	\N	t
369	speaker10@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.6353	\N	2026-08-03 10:34:45.638723	2026-08-03 10:34:45.638723	submitter	$2a$11$OZ1uu/Z.lxN7zttwH8kvSOb5GH95T4w7md3.pWSTDNaV/yvBFXACe	\N	\N	0	\N	\N	\N	\N	t
370	speaker11@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.780036	\N	2026-08-03 10:34:45.785123	2026-08-03 10:34:45.785123	submitter	$2a$11$yf8l/yV45kiEtAOQIDMOl.3PowFJGscm1R182/EvNlEmxkba8WrmC	\N	\N	0	\N	\N	\N	\N	t
371	speaker12@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:45.936856	\N	2026-08-03 10:34:45.940212	2026-08-03 10:34:45.940212	submitter	$2a$11$1e8sJc2AQyyXhYRZXSPaoOZFU9hqD6C5Ozuy2KoKDzV4UOPXkQzne	\N	\N	0	\N	\N	\N	\N	t
372	speaker13@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.083606	\N	2026-08-03 10:34:46.087489	2026-08-03 10:34:46.087489	submitter	$2a$11$ddPlCdb0S4JA.JyD2AA7TOPikAdu.bTQLDy9gDRrT19j7gSJwCU/q	\N	\N	0	\N	\N	\N	\N	t
373	speaker14@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.232728	\N	2026-08-03 10:34:46.238073	2026-08-03 10:34:46.238073	submitter	$2a$11$8cGIDIRe/K6v4Li2zqAhQ.j25wBnqpZp4wMpB/RPQNuSHlkOAHnEW	\N	\N	0	\N	\N	\N	\N	t
374	speaker15@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.383768	\N	2026-08-03 10:34:46.387848	2026-08-03 10:34:46.387848	submitter	$2a$11$wK4meRiDKXriMtFRbRcvwuwZ.k45KQvoYCqGuHInG/trEjkJmwQ5.	\N	\N	0	\N	\N	\N	\N	t
375	speaker16@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.530354	\N	2026-08-03 10:34:46.534574	2026-08-03 10:34:46.534574	submitter	$2a$11$WovE9z/gY9O3JgCAhnGZ4.5K4kP4e8e6e.oaY6WOdCYRFjHrg5wtS	\N	\N	0	\N	\N	\N	\N	t
376	speaker17@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.681094	\N	2026-08-03 10:34:46.686774	2026-08-03 10:34:46.686774	submitter	$2a$11$3Ur1ZxXBewgqiiWOkdcTzuzDPIHlF2HPCGMqOqM/nMi2LrxaE4txm	\N	\N	0	\N	\N	\N	\N	t
377	speaker18@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:46.844932	\N	2026-08-03 10:34:46.850369	2026-08-03 10:34:46.850369	submitter	$2a$11$bvnvxAo0h.iUSJ4JMAa3ee5ESNST.krkzZrlOs7p504cSTu8hllb6	\N	\N	0	\N	\N	\N	\N	t
378	speaker19@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:47.001219	\N	2026-08-03 10:34:47.004411	2026-08-03 10:34:47.004411	submitter	$2a$11$ZuLOtyM4jqOmITbUgJ2JIuyKiqM8eH/M.uEajsFW8fK.NWXPMjDyu	\N	\N	0	\N	\N	\N	\N	t
379	speaker20@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:47.151716	\N	2026-08-03 10:34:47.155793	2026-08-03 10:34:47.155793	submitter	$2a$11$RhSro7voGLzaZXUJKDsMBe1KnhYz3rMlHbYYAoLlp1pqqiSyQ.aRy	\N	\N	0	\N	\N	\N	\N	t
380	speaker21@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:47.304948	\N	2026-08-03 10:34:47.309718	2026-08-03 10:34:47.309718	submitter	$2a$11$sTKas35AIkYZXInH1FLXbe/y61TRe1CyVHps5xHEaoSE8x6xYz4BG	\N	\N	0	\N	\N	\N	\N	t
381	speaker22@example.org	\N	\N	\N	0	\N	\N	\N	\N	\N	2026-08-03 10:34:47.458954	\N	2026-08-03 10:34:47.463523	2026-08-03 10:34:47.463523	submitter	$2a$11$O14ZPKkBQlhISuDzx43x9O3oY3DuOA8fXCmAhbFqceHu7ec0f09GW	\N	\N	0	\N	\N	\N	\N	t
361	speaker2@example.org	\N	\N	\N	1	2026-08-03 10:39:01.1803	2026-08-03 10:39:01.1803	127.0.0.1	127.0.0.1	\N	2026-08-03 10:34:44.450872	\N	2026-08-03 10:34:44.454843	2026-08-03 10:39:01.180538	submitter	$2a$11$8794hMQHAqiUogL8Tr4hmO3pGkK0URw/p/QFz7HvNjPHI0i3jQ/uO	\N	\N	0	\N	\N	\N	\N	t
356	orga@example.org	\N	\N	\N	2	2026-08-03 10:39:09.946109	2026-08-03 10:38:31.27761	127.0.0.1	127.0.0.1	\N	2026-08-03 10:34:43.669551	\N	2026-08-03 10:34:43.681281	2026-08-03 10:39:09.946458	crew	$2a$11$h0cLVG6sMTPqCoSObyR/y.eKsPFVRva3Ci9ILc.qqjFLzoG9zrKUe	\N	\N	0	\N	\N	\N	\N	t
358	reviewer@example.org	\N	\N	\N	1	2026-08-03 10:40:55.550081	2026-08-03 10:40:55.550081	127.0.0.1	127.0.0.1	\N	2026-08-03 10:34:43.997197	\N	2026-08-03 10:34:44.001149	2026-08-03 10:40:55.550356	crew	$2a$11$fT1MZllxCc/WaUMEiON/FubnAaoiUe5T8uS.3NGWz.G33tSU9EKB.	\N	\N	0	\N	\N	\N	\N	t
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
18	Room	139	update	356	---\nconference_id: 45\nsize: 40\nid: 139\nname: Workshop Lab\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:34:52.151321000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:34:52.151321000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:34:52.151321000 Z\n  zone: *1\n  time: 2026-08-03 10:34:52.151321000 Z\nrank: 3\n	2026-08-03 10:35:59.996436	45	45	Conference	---\nsize:\n- 40\n- 45\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:34:52.151321000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:34:52.151321000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:59.996436670 Z\n  zone: *1\n  time: 2026-08-03 10:35:59.996436670 Z\n
13	Event	1013	update	331	---\nconference_id: 42\nid: 1013\ntitle: WebAssembly for backend developers\nsubtitle: A tour without the buzzwords\nevent_type: lecture\ntime_slots: 4\nstate: review\nlanguage: en\nstart_time: \nabstract: WebAssembly for backend developers. A tour without the buzzwords. This abstract\n  is demo content generated by demo:seed.\ndescription: |-\n  A longer description for "WebAssembly for backend developers".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-16 10:07:52.810520000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-16 10:07:52.810520000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:29.421816000 Z\n  zone: *1\n  time: 2026-08-03 10:08:29.421816000 Z\naverage_rating: \nevent_ratings_count: 2\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: 784b7907-70c1-40a3-b3a5-4999a96c4d72\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: a7vuMvqzSed3zQBKAXWu7wHj\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.127504	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:29.421816000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:29.421816000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.127504732 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.127504732 Z\nsubmission_note:\n- \n- Asked the speaker for a longer abstract.\n
14	Event	1009	update	332	---\nconference_id: 42\nid: 1009\ntitle: Event sourcing, one year later\nsubtitle: Would we do it again?\nevent_type: lecture\ntime_slots: 4\nstate: unconfirmed\nlanguage: en\nstart_time: \nabstract: Event sourcing, one year later. Would we do it again?. This abstract is\n  demo content generated by demo:seed.\ndescription: |-\n  A longer description for "Event sourcing, one year later".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-12 10:07:52.459365000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-12 10:07:52.459365000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:28.227023000 Z\n  zone: *1\n  time: 2026-08-03 10:08:28.227023000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: b016e61d-8137-4666-b39d-3c56e810b3e7\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: JRavSnYPNtutnkagpJrfDeXq\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.155648	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:28.227023000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:28.227023000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.155648745 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.155648745 Z\nnote:\n- \n- Reminder sent, waiting for confirmation.\n
15	Event	990	update	331	---\nconference_id: 42\nid: 990\ntitle: From monolith to modules\nsubtitle: Without a big bang rewrite\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: From monolith to modules. Without a big bang rewrite. This abstract is demo\n  content generated by demo:seed.\ndescription: |-\n  A longer description for "From monolith to modules".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 173\nroom_id: 130\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-23 10:07:50.284434000 Z\n  zone: *1\n  time: 2026-04-23 10:07:50.284434000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:36.279192000 Z\n  zone: *1\n  time: 2026-08-03 10:08:36.279192000 Z\naverage_rating: 3.75\nevent_ratings_count: 4\nnote: \nsubmission_note: Prefers a morning slot.\nspeaker_count: 1\nevent_feedbacks_count: 6\naverage_feedback: 5.0\nguid: 589ca6df-1a57-40e3-8bcd-cc7e712807b2\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: Lnf5VUReCUM3NmHz7qpA9gZ6\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:08:42.195671	42	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:36.279192000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:08:36.279192000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:08:42.195671289 Z\n  zone: *1\n  time: 2026-08-03 10:08:42.195671289 Z\ntech_rider:\n- \n- Needs a second screen for the notes view.\n
16	Event	1087	update	356	---\nconference_id: 45\nid: 1087\ntitle: 'Opening keynote: ten years of frab'\nsubtitle: What we learned running conferences\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: 'Opening keynote: ten years of frab. What we learned running conferences.\n  This abstract is demo content generated by demo:seed.'\ndescription: |-\n  A longer description for "Opening keynote: ten years of frab".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 185\nroom_id: 137\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-21 10:34:52.217114000 Z\n  zone: *1\n  time: 2026-04-21 10:34:52.217114000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:54.928437000 Z\n  zone: *1\n  time: 2026-08-03 10:35:54.928437000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 4\naverage_feedback: 3.0\nguid: 846cd117-ebc0-4da6-96f3-d48fdf6a2fb2\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: Wireless handheld microphone, HDMI, clicker.\ninvite_token: kpQULDsjqfLDjRjopH9zpNok\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:35:59.912343	45	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:54.928437000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:35:54.928437000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:59.912343319 Z\n  zone: *1\n  time: 2026-08-03 10:35:59.912343319 Z\nnote:\n- \n- Confirmed by phone, speaker will bring their own laptop.\n
17	Event	1088	update	357	---\nconference_id: 45\nid: 1088\ntitle: Refactoring legacy Rails\nsubtitle: A field guide\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: Refactoring legacy Rails. A field guide. This abstract is demo content generated\n  by demo:seed.\ndescription: |-\n  A longer description for "Refactoring legacy Rails".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 186\nroom_id: 138\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-22 10:34:52.325601000 Z\n  zone: *1\n  time: 2026-04-22 10:34:52.325601000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:55.015063000 Z\n  zone: *1\n  time: 2026-08-03 10:35:55.015063000 Z\naverage_rating: 3.125\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 2\nevent_feedbacks_count: 5\naverage_feedback: 4.0\nguid: 1c6faea5-e30e-4681-89da-dd8f1ba1fa8e\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: uVo6YyDKkG3BXUPZ4qxcy7bC\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:35:59.948307	45	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:55.015063000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:35:55.015063000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:59.948307172 Z\n  zone: *1\n  time: 2026-08-03 10:35:59.948307172 Z\ndo_not_record:\n- false\n- true\n
19	Event	1112	update	357	---\nconference_id: 45\nid: 1112\ntitle: WebAssembly for backend developers\nsubtitle: A tour without the buzzwords\nevent_type: lecture\ntime_slots: 4\nstate: review\nlanguage: en\nstart_time: \nabstract: WebAssembly for backend developers. A tour without the buzzwords. This abstract\n  is demo content generated by demo:seed.\ndescription: |-\n  A longer description for "WebAssembly for backend developers".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 186\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-16 10:34:54.994469000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-16 10:34:54.994469000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:33.599972000 Z\n  zone: *1\n  time: 2026-08-03 10:35:33.599972000 Z\naverage_rating: \nevent_ratings_count: 2\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: e314b15c-3e3a-4ad6-a486-2955dd85a62a\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: xwridHci6hpg4MTFnmKhM696\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:36:00.005244	45	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:33.599972000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:35:33.599972000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:36:00.005244812 Z\n  zone: *1\n  time: 2026-08-03 10:36:00.005244812 Z\nsubmission_note:\n- \n- Asked the speaker for a longer abstract.\n
20	Event	1108	update	358	---\nconference_id: 45\nid: 1108\ntitle: Event sourcing, one year later\nsubtitle: Would we do it again?\nevent_type: lecture\ntime_slots: 4\nstate: unconfirmed\nlanguage: en\nstart_time: \nabstract: Event sourcing, one year later. Would we do it again?. This abstract is\n  demo content generated by demo:seed.\ndescription: |-\n  A longer description for "Event sourcing, one year later".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 186\nroom_id: \ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-05-12 10:34:54.555068000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-05-12 10:34:54.555068000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:31.777841000 Z\n  zone: *1\n  time: 2026-08-03 10:35:31.777841000 Z\naverage_rating: 3.0\nevent_ratings_count: 4\nnote: \nsubmission_note: \nspeaker_count: 1\nevent_feedbacks_count: 0\naverage_feedback: \nguid: '09c5bdd0-71a8-4f57-99f8-45223425dd56'\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: hzLM1oJ8nQW7N4kWTxCfMpht\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:36:00.016252	45	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:31.777841000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:35:31.777841000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:36:00.016252154 Z\n  zone: *1\n  time: 2026-08-03 10:36:00.016252154 Z\nnote:\n- \n- Reminder sent, waiting for confirmation.\n
21	Event	1089	update	357	---\nconference_id: 45\nid: 1089\ntitle: From monolith to modules\nsubtitle: Without a big bang rewrite\nevent_type: lecture\ntime_slots: 4\nstate: confirmed\nlanguage: en\nstart_time: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-02 07:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-02 07:00:00.000000000 Z\nabstract: From monolith to modules. Without a big bang rewrite. This abstract is demo\n  content generated by demo:seed.\ndescription: |-\n  A longer description for "From monolith to modules".\n\n  The session covers the background, a worked example and a short Q&A at the end. All of this is generated demo data so you can click through frab with realistic looking content.\npublic: true\nlogo_file_name: \nlogo_content_type: \nlogo_file_size: \nlogo_updated_at: \ntrack_id: 186\nroom_id: 139\ncreated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-04-23 10:34:52.428855000 Z\n  zone: *1\n  time: 2026-04-23 10:34:52.428855000 Z\nupdated_at: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:55.198927000 Z\n  zone: *1\n  time: 2026-08-03 10:35:55.198927000 Z\naverage_rating: 3.75\nevent_ratings_count: 4\nnote: \nsubmission_note: Prefers a morning slot.\nspeaker_count: 1\nevent_feedbacks_count: 6\naverage_feedback: 5.0\nguid: 159cf045-35df-4041-8092-54b4ed107827\ndo_not_record: false\nrecording_license: CC BY-SA 4.0\ntech_rider: \ninvite_token: nqhtKv1Mh6dDBXe9dXK55zCm\nvideo_url: \ncoauthors: \ncoauthor_1: \ncoauthor_2: \ncoauthor_3: \ncoauthor_4: \ncoauthor_5: \ncoauthor_1_name: \ncoauthor_1_last_name: \ncoauthor_2_name: \ncoauthor_2_last_name: \ncoauthor_3_name: \ncoauthor_3_last_name: \ncoauthor_4_name: \ncoauthor_4_last_name: \ncoauthor_5_name: \ncoauthor_5_last_name: \n	2026-08-03 10:36:00.028313	45	\N	\N	---\nupdated_at:\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:35:55.198927000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2026-08-03 10:35:55.198927000 Z\n- !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2026-08-03 10:36:00.028313844 Z\n  zone: *1\n  time: 2026-08-03 10:36:00.028313844 Z\ntech_rider:\n- \n- Needs a second screen for the notes view.\n
\.


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 1261, true);


--
-- Name: average_review_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.average_review_scores_id_seq', 3442, true);


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.call_for_participations_id_seq', 45, true);


--
-- Name: classifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classifiers_id_seq', 72, true);


--
-- Name: conference_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conference_exports_id_seq', 1, false);


--
-- Name: conference_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conference_users_id_seq', 147, true);


--
-- Name: conferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conferences_id_seq', 45, true);


--
-- Name: conflicts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conflicts_id_seq', 2960, true);


--
-- Name: days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.days_id_seq', 89, true);


--
-- Name: event_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_attachments_id_seq', 199, true);


--
-- Name: event_classifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_classifiers_id_seq', 2931, true);


--
-- Name: event_feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_feedbacks_id_seq', 1426, true);


--
-- Name: event_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_people_id_seq', 3423, true);


--
-- Name: event_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_ratings_id_seq', 3019, true);


--
-- Name: event_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_translations_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_id_seq', 1173, true);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expenses_id_seq', 250, true);


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

SELECT pg_catalog.setval('public.languages_id_seq', 103, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 572, true);


--
-- Name: mail_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mail_templates_id_seq', 129, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 90, true);


--
-- Name: papers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.papers_id_seq', 1173, true);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_id_seq', 381, true);


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

SELECT pg_catalog.setval('public.review_metrics_id_seq', 102, true);


--
-- Name: review_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.review_scores_id_seq', 9595, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rooms_id_seq', 140, true);


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

SELECT pg_catalog.setval('public.tracks_id_seq', 191, true);


--
-- Name: transport_needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_needs_id_seq', 250, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 381, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.versions_id_seq', 21, true);


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

