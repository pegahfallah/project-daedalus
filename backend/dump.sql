--
-- PostgreSQL database dump
--

\restrict EBdCZe0ZMYSQ6eZlsWdun6O7IgtdStnv1ZRI42Hi5crxR2FxPBkcJNxcXRVWXGK

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

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
-- Name: about; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.about (
    id uuid NOT NULL,
    label character varying(255),
    heading character varying(255),
    body text,
    stat_1_value character varying(255),
    stat_1_label character varying(255),
    stat_2_value character varying(255),
    stat_2_label character varying(255),
    stat_3_value character varying(255),
    stat_3_label character varying(255)
);


ALTER TABLE public.about OWNER TO daedalus;

--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO daedalus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO daedalus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO daedalus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO daedalus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO daedalus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO daedalus;

--
-- Name: directus_deployment_projects; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_deployment_projects (
    id uuid NOT NULL,
    deployment uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_deployment_projects OWNER TO daedalus;

--
-- Name: directus_deployment_runs; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_deployment_runs (
    id uuid NOT NULL,
    project uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    target character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_deployment_runs OWNER TO daedalus;

--
-- Name: directus_deployments; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_deployments (
    id uuid NOT NULL,
    provider character varying(255) NOT NULL,
    credentials text,
    options text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_deployments OWNER TO daedalus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO daedalus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text,
    searchable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_fields OWNER TO daedalus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO daedalus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO daedalus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO daedalus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO daedalus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO daedalus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO daedalus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO daedalus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO daedalus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO daedalus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO daedalus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO daedalus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO daedalus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO daedalus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO daedalus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO daedalus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO daedalus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO daedalus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO daedalus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO daedalus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO daedalus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text,
    project_owner character varying(255),
    project_usage character varying(255),
    org_name character varying(255),
    product_updates boolean,
    project_status character varying(255),
    ai_openai_api_key text,
    ai_anthropic_api_key text,
    ai_system_prompt text,
    ai_google_api_key text,
    ai_openai_compatible_api_key text,
    ai_openai_compatible_base_url text,
    ai_openai_compatible_name text,
    ai_openai_compatible_models json,
    ai_openai_compatible_headers json,
    ai_openai_allowed_models json,
    ai_anthropic_allowed_models json,
    ai_google_allowed_models json,
    collaborative_editing_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_settings OWNER TO daedalus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: daedalus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO daedalus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daedalus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO daedalus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO daedalus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO daedalus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO daedalus;

--
-- Name: footer; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.footer (
    id uuid NOT NULL,
    cta_text text,
    cta_label character varying(255),
    cta_url character varying(255),
    twitter_url character varying(255),
    instagram_url character varying(255),
    linkedin_url character varying(255),
    cta_text_mobile text
);


ALTER TABLE public.footer OWNER TO daedalus;

--
-- Name: hero; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.hero (
    id uuid NOT NULL,
    subtitle character varying(255),
    title character varying(255),
    year character varying(255),
    tagline character varying(255),
    dates character varying(255),
    venue character varying(255),
    image uuid,
    cta_label character varying(255),
    cta_url character varying(255),
    subtitle_mobile character varying(255)
);


ALTER TABLE public.hero OWNER TO daedalus;

--
-- Name: navigation; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.navigation (
    id uuid NOT NULL,
    label character varying(255),
    url character varying(255),
    is_cta boolean DEFAULT false,
    sort integer,
    date_created timestamp with time zone,
    date_updated timestamp with time zone
);


ALTER TABLE public.navigation OWNER TO daedalus;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.pages (
    id uuid NOT NULL,
    title character varying(255),
    slug character varying(255),
    seo_title character varying(255),
    seo_description text,
    og_image uuid
);


ALTER TABLE public.pages OWNER TO daedalus;

--
-- Name: partners; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.partners (
    id uuid NOT NULL,
    name character varying(255),
    tier character varying(255),
    logo uuid,
    website character varying(255),
    sort integer,
    status character varying(255) DEFAULT 'published'::character varying,
    date_created timestamp with time zone,
    date_updated timestamp with time zone
);


ALTER TABLE public.partners OWNER TO daedalus;

--
-- Name: partners_section; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.partners_section (
    id uuid NOT NULL,
    label character varying(255),
    heading character varying(255)
);


ALTER TABLE public.partners_section OWNER TO daedalus;

--
-- Name: programme_section; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.programme_section (
    id uuid NOT NULL,
    label character varying(255),
    heading character varying(255)
);


ALTER TABLE public.programme_section OWNER TO daedalus;

--
-- Name: schedule_days; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.schedule_days (
    id uuid NOT NULL,
    day_number integer,
    title character varying(255),
    date date,
    sort integer,
    date_created timestamp with time zone,
    date_updated timestamp with time zone
);


ALTER TABLE public.schedule_days OWNER TO daedalus;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.sessions (
    id uuid NOT NULL,
    title character varying(255),
    type character varying(255),
    start_time time without time zone,
    room character varying(255),
    day uuid,
    sort integer,
    status character varying(255) DEFAULT 'published'::character varying,
    date_created timestamp with time zone,
    date_updated timestamp with time zone
);


ALTER TABLE public.sessions OWNER TO daedalus;

--
-- Name: sessions_speakers; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.sessions_speakers (
    id uuid NOT NULL,
    sessions_id uuid,
    speakers_id uuid
);


ALTER TABLE public.sessions_speakers OWNER TO daedalus;

--
-- Name: speakers; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.speakers (
    id uuid NOT NULL,
    name character varying(255),
    role character varying(255),
    company character varying(255),
    company_url character varying(255),
    headshot uuid,
    sort integer,
    status character varying(255) DEFAULT 'published'::character varying,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    role_mobile character varying(255),
    company_mobile character varying(255)
);


ALTER TABLE public.speakers OWNER TO daedalus;

--
-- Name: speakers_section; Type: TABLE; Schema: public; Owner: daedalus
--

CREATE TABLE public.speakers_section (
    id uuid NOT NULL,
    label character varying(255),
    heading character varying(255)
);


ALTER TABLE public.speakers_section OWNER TO daedalus;

--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Data for Name: about; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.about (id, label, heading, body, stat_1_value, stat_1_label, stat_2_value, stat_2_label, stat_3_value, stat_3_label) FROM stdin;
f12dac80-0682-4b88-8e16-c420c59d1842	About the Event	Three days of ideas that shape how we build.	FORMA is a 3-day summit bringing together architects, urban planners, engineers, and designers to explore sustainable futures, urban transformation, and technology in the built environment.\n\nFrom net-zero construction to AI-driven design, FORMA gathers the sharpest minds at the intersection of creativity and engineering. Join 1,200+ professionals for keynotes, panels, workshops, and conversations that shape how we build.	1,200+	Attendees	40+	Speakers	25	Countries Represented
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
8deec95a-a912-463a-8c4a-8cd8d5fc9df8	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
5556954b-5c21-4ef3-818c-45a36373c649	cc1156d2-0860-48f6-a13b-3bfdd25e0b8e	\N	141bfc2f-27de-4f77-9c36-748c35a3bf5f	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-02-27 12:20:44.038+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	http://localhost:8055
2	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-02-27 12:21:04.733+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
3	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:02:42.611+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/2.5.25 Chrome/142.0.7444.265 Electron/39.4.0 Safari/537.36	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	http://localhost:8055
4	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:04:36.006+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/2.5.25 Chrome/142.0.7444.265 Electron/39.4.0 Safari/537.36	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	http://localhost:8055
5	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:05:32.863+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	http://localhost:8055
6	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.585+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
7	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.591+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
8	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.593+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
9	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.597+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
10	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.599+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
11	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.6+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
12	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:24:41.602+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
13	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:28:03.242+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
14	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:28:55.629+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
15	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:29:56.241+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
16	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:02.594+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
17	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:31.373+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
18	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:31.447+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
19	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:31.45+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_files	http://localhost:8055
20	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:31.47+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
21	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:30:31.513+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
22	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.637+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
23	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.709+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
24	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.71+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_page_sections	http://localhost:8055
25	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.733+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
26	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.734+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	page_sections	http://localhost:8055
27	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.753+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
28	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:31:16.801+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
29	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:32:05.073+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
30	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.722+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
31	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.726+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
32	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.728+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
33	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.73+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
34	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.732+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
35	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.734+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
36	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.736+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
37	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:33:51.738+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	section	http://localhost:8055
38	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:00.188+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	page_sections	http://localhost:8055
39	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:00.194+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
40	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:00.198+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	section	http://localhost:8055
41	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:00.202+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_files	http://localhost:8055
42	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:00.209+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_page_sections	http://localhost:8055
43	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:04.863+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
44	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:04.87+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	page_sections	http://localhost:8055
45	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:04.876+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	section	http://localhost:8055
46	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:04.88+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_files	http://localhost:8055
47	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 15:34:04.884+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_page_sections	http://localhost:8055
48	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	section	http://localhost:8055
49	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.004+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
50	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.004+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
51	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.005+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
52	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.005+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
53	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.006+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
54	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.006+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
55	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:35.007+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
56	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:38.39+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
57	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:38.434+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	page_sections	http://localhost:8055
58	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:38.435+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
59	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:38.436+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
60	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:41.495+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_files	http://localhost:8055
61	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:41.498+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
62	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:41.498+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
200	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.537+00	192.168.65.1	curl/8.7.1	directus_collections	pages	\N
63	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:41.499+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
64	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:44.241+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages_page_sections	http://localhost:8055
65	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:44.244+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
66	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:44.245+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
67	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:44.251+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
68	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.698+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
69	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.701+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
70	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.702+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
71	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.702+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
72	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.703+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
73	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.703+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
74	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.704+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
75	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.704+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
76	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.705+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
77	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.705+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
78	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-02 18:06:48.706+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
79	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:23.385+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	http://localhost:8055
80	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.173+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
81	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.177+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
82	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.179+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
83	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.181+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
84	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.183+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
85	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.186+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
86	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:04:50.19+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
87	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.471+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
88	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.475+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
89	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.478+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
90	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.48+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
91	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.482+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
92	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.484+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
93	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.486+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
94	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:07.488+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	navigation	http://localhost:8055
95	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.843+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
96	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.847+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
97	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.851+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
98	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.853+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
99	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.854+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
100	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.856+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
101	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:23.858+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	hero	http://localhost:8055
102	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.902+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
103	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.905+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
104	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.908+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
105	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.911+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
106	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.913+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
107	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.915+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
108	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:05:37.917+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	about	http://localhost:8055
109	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.703+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
110	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.705+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
111	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.706+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
112	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.708+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
113	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.708+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
114	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.709+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
115	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:23.71+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
116	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.944+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
117	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.948+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
118	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.954+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
119	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.956+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
120	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.958+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
121	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.96+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
122	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.962+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
123	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:06:55.964+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	speakers	http://localhost:8055
124	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.596+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
125	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.6+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
126	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.602+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
127	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.604+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
128	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.606+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
129	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.607+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
130	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.609+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
131	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:07:17.611+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	schedule_days	http://localhost:8055
132	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.955+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
133	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.959+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
134	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.961+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
135	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.963+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
136	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.965+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
137	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.967+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
138	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:08:09.969+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	sessions	http://localhost:8055
139	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.255+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	about	http://localhost:8055
140	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.259+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
141	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.26+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
142	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.26+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
143	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.261+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
144	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.261+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
145	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:25.262+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
146	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.189+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
147	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.19+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
148	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.191+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
149	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.191+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
150	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.192+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
151	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.192+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
152	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:28.192+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
168	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.219+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	pages	http://localhost:8055
169	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.221+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
170	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.221+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
171	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.221+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
172	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.221+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
173	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.222+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
174	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:36.222+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
183	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.064+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	sessions	http://localhost:8055
184	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.067+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
185	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.068+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
186	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.07+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
187	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.071+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
188	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.071+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
189	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:44.072+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
153	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.127+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	hero	http://localhost:8055
154	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.129+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
155	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.13+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
156	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.13+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
157	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.131+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
158	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.132+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
159	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:31.132+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
160	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.549+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	navigation	http://localhost:8055
161	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.552+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
162	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.553+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
163	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.554+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
164	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.554+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
165	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.555+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
166	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.556+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
167	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:33.556+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
175	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.519+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	schedule_days	http://localhost:8055
176	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.522+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
177	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.523+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
178	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.523+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
179	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.524+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
180	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.524+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
181	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.525+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
182	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:41.525+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
190	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.201+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_collections	speakers	http://localhost:8055
191	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.202+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
192	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.202+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
193	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.202+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
194	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.203+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
195	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.203+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
196	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.203+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
197	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:09:48.203+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
198	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:23:41.989+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
199	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.534+00	192.168.65.1	curl/8.7.1	directus_fields	78	\N
201	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.585+00	192.168.65.1	curl/8.7.1	directus_fields	79	\N
202	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.586+00	192.168.65.1	curl/8.7.1	directus_collections	navigation	\N
203	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.617+00	192.168.65.1	curl/8.7.1	directus_fields	80	\N
204	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.619+00	192.168.65.1	curl/8.7.1	directus_collections	hero	\N
205	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.649+00	192.168.65.1	curl/8.7.1	directus_fields	81	\N
206	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.651+00	192.168.65.1	curl/8.7.1	directus_collections	about	\N
207	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.68+00	192.168.65.1	curl/8.7.1	directus_fields	82	\N
208	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.68+00	192.168.65.1	curl/8.7.1	directus_collections	speakers_section	\N
209	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.71+00	192.168.65.1	curl/8.7.1	directus_fields	83	\N
210	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.712+00	192.168.65.1	curl/8.7.1	directus_collections	speakers	\N
211	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.74+00	192.168.65.1	curl/8.7.1	directus_fields	84	\N
212	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.741+00	192.168.65.1	curl/8.7.1	directus_collections	schedule_days	\N
213	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.769+00	192.168.65.1	curl/8.7.1	directus_fields	85	\N
214	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.77+00	192.168.65.1	curl/8.7.1	directus_collections	sessions	\N
215	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.804+00	192.168.65.1	curl/8.7.1	directus_fields	86	\N
216	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.805+00	192.168.65.1	curl/8.7.1	directus_collections	sessions_speakers	\N
217	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.832+00	192.168.65.1	curl/8.7.1	directus_fields	87	\N
218	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.833+00	192.168.65.1	curl/8.7.1	directus_collections	programme_section	\N
219	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.884+00	192.168.65.1	curl/8.7.1	directus_fields	88	\N
220	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.896+00	192.168.65.1	curl/8.7.1	directus_collections	partners	\N
221	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.972+00	192.168.65.1	curl/8.7.1	directus_fields	89	\N
222	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:39.974+00	192.168.65.1	curl/8.7.1	directus_collections	partners_section	\N
223	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:40.019+00	192.168.65.1	curl/8.7.1	directus_fields	90	\N
224	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:25:40.022+00	192.168.65.1	curl/8.7.1	directus_collections	footer	\N
225	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.227+00	192.168.65.1	curl/8.7.1	directus_fields	91	\N
226	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.291+00	192.168.65.1	curl/8.7.1	directus_fields	92	\N
227	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.33+00	192.168.65.1	curl/8.7.1	directus_fields	93	\N
228	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.364+00	192.168.65.1	curl/8.7.1	directus_fields	94	\N
229	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.393+00	192.168.65.1	curl/8.7.1	directus_fields	95	\N
230	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.431+00	192.168.65.1	curl/8.7.1	directus_fields	96	\N
231	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.483+00	192.168.65.1	curl/8.7.1	directus_fields	97	\N
232	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.511+00	192.168.65.1	curl/8.7.1	directus_fields	98	\N
233	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.543+00	192.168.65.1	curl/8.7.1	directus_fields	99	\N
234	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.571+00	192.168.65.1	curl/8.7.1	directus_fields	100	\N
235	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.603+00	192.168.65.1	curl/8.7.1	directus_fields	101	\N
236	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.631+00	192.168.65.1	curl/8.7.1	directus_fields	102	\N
237	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.658+00	192.168.65.1	curl/8.7.1	directus_fields	103	\N
238	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.687+00	192.168.65.1	curl/8.7.1	directus_fields	104	\N
239	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.717+00	192.168.65.1	curl/8.7.1	directus_fields	105	\N
240	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.747+00	192.168.65.1	curl/8.7.1	directus_fields	106	\N
241	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.774+00	192.168.65.1	curl/8.7.1	directus_fields	107	\N
242	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.805+00	192.168.65.1	curl/8.7.1	directus_fields	108	\N
243	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.835+00	192.168.65.1	curl/8.7.1	directus_fields	109	\N
244	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.867+00	192.168.65.1	curl/8.7.1	directus_fields	110	\N
245	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.898+00	192.168.65.1	curl/8.7.1	directus_fields	111	\N
246	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.93+00	192.168.65.1	curl/8.7.1	directus_fields	112	\N
247	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:43.969+00	192.168.65.1	curl/8.7.1	directus_fields	113	\N
248	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.003+00	192.168.65.1	curl/8.7.1	directus_fields	114	\N
249	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.038+00	192.168.65.1	curl/8.7.1	directus_fields	115	\N
250	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.071+00	192.168.65.1	curl/8.7.1	directus_fields	116	\N
251	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.101+00	192.168.65.1	curl/8.7.1	directus_fields	117	\N
252	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.2+00	192.168.65.1	curl/8.7.1	directus_fields	118	\N
253	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.23+00	192.168.65.1	curl/8.7.1	directus_fields	119	\N
254	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.259+00	192.168.65.1	curl/8.7.1	directus_fields	120	\N
255	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.288+00	192.168.65.1	curl/8.7.1	directus_fields	121	\N
256	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.319+00	192.168.65.1	curl/8.7.1	directus_fields	122	\N
257	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.348+00	192.168.65.1	curl/8.7.1	directus_fields	123	\N
258	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.377+00	192.168.65.1	curl/8.7.1	directus_fields	124	\N
259	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.405+00	192.168.65.1	curl/8.7.1	directus_fields	125	\N
260	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.434+00	192.168.65.1	curl/8.7.1	directus_fields	126	\N
261	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.463+00	192.168.65.1	curl/8.7.1	directus_fields	127	\N
262	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.491+00	192.168.65.1	curl/8.7.1	directus_fields	128	\N
263	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.519+00	192.168.65.1	curl/8.7.1	directus_fields	129	\N
264	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.549+00	192.168.65.1	curl/8.7.1	directus_fields	130	\N
265	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.577+00	192.168.65.1	curl/8.7.1	directus_fields	131	\N
266	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.608+00	192.168.65.1	curl/8.7.1	directus_fields	132	\N
267	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.637+00	192.168.65.1	curl/8.7.1	directus_fields	133	\N
268	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.665+00	192.168.65.1	curl/8.7.1	directus_fields	134	\N
269	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.694+00	192.168.65.1	curl/8.7.1	directus_fields	135	\N
270	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.721+00	192.168.65.1	curl/8.7.1	directus_fields	136	\N
271	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.752+00	192.168.65.1	curl/8.7.1	directus_fields	137	\N
272	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.781+00	192.168.65.1	curl/8.7.1	directus_fields	138	\N
273	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.809+00	192.168.65.1	curl/8.7.1	directus_fields	139	\N
274	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.838+00	192.168.65.1	curl/8.7.1	directus_fields	140	\N
275	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.867+00	192.168.65.1	curl/8.7.1	directus_fields	141	\N
276	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.896+00	192.168.65.1	curl/8.7.1	directus_fields	142	\N
277	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.926+00	192.168.65.1	curl/8.7.1	directus_fields	143	\N
278	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.955+00	192.168.65.1	curl/8.7.1	directus_fields	144	\N
279	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:44.984+00	192.168.65.1	curl/8.7.1	directus_fields	145	\N
280	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.013+00	192.168.65.1	curl/8.7.1	directus_fields	146	\N
281	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.044+00	192.168.65.1	curl/8.7.1	directus_fields	147	\N
282	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.072+00	192.168.65.1	curl/8.7.1	directus_fields	148	\N
283	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.104+00	192.168.65.1	curl/8.7.1	directus_fields	149	\N
284	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.135+00	192.168.65.1	curl/8.7.1	directus_fields	150	\N
285	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.167+00	192.168.65.1	curl/8.7.1	directus_fields	151	\N
286	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.197+00	192.168.65.1	curl/8.7.1	directus_fields	152	\N
287	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.225+00	192.168.65.1	curl/8.7.1	directus_fields	153	\N
288	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.254+00	192.168.65.1	curl/8.7.1	directus_fields	154	\N
289	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:26:45.284+00	192.168.65.1	curl/8.7.1	directus_fields	155	\N
290	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:27:10.816+00	192.168.65.1	curl/8.7.1	directus_fields	156	\N
291	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:27:10.883+00	192.168.65.1	curl/8.7.1	directus_fields	157	\N
292	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.789+00	192.168.65.1	curl/8.7.1	directus_collections	sessions_speakers	\N
293	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.793+00	192.168.65.1	curl/8.7.1	directus_fields	86	\N
294	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.794+00	192.168.65.1	curl/8.7.1	directus_fields	138	\N
295	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.795+00	192.168.65.1	curl/8.7.1	directus_fields	139	\N
296	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.854+00	192.168.65.1	curl/8.7.1	directus_collections	sessions	\N
297	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.855+00	192.168.65.1	curl/8.7.1	directus_fields	85	\N
298	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.855+00	192.168.65.1	curl/8.7.1	directus_fields	131	\N
299	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.855+00	192.168.65.1	curl/8.7.1	directus_fields	132	\N
300	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.856+00	192.168.65.1	curl/8.7.1	directus_fields	133	\N
301	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.856+00	192.168.65.1	curl/8.7.1	directus_fields	134	\N
302	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.856+00	192.168.65.1	curl/8.7.1	directus_fields	135	\N
303	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.856+00	192.168.65.1	curl/8.7.1	directus_fields	136	\N
304	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.857+00	192.168.65.1	curl/8.7.1	directus_fields	137	\N
305	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.857+00	192.168.65.1	curl/8.7.1	directus_fields	156	\N
306	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.908+00	192.168.65.1	curl/8.7.1	directus_collections	schedule_days	\N
307	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.912+00	192.168.65.1	curl/8.7.1	directus_fields	84	\N
308	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.915+00	192.168.65.1	curl/8.7.1	directus_fields	127	\N
309	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.916+00	192.168.65.1	curl/8.7.1	directus_fields	128	\N
310	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.918+00	192.168.65.1	curl/8.7.1	directus_fields	129	\N
311	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.918+00	192.168.65.1	curl/8.7.1	directus_fields	130	\N
312	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.919+00	192.168.65.1	curl/8.7.1	directus_fields	157	\N
313	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.998+00	192.168.65.1	curl/8.7.1	directus_collections	speakers	\N
314	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.999+00	192.168.65.1	curl/8.7.1	directus_fields	83	\N
315	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.999+00	192.168.65.1	curl/8.7.1	directus_fields	120	\N
316	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:16.999+00	192.168.65.1	curl/8.7.1	directus_fields	121	\N
317	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17+00	192.168.65.1	curl/8.7.1	directus_fields	122	\N
318	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17+00	192.168.65.1	curl/8.7.1	directus_fields	123	\N
319	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17+00	192.168.65.1	curl/8.7.1	directus_fields	124	\N
320	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17+00	192.168.65.1	curl/8.7.1	directus_fields	125	\N
321	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.001+00	192.168.65.1	curl/8.7.1	directus_fields	126	\N
322	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.037+00	192.168.65.1	curl/8.7.1	directus_collections	speakers_section	\N
323	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.038+00	192.168.65.1	curl/8.7.1	directus_fields	82	\N
324	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.039+00	192.168.65.1	curl/8.7.1	directus_fields	118	\N
325	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.039+00	192.168.65.1	curl/8.7.1	directus_fields	119	\N
326	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.068+00	192.168.65.1	curl/8.7.1	directus_collections	hero	\N
327	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.069+00	192.168.65.1	curl/8.7.1	directus_fields	80	\N
328	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.069+00	192.168.65.1	curl/8.7.1	directus_fields	100	\N
329	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.07+00	192.168.65.1	curl/8.7.1	directus_fields	101	\N
330	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.07+00	192.168.65.1	curl/8.7.1	directus_fields	102	\N
331	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.07+00	192.168.65.1	curl/8.7.1	directus_fields	103	\N
332	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.07+00	192.168.65.1	curl/8.7.1	directus_fields	104	\N
333	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.07+00	192.168.65.1	curl/8.7.1	directus_fields	105	\N
334	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.071+00	192.168.65.1	curl/8.7.1	directus_fields	106	\N
335	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.071+00	192.168.65.1	curl/8.7.1	directus_fields	107	\N
336	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.071+00	192.168.65.1	curl/8.7.1	directus_fields	108	\N
337	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.109+00	192.168.65.1	curl/8.7.1	directus_collections	about	\N
338	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.113+00	192.168.65.1	curl/8.7.1	directus_fields	81	\N
339	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.113+00	192.168.65.1	curl/8.7.1	directus_fields	109	\N
340	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.114+00	192.168.65.1	curl/8.7.1	directus_fields	110	\N
341	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.114+00	192.168.65.1	curl/8.7.1	directus_fields	111	\N
342	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.115+00	192.168.65.1	curl/8.7.1	directus_fields	112	\N
343	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.115+00	192.168.65.1	curl/8.7.1	directus_fields	113	\N
344	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.115+00	192.168.65.1	curl/8.7.1	directus_fields	114	\N
345	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.116+00	192.168.65.1	curl/8.7.1	directus_fields	115	\N
346	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.116+00	192.168.65.1	curl/8.7.1	directus_fields	116	\N
347	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.116+00	192.168.65.1	curl/8.7.1	directus_fields	117	\N
348	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.151+00	192.168.65.1	curl/8.7.1	directus_collections	pages	\N
349	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.152+00	192.168.65.1	curl/8.7.1	directus_fields	78	\N
350	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.152+00	192.168.65.1	curl/8.7.1	directus_fields	91	\N
351	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.153+00	192.168.65.1	curl/8.7.1	directus_fields	92	\N
352	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.154+00	192.168.65.1	curl/8.7.1	directus_fields	93	\N
353	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.155+00	192.168.65.1	curl/8.7.1	directus_fields	94	\N
354	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.156+00	192.168.65.1	curl/8.7.1	directus_fields	95	\N
355	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.188+00	192.168.65.1	curl/8.7.1	directus_collections	navigation	\N
356	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.189+00	192.168.65.1	curl/8.7.1	directus_fields	79	\N
357	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.189+00	192.168.65.1	curl/8.7.1	directus_fields	96	\N
358	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.189+00	192.168.65.1	curl/8.7.1	directus_fields	97	\N
359	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.189+00	192.168.65.1	curl/8.7.1	directus_fields	98	\N
360	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.19+00	192.168.65.1	curl/8.7.1	directus_fields	99	\N
361	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.22+00	192.168.65.1	curl/8.7.1	directus_collections	programme_section	\N
362	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.222+00	192.168.65.1	curl/8.7.1	directus_fields	87	\N
363	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.222+00	192.168.65.1	curl/8.7.1	directus_fields	140	\N
364	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.222+00	192.168.65.1	curl/8.7.1	directus_fields	141	\N
365	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.248+00	192.168.65.1	curl/8.7.1	directus_collections	partners	\N
366	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.249+00	192.168.65.1	curl/8.7.1	directus_fields	88	\N
367	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.249+00	192.168.65.1	curl/8.7.1	directus_fields	142	\N
368	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.249+00	192.168.65.1	curl/8.7.1	directus_fields	143	\N
369	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.249+00	192.168.65.1	curl/8.7.1	directus_fields	144	\N
370	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.25+00	192.168.65.1	curl/8.7.1	directus_fields	145	\N
371	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.25+00	192.168.65.1	curl/8.7.1	directus_fields	146	\N
372	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.25+00	192.168.65.1	curl/8.7.1	directus_fields	147	\N
373	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.281+00	192.168.65.1	curl/8.7.1	directus_collections	partners_section	\N
374	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.282+00	192.168.65.1	curl/8.7.1	directus_fields	89	\N
375	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.282+00	192.168.65.1	curl/8.7.1	directus_fields	148	\N
376	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.283+00	192.168.65.1	curl/8.7.1	directus_fields	149	\N
377	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.315+00	192.168.65.1	curl/8.7.1	directus_collections	footer	\N
378	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.316+00	192.168.65.1	curl/8.7.1	directus_fields	90	\N
379	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.316+00	192.168.65.1	curl/8.7.1	directus_fields	150	\N
380	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.316+00	192.168.65.1	curl/8.7.1	directus_fields	151	\N
381	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.317+00	192.168.65.1	curl/8.7.1	directus_fields	152	\N
382	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.317+00	192.168.65.1	curl/8.7.1	directus_fields	153	\N
383	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.317+00	192.168.65.1	curl/8.7.1	directus_fields	154	\N
384	delete	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:17.317+00	192.168.65.1	curl/8.7.1	directus_fields	155	\N
385	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:28:23.647+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
386	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.349+00	192.168.65.1	curl/8.7.1	directus_fields	158	\N
387	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.354+00	192.168.65.1	curl/8.7.1	directus_collections	pages	\N
388	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.397+00	192.168.65.1	curl/8.7.1	directus_fields	159	\N
389	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.398+00	192.168.65.1	curl/8.7.1	directus_collections	navigation	\N
390	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.426+00	192.168.65.1	curl/8.7.1	directus_fields	160	\N
391	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.428+00	192.168.65.1	curl/8.7.1	directus_collections	hero	\N
392	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.46+00	192.168.65.1	curl/8.7.1	directus_fields	161	\N
393	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.461+00	192.168.65.1	curl/8.7.1	directus_collections	about	\N
394	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.494+00	192.168.65.1	curl/8.7.1	directus_fields	162	\N
395	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.495+00	192.168.65.1	curl/8.7.1	directus_collections	speakers_section	\N
396	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.522+00	192.168.65.1	curl/8.7.1	directus_fields	163	\N
397	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.524+00	192.168.65.1	curl/8.7.1	directus_collections	speakers	\N
398	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.549+00	192.168.65.1	curl/8.7.1	directus_fields	164	\N
399	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.551+00	192.168.65.1	curl/8.7.1	directus_collections	schedule_days	\N
400	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.584+00	192.168.65.1	curl/8.7.1	directus_fields	165	\N
401	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.586+00	192.168.65.1	curl/8.7.1	directus_collections	sessions	\N
402	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.625+00	192.168.65.1	curl/8.7.1	directus_fields	166	\N
403	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.626+00	192.168.65.1	curl/8.7.1	directus_collections	sessions_speakers	\N
404	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.651+00	192.168.65.1	curl/8.7.1	directus_fields	167	\N
405	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.652+00	192.168.65.1	curl/8.7.1	directus_collections	programme_section	\N
406	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.733+00	192.168.65.1	curl/8.7.1	directus_fields	168	\N
407	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.734+00	192.168.65.1	curl/8.7.1	directus_collections	partners	\N
408	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.774+00	192.168.65.1	curl/8.7.1	directus_fields	169	\N
409	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.778+00	192.168.65.1	curl/8.7.1	directus_collections	partners_section	\N
410	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.804+00	192.168.65.1	curl/8.7.1	directus_fields	170	\N
411	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:29:37.805+00	192.168.65.1	curl/8.7.1	directus_collections	footer	\N
412	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.53+00	192.168.65.1	curl/8.7.1	directus_fields	171	\N
413	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.59+00	192.168.65.1	curl/8.7.1	directus_fields	172	\N
414	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.625+00	192.168.65.1	curl/8.7.1	directus_fields	173	\N
415	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.658+00	192.168.65.1	curl/8.7.1	directus_fields	174	\N
416	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.689+00	192.168.65.1	curl/8.7.1	directus_fields	175	\N
417	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.718+00	192.168.65.1	curl/8.7.1	directus_fields	176	\N
418	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.766+00	192.168.65.1	curl/8.7.1	directus_fields	177	\N
419	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.8+00	192.168.65.1	curl/8.7.1	directus_fields	178	\N
420	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.831+00	192.168.65.1	curl/8.7.1	directus_fields	179	\N
421	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.858+00	192.168.65.1	curl/8.7.1	directus_fields	180	\N
422	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.889+00	192.168.65.1	curl/8.7.1	directus_fields	181	\N
423	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.917+00	192.168.65.1	curl/8.7.1	directus_fields	182	\N
424	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.944+00	192.168.65.1	curl/8.7.1	directus_fields	183	\N
425	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:39.976+00	192.168.65.1	curl/8.7.1	directus_fields	184	\N
426	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.008+00	192.168.65.1	curl/8.7.1	directus_fields	185	\N
427	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.037+00	192.168.65.1	curl/8.7.1	directus_fields	186	\N
428	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.069+00	192.168.65.1	curl/8.7.1	directus_fields	187	\N
429	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.102+00	192.168.65.1	curl/8.7.1	directus_fields	188	\N
430	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.132+00	192.168.65.1	curl/8.7.1	directus_fields	189	\N
431	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.17+00	192.168.65.1	curl/8.7.1	directus_fields	190	\N
432	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.196+00	192.168.65.1	curl/8.7.1	directus_fields	191	\N
433	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.224+00	192.168.65.1	curl/8.7.1	directus_fields	192	\N
434	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.253+00	192.168.65.1	curl/8.7.1	directus_fields	193	\N
435	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.283+00	192.168.65.1	curl/8.7.1	directus_fields	194	\N
436	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.31+00	192.168.65.1	curl/8.7.1	directus_fields	195	\N
437	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.339+00	192.168.65.1	curl/8.7.1	directus_fields	196	\N
438	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.367+00	192.168.65.1	curl/8.7.1	directus_fields	197	\N
439	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.395+00	192.168.65.1	curl/8.7.1	directus_fields	198	\N
440	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.427+00	192.168.65.1	curl/8.7.1	directus_fields	199	\N
441	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.458+00	192.168.65.1	curl/8.7.1	directus_fields	200	\N
442	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.489+00	192.168.65.1	curl/8.7.1	directus_fields	201	\N
443	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.517+00	192.168.65.1	curl/8.7.1	directus_fields	202	\N
444	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.544+00	192.168.65.1	curl/8.7.1	directus_fields	203	\N
445	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.571+00	192.168.65.1	curl/8.7.1	directus_fields	204	\N
446	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.599+00	192.168.65.1	curl/8.7.1	directus_fields	205	\N
447	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.627+00	192.168.65.1	curl/8.7.1	directus_fields	206	\N
448	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.655+00	192.168.65.1	curl/8.7.1	directus_fields	207	\N
449	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.683+00	192.168.65.1	curl/8.7.1	directus_fields	208	\N
450	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.711+00	192.168.65.1	curl/8.7.1	directus_fields	209	\N
451	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.74+00	192.168.65.1	curl/8.7.1	directus_fields	210	\N
452	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.769+00	192.168.65.1	curl/8.7.1	directus_fields	211	\N
453	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.8+00	192.168.65.1	curl/8.7.1	directus_fields	212	\N
454	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.828+00	192.168.65.1	curl/8.7.1	directus_fields	213	\N
455	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.857+00	192.168.65.1	curl/8.7.1	directus_fields	214	\N
456	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.887+00	192.168.65.1	curl/8.7.1	directus_fields	215	\N
457	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.915+00	192.168.65.1	curl/8.7.1	directus_fields	216	\N
458	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.944+00	192.168.65.1	curl/8.7.1	directus_fields	217	\N
459	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:40.974+00	192.168.65.1	curl/8.7.1	directus_fields	218	\N
460	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.003+00	192.168.65.1	curl/8.7.1	directus_fields	219	\N
461	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.031+00	192.168.65.1	curl/8.7.1	directus_fields	220	\N
462	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.062+00	192.168.65.1	curl/8.7.1	directus_fields	221	\N
463	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.09+00	192.168.65.1	curl/8.7.1	directus_fields	222	\N
464	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.121+00	192.168.65.1	curl/8.7.1	directus_fields	223	\N
465	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.149+00	192.168.65.1	curl/8.7.1	directus_fields	224	\N
466	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.178+00	192.168.65.1	curl/8.7.1	directus_fields	225	\N
467	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.206+00	192.168.65.1	curl/8.7.1	directus_fields	226	\N
468	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.238+00	192.168.65.1	curl/8.7.1	directus_fields	227	\N
469	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.268+00	192.168.65.1	curl/8.7.1	directus_fields	228	\N
470	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.298+00	192.168.65.1	curl/8.7.1	directus_fields	229	\N
471	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.327+00	192.168.65.1	curl/8.7.1	directus_fields	230	\N
472	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.355+00	192.168.65.1	curl/8.7.1	directus_fields	231	\N
473	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.384+00	192.168.65.1	curl/8.7.1	directus_fields	232	\N
474	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.414+00	192.168.65.1	curl/8.7.1	directus_fields	233	\N
475	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.442+00	192.168.65.1	curl/8.7.1	directus_fields	234	\N
476	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:34:41.47+00	192.168.65.1	curl/8.7.1	directus_fields	235	\N
477	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:35:20.505+00	192.168.65.1	curl/8.7.1	directus_fields	236	\N
478	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:35:20.547+00	192.168.65.1	curl/8.7.1	directus_fields	237	\N
479	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:58.467+00	192.168.65.1	curl/8.7.1	directus_files	f6beaffe-9605-43fd-9a94-f9c82172f6cd	\N
480	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.469+00	192.168.65.1	curl/8.7.1	directus_files	0f167ca6-6050-406b-a14f-36ad6b08452f	\N
481	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.57+00	192.168.65.1	curl/8.7.1	directus_files	c99b6bac-dcd4-428a-a625-73224bc0545c	\N
482	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.661+00	192.168.65.1	curl/8.7.1	directus_files	140025b1-41fc-457b-9c03-5b4d6841608f	\N
483	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.792+00	192.168.65.1	curl/8.7.1	directus_files	25ec1694-34b1-4582-b4fe-107cf42a0ece	\N
484	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.908+00	192.168.65.1	curl/8.7.1	directus_files	6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9	\N
485	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.047+00	192.168.65.1	curl/8.7.1	directus_files	fea91a70-407c-4194-8611-3a4b2743d4d9	\N
486	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.171+00	192.168.65.1	curl/8.7.1	directus_files	594fa220-8bdf-4c7d-b38c-42c024f40578	\N
487	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.283+00	192.168.65.1	curl/8.7.1	directus_files	9257911c-4480-41eb-8c6f-460df4b3e423	\N
488	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.409+00	192.168.65.1	curl/8.7.1	directus_files	ba961b2a-f87c-4b73-9b46-9fde48b18179	\N
489	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.548+00	192.168.65.1	curl/8.7.1	directus_files	713df7b0-279f-42ec-a229-2534ee4014af	\N
490	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.068+00	192.168.65.1	curl/8.7.1	directus_files	80d6df78-4eba-4355-9662-655b3d39f7d9	\N
491	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.318+00	192.168.65.1	curl/8.7.1	directus_files	5e22b965-bbcd-48b5-8e93-a173288b334b	\N
492	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.454+00	192.168.65.1	curl/8.7.1	directus_files	0434af03-7e74-47b7-a6c8-90740ebb4d94	\N
493	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.879+00	192.168.65.1	curl/8.7.1	directus_files	d8ec1e92-f2f5-41f4-ba96-871e02f9b666	\N
494	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:02.328+00	192.168.65.1	curl/8.7.1	directus_files	a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59	\N
495	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:38.453+00	192.168.65.1	curl/8.7.1	navigation	94557cdb-752c-4bbb-a408-48ea8299e683	\N
496	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:38.612+00	192.168.65.1	curl/8.7.1	navigation	34a06d1d-c141-4eb1-ba8d-557eef402762	\N
497	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:38.935+00	192.168.65.1	curl/8.7.1	navigation	062851c3-bada-4de3-b2ec-36284802ec21	\N
498	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:39.706+00	192.168.65.1	curl/8.7.1	navigation	50ad2cf6-825e-4221-b095-13563d0bff53	\N
499	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:41.187+00	192.168.65.1	curl/8.7.1	navigation	ad24d508-ad16-421a-a43d-bf2d4d25c352	\N
500	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:41.848+00	192.168.65.1	curl/8.7.1	speakers	3c211554-efa2-4bc0-bc41-ab4149e017cc	\N
501	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:41.974+00	192.168.65.1	curl/8.7.1	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	\N
502	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:42.114+00	192.168.65.1	curl/8.7.1	speakers	75612f84-bbd9-4f65-96d7-e3568a37ecb9	\N
503	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:42.505+00	192.168.65.1	curl/8.7.1	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	\N
504	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:42.605+00	192.168.65.1	curl/8.7.1	speakers	e159b144-6ec8-42a4-b43d-b4a9ccefcb77	\N
505	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:38:42.686+00	192.168.65.1	curl/8.7.1	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	\N
506	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.132+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
507	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.296+00	192.168.65.1	curl/8.7.1	pages	f422231f-646a-4c6c-a8d8-f55633f80fbd	\N
508	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.472+00	192.168.65.1	curl/8.7.1	hero	6cb11279-54d4-449e-9ac4-c55d43c27d46	\N
509	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.59+00	192.168.65.1	curl/8.7.1	about	f12dac80-0682-4b88-8e16-c420c59d1842	\N
510	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.746+00	192.168.65.1	curl/8.7.1	speakers_section	df2d9f82-4929-4b4e-bd60-f8c850faffe3	\N
511	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:39.883+00	192.168.65.1	curl/8.7.1	programme_section	e5967731-32b8-45ac-bae1-98cfe74a7e60	\N
512	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:40.016+00	192.168.65.1	curl/8.7.1	partners_section	de871392-517b-4863-abc8-a924508c5621	\N
513	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:39:40.158+00	192.168.65.1	curl/8.7.1	footer	acb25ee5-8521-4c69-a5f5-79c495345206	\N
514	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:43.897+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
515	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.081+00	192.168.65.1	curl/8.7.1	schedule_days	c3d2337b-3400-4463-9df4-f1d74fa92496	\N
516	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.256+00	192.168.65.1	curl/8.7.1	schedule_days	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	\N
517	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.641+00	192.168.65.1	curl/8.7.1	schedule_days	b142016a-85e1-4644-bb53-178c56a2e990	\N
518	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.809+00	192.168.65.1	curl/8.7.1	sessions_speakers	7df6dd63-da50-4173-8bea-07cdf4f7abb1	\N
519	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.827+00	192.168.65.1	curl/8.7.1	sessions	e939e7a1-ff14-4c77-98d5-258a9d7c0543	\N
520	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.942+00	192.168.65.1	curl/8.7.1	sessions_speakers	fe6bb198-621e-4704-8f0c-c78a9a6a09d0	\N
521	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.95+00	192.168.65.1	curl/8.7.1	sessions_speakers	e1c677a9-edef-410e-9291-db31e220ed0f	\N
522	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:44.954+00	192.168.65.1	curl/8.7.1	sessions	4f98964c-f1f8-48a3-8f40-87f53ba2067f	\N
523	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.051+00	192.168.65.1	curl/8.7.1	sessions_speakers	65edf82a-13e4-4f71-9367-25be5e2b3f46	\N
524	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.076+00	192.168.65.1	curl/8.7.1	sessions	c4491f41-46c4-4e21-965e-6674fa1c5aca	\N
525	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.278+00	192.168.65.1	curl/8.7.1	sessions_speakers	4c46b687-1ccf-450e-b43a-a9173ba882c7	\N
526	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.292+00	192.168.65.1	curl/8.7.1	sessions	dd5770aa-f75c-4aa5-baf1-49d8a667ad53	\N
527	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.466+00	192.168.65.1	curl/8.7.1	sessions_speakers	113510c4-f186-4490-99ef-38d1449e41ad	\N
528	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.472+00	192.168.65.1	curl/8.7.1	sessions	8725c30c-5ced-4355-a93c-302e03048d1a	\N
529	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.604+00	192.168.65.1	curl/8.7.1	sessions_speakers	ab86fe93-4721-40d5-8040-8d224434673d	\N
530	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.613+00	192.168.65.1	curl/8.7.1	sessions	a352a1dd-7d60-4f4e-924b-07aa56d72bb3	\N
531	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.756+00	192.168.65.1	curl/8.7.1	sessions_speakers	75b1bf6a-9fd8-4263-ade6-522dafd6034c	\N
532	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:45.76+00	192.168.65.1	curl/8.7.1	sessions	a3e9e38d-9da6-4645-9166-0cff35a3f265	\N
533	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.067+00	192.168.65.1	curl/8.7.1	sessions_speakers	d1feef3e-357d-4edd-9fe3-9c1f7b5d20f9	\N
534	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.076+00	192.168.65.1	curl/8.7.1	sessions_speakers	d2ac1510-16c9-47b9-af85-9cdcdd2e1098	\N
535	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.092+00	192.168.65.1	curl/8.7.1	sessions	c9283c34-1dbe-4b7f-a668-d03b1a5eb114	\N
536	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.411+00	192.168.65.1	curl/8.7.1	sessions_speakers	596e3a30-27f3-4ac9-833b-55e5dc4607d3	\N
537	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.414+00	192.168.65.1	curl/8.7.1	sessions	3790b8bb-b54c-44da-b55a-5d8ceb27429b	\N
538	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.472+00	192.168.65.1	curl/8.7.1	sessions_speakers	34d787e2-0c74-40a1-8c4d-39bc8904ea93	\N
539	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.475+00	192.168.65.1	curl/8.7.1	sessions	0e3caaa2-0e5e-42ca-9af9-5b15410c8e68	\N
540	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.955+00	192.168.65.1	curl/8.7.1	sessions_speakers	fa00a004-87f4-466a-965b-9f33d25f8472	\N
541	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:46.968+00	192.168.65.1	curl/8.7.1	sessions	d69d1530-fc05-44c5-bb8d-9665321fb1cb	\N
542	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.225+00	192.168.65.1	curl/8.7.1	sessions_speakers	4f814c44-e6f7-4b7e-bd8f-7fbb24341515	\N
543	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.236+00	192.168.65.1	curl/8.7.1	sessions	e076e5ad-8e2b-49c2-8c1c-3a58c893afd7	\N
544	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.555+00	192.168.65.1	curl/8.7.1	sessions_speakers	1e3fe179-16c4-48d8-ad30-71bf7c7433ab	\N
545	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.56+00	192.168.65.1	curl/8.7.1	sessions_speakers	c0f4babe-3f87-4beb-a6f8-40bc5a2de33c	\N
546	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.592+00	192.168.65.1	curl/8.7.1	sessions	6ffcdd5e-e2e4-46ff-a255-92714aac3244	\N
547	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.727+00	192.168.65.1	curl/8.7.1	sessions_speakers	0b6ff5b5-4f5b-4aaa-ac10-9708bb694b2c	\N
548	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.735+00	192.168.65.1	curl/8.7.1	sessions	340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4	\N
549	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:40:47.973+00	192.168.65.1	curl/8.7.1	sessions	f3a71e8d-a6cf-4949-9db1-5c5cb505111b	\N
550	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.24+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
551	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.72+00	192.168.65.1	curl/8.7.1	partners	7555b6c2-97ef-4ed1-a6ef-0c23b830028f	\N
552	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.75+00	192.168.65.1	curl/8.7.1	partners	03bc9658-fd65-4d83-9e49-952934db45af	\N
553	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.774+00	192.168.65.1	curl/8.7.1	partners	d1c1a1de-949a-46bc-adba-124315d106cb	\N
554	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.802+00	192.168.65.1	curl/8.7.1	partners	0fbcf083-1af5-416b-886c-4f40ede15ae7	\N
555	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.828+00	192.168.65.1	curl/8.7.1	partners	4b3e651f-63ce-4e6d-a699-e5f8f48554fc	\N
556	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.85+00	192.168.65.1	curl/8.7.1	partners	be73c710-fff0-4b88-8b9c-f0a4b09de867	\N
557	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.872+00	192.168.65.1	curl/8.7.1	partners	dc2a3b30-6fb6-4fda-bd92-c4ac65ce44fc	\N
558	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.894+00	192.168.65.1	curl/8.7.1	partners	631a0f2d-c537-48e7-8b8a-a683fcc6f41b	\N
559	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:41:11.917+00	192.168.65.1	curl/8.7.1	partners	7f5e63f9-2f2a-4ab6-9fc0-b68e5f624494	\N
560	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:43:36.926+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
561	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:43:44.69+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
562	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:27.794+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
563	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.273+00	192.168.65.1	curl/8.7.1	directus_fields	238	\N
564	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.347+00	192.168.65.1	curl/8.7.1	directus_fields	239	\N
565	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.387+00	192.168.65.1	curl/8.7.1	directus_fields	240	\N
566	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.424+00	192.168.65.1	curl/8.7.1	directus_fields	241	\N
567	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.458+00	192.168.65.1	curl/8.7.1	directus_fields	242	\N
568	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.49+00	192.168.65.1	curl/8.7.1	directus_fields	243	\N
569	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.52+00	192.168.65.1	curl/8.7.1	directus_fields	244	\N
570	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.565+00	192.168.65.1	curl/8.7.1	directus_fields	245	\N
571	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.606+00	192.168.65.1	curl/8.7.1	directus_fields	246	\N
572	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:28.643+00	192.168.65.1	curl/8.7.1	directus_fields	247	\N
573	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:45:54.391+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
574	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:46:19.825+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
575	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:46:33.305+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
576	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:13.04+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
577	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:23.872+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
578	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.351+00	192.168.65.1	curl/8.7.1	directus_permissions	1	\N
579	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.395+00	192.168.65.1	curl/8.7.1	directus_permissions	2	\N
580	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.427+00	192.168.65.1	curl/8.7.1	directus_permissions	3	\N
581	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.462+00	192.168.65.1	curl/8.7.1	directus_permissions	4	\N
582	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.498+00	192.168.65.1	curl/8.7.1	directus_permissions	5	\N
583	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.535+00	192.168.65.1	curl/8.7.1	directus_permissions	6	\N
584	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.57+00	192.168.65.1	curl/8.7.1	directus_permissions	7	\N
585	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.606+00	192.168.65.1	curl/8.7.1	directus_permissions	8	\N
586	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.645+00	192.168.65.1	curl/8.7.1	directus_permissions	9	\N
587	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.682+00	192.168.65.1	curl/8.7.1	directus_permissions	10	\N
588	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.723+00	192.168.65.1	curl/8.7.1	directus_permissions	11	\N
589	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.769+00	192.168.65.1	curl/8.7.1	directus_permissions	12	\N
590	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.813+00	192.168.65.1	curl/8.7.1	directus_permissions	13	\N
591	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:47:24.855+00	192.168.65.1	curl/8.7.1	directus_permissions	14	\N
592	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:54:53.631+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
593	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:55:17.024+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
594	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:55:23.559+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
595	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:55:32.515+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
596	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 19:20:35.022+00	192.168.65.1	node	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
597	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 20:08:16.584+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	navigation	062851c3-bada-4de3-b2ec-36284802ec21	http://localhost:8055
598	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 20:08:40.48+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	navigation	50ad2cf6-825e-4221-b095-13563d0bff53	http://localhost:8055
599	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:16:05.976+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
600	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:16:21.252+00	192.168.65.1	curl/8.7.1	directus_fields	248	\N
601	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:16:21.389+00	192.168.65.1	curl/8.7.1	directus_fields	249	\N
602	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:16:21.446+00	192.168.65.1	curl/8.7.1	directus_fields	250	\N
603	create	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:16:21.482+00	192.168.65.1	curl/8.7.1	directus_fields	251	\N
604	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:21:12.952+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
605	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:02.229+00	192.168.65.1	curl/8.7.1	hero	6cb11279-54d4-449e-9ac4-c55d43c27d46	\N
606	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:02.263+00	192.168.65.1	curl/8.7.1	footer	acb25ee5-8521-4c69-a5f5-79c495345206	\N
607	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.122+00	192.168.65.1	curl/8.7.1	speakers	3c211554-efa2-4bc0-bc41-ab4149e017cc	\N
608	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.141+00	192.168.65.1	curl/8.7.1	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	\N
609	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.159+00	192.168.65.1	curl/8.7.1	speakers	75612f84-bbd9-4f65-96d7-e3568a37ecb9	\N
610	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.176+00	192.168.65.1	curl/8.7.1	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	\N
611	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.193+00	192.168.65.1	curl/8.7.1	speakers	e159b144-6ec8-42a4-b43d-b4a9ccefcb77	\N
612	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:24:03.212+00	192.168.65.1	curl/8.7.1	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	\N
613	login	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:53:03.796+00	192.168.65.1	curl/8.7.1	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N
614	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:53:04.262+00	192.168.65.1	curl/8.7.1	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	\N
615	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:53:04.288+00	192.168.65.1	curl/8.7.1	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	\N
616	update	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 23:53:04.308+00	192.168.65.1	curl/8.7.1	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
pages	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
navigation	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	\N	\N	open	\N	f
hero	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
about	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
speakers_section	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
speakers	\N	\N	\N	f	f	\N	status	t	archived	\N	sort	all	\N	\N	\N	\N	open	\N	f
schedule_days	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	\N	\N	open	\N	f
sessions	\N	\N	\N	f	f	\N	status	t	archived	\N	sort	all	\N	\N	\N	\N	open	\N	f
sessions_speakers	\N	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
programme_section	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
partners	\N	\N	\N	f	f	\N	status	t	archived	\N	sort	all	\N	\N	\N	\N	open	\N	f
partners_section	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
footer	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_deployment_projects; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_deployment_projects (id, deployment, external_id, name, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_deployment_runs; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_deployment_runs (id, project, external_id, target, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_deployments; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_deployments (id, provider, credentials, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message, searchable) FROM stdin;
158	pages	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
159	navigation	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
160	hero	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
161	about	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
162	speakers_section	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
163	speakers	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
164	schedule_days	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
165	sessions	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
166	sessions_speakers	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
167	programme_section	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
168	partners	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
169	partners_section	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
170	footer	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
171	pages	title	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	f	\N	\N	\N	t
172	pages	slug	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
173	pages	seo_title	\N	input	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
174	pages	seo_description	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
175	pages	og_image	file	file-image	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
176	navigation	label	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	f	\N	\N	\N	t
177	navigation	url	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
178	navigation	is_cta	\N	boolean	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
179	navigation	sort	\N	input	\N	\N	\N	f	t	5	full	\N	\N	\N	f	\N	\N	\N	t
180	hero	subtitle	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
181	hero	title	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
182	hero	year	\N	input	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
183	hero	tagline	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
184	hero	dates	\N	input	\N	\N	\N	f	f	6	half	\N	\N	\N	f	\N	\N	\N	t
185	hero	venue	\N	input	\N	\N	\N	f	f	7	half	\N	\N	\N	f	\N	\N	\N	t
186	hero	image	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
187	hero	cta_label	\N	input	\N	\N	\N	f	f	9	half	\N	\N	\N	f	\N	\N	\N	t
188	hero	cta_url	\N	input	\N	\N	\N	f	f	10	half	\N	\N	\N	f	\N	\N	\N	t
189	about	label	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
190	about	heading	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
191	about	body	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
192	about	stat_1_value	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N	t
193	about	stat_1_label	\N	input	\N	\N	\N	f	f	6	half	\N	\N	\N	f	\N	\N	\N	t
194	about	stat_2_value	\N	input	\N	\N	\N	f	f	7	half	\N	\N	\N	f	\N	\N	\N	t
195	about	stat_2_label	\N	input	\N	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N	t
196	about	stat_3_value	\N	input	\N	\N	\N	f	f	9	half	\N	\N	\N	f	\N	\N	\N	t
197	about	stat_3_label	\N	input	\N	\N	\N	f	f	10	half	\N	\N	\N	f	\N	\N	\N	t
198	speakers_section	label	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
199	speakers_section	heading	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
200	speakers	name	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	f	\N	\N	\N	t
201	speakers	role	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
202	speakers	company	\N	input	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
203	speakers	company_url	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N	t
204	speakers	headshot	file	file-image	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
205	speakers	sort	\N	input	\N	\N	\N	f	t	7	full	\N	\N	\N	f	\N	\N	\N	t
206	speakers	status	\N	select-dropdown	{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]}	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N	t
207	schedule_days	day_number	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	f	\N	\N	\N	t
208	schedule_days	title	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
209	schedule_days	date	\N	datetime	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
210	schedule_days	sort	\N	input	\N	\N	\N	f	t	5	full	\N	\N	\N	f	\N	\N	\N	t
211	sessions	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
212	sessions	type	\N	select-dropdown	{"choices":[{"text":"Keynote","value":"keynote"},{"text":"Panel","value":"panel"},{"text":"Talk","value":"talk"},{"text":"Workshop","value":"workshop"},{"text":"Event","value":"event"}]}	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
213	sessions	start_time	\N	datetime	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
214	sessions	room	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N	t
215	sessions	day	m2o	select-dropdown-m2o	\N	\N	\N	f	f	6	half	\N	\N	\N	f	\N	\N	\N	t
216	sessions	sort	\N	input	\N	\N	\N	f	t	7	full	\N	\N	\N	f	\N	\N	\N	t
217	sessions	status	\N	select-dropdown	{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]}	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N	t
218	sessions_speakers	sessions_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N	t
219	sessions_speakers	speakers_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N	t
220	programme_section	label	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
221	programme_section	heading	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
222	partners	name	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	f	\N	\N	\N	t
223	partners	tier	\N	select-dropdown	{"choices":[{"text":"Gold","value":"gold"},{"text":"Silver","value":"silver"},{"text":"Bronze","value":"bronze"}]}	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
224	partners	logo	file	file-image	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
225	partners	website	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
226	partners	sort	\N	input	\N	\N	\N	f	t	6	full	\N	\N	\N	f	\N	\N	\N	t
227	partners	status	\N	select-dropdown	{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]}	\N	\N	f	f	7	half	\N	\N	\N	f	\N	\N	\N	t
228	partners_section	label	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
229	partners_section	heading	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
230	footer	cta_text	\N	input-multiline	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
231	footer	cta_label	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	f	\N	\N	\N	t
232	footer	cta_url	\N	input	\N	\N	\N	f	f	4	half	\N	\N	\N	f	\N	\N	\N	t
233	footer	twitter_url	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N	t
234	footer	instagram_url	\N	input	\N	\N	\N	f	f	6	half	\N	\N	\N	f	\N	\N	\N	t
235	footer	linkedin_url	\N	input	\N	\N	\N	f	f	7	half	\N	\N	\N	f	\N	\N	\N	t
236	sessions	speakers	m2m	list-m2m	{"template":"{{speakers_id.name}}"}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
237	schedule_days	sessions	o2m	list-o2m	{"template":"{{title}}"}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
238	speakers	date_created	date-created	datetime	\N	\N	\N	t	t	9	half	\N	\N	\N	f	\N	\N	\N	t
239	speakers	date_updated	date-updated	datetime	\N	\N	\N	t	t	10	half	\N	\N	\N	f	\N	\N	\N	t
240	sessions	date_created	date-created	datetime	\N	\N	\N	t	t	10	half	\N	\N	\N	f	\N	\N	\N	t
241	sessions	date_updated	date-updated	datetime	\N	\N	\N	t	t	11	half	\N	\N	\N	f	\N	\N	\N	t
242	schedule_days	date_created	date-created	datetime	\N	\N	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N	t
243	schedule_days	date_updated	date-updated	datetime	\N	\N	\N	t	t	8	half	\N	\N	\N	f	\N	\N	\N	t
244	navigation	date_created	date-created	datetime	\N	\N	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N	t
245	navigation	date_updated	date-updated	datetime	\N	\N	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N	t
246	partners	date_created	date-created	datetime	\N	\N	\N	t	t	8	half	\N	\N	\N	f	\N	\N	\N	t
247	partners	date_updated	date-updated	datetime	\N	\N	\N	t	t	9	half	\N	\N	\N	f	\N	\N	\N	t
248	hero	subtitle_mobile	\N	input	\N	\N	\N	f	f	11	full	\N	Shortened subtitle for mobile screens	\N	f	\N	\N	\N	t
249	footer	cta_text_mobile	\N	input-multiline	\N	\N	\N	f	f	8	full	\N	Shortened CTA text for mobile screens	\N	f	\N	\N	\N	t
250	speakers	role_mobile	\N	input	\N	\N	\N	f	f	11	full	\N	Shortened role for mobile screens	\N	f	\N	\N	\N	t
251	speakers	company_mobile	\N	input	\N	\N	\N	f	f	12	full	\N	Shortened company name for mobile screens	\N	f	\N	\N	\N	t
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
f6beaffe-9605-43fd-9a94-f9c82172f6cd	local	f6beaffe-9605-43fd-9a94-f9c82172f6cd.png	Hero-image.png	Hero Image	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:58.461+00	\N	2026-03-04 18:36:58.809+00	\N	7864196	2752	1536	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:58.806+00
0f167ca6-6050-406b-a14f-36ad6b08452f	local	0f167ca6-6050-406b-a14f-36ad6b08452f.png	elena-vasquez.png	Elena Vasquez	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.467+00	\N	2026-03-04 18:36:59.506+00	\N	1749183	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:59.504+00
c99b6bac-dcd4-428a-a625-73224bc0545c	local	c99b6bac-dcd4-428a-a625-73224bc0545c.png	james-okonkwo.png	James Okonkwo	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.561+00	\N	2026-03-04 18:36:59.606+00	\N	1704796	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:59.605+00
140025b1-41fc-457b-9c03-5b4d6841608f	local	140025b1-41fc-457b-9c03-5b4d6841608f.png	lina-petersson.png	Lina Petersson	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.659+00	\N	2026-03-04 18:36:59.706+00	\N	1897766	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:59.705+00
25ec1694-34b1-4582-b4fe-107cf42a0ece	local	25ec1694-34b1-4582-b4fe-107cf42a0ece.png	ravi-mehta.png	Ravi Mehta	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.788+00	\N	2026-03-04 18:36:59.841+00	\N	1846257	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:59.839+00
6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9	local	6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9.png	sophie-laurent.png	Sophie Laurent	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:36:59.904+00	\N	2026-03-04 18:36:59.962+00	\N	2053047	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:36:59.96+00
fea91a70-407c-4194-8611-3a4b2743d4d9	local	fea91a70-407c-4194-8611-3a4b2743d4d9.png	marcus-brandt.png	Marcus Brandt	image/png	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.043+00	\N	2026-03-04 18:37:00.104+00	\N	2109922	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-04 18:37:00.102+00
594fa220-8bdf-4c7d-b38c-42c024f40578	local	594fa220-8bdf-4c7d-b38c-42c024f40578.svg	meridian-structures.svg	Meridian Structures	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.169+00	\N	2026-03-04 18:37:00.182+00	\N	9171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:00.18+00
9257911c-4480-41eb-8c6f-460df4b3e423	local	9257911c-4480-41eb-8c6f-460df4b3e423.svg	axiom-engineering.svg	Axiom Engineering	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.28+00	\N	2026-03-04 18:37:00.296+00	\N	11203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:00.293+00
ba961b2a-f87c-4b73-9b46-9fde48b18179	local	ba961b2a-f87c-4b73-9b46-9fde48b18179.svg	canopy-design.svg	Canopy Design	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.407+00	\N	2026-03-04 18:37:00.424+00	\N	9451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:00.422+00
713df7b0-279f-42ec-a229-2534ee4014af	local	713df7b0-279f-42ec-a229-2534ee4014af.svg	northlight-architecture.svg	Northlight Architecture	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:00.545+00	\N	2026-03-04 18:37:00.56+00	\N	11290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:00.559+00
80d6df78-4eba-4355-9662-655b3d39f7d9	local	80d6df78-4eba-4355-9662-655b3d39f7d9.svg	terraverde-materials.svg	Terraverde Materials	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.065+00	\N	2026-03-04 18:37:01.108+00	\N	9871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:01.106+00
5e22b965-bbcd-48b5-8e93-a173288b334b	local	5e22b965-bbcd-48b5-8e93-a173288b334b.svg	skyline-consulting.svg	Skyline Consulting	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.316+00	\N	2026-03-04 18:37:01.327+00	\N	8798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:01.326+00
0434af03-7e74-47b7-a6c8-90740ebb4d94	local	0434af03-7e74-47b7-a6c8-90740ebb4d94.svg	blueprint-analytics.svg	Blueprint Analytics	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.452+00	\N	2026-03-04 18:37:01.466+00	\N	9117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:01.463+00
d8ec1e92-f2f5-41f4-ba96-871e02f9b666	local	d8ec1e92-f2f5-41f4-ba96-871e02f9b666.svg	formlab-studio.svg	FormLab Studio	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:01.855+00	\N	2026-03-04 18:37:01.95+00	\N	7012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:01.926+00
a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59	local	a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59.svg	atlas-construction.svg	Atlas Construction	image/svg+xml	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-04 18:37:02.301+00	\N	2026-03-04 18:37:02.368+00	\N	12352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-04 18:37:02.366+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2026-02-27 12:19:46.754653+00
20201029A	Remove System Relations	2026-02-27 12:19:46.757824+00
20201029B	Remove System Collections	2026-02-27 12:19:46.76148+00
20201029C	Remove System Fields	2026-02-27 12:19:46.765743+00
20201105A	Add Cascade System Relations	2026-02-27 12:19:46.781892+00
20201105B	Change Webhook URL Type	2026-02-27 12:19:46.784707+00
20210225A	Add Relations Sort Field	2026-02-27 12:19:46.787042+00
20210304A	Remove Locked Fields	2026-02-27 12:19:46.787975+00
20210312A	Webhooks Collections Text	2026-02-27 12:19:46.790241+00
20210331A	Add Refresh Interval	2026-02-27 12:19:46.791026+00
20210415A	Make Filesize Nullable	2026-02-27 12:19:46.793677+00
20210416A	Add Collections Accountability	2026-02-27 12:19:46.795077+00
20210422A	Remove Files Interface	2026-02-27 12:19:46.795783+00
20210506A	Rename Interfaces	2026-02-27 12:19:46.801694+00
20210510A	Restructure Relations	2026-02-27 12:19:46.805559+00
20210518A	Add Foreign Key Constraints	2026-02-27 12:19:46.80862+00
20210519A	Add System Fk Triggers	2026-02-27 12:19:46.818191+00
20210521A	Add Collections Icon Color	2026-02-27 12:19:46.819045+00
20210525A	Add Insights	2026-02-27 12:19:46.825407+00
20210608A	Add Deep Clone Config	2026-02-27 12:19:46.826213+00
20210626A	Change Filesize Bigint	2026-02-27 12:19:46.83302+00
20210716A	Add Conditions to Fields	2026-02-27 12:19:46.834561+00
20210721A	Add Default Folder	2026-02-27 12:19:46.838028+00
20210802A	Replace Groups	2026-02-27 12:19:46.840054+00
20210803A	Add Required to Fields	2026-02-27 12:19:46.840992+00
20210805A	Update Groups	2026-02-27 12:19:46.843103+00
20210805B	Change Image Metadata Structure	2026-02-27 12:19:46.845641+00
20210811A	Add Geometry Config	2026-02-27 12:19:46.847821+00
20210831A	Remove Limit Column	2026-02-27 12:19:46.84962+00
20210903A	Add Auth Provider	2026-02-27 12:19:46.860435+00
20210907A	Webhooks Collections Not Null	2026-02-27 12:19:46.863641+00
20210910A	Move Module Setup	2026-02-27 12:19:46.864958+00
20210920A	Webhooks URL Not Null	2026-02-27 12:19:46.868319+00
20210924A	Add Collection Organization	2026-02-27 12:19:46.872814+00
20210927A	Replace Fields Group	2026-02-27 12:19:46.882525+00
20210927B	Replace M2M Interface	2026-02-27 12:19:46.888842+00
20210929A	Rename Login Action	2026-02-27 12:19:46.891634+00
20211007A	Update Presets	2026-02-27 12:19:46.899096+00
20211009A	Add Auth Data	2026-02-27 12:19:46.902664+00
20211016A	Add Webhook Headers	2026-02-27 12:19:46.904297+00
20211103A	Set Unique to User Token	2026-02-27 12:19:46.906317+00
20211103B	Update Special Geometry	2026-02-27 12:19:46.907493+00
20211104A	Remove Collections Listing	2026-02-27 12:19:46.908645+00
20211118A	Add Notifications	2026-02-27 12:19:46.915208+00
20211211A	Add Shares	2026-02-27 12:19:46.921836+00
20211230A	Add Project Descriptor	2026-02-27 12:19:46.92267+00
20220303A	Remove Default Project Color	2026-02-27 12:19:46.924725+00
20220308A	Add Bookmark Icon and Color	2026-02-27 12:19:46.925646+00
20220314A	Add Translation Strings	2026-02-27 12:19:46.926308+00
20220322A	Rename Field Typecast Flags	2026-02-27 12:19:46.927655+00
20220323A	Add Field Validation	2026-02-27 12:19:46.928387+00
20220325A	Fix Typecast Flags	2026-02-27 12:19:46.929762+00
20220325B	Add Default Language	2026-02-27 12:19:46.932244+00
20220402A	Remove Default Value Panel Icon	2026-02-27 12:19:46.934198+00
20220429A	Add Flows	2026-02-27 12:19:46.945537+00
20220429B	Add Color to Insights Icon	2026-02-27 12:19:46.94642+00
20220429C	Drop Non Null From IP of Activity	2026-02-27 12:19:46.94716+00
20220429D	Drop Non Null From Sender of Notifications	2026-02-27 12:19:46.947917+00
20220614A	Rename Hook Trigger to Event	2026-02-27 12:19:46.948609+00
20220801A	Update Notifications Timestamp Column	2026-02-27 12:19:46.950721+00
20220802A	Add Custom Aspect Ratios	2026-02-27 12:19:46.951464+00
20220826A	Add Origin to Accountability	2026-02-27 12:19:46.952425+00
20230401A	Update Material Icons	2026-02-27 12:19:46.954681+00
20230525A	Add Preview Settings	2026-02-27 12:19:46.955355+00
20230526A	Migrate Translation Strings	2026-02-27 12:19:46.958993+00
20230721A	Require Shares Fields	2026-02-27 12:19:46.960687+00
20230823A	Add Content Versioning	2026-02-27 12:19:46.967369+00
20230927A	Themes	2026-02-27 12:19:46.971796+00
20231009A	Update CSV Fields to Text	2026-02-27 12:19:46.973673+00
20231009B	Update Panel Options	2026-02-27 12:19:46.974403+00
20231010A	Add Extensions	2026-02-27 12:19:46.976016+00
20231215A	Add Focalpoints	2026-02-27 12:19:46.976691+00
20240122A	Add Report URL Fields	2026-02-27 12:19:46.977466+00
20240204A	Marketplace	2026-02-27 12:19:46.984116+00
20240305A	Change Useragent Type	2026-02-27 12:19:46.987188+00
20240311A	Deprecate Webhooks	2026-02-27 12:19:46.990496+00
20240422A	Public Registration	2026-02-27 12:19:46.992583+00
20240515A	Add Session Window	2026-02-27 12:19:46.993402+00
20240701A	Add Tus Data	2026-02-27 12:19:46.994429+00
20240716A	Update Files Date Fields	2026-02-27 12:19:46.997082+00
20240806A	Permissions Policies	2026-02-27 12:19:47.010698+00
20240817A	Update Icon Fields Length	2026-02-27 12:19:47.016818+00
20240909A	Separate Comments	2026-02-27 12:19:47.021647+00
20240909B	Consolidate Content Versioning	2026-02-27 12:19:47.022588+00
20240924A	Migrate Legacy Comments	2026-02-27 12:19:47.024639+00
20240924B	Populate Versioning Deltas	2026-02-27 12:19:47.026199+00
20250224A	Visual Editor	2026-02-27 12:19:47.027269+00
20250609A	License Banner	2026-02-27 12:19:47.028724+00
20250613A	Add Project ID	2026-02-27 12:19:47.033014+00
20250718A	Add Direction	2026-02-27 12:19:47.033898+00
20250813A	Add MCP	2026-02-27 12:19:47.035294+00
20251012A	Add Field Searchable	2026-02-27 12:19:47.036056+00
20251014A	Add Project Owner	2026-02-27 12:19:47.055072+00
20251028A	Add Retention Indexes	2026-02-27 12:19:47.07666+00
20251103A	Add AI Settings	2026-02-27 12:19:47.077844+00
20251224A	Remove Webhooks	2026-02-27 12:19:47.079931+00
20260110A	Add AI Provider Settings	2026-02-27 12:19:47.08168+00
20260113A	Add Revisions Index	2026-02-27 12:19:47.089632+00
20260128A	Add Collaborative Editing	2026-02-27 12:19:47.090709+00
20260204A	Add Deployment	2026-02-27 12:19:47.101757+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	pages	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
2	navigation	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
3	hero	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
4	about	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
5	speakers_section	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
6	speakers	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
7	schedule_days	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
8	sessions	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
9	sessions_speakers	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
10	programme_section	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
11	partners	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
12	partners_section	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
13	footer	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
14	directus_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
141bfc2f-27de-4f77-9c36-748c35a3bf5f	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
1	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
2	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
3	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N	schedule_days	\N	\N	{"tabular":{"sort":["sort"],"page":1,"fields":["date","day_number","sessions","title"]}}	{"tabular":{"widths":{"date":105.00390625,"day_number":147.953125,"sessions":105.3671875,"title":160}}}	\N	\N	bookmark	\N
4	\N	c0672fd6-e08a-4cc9-9d1a-67294afe926f	\N	sessions	\N	tabular	{"tabular":{"page":1,"fields":["room","start_time","title","type"]}}	{"tabular":{"widths":{"room":160,"start_time":160,"title":298.90234375,"type":160}},"kanban":{"groupOrder":{"groupField":"type","sortMap":{"keynote":0,"panel":1,"talk":2,"workshop":3,"event":4}}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
25	sessions	day	schedule_days	sessions	\N	\N	\N	sort	nullify
26	sessions_speakers	sessions_id	sessions	speakers	\N	\N	speakers_id	\N	nullify
27	sessions_speakers	speakers_id	speakers	\N	\N	\N	sessions_id	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019c9f0a-6ed8-7420-84ea-a614c33c1365","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"pegahcode@gmail.com","project_usage":"personal","org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5-nano","gpt-5-mini","gpt-5"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-5"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false}	{"project_owner":"pegahcode@gmail.com","project_usage":"personal","org_name":null,"product_updates":false,"project_status":null}	\N	\N
2	4	directus_users	c0672fd6-e08a-4cc9-9d1a-67294afe926f	{"id":"c0672fd6-e08a-4cc9-9d1a-67294afe926f","first_name":"pegah","last_name":"fallah","email":"admin@projectdaedalus.dev","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"cc1156d2-0860-48f6-a13b-3bfdd25e0b8e","token":null,"last_access":"2026-03-02T15:02:42.612Z","last_page":"/users/c0672fd6-e08a-4cc9-9d1a-67294afe926f","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"first_name":"pegah","last_name":"fallah"}	\N	\N
3	6	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	\N	\N
4	7	directus_fields	2	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	\N	\N
5	8	directus_fields	3	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	\N	\N
6	9	directus_fields	4	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	\N	\N
7	10	directus_fields	5	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	\N	\N
8	11	directus_fields	6	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	\N	\N
9	12	directus_collections	pages	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"pages"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"pages"}	\N	\N
10	13	directus_collections	pages	{"collection":"pages","icon":null,"note":"landing page meta data and wrapper","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"note":"landing page meta data and wrapper"}	\N	\N
11	14	directus_fields	7	{"sort":7,"interface":"input","special":null,"required":false,"collection":"pages","field":"slug"}	{"sort":7,"interface":"input","special":null,"required":false,"collection":"pages","field":"slug"}	\N	\N
12	15	directus_fields	8	{"sort":8,"interface":"input","special":null,"collection":"pages","field":"seo_title"}	{"sort":8,"interface":"input","special":null,"collection":"pages","field":"seo_title"}	\N	\N
13	16	directus_fields	9	{"sort":9,"interface":"input","special":null,"collection":"pages","field":"seo_description"}	{"sort":9,"interface":"input","special":null,"collection":"pages","field":"seo_description"}	\N	\N
14	17	directus_fields	10	{"sort":10,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	{"sort":10,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	\N	\N
15	18	directus_fields	11	{"sort":1,"hidden":true,"field":"id","collection":"pages_files"}	{"sort":1,"hidden":true,"field":"id","collection":"pages_files"}	\N	\N
16	19	directus_collections	pages_files	{"hidden":true,"icon":"import_export","collection":"pages_files"}	{"hidden":true,"icon":"import_export","collection":"pages_files"}	\N	\N
17	20	directus_fields	12	{"sort":2,"hidden":true,"collection":"pages_files","field":"pages_id"}	{"sort":2,"hidden":true,"collection":"pages_files","field":"pages_id"}	\N	\N
18	21	directus_fields	13	{"sort":3,"hidden":true,"collection":"pages_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"pages_files","field":"directus_files_id"}	\N	\N
19	22	directus_fields	14	{"sort":11,"interface":"list-m2m","special":["m2m"],"collection":"pages","field":"sections"}	{"sort":11,"interface":"list-m2m","special":["m2m"],"collection":"pages","field":"sections"}	\N	\N
20	23	directus_fields	15	{"sort":1,"hidden":true,"field":"id","collection":"pages_page_sections"}	{"sort":1,"hidden":true,"field":"id","collection":"pages_page_sections"}	\N	\N
21	24	directus_collections	pages_page_sections	{"hidden":true,"icon":"import_export","collection":"pages_page_sections"}	{"hidden":true,"icon":"import_export","collection":"pages_page_sections"}	\N	\N
22	25	directus_fields	16	{"sort":1,"hidden":true,"field":"id","collection":"page_sections"}	{"sort":1,"hidden":true,"field":"id","collection":"page_sections"}	\N	\N
23	26	directus_collections	page_sections	{"collection":"page_sections"}	{"collection":"page_sections"}	\N	\N
24	27	directus_fields	17	{"sort":2,"hidden":true,"collection":"pages_page_sections","field":"pages_id"}	{"sort":2,"hidden":true,"collection":"pages_page_sections","field":"pages_id"}	\N	\N
25	28	directus_fields	18	{"sort":3,"hidden":true,"collection":"pages_page_sections","field":"page_sections_id"}	{"sort":3,"hidden":true,"collection":"pages_page_sections","field":"page_sections_id"}	\N	\N
26	29	directus_fields	19	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_sections","field":"page"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"page_sections","field":"page"}	\N	\N
27	30	directus_fields	20	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"section"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"section"}	\N	\N
28	31	directus_fields	21	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"section"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"section"}	\N	\N
29	32	directus_fields	22	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"section"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"section"}	\N	\N
30	33	directus_fields	23	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"section"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"section"}	\N	\N
31	34	directus_fields	24	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"section"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"section"}	\N	\N
32	35	directus_fields	25	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"section"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"section"}	\N	\N
33	36	directus_fields	26	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"section"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"section"}	\N	\N
34	37	directus_collections	section	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"section"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"section"}	\N	\N
35	38	directus_collections	page_sections	{"collection":"page_sections","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
36	39	directus_collections	pages	{"collection":"pages","icon":null,"note":"landing page meta data and wrapper","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
37	40	directus_collections	section	{"collection":"section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
38	41	directus_collections	pages_files	{"collection":"pages_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
39	42	directus_collections	pages_page_sections	{"collection":"pages_page_sections","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
40	43	directus_collections	pages	{"collection":"pages","icon":null,"note":"landing page meta data and wrapper","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
41	44	directus_collections	page_sections	{"collection":"page_sections","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
42	45	directus_collections	section	{"collection":"section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
43	46	directus_collections	pages_files	{"collection":"pages_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
44	47	directus_collections	pages_page_sections	{"collection":"pages_page_sections","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
45	80	directus_fields	27	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"pages"}	\N	\N
46	81	directus_fields	28	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"pages"}	\N	\N
47	82	directus_fields	29	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"pages"}	\N	\N
48	83	directus_fields	30	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"pages"}	\N	\N
49	84	directus_fields	31	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"pages"}	\N	\N
50	85	directus_fields	32	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"pages"}	\N	\N
51	86	directus_collections	pages	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"pages"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"pages"}	\N	\N
52	87	directus_fields	33	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"navigation"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"navigation"}	\N	\N
53	88	directus_fields	34	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"navigation"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"navigation"}	\N	\N
54	89	directus_fields	35	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"navigation"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"navigation"}	\N	\N
55	90	directus_fields	36	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"navigation"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"navigation"}	\N	\N
56	91	directus_fields	37	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"navigation"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"navigation"}	\N	\N
57	92	directus_fields	38	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"navigation"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"navigation"}	\N	\N
58	93	directus_fields	39	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"navigation"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"navigation"}	\N	\N
59	94	directus_collections	navigation	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"navigation"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"navigation"}	\N	\N
60	95	directus_fields	40	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero"}	\N	\N
72	107	directus_fields	51	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"about"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"about"}	\N	\N
73	108	directus_collections	about	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"about"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"about"}	\N	\N
86	121	directus_fields	63	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"speakers"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"speakers"}	\N	\N
88	123	directus_collections	speakers	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"speakers"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"speakers"}	\N	\N
61	96	directus_fields	41	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"hero"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"hero"}	\N	\N
62	97	directus_fields	42	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"hero"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"hero"}	\N	\N
63	98	directus_fields	43	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"hero"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"hero"}	\N	\N
64	99	directus_fields	44	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hero"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hero"}	\N	\N
65	100	directus_fields	45	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hero"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hero"}	\N	\N
66	101	directus_collections	hero	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"hero"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"hero"}	\N	\N
67	102	directus_fields	46	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"about"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"about"}	\N	\N
68	103	directus_fields	47	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"about"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"about"}	\N	\N
69	104	directus_fields	48	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"about"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"about"}	\N	\N
70	105	directus_fields	49	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"about"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"about"}	\N	\N
71	106	directus_fields	50	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"about"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"about"}	\N	\N
74	109	directus_fields	52	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	\N	\N
75	110	directus_fields	53	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"footer"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"footer"}	\N	\N
76	111	directus_fields	54	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"footer"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"footer"}	\N	\N
77	112	directus_fields	55	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"footer"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"footer"}	\N	\N
78	113	directus_fields	56	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"footer"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"footer"}	\N	\N
79	114	directus_fields	57	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"footer"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"footer"}	\N	\N
80	115	directus_collections	footer	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"footer"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":true,"collection":"footer"}	\N	\N
81	116	directus_fields	58	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"speakers"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"speakers"}	\N	\N
82	117	directus_fields	59	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"speakers"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"speakers"}	\N	\N
83	118	directus_fields	60	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"speakers"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"speakers"}	\N	\N
84	119	directus_fields	61	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"speakers"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"speakers"}	\N	\N
85	120	directus_fields	62	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"speakers"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"speakers"}	\N	\N
87	122	directus_fields	64	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"speakers"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"speakers"}	\N	\N
89	124	directus_fields	65	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"schedule_days"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"schedule_days"}	\N	\N
90	125	directus_fields	66	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"schedule_days"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"schedule_days"}	\N	\N
91	126	directus_fields	67	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"schedule_days"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"schedule_days"}	\N	\N
92	127	directus_fields	68	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"schedule_days"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"schedule_days"}	\N	\N
93	128	directus_fields	69	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"schedule_days"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"schedule_days"}	\N	\N
94	129	directus_fields	70	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"schedule_days"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"schedule_days"}	\N	\N
95	130	directus_fields	71	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"schedule_days"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"schedule_days"}	\N	\N
96	131	directus_collections	schedule_days	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"schedule_days"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"schedule_days"}	\N	\N
97	132	directus_fields	72	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sessions"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sessions"}	\N	\N
98	133	directus_fields	73	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"sessions"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"sessions"}	\N	\N
99	134	directus_fields	74	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"sessions"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"sessions"}	\N	\N
100	135	directus_fields	75	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"sessions"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"sessions"}	\N	\N
127	222	directus_collections	partners_section	{"singleton":true,"icon":"groups","note":"Partners section heading","collection":"partners_section"}	{"singleton":true,"icon":"groups","note":"Partners section heading","collection":"partners_section"}	\N	\N
101	136	directus_fields	76	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"sessions"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"sessions"}	\N	\N
102	137	directus_fields	77	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"sessions"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"sessions"}	\N	\N
103	138	directus_collections	sessions	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"sessions"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"sessions"}	\N	\N
104	199	directus_fields	78	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"pages"}	\N	\N
105	200	directus_collections	pages	{"singleton":true,"icon":"description","note":"Page-level settings","collection":"pages"}	{"singleton":true,"icon":"description","note":"Page-level settings","collection":"pages"}	\N	\N
106	201	directus_fields	79	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"navigation"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"navigation"}	\N	\N
107	202	directus_collections	navigation	{"singleton":false,"icon":"menu","note":"Navigation links","sort_field":"sort","collection":"navigation"}	{"singleton":false,"icon":"menu","note":"Navigation links","sort_field":"sort","collection":"navigation"}	\N	\N
108	203	directus_fields	80	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"hero"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"hero"}	\N	\N
109	204	directus_collections	hero	{"singleton":true,"icon":"photo_camera","note":"Hero section","collection":"hero"}	{"singleton":true,"icon":"photo_camera","note":"Hero section","collection":"hero"}	\N	\N
110	205	directus_fields	81	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"about"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"about"}	\N	\N
111	206	directus_collections	about	{"singleton":true,"icon":"info","note":"About section","collection":"about"}	{"singleton":true,"icon":"info","note":"About section","collection":"about"}	\N	\N
112	207	directus_fields	82	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"speakers_section"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"speakers_section"}	\N	\N
113	208	directus_collections	speakers_section	{"singleton":true,"icon":"record_voice_over","note":"Speakers section heading","collection":"speakers_section"}	{"singleton":true,"icon":"record_voice_over","note":"Speakers section heading","collection":"speakers_section"}	\N	\N
114	209	directus_fields	83	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"speakers"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"speakers"}	\N	\N
115	210	directus_collections	speakers	{"singleton":false,"icon":"person","note":"Speaker profiles","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"speakers"}	{"singleton":false,"icon":"person","note":"Speaker profiles","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"speakers"}	\N	\N
116	211	directus_fields	84	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"schedule_days"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"schedule_days"}	\N	\N
117	212	directus_collections	schedule_days	{"singleton":false,"icon":"calendar_today","note":"Conference days","sort_field":"sort","collection":"schedule_days"}	{"singleton":false,"icon":"calendar_today","note":"Conference days","sort_field":"sort","collection":"schedule_days"}	\N	\N
118	213	directus_fields	85	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"sessions"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"sessions"}	\N	\N
119	214	directus_collections	sessions	{"singleton":false,"icon":"event","note":"Conference sessions","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"sessions"}	{"singleton":false,"icon":"event","note":"Conference sessions","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"sessions"}	\N	\N
120	215	directus_fields	86	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"sessions_speakers"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"sessions_speakers"}	\N	\N
121	216	directus_collections	sessions_speakers	{"singleton":false,"icon":"link","hidden":true,"collection":"sessions_speakers"}	{"singleton":false,"icon":"link","hidden":true,"collection":"sessions_speakers"}	\N	\N
122	217	directus_fields	87	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"programme_section"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"programme_section"}	\N	\N
123	218	directus_collections	programme_section	{"singleton":true,"icon":"schedule","note":"Programme section heading","collection":"programme_section"}	{"singleton":true,"icon":"schedule","note":"Programme section heading","collection":"programme_section"}	\N	\N
124	219	directus_fields	88	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"partners"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"partners"}	\N	\N
125	220	directus_collections	partners	{"singleton":false,"icon":"handshake","note":"Sponsor/partner logos","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"partners"}	{"singleton":false,"icon":"handshake","note":"Sponsor/partner logos","sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"partners"}	\N	\N
126	221	directus_fields	89	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"partners_section"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"partners_section"}	\N	\N
220	409	directus_collections	partners_section	{"singleton":true,"collection":"partners_section"}	{"singleton":true,"collection":"partners_section"}	\N	\N
128	223	directus_fields	90	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"footer"}	{"sort":1,"hidden":true,"interface":"numeric","readonly":true,"field":"id","collection":"footer"}	\N	\N
129	224	directus_collections	footer	{"singleton":true,"icon":"call_to_action","note":"Footer content","collection":"footer"}	{"singleton":true,"icon":"call_to_action","note":"Footer content","collection":"footer"}	\N	\N
130	225	directus_fields	91	{"sort":2,"interface":"input","width":"half","collection":"pages","field":"title"}	{"sort":2,"interface":"input","width":"half","collection":"pages","field":"title"}	\N	\N
131	226	directus_fields	92	{"sort":3,"interface":"input","width":"half","collection":"pages","field":"slug"}	{"sort":3,"interface":"input","width":"half","collection":"pages","field":"slug"}	\N	\N
132	227	directus_fields	93	{"sort":4,"interface":"input","width":"half","collection":"pages","field":"seo_title"}	{"sort":4,"interface":"input","width":"half","collection":"pages","field":"seo_title"}	\N	\N
133	228	directus_fields	94	{"sort":5,"interface":"input-multiline","width":"full","collection":"pages","field":"seo_description"}	{"sort":5,"interface":"input-multiline","width":"full","collection":"pages","field":"seo_description"}	\N	\N
134	229	directus_fields	95	{"sort":6,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	\N	\N
135	230	directus_fields	96	{"sort":2,"interface":"input","width":"half","collection":"navigation","field":"label"}	{"sort":2,"interface":"input","width":"half","collection":"navigation","field":"label"}	\N	\N
136	231	directus_fields	97	{"sort":3,"interface":"input","width":"half","collection":"navigation","field":"url"}	{"sort":3,"interface":"input","width":"half","collection":"navigation","field":"url"}	\N	\N
137	232	directus_fields	98	{"sort":4,"interface":"boolean","width":"half","collection":"navigation","field":"is_cta"}	{"sort":4,"interface":"boolean","width":"half","collection":"navigation","field":"is_cta"}	\N	\N
138	233	directus_fields	99	{"sort":5,"interface":"input","hidden":true,"collection":"navigation","field":"sort"}	{"sort":5,"interface":"input","hidden":true,"collection":"navigation","field":"sort"}	\N	\N
139	234	directus_fields	100	{"sort":2,"interface":"input","width":"full","collection":"hero","field":"subtitle"}	{"sort":2,"interface":"input","width":"full","collection":"hero","field":"subtitle"}	\N	\N
140	235	directus_fields	101	{"sort":3,"interface":"input","width":"half","collection":"hero","field":"title"}	{"sort":3,"interface":"input","width":"half","collection":"hero","field":"title"}	\N	\N
141	236	directus_fields	102	{"sort":4,"interface":"input","width":"half","collection":"hero","field":"year"}	{"sort":4,"interface":"input","width":"half","collection":"hero","field":"year"}	\N	\N
142	237	directus_fields	103	{"sort":5,"interface":"input","width":"full","collection":"hero","field":"tagline"}	{"sort":5,"interface":"input","width":"full","collection":"hero","field":"tagline"}	\N	\N
143	238	directus_fields	104	{"sort":6,"interface":"input","width":"half","collection":"hero","field":"dates"}	{"sort":6,"interface":"input","width":"half","collection":"hero","field":"dates"}	\N	\N
144	239	directus_fields	105	{"sort":7,"interface":"input","width":"half","collection":"hero","field":"venue"}	{"sort":7,"interface":"input","width":"half","collection":"hero","field":"venue"}	\N	\N
145	240	directus_fields	106	{"sort":8,"interface":"file-image","special":["file"],"collection":"hero","field":"image"}	{"sort":8,"interface":"file-image","special":["file"],"collection":"hero","field":"image"}	\N	\N
146	241	directus_fields	107	{"sort":9,"interface":"input","width":"half","collection":"hero","field":"cta_label"}	{"sort":9,"interface":"input","width":"half","collection":"hero","field":"cta_label"}	\N	\N
147	242	directus_fields	108	{"sort":10,"interface":"input","width":"half","collection":"hero","field":"cta_url"}	{"sort":10,"interface":"input","width":"half","collection":"hero","field":"cta_url"}	\N	\N
148	243	directus_fields	109	{"sort":2,"interface":"input","width":"full","collection":"about","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"about","field":"label"}	\N	\N
149	244	directus_fields	110	{"sort":3,"interface":"input","width":"full","collection":"about","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"about","field":"heading"}	\N	\N
150	245	directus_fields	111	{"sort":4,"interface":"input-multiline","width":"full","collection":"about","field":"body"}	{"sort":4,"interface":"input-multiline","width":"full","collection":"about","field":"body"}	\N	\N
151	246	directus_fields	112	{"sort":5,"interface":"input","width":"half","collection":"about","field":"stat_1_value"}	{"sort":5,"interface":"input","width":"half","collection":"about","field":"stat_1_value"}	\N	\N
152	247	directus_fields	113	{"sort":6,"interface":"input","width":"half","collection":"about","field":"stat_1_label"}	{"sort":6,"interface":"input","width":"half","collection":"about","field":"stat_1_label"}	\N	\N
153	248	directus_fields	114	{"sort":7,"interface":"input","width":"half","collection":"about","field":"stat_2_value"}	{"sort":7,"interface":"input","width":"half","collection":"about","field":"stat_2_value"}	\N	\N
154	249	directus_fields	115	{"sort":8,"interface":"input","width":"half","collection":"about","field":"stat_2_label"}	{"sort":8,"interface":"input","width":"half","collection":"about","field":"stat_2_label"}	\N	\N
155	250	directus_fields	116	{"sort":9,"interface":"input","width":"half","collection":"about","field":"stat_3_value"}	{"sort":9,"interface":"input","width":"half","collection":"about","field":"stat_3_value"}	\N	\N
156	251	directus_fields	117	{"sort":10,"interface":"input","width":"half","collection":"about","field":"stat_3_label"}	{"sort":10,"interface":"input","width":"half","collection":"about","field":"stat_3_label"}	\N	\N
157	252	directus_fields	118	{"sort":2,"interface":"input","width":"full","collection":"speakers_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"speakers_section","field":"label"}	\N	\N
158	253	directus_fields	119	{"sort":3,"interface":"input","width":"full","collection":"speakers_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"speakers_section","field":"heading"}	\N	\N
159	254	directus_fields	120	{"sort":2,"interface":"input","width":"half","collection":"speakers","field":"name"}	{"sort":2,"interface":"input","width":"half","collection":"speakers","field":"name"}	\N	\N
160	255	directus_fields	121	{"sort":3,"interface":"input","width":"half","collection":"speakers","field":"role"}	{"sort":3,"interface":"input","width":"half","collection":"speakers","field":"role"}	\N	\N
161	256	directus_fields	122	{"sort":4,"interface":"input","width":"half","collection":"speakers","field":"company"}	{"sort":4,"interface":"input","width":"half","collection":"speakers","field":"company"}	\N	\N
162	257	directus_fields	123	{"sort":5,"interface":"input","width":"half","collection":"speakers","field":"company_url"}	{"sort":5,"interface":"input","width":"half","collection":"speakers","field":"company_url"}	\N	\N
163	258	directus_fields	124	{"sort":6,"interface":"file-image","special":["file"],"collection":"speakers","field":"headshot"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"speakers","field":"headshot"}	\N	\N
164	259	directus_fields	125	{"sort":7,"interface":"input","hidden":true,"collection":"speakers","field":"sort"}	{"sort":7,"interface":"input","hidden":true,"collection":"speakers","field":"sort"}	\N	\N
165	260	directus_fields	126	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"speakers","field":"status"}	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"speakers","field":"status"}	\N	\N
166	261	directus_fields	127	{"sort":2,"interface":"input","width":"half","collection":"schedule_days","field":"day_number"}	{"sort":2,"interface":"input","width":"half","collection":"schedule_days","field":"day_number"}	\N	\N
167	262	directus_fields	128	{"sort":3,"interface":"input","width":"half","collection":"schedule_days","field":"title"}	{"sort":3,"interface":"input","width":"half","collection":"schedule_days","field":"title"}	\N	\N
168	263	directus_fields	129	{"sort":4,"interface":"datetime","width":"half","collection":"schedule_days","field":"date"}	{"sort":4,"interface":"datetime","width":"half","collection":"schedule_days","field":"date"}	\N	\N
169	264	directus_fields	130	{"sort":5,"interface":"input","hidden":true,"collection":"schedule_days","field":"sort"}	{"sort":5,"interface":"input","hidden":true,"collection":"schedule_days","field":"sort"}	\N	\N
170	265	directus_fields	131	{"sort":2,"interface":"input","width":"full","collection":"sessions","field":"title"}	{"sort":2,"interface":"input","width":"full","collection":"sessions","field":"title"}	\N	\N
171	266	directus_fields	132	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Keynote","value":"keynote"},{"text":"Panel","value":"panel"},{"text":"Talk","value":"talk"},{"text":"Workshop","value":"workshop"},{"text":"Event","value":"event"}]},"width":"half","collection":"sessions","field":"type"}	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Keynote","value":"keynote"},{"text":"Panel","value":"panel"},{"text":"Talk","value":"talk"},{"text":"Workshop","value":"workshop"},{"text":"Event","value":"event"}]},"width":"half","collection":"sessions","field":"type"}	\N	\N
172	267	directus_fields	133	{"sort":4,"interface":"datetime","width":"half","collection":"sessions","field":"start_time"}	{"sort":4,"interface":"datetime","width":"half","collection":"sessions","field":"start_time"}	\N	\N
173	268	directus_fields	134	{"sort":5,"interface":"input","width":"half","collection":"sessions","field":"room"}	{"sort":5,"interface":"input","width":"half","collection":"sessions","field":"room"}	\N	\N
174	269	directus_fields	135	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"width":"half","collection":"sessions","field":"day"}	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"width":"half","collection":"sessions","field":"day"}	\N	\N
175	270	directus_fields	136	{"sort":7,"interface":"input","hidden":true,"collection":"sessions","field":"sort"}	{"sort":7,"interface":"input","hidden":true,"collection":"sessions","field":"sort"}	\N	\N
176	271	directus_fields	137	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"sessions","field":"status"}	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"sessions","field":"status"}	\N	\N
177	272	directus_fields	138	{"sort":2,"hidden":true,"collection":"sessions_speakers","field":"sessions_id"}	{"sort":2,"hidden":true,"collection":"sessions_speakers","field":"sessions_id"}	\N	\N
178	273	directus_fields	139	{"sort":3,"hidden":true,"collection":"sessions_speakers","field":"speakers_id"}	{"sort":3,"hidden":true,"collection":"sessions_speakers","field":"speakers_id"}	\N	\N
179	274	directus_fields	140	{"sort":2,"interface":"input","width":"full","collection":"programme_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"programme_section","field":"label"}	\N	\N
180	275	directus_fields	141	{"sort":3,"interface":"input","width":"full","collection":"programme_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"programme_section","field":"heading"}	\N	\N
181	276	directus_fields	142	{"sort":2,"interface":"input","width":"half","collection":"partners","field":"name"}	{"sort":2,"interface":"input","width":"half","collection":"partners","field":"name"}	\N	\N
182	277	directus_fields	143	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Gold","value":"gold"},{"text":"Silver","value":"silver"},{"text":"Bronze","value":"bronze"}]},"width":"half","collection":"partners","field":"tier"}	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Gold","value":"gold"},{"text":"Silver","value":"silver"},{"text":"Bronze","value":"bronze"}]},"width":"half","collection":"partners","field":"tier"}	\N	\N
183	278	directus_fields	144	{"sort":4,"interface":"file-image","special":["file"],"collection":"partners","field":"logo"}	{"sort":4,"interface":"file-image","special":["file"],"collection":"partners","field":"logo"}	\N	\N
184	279	directus_fields	145	{"sort":5,"interface":"input","width":"full","collection":"partners","field":"website"}	{"sort":5,"interface":"input","width":"full","collection":"partners","field":"website"}	\N	\N
185	280	directus_fields	146	{"sort":6,"interface":"input","hidden":true,"collection":"partners","field":"sort"}	{"sort":6,"interface":"input","hidden":true,"collection":"partners","field":"sort"}	\N	\N
186	281	directus_fields	147	{"sort":7,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"partners","field":"status"}	{"sort":7,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"partners","field":"status"}	\N	\N
187	282	directus_fields	148	{"sort":2,"interface":"input","width":"full","collection":"partners_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"partners_section","field":"label"}	\N	\N
188	283	directus_fields	149	{"sort":3,"interface":"input","width":"full","collection":"partners_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"partners_section","field":"heading"}	\N	\N
189	284	directus_fields	150	{"sort":2,"interface":"input-multiline","width":"full","collection":"footer","field":"cta_text"}	{"sort":2,"interface":"input-multiline","width":"full","collection":"footer","field":"cta_text"}	\N	\N
190	285	directus_fields	151	{"sort":3,"interface":"input","width":"half","collection":"footer","field":"cta_label"}	{"sort":3,"interface":"input","width":"half","collection":"footer","field":"cta_label"}	\N	\N
191	286	directus_fields	152	{"sort":4,"interface":"input","width":"half","collection":"footer","field":"cta_url"}	{"sort":4,"interface":"input","width":"half","collection":"footer","field":"cta_url"}	\N	\N
192	287	directus_fields	153	{"sort":5,"interface":"input","width":"half","collection":"footer","field":"twitter_url"}	{"sort":5,"interface":"input","width":"half","collection":"footer","field":"twitter_url"}	\N	\N
193	288	directus_fields	154	{"sort":6,"interface":"input","width":"half","collection":"footer","field":"instagram_url"}	{"sort":6,"interface":"input","width":"half","collection":"footer","field":"instagram_url"}	\N	\N
194	289	directus_fields	155	{"sort":7,"interface":"input","width":"half","collection":"footer","field":"linkedin_url"}	{"sort":7,"interface":"input","width":"half","collection":"footer","field":"linkedin_url"}	\N	\N
195	290	directus_fields	156	{"sort":9,"interface":"list-m2m","special":["m2m"],"options":{"template":"{{speakers_id.name}}"},"collection":"sessions","field":"speakers"}	{"sort":9,"interface":"list-m2m","special":["m2m"],"options":{"template":"{{speakers_id.name}}"},"collection":"sessions","field":"speakers"}	\N	\N
196	291	directus_fields	157	{"sort":6,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{title}}"},"collection":"schedule_days","field":"sessions"}	{"sort":6,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{title}}"},"collection":"schedule_days","field":"sessions"}	\N	\N
197	386	directus_fields	158	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"pages"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"pages"}	\N	\N
198	387	directus_collections	pages	{"singleton":true,"collection":"pages"}	{"singleton":true,"collection":"pages"}	\N	\N
199	388	directus_fields	159	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"navigation"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"navigation"}	\N	\N
200	389	directus_collections	navigation	{"singleton":false,"sort_field":"sort","collection":"navigation"}	{"singleton":false,"sort_field":"sort","collection":"navigation"}	\N	\N
201	390	directus_fields	160	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"hero"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"hero"}	\N	\N
202	391	directus_collections	hero	{"singleton":true,"collection":"hero"}	{"singleton":true,"collection":"hero"}	\N	\N
203	392	directus_fields	161	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"about"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"about"}	\N	\N
204	393	directus_collections	about	{"singleton":true,"collection":"about"}	{"singleton":true,"collection":"about"}	\N	\N
205	394	directus_fields	162	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"speakers_section"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"speakers_section"}	\N	\N
206	395	directus_collections	speakers_section	{"singleton":true,"collection":"speakers_section"}	{"singleton":true,"collection":"speakers_section"}	\N	\N
207	396	directus_fields	163	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"speakers"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"speakers"}	\N	\N
208	397	directus_collections	speakers	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"speakers"}	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"speakers"}	\N	\N
209	398	directus_fields	164	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"schedule_days"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"schedule_days"}	\N	\N
210	399	directus_collections	schedule_days	{"singleton":false,"sort_field":"sort","collection":"schedule_days"}	{"singleton":false,"sort_field":"sort","collection":"schedule_days"}	\N	\N
211	400	directus_fields	165	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"sessions"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"sessions"}	\N	\N
212	401	directus_collections	sessions	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"sessions"}	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"sessions"}	\N	\N
213	402	directus_fields	166	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"sessions_speakers"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"sessions_speakers"}	\N	\N
214	403	directus_collections	sessions_speakers	{"singleton":false,"hidden":true,"collection":"sessions_speakers"}	{"singleton":false,"hidden":true,"collection":"sessions_speakers"}	\N	\N
215	404	directus_fields	167	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"programme_section"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"programme_section"}	\N	\N
216	405	directus_collections	programme_section	{"singleton":true,"collection":"programme_section"}	{"singleton":true,"collection":"programme_section"}	\N	\N
217	406	directus_fields	168	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"partners"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"partners"}	\N	\N
218	407	directus_collections	partners	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"partners"}	{"singleton":false,"sort_field":"sort","archive_field":"status","archive_value":"archived","collection":"partners"}	\N	\N
219	408	directus_fields	169	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"partners_section"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"partners_section"}	\N	\N
221	410	directus_fields	170	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"footer"}	{"sort":1,"special":["uuid"],"interface":"input","readonly":true,"hidden":true,"field":"id","collection":"footer"}	\N	\N
222	411	directus_collections	footer	{"singleton":true,"collection":"footer"}	{"singleton":true,"collection":"footer"}	\N	\N
223	412	directus_fields	171	{"sort":2,"interface":"input","width":"half","collection":"pages","field":"title"}	{"sort":2,"interface":"input","width":"half","collection":"pages","field":"title"}	\N	\N
224	413	directus_fields	172	{"sort":3,"interface":"input","width":"half","collection":"pages","field":"slug"}	{"sort":3,"interface":"input","width":"half","collection":"pages","field":"slug"}	\N	\N
225	414	directus_fields	173	{"sort":4,"interface":"input","width":"half","collection":"pages","field":"seo_title"}	{"sort":4,"interface":"input","width":"half","collection":"pages","field":"seo_title"}	\N	\N
226	415	directus_fields	174	{"sort":5,"interface":"input-multiline","width":"full","collection":"pages","field":"seo_description"}	{"sort":5,"interface":"input-multiline","width":"full","collection":"pages","field":"seo_description"}	\N	\N
227	416	directus_fields	175	{"sort":6,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"pages","field":"og_image"}	\N	\N
228	417	directus_fields	176	{"sort":2,"interface":"input","width":"half","collection":"navigation","field":"label"}	{"sort":2,"interface":"input","width":"half","collection":"navigation","field":"label"}	\N	\N
229	418	directus_fields	177	{"sort":3,"interface":"input","width":"half","collection":"navigation","field":"url"}	{"sort":3,"interface":"input","width":"half","collection":"navigation","field":"url"}	\N	\N
230	419	directus_fields	178	{"sort":4,"interface":"boolean","width":"half","collection":"navigation","field":"is_cta"}	{"sort":4,"interface":"boolean","width":"half","collection":"navigation","field":"is_cta"}	\N	\N
231	420	directus_fields	179	{"sort":5,"interface":"input","hidden":true,"collection":"navigation","field":"sort"}	{"sort":5,"interface":"input","hidden":true,"collection":"navigation","field":"sort"}	\N	\N
232	421	directus_fields	180	{"sort":2,"interface":"input","width":"full","collection":"hero","field":"subtitle"}	{"sort":2,"interface":"input","width":"full","collection":"hero","field":"subtitle"}	\N	\N
233	422	directus_fields	181	{"sort":3,"interface":"input","width":"half","collection":"hero","field":"title"}	{"sort":3,"interface":"input","width":"half","collection":"hero","field":"title"}	\N	\N
234	423	directus_fields	182	{"sort":4,"interface":"input","width":"half","collection":"hero","field":"year"}	{"sort":4,"interface":"input","width":"half","collection":"hero","field":"year"}	\N	\N
235	424	directus_fields	183	{"sort":5,"interface":"input","width":"full","collection":"hero","field":"tagline"}	{"sort":5,"interface":"input","width":"full","collection":"hero","field":"tagline"}	\N	\N
236	425	directus_fields	184	{"sort":6,"interface":"input","width":"half","collection":"hero","field":"dates"}	{"sort":6,"interface":"input","width":"half","collection":"hero","field":"dates"}	\N	\N
237	426	directus_fields	185	{"sort":7,"interface":"input","width":"half","collection":"hero","field":"venue"}	{"sort":7,"interface":"input","width":"half","collection":"hero","field":"venue"}	\N	\N
238	427	directus_fields	186	{"sort":8,"interface":"file-image","special":["file"],"collection":"hero","field":"image"}	{"sort":8,"interface":"file-image","special":["file"],"collection":"hero","field":"image"}	\N	\N
239	428	directus_fields	187	{"sort":9,"interface":"input","width":"half","collection":"hero","field":"cta_label"}	{"sort":9,"interface":"input","width":"half","collection":"hero","field":"cta_label"}	\N	\N
240	429	directus_fields	188	{"sort":10,"interface":"input","width":"half","collection":"hero","field":"cta_url"}	{"sort":10,"interface":"input","width":"half","collection":"hero","field":"cta_url"}	\N	\N
241	430	directus_fields	189	{"sort":2,"interface":"input","width":"full","collection":"about","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"about","field":"label"}	\N	\N
242	431	directus_fields	190	{"sort":3,"interface":"input","width":"full","collection":"about","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"about","field":"heading"}	\N	\N
243	432	directus_fields	191	{"sort":4,"interface":"input-multiline","width":"full","collection":"about","field":"body"}	{"sort":4,"interface":"input-multiline","width":"full","collection":"about","field":"body"}	\N	\N
244	433	directus_fields	192	{"sort":5,"interface":"input","width":"half","collection":"about","field":"stat_1_value"}	{"sort":5,"interface":"input","width":"half","collection":"about","field":"stat_1_value"}	\N	\N
245	434	directus_fields	193	{"sort":6,"interface":"input","width":"half","collection":"about","field":"stat_1_label"}	{"sort":6,"interface":"input","width":"half","collection":"about","field":"stat_1_label"}	\N	\N
246	435	directus_fields	194	{"sort":7,"interface":"input","width":"half","collection":"about","field":"stat_2_value"}	{"sort":7,"interface":"input","width":"half","collection":"about","field":"stat_2_value"}	\N	\N
247	436	directus_fields	195	{"sort":8,"interface":"input","width":"half","collection":"about","field":"stat_2_label"}	{"sort":8,"interface":"input","width":"half","collection":"about","field":"stat_2_label"}	\N	\N
248	437	directus_fields	196	{"sort":9,"interface":"input","width":"half","collection":"about","field":"stat_3_value"}	{"sort":9,"interface":"input","width":"half","collection":"about","field":"stat_3_value"}	\N	\N
249	438	directus_fields	197	{"sort":10,"interface":"input","width":"half","collection":"about","field":"stat_3_label"}	{"sort":10,"interface":"input","width":"half","collection":"about","field":"stat_3_label"}	\N	\N
250	439	directus_fields	198	{"sort":2,"interface":"input","width":"full","collection":"speakers_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"speakers_section","field":"label"}	\N	\N
251	440	directus_fields	199	{"sort":3,"interface":"input","width":"full","collection":"speakers_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"speakers_section","field":"heading"}	\N	\N
252	441	directus_fields	200	{"sort":2,"interface":"input","width":"half","collection":"speakers","field":"name"}	{"sort":2,"interface":"input","width":"half","collection":"speakers","field":"name"}	\N	\N
253	442	directus_fields	201	{"sort":3,"interface":"input","width":"half","collection":"speakers","field":"role"}	{"sort":3,"interface":"input","width":"half","collection":"speakers","field":"role"}	\N	\N
254	443	directus_fields	202	{"sort":4,"interface":"input","width":"half","collection":"speakers","field":"company"}	{"sort":4,"interface":"input","width":"half","collection":"speakers","field":"company"}	\N	\N
310	499	navigation	ad24d508-ad16-421a-a43d-bf2d4d25c352	{"label":"Register","url":"#register","is_cta":true,"sort":5}	{"label":"Register","url":"#register","is_cta":true,"sort":5}	\N	\N
255	444	directus_fields	203	{"sort":5,"interface":"input","width":"half","collection":"speakers","field":"company_url"}	{"sort":5,"interface":"input","width":"half","collection":"speakers","field":"company_url"}	\N	\N
256	445	directus_fields	204	{"sort":6,"interface":"file-image","special":["file"],"collection":"speakers","field":"headshot"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"speakers","field":"headshot"}	\N	\N
257	446	directus_fields	205	{"sort":7,"interface":"input","hidden":true,"collection":"speakers","field":"sort"}	{"sort":7,"interface":"input","hidden":true,"collection":"speakers","field":"sort"}	\N	\N
258	447	directus_fields	206	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"speakers","field":"status"}	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"speakers","field":"status"}	\N	\N
259	448	directus_fields	207	{"sort":2,"interface":"input","width":"half","collection":"schedule_days","field":"day_number"}	{"sort":2,"interface":"input","width":"half","collection":"schedule_days","field":"day_number"}	\N	\N
260	449	directus_fields	208	{"sort":3,"interface":"input","width":"half","collection":"schedule_days","field":"title"}	{"sort":3,"interface":"input","width":"half","collection":"schedule_days","field":"title"}	\N	\N
261	450	directus_fields	209	{"sort":4,"interface":"datetime","width":"half","collection":"schedule_days","field":"date"}	{"sort":4,"interface":"datetime","width":"half","collection":"schedule_days","field":"date"}	\N	\N
262	451	directus_fields	210	{"sort":5,"interface":"input","hidden":true,"collection":"schedule_days","field":"sort"}	{"sort":5,"interface":"input","hidden":true,"collection":"schedule_days","field":"sort"}	\N	\N
263	452	directus_fields	211	{"sort":2,"interface":"input","width":"full","collection":"sessions","field":"title"}	{"sort":2,"interface":"input","width":"full","collection":"sessions","field":"title"}	\N	\N
264	453	directus_fields	212	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Keynote","value":"keynote"},{"text":"Panel","value":"panel"},{"text":"Talk","value":"talk"},{"text":"Workshop","value":"workshop"},{"text":"Event","value":"event"}]},"width":"half","collection":"sessions","field":"type"}	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Keynote","value":"keynote"},{"text":"Panel","value":"panel"},{"text":"Talk","value":"talk"},{"text":"Workshop","value":"workshop"},{"text":"Event","value":"event"}]},"width":"half","collection":"sessions","field":"type"}	\N	\N
265	454	directus_fields	213	{"sort":4,"interface":"datetime","width":"half","collection":"sessions","field":"start_time"}	{"sort":4,"interface":"datetime","width":"half","collection":"sessions","field":"start_time"}	\N	\N
266	455	directus_fields	214	{"sort":5,"interface":"input","width":"half","collection":"sessions","field":"room"}	{"sort":5,"interface":"input","width":"half","collection":"sessions","field":"room"}	\N	\N
267	456	directus_fields	215	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"width":"half","collection":"sessions","field":"day"}	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"width":"half","collection":"sessions","field":"day"}	\N	\N
268	457	directus_fields	216	{"sort":7,"interface":"input","hidden":true,"collection":"sessions","field":"sort"}	{"sort":7,"interface":"input","hidden":true,"collection":"sessions","field":"sort"}	\N	\N
269	458	directus_fields	217	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"sessions","field":"status"}	{"sort":8,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"sessions","field":"status"}	\N	\N
270	459	directus_fields	218	{"sort":2,"hidden":true,"collection":"sessions_speakers","field":"sessions_id"}	{"sort":2,"hidden":true,"collection":"sessions_speakers","field":"sessions_id"}	\N	\N
271	460	directus_fields	219	{"sort":3,"hidden":true,"collection":"sessions_speakers","field":"speakers_id"}	{"sort":3,"hidden":true,"collection":"sessions_speakers","field":"speakers_id"}	\N	\N
272	461	directus_fields	220	{"sort":2,"interface":"input","width":"full","collection":"programme_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"programme_section","field":"label"}	\N	\N
273	462	directus_fields	221	{"sort":3,"interface":"input","width":"full","collection":"programme_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"programme_section","field":"heading"}	\N	\N
274	463	directus_fields	222	{"sort":2,"interface":"input","width":"half","collection":"partners","field":"name"}	{"sort":2,"interface":"input","width":"half","collection":"partners","field":"name"}	\N	\N
275	464	directus_fields	223	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Gold","value":"gold"},{"text":"Silver","value":"silver"},{"text":"Bronze","value":"bronze"}]},"width":"half","collection":"partners","field":"tier"}	{"sort":3,"interface":"select-dropdown","options":{"choices":[{"text":"Gold","value":"gold"},{"text":"Silver","value":"silver"},{"text":"Bronze","value":"bronze"}]},"width":"half","collection":"partners","field":"tier"}	\N	\N
276	465	directus_fields	224	{"sort":4,"interface":"file-image","special":["file"],"collection":"partners","field":"logo"}	{"sort":4,"interface":"file-image","special":["file"],"collection":"partners","field":"logo"}	\N	\N
277	466	directus_fields	225	{"sort":5,"interface":"input","width":"full","collection":"partners","field":"website"}	{"sort":5,"interface":"input","width":"full","collection":"partners","field":"website"}	\N	\N
278	467	directus_fields	226	{"sort":6,"interface":"input","hidden":true,"collection":"partners","field":"sort"}	{"sort":6,"interface":"input","hidden":true,"collection":"partners","field":"sort"}	\N	\N
279	468	directus_fields	227	{"sort":7,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"partners","field":"status"}	{"sort":7,"interface":"select-dropdown","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"width":"half","collection":"partners","field":"status"}	\N	\N
280	469	directus_fields	228	{"sort":2,"interface":"input","width":"full","collection":"partners_section","field":"label"}	{"sort":2,"interface":"input","width":"full","collection":"partners_section","field":"label"}	\N	\N
281	470	directus_fields	229	{"sort":3,"interface":"input","width":"full","collection":"partners_section","field":"heading"}	{"sort":3,"interface":"input","width":"full","collection":"partners_section","field":"heading"}	\N	\N
282	471	directus_fields	230	{"sort":2,"interface":"input-multiline","width":"full","collection":"footer","field":"cta_text"}	{"sort":2,"interface":"input-multiline","width":"full","collection":"footer","field":"cta_text"}	\N	\N
283	472	directus_fields	231	{"sort":3,"interface":"input","width":"half","collection":"footer","field":"cta_label"}	{"sort":3,"interface":"input","width":"half","collection":"footer","field":"cta_label"}	\N	\N
284	473	directus_fields	232	{"sort":4,"interface":"input","width":"half","collection":"footer","field":"cta_url"}	{"sort":4,"interface":"input","width":"half","collection":"footer","field":"cta_url"}	\N	\N
285	474	directus_fields	233	{"sort":5,"interface":"input","width":"half","collection":"footer","field":"twitter_url"}	{"sort":5,"interface":"input","width":"half","collection":"footer","field":"twitter_url"}	\N	\N
286	475	directus_fields	234	{"sort":6,"interface":"input","width":"half","collection":"footer","field":"instagram_url"}	{"sort":6,"interface":"input","width":"half","collection":"footer","field":"instagram_url"}	\N	\N
287	476	directus_fields	235	{"sort":7,"interface":"input","width":"half","collection":"footer","field":"linkedin_url"}	{"sort":7,"interface":"input","width":"half","collection":"footer","field":"linkedin_url"}	\N	\N
288	477	directus_fields	236	{"sort":9,"interface":"list-m2m","special":["m2m"],"options":{"template":"{{speakers_id.name}}"},"collection":"sessions","field":"speakers"}	{"sort":9,"interface":"list-m2m","special":["m2m"],"options":{"template":"{{speakers_id.name}}"},"collection":"sessions","field":"speakers"}	\N	\N
289	478	directus_fields	237	{"sort":6,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{title}}"},"collection":"schedule_days","field":"sessions"}	{"sort":6,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{title}}"},"collection":"schedule_days","field":"sessions"}	\N	\N
290	479	directus_files	f6beaffe-9605-43fd-9a94-f9c82172f6cd	{"title":"Hero Image","filename_download":"Hero-image.png","type":"image/png","storage":"local"}	{"title":"Hero Image","filename_download":"Hero-image.png","type":"image/png","storage":"local"}	\N	\N
291	480	directus_files	0f167ca6-6050-406b-a14f-36ad6b08452f	{"title":"Elena Vasquez","filename_download":"elena-vasquez.png","type":"image/png","storage":"local"}	{"title":"Elena Vasquez","filename_download":"elena-vasquez.png","type":"image/png","storage":"local"}	\N	\N
292	481	directus_files	c99b6bac-dcd4-428a-a625-73224bc0545c	{"title":"James Okonkwo","filename_download":"james-okonkwo.png","type":"image/png","storage":"local"}	{"title":"James Okonkwo","filename_download":"james-okonkwo.png","type":"image/png","storage":"local"}	\N	\N
293	482	directus_files	140025b1-41fc-457b-9c03-5b4d6841608f	{"title":"Lina Petersson","filename_download":"lina-petersson.png","type":"image/png","storage":"local"}	{"title":"Lina Petersson","filename_download":"lina-petersson.png","type":"image/png","storage":"local"}	\N	\N
294	483	directus_files	25ec1694-34b1-4582-b4fe-107cf42a0ece	{"title":"Ravi Mehta","filename_download":"ravi-mehta.png","type":"image/png","storage":"local"}	{"title":"Ravi Mehta","filename_download":"ravi-mehta.png","type":"image/png","storage":"local"}	\N	\N
295	484	directus_files	6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9	{"title":"Sophie Laurent","filename_download":"sophie-laurent.png","type":"image/png","storage":"local"}	{"title":"Sophie Laurent","filename_download":"sophie-laurent.png","type":"image/png","storage":"local"}	\N	\N
296	485	directus_files	fea91a70-407c-4194-8611-3a4b2743d4d9	{"title":"Marcus Brandt","filename_download":"marcus-brandt.png","type":"image/png","storage":"local"}	{"title":"Marcus Brandt","filename_download":"marcus-brandt.png","type":"image/png","storage":"local"}	\N	\N
297	486	directus_files	594fa220-8bdf-4c7d-b38c-42c024f40578	{"title":"Meridian Structures","filename_download":"meridian-structures.svg","type":"image/svg+xml","storage":"local"}	{"title":"Meridian Structures","filename_download":"meridian-structures.svg","type":"image/svg+xml","storage":"local"}	\N	\N
298	487	directus_files	9257911c-4480-41eb-8c6f-460df4b3e423	{"title":"Axiom Engineering","filename_download":"axiom-engineering.svg","type":"image/svg+xml","storage":"local"}	{"title":"Axiom Engineering","filename_download":"axiom-engineering.svg","type":"image/svg+xml","storage":"local"}	\N	\N
299	488	directus_files	ba961b2a-f87c-4b73-9b46-9fde48b18179	{"title":"Canopy Design","filename_download":"canopy-design.svg","type":"image/svg+xml","storage":"local"}	{"title":"Canopy Design","filename_download":"canopy-design.svg","type":"image/svg+xml","storage":"local"}	\N	\N
300	489	directus_files	713df7b0-279f-42ec-a229-2534ee4014af	{"title":"Northlight Architecture","filename_download":"northlight-architecture.svg","type":"image/svg+xml","storage":"local"}	{"title":"Northlight Architecture","filename_download":"northlight-architecture.svg","type":"image/svg+xml","storage":"local"}	\N	\N
301	490	directus_files	80d6df78-4eba-4355-9662-655b3d39f7d9	{"title":"Terraverde Materials","filename_download":"terraverde-materials.svg","type":"image/svg+xml","storage":"local"}	{"title":"Terraverde Materials","filename_download":"terraverde-materials.svg","type":"image/svg+xml","storage":"local"}	\N	\N
302	491	directus_files	5e22b965-bbcd-48b5-8e93-a173288b334b	{"title":"Skyline Consulting","filename_download":"skyline-consulting.svg","type":"image/svg+xml","storage":"local"}	{"title":"Skyline Consulting","filename_download":"skyline-consulting.svg","type":"image/svg+xml","storage":"local"}	\N	\N
303	492	directus_files	0434af03-7e74-47b7-a6c8-90740ebb4d94	{"title":"Blueprint Analytics","filename_download":"blueprint-analytics.svg","type":"image/svg+xml","storage":"local"}	{"title":"Blueprint Analytics","filename_download":"blueprint-analytics.svg","type":"image/svg+xml","storage":"local"}	\N	\N
304	493	directus_files	d8ec1e92-f2f5-41f4-ba96-871e02f9b666	{"title":"FormLab Studio","filename_download":"formlab-studio.svg","type":"image/svg+xml","storage":"local"}	{"title":"FormLab Studio","filename_download":"formlab-studio.svg","type":"image/svg+xml","storage":"local"}	\N	\N
305	494	directus_files	a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59	{"title":"Atlas Construction","filename_download":"atlas-construction.svg","type":"image/svg+xml","storage":"local"}	{"title":"Atlas Construction","filename_download":"atlas-construction.svg","type":"image/svg+xml","storage":"local"}	\N	\N
306	495	navigation	94557cdb-752c-4bbb-a408-48ea8299e683	{"label":"About","url":"#about","is_cta":false,"sort":1}	{"label":"About","url":"#about","is_cta":false,"sort":1}	\N	\N
307	496	navigation	34a06d1d-c141-4eb1-ba8d-557eef402762	{"label":"Speakers","url":"#speakers","is_cta":false,"sort":2}	{"label":"Speakers","url":"#speakers","is_cta":false,"sort":2}	\N	\N
308	497	navigation	062851c3-bada-4de3-b2ec-36284802ec21	{"label":"Programme","url":"#programme","is_cta":false,"sort":3}	{"label":"Programme","url":"#programme","is_cta":false,"sort":3}	\N	\N
309	498	navigation	50ad2cf6-825e-4221-b095-13563d0bff53	{"label":"Partners","url":"#partners","is_cta":false,"sort":4}	{"label":"Partners","url":"#partners","is_cta":false,"sort":4}	\N	\N
311	500	speakers	3c211554-efa2-4bc0-bc41-ab4149e017cc	{"name":"Elena Vasquez","role":"Founding Partner","company":"Studio Vasquez","headshot":"0f167ca6-6050-406b-a14f-36ad6b08452f","sort":1,"status":"published"}	{"name":"Elena Vasquez","role":"Founding Partner","company":"Studio Vasquez","headshot":"0f167ca6-6050-406b-a14f-36ad6b08452f","sort":1,"status":"published"}	\N	\N
312	501	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	{"name":"James Okonkwo","role":"Director of Urban Design","company":"Metropolitan Studio","headshot":"c99b6bac-dcd4-428a-a625-73224bc0545c","sort":2,"status":"published"}	{"name":"James Okonkwo","role":"Director of Urban Design","company":"Metropolitan Studio","headshot":"c99b6bac-dcd4-428a-a625-73224bc0545c","sort":2,"status":"published"}	\N	\N
313	502	speakers	75612f84-bbd9-4f65-96d7-e3568a37ecb9	{"name":"Lina Petersson","role":"Head of Computational Design","company":"Forma Architects","headshot":"140025b1-41fc-457b-9c03-5b4d6841608f","sort":3,"status":"published"}	{"name":"Lina Petersson","role":"Head of Computational Design","company":"Forma Architects","headshot":"140025b1-41fc-457b-9c03-5b4d6841608f","sort":3,"status":"published"}	\N	\N
314	503	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	{"name":"Ravi Mehta","role":"Professor of Sustainable Construction","company":"UCL Bartlett School of Architecture","headshot":"25ec1694-34b1-4582-b4fe-107cf42a0ece","sort":4,"status":"published"}	{"name":"Ravi Mehta","role":"Professor of Sustainable Construction","company":"UCL Bartlett School of Architecture","headshot":"25ec1694-34b1-4582-b4fe-107cf42a0ece","sort":4,"status":"published"}	\N	\N
315	504	speakers	e159b144-6ec8-42a4-b43d-b4a9ccefcb77	{"name":"Sophie Laurent","role":"Founder & Director","company":"UrbanLab Paris","headshot":"6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9","sort":5,"status":"published"}	{"name":"Sophie Laurent","role":"Founder & Director","company":"UrbanLab Paris","headshot":"6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9","sort":5,"status":"published"}	\N	\N
316	505	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	{"name":"Marcus Brandt","role":"Innovation Lead","company":"Arup Engineering","headshot":"fea91a70-407c-4194-8611-3a4b2743d4d9","sort":6,"status":"published"}	{"name":"Marcus Brandt","role":"Innovation Lead","company":"Arup Engineering","headshot":"fea91a70-407c-4194-8611-3a4b2743d4d9","sort":6,"status":"published"}	\N	\N
317	507	pages	f422231f-646a-4c6c-a8d8-f55633f80fbd	{"title":"FORMA 2026","slug":"home","seo_title":"FORMA 2026 — Architecture & Built Environment Summit","seo_description":"Three days of ideas that shape how we build. 15-17 October 2026, The Barbican Centre, London."}	{"title":"FORMA 2026","slug":"home","seo_title":"FORMA 2026 — Architecture & Built Environment Summit","seo_description":"Three days of ideas that shape how we build. 15-17 October 2026, The Barbican Centre, London."}	\N	\N
318	508	hero	6cb11279-54d4-449e-9ac4-c55d43c27d46	{"subtitle":"Architecture & Built Environment Summit","title":"FORMA","year":"2026","tagline":"Shaping Tomorrow's Built Environment","dates":"15–17 October 2026","venue":"The Barbican Centre, London, UK","image":"f6beaffe-9605-43fd-9a94-f9c82172f6cd","cta_label":"Register Now","cta_url":"#register"}	{"subtitle":"Architecture & Built Environment Summit","title":"FORMA","year":"2026","tagline":"Shaping Tomorrow's Built Environment","dates":"15–17 October 2026","venue":"The Barbican Centre, London, UK","image":"f6beaffe-9605-43fd-9a94-f9c82172f6cd","cta_label":"Register Now","cta_url":"#register"}	\N	\N
319	509	about	f12dac80-0682-4b88-8e16-c420c59d1842	{"label":"About the Event","heading":"Three days of ideas that shape how we build.","body":"FORMA is a 3-day summit bringing together architects, urban planners, engineers, and designers to explore sustainable futures, urban transformation, and technology in the built environment.\\n\\nFrom net-zero construction to AI-driven design, FORMA gathers the sharpest minds at the intersection of creativity and engineering. Join 1,200+ professionals for keynotes, panels, workshops, and conversations that shape how we build.","stat_1_value":"1,200+","stat_1_label":"Attendees","stat_2_value":"40+","stat_2_label":"Speakers","stat_3_value":"25","stat_3_label":"Countries Represented"}	{"label":"About the Event","heading":"Three days of ideas that shape how we build.","body":"FORMA is a 3-day summit bringing together architects, urban planners, engineers, and designers to explore sustainable futures, urban transformation, and technology in the built environment.\\n\\nFrom net-zero construction to AI-driven design, FORMA gathers the sharpest minds at the intersection of creativity and engineering. Join 1,200+ professionals for keynotes, panels, workshops, and conversations that shape how we build.","stat_1_value":"1,200+","stat_1_label":"Attendees","stat_2_value":"40+","stat_2_label":"Speakers","stat_3_value":"25","stat_3_label":"Countries Represented"}	\N	\N
320	510	speakers_section	df2d9f82-4929-4b4e-bd60-f8c850faffe3	{"label":"Featured Speakers","heading":"The sharpest minds in architecture & design."}	{"label":"Featured Speakers","heading":"The sharpest minds in architecture & design."}	\N	\N
321	511	programme_section	e5967731-32b8-45ac-bae1-98cfe74a7e60	{"label":"Programme","heading":"Three days. Fifteen sessions. One vision."}	{"label":"Programme","heading":"Three days. Fifteen sessions. One vision."}	\N	\N
322	512	partners_section	de871392-517b-4863-abc8-a924508c5621	{"label":"Our Partners","heading":"Supported by leaders in the built environment."}	{"label":"Our Partners","heading":"Supported by leaders in the built environment."}	\N	\N
323	513	footer	acb25ee5-8521-4c69-a5f5-79c495345206	{"cta_text":"Don't miss FORMA 2026. Three days of ideas that shape how we build.","cta_label":"Register Now","cta_url":"#register","twitter_url":"https://twitter.com/forma2026","instagram_url":"https://instagram.com/forma2026","linkedin_url":"https://linkedin.com/company/forma2026"}	{"cta_text":"Don't miss FORMA 2026. Three days of ideas that shape how we build.","cta_label":"Register Now","cta_url":"#register","twitter_url":"https://twitter.com/forma2026","instagram_url":"https://instagram.com/forma2026","linkedin_url":"https://linkedin.com/company/forma2026"}	\N	\N
324	515	schedule_days	c3d2337b-3400-4463-9df4-f1d74fa92496	{"day_number":1,"title":"Sustainable Futures","date":"2026-10-15","sort":1}	{"day_number":1,"title":"Sustainable Futures","date":"2026-10-15","sort":1}	\N	\N
325	516	schedule_days	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	{"day_number":2,"title":"Urban Landscapes","date":"2026-10-16","sort":2}	{"day_number":2,"title":"Urban Landscapes","date":"2026-10-16","sort":2}	\N	\N
326	517	schedule_days	b142016a-85e1-4644-bb53-178c56a2e990	{"day_number":3,"title":"Digital Frontiers","date":"2026-10-17","sort":3}	{"day_number":3,"title":"Digital Frontiers","date":"2026-10-17","sort":3}	\N	\N
327	518	sessions_speakers	7df6dd63-da50-4173-8bea-07cdf4f7abb1	{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc","sessions_id":"e939e7a1-ff14-4c77-98d5-258a9d7c0543"}	{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc","sessions_id":"e939e7a1-ff14-4c77-98d5-258a9d7c0543"}	328	\N
373	568	directus_fields	243	{"sort":8,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"schedule_days","field":"date_updated"}	{"sort":8,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"schedule_days","field":"date_updated"}	\N	\N
328	519	sessions	e939e7a1-ff14-4c77-98d5-258a9d7c0543	{"title":"Opening Keynote","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc"}]},"sort":1,"status":"published"}	{"title":"Opening Keynote","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc"}]},"sort":1,"status":"published"}	\N	\N
331	522	sessions	4f98964c-f1f8-48a3-8f40-87f53ba2067f	{"title":"Net Zero by Design","type":"panel","start_time":"11:00:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc"},{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f"}]},"sort":2,"status":"published"}	{"title":"Net Zero by Design","type":"panel","start_time":"11:00:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc"},{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f"}]},"sort":2,"status":"published"}	\N	\N
329	520	sessions_speakers	fe6bb198-621e-4704-8f0c-c78a9a6a09d0	{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc","sessions_id":"4f98964c-f1f8-48a3-8f40-87f53ba2067f"}	{"speakers_id":"3c211554-efa2-4bc0-bc41-ab4149e017cc","sessions_id":"4f98964c-f1f8-48a3-8f40-87f53ba2067f"}	331	\N
330	521	sessions_speakers	e1c677a9-edef-410e-9291-db31e220ed0f	{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","sessions_id":"4f98964c-f1f8-48a3-8f40-87f53ba2067f"}	{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","sessions_id":"4f98964c-f1f8-48a3-8f40-87f53ba2067f"}	331	\N
333	524	sessions	c4491f41-46c4-4e21-965e-6674fa1c5aca	{"title":"Timber's Second Coming","type":"talk","start_time":"14:00:00","room":"Room B","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f"}]},"sort":3,"status":"published"}	{"title":"Timber's Second Coming","type":"talk","start_time":"14:00:00","room":"Room B","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f"}]},"sort":3,"status":"published"}	\N	\N
332	523	sessions_speakers	65edf82a-13e4-4f71-9367-25be5e2b3f46	{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","sessions_id":"c4491f41-46c4-4e21-965e-6674fa1c5aca"}	{"speakers_id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","sessions_id":"c4491f41-46c4-4e21-965e-6674fa1c5aca"}	333	\N
335	526	sessions	dd5770aa-f75c-4aa5-baf1-49d8a667ad53	{"title":"Cities That Breathe","type":"talk","start_time":"15:30:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":4,"status":"published"}	{"title":"Cities That Breathe","type":"talk","start_time":"15:30:00","room":"Hall A","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":4,"status":"published"}	\N	\N
334	525	sessions_speakers	4c46b687-1ccf-450e-b43a-a9173ba882c7	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"dd5770aa-f75c-4aa5-baf1-49d8a667ad53"}	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"dd5770aa-f75c-4aa5-baf1-49d8a667ad53"}	335	\N
337	528	sessions	8725c30c-5ced-4355-a93c-302e03048d1a	{"title":"Life Cycle Assessment Tools","type":"workshop","start_time":"17:00:00","room":"Room C","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":5,"status":"published"}	{"title":"Life Cycle Assessment Tools","type":"workshop","start_time":"17:00:00","room":"Room C","day":"c3d2337b-3400-4463-9df4-f1d74fa92496","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":5,"status":"published"}	\N	\N
336	527	sessions_speakers	113510c4-f186-4490-99ef-38d1449e41ad	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"8725c30c-5ced-4355-a93c-302e03048d1a"}	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"8725c30c-5ced-4355-a93c-302e03048d1a"}	337	\N
339	530	sessions	a352a1dd-7d60-4f4e-924b-07aa56d72bb3	{"title":"The 15-Minute City","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":6,"status":"published"}	{"title":"The 15-Minute City","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":6,"status":"published"}	\N	\N
338	529	sessions_speakers	ab86fe93-4721-40d5-8040-8d224434673d	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"a352a1dd-7d60-4f4e-924b-07aa56d72bb3"}	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"a352a1dd-7d60-4f4e-924b-07aa56d72bb3"}	339	\N
340	531	sessions_speakers	75b1bf6a-9fd8-4263-ade6-522dafd6034c	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"a3e9e38d-9da6-4645-9166-0cff35a3f265"}	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"a3e9e38d-9da6-4645-9166-0cff35a3f265"}	341	\N
374	569	directus_fields	244	{"sort":6,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"navigation","field":"date_created"}	{"sort":6,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"navigation","field":"date_created"}	\N	\N
375	570	directus_fields	245	{"sort":7,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"navigation","field":"date_updated"}	{"sort":7,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"navigation","field":"date_updated"}	\N	\N
376	571	directus_fields	246	{"sort":8,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"partners","field":"date_created"}	{"sort":8,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"partners","field":"date_created"}	\N	\N
377	572	directus_fields	247	{"sort":9,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"partners","field":"date_updated"}	{"sort":9,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"partners","field":"date_updated"}	\N	\N
379	579	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"navigation","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"navigation","action":"read","fields":["*"]}	\N	\N
380	580	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"hero","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"hero","action":"read","fields":["*"]}	\N	\N
381	581	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"about","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"about","action":"read","fields":["*"]}	\N	\N
341	532	sessions	a3e9e38d-9da6-4645-9166-0cff35a3f265	{"title":"Housing Without Compromise","type":"talk","start_time":"11:00:00","room":"Room B","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":7,"status":"published"}	{"title":"Housing Without Compromise","type":"talk","start_time":"11:00:00","room":"Room B","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":7,"status":"published"}	\N	\N
344	535	sessions	c9283c34-1dbe-4b7f-a668-d03b1a5eb114	{"title":"Public Space Reimagined","type":"panel","start_time":"14:00:00","room":"Hall A","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"},{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":8,"status":"published"}	{"title":"Public Space Reimagined","type":"panel","start_time":"14:00:00","room":"Hall A","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"},{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":8,"status":"published"}	\N	\N
342	533	sessions_speakers	d1feef3e-357d-4edd-9fe3-9c1f7b5d20f9	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"c9283c34-1dbe-4b7f-a668-d03b1a5eb114"}	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"c9283c34-1dbe-4b7f-a668-d03b1a5eb114"}	344	\N
343	534	sessions_speakers	d2ac1510-16c9-47b9-af85-9cdcdd2e1098	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"c9283c34-1dbe-4b7f-a668-d03b1a5eb114"}	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"c9283c34-1dbe-4b7f-a668-d03b1a5eb114"}	344	\N
346	537	sessions	3790b8bb-b54c-44da-b55a-5d8ceb27429b	{"title":"Infrastructure as Architecture","type":"talk","start_time":"15:30:00","room":"Room B","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":9,"status":"published"}	{"title":"Infrastructure as Architecture","type":"talk","start_time":"15:30:00","room":"Room B","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":9,"status":"published"}	\N	\N
345	536	sessions_speakers	596e3a30-27f3-4ac9-833b-55e5dc4607d3	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"3790b8bb-b54c-44da-b55a-5d8ceb27429b"}	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"3790b8bb-b54c-44da-b55a-5d8ceb27429b"}	346	\N
348	539	sessions	0e3caaa2-0e5e-42ca-9af9-5b15410c8e68	{"title":"Community Co-Design Methods","type":"workshop","start_time":"17:00:00","room":"Room C","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":10,"status":"published"}	{"title":"Community Co-Design Methods","type":"workshop","start_time":"17:00:00","room":"Room C","day":"c9ef93ee-23c9-4328-a9d4-45ac47a18d2e","speakers":{"create":[{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77"}]},"sort":10,"status":"published"}	\N	\N
347	538	sessions_speakers	34d787e2-0c74-40a1-8c4d-39bc8904ea93	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"0e3caaa2-0e5e-42ca-9af9-5b15410c8e68"}	{"speakers_id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","sessions_id":"0e3caaa2-0e5e-42ca-9af9-5b15410c8e68"}	348	\N
350	541	sessions	d69d1530-fc05-44c5-bb8d-9665321fb1cb	{"title":"Algorithms and Aesthetics","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9"}]},"sort":11,"status":"published"}	{"title":"Algorithms and Aesthetics","type":"keynote","start_time":"09:30:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9"}]},"sort":11,"status":"published"}	\N	\N
349	540	sessions_speakers	fa00a004-87f4-466a-965b-9f33d25f8472	{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9","sessions_id":"d69d1530-fc05-44c5-bb8d-9665321fb1cb"}	{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9","sessions_id":"d69d1530-fc05-44c5-bb8d-9665321fb1cb"}	350	\N
352	543	sessions	e076e5ad-8e2b-49c2-8c1c-3a58c893afd7	{"title":"Smart Buildings, Smarter People","type":"talk","start_time":"11:00:00","room":"Room B","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":12,"status":"published"}	{"title":"Smart Buildings, Smarter People","type":"talk","start_time":"11:00:00","room":"Room B","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":12,"status":"published"}	\N	\N
351	542	sessions_speakers	4f814c44-e6f7-4b7e-bd8f-7fbb24341515	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"e076e5ad-8e2b-49c2-8c1c-3a58c893afd7"}	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"e076e5ad-8e2b-49c2-8c1c-3a58c893afd7"}	352	\N
353	544	sessions_speakers	1e3fe179-16c4-48d8-ad30-71bf7c7433ab	{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9","sessions_id":"6ffcdd5e-e2e4-46ff-a255-92714aac3244"}	{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9","sessions_id":"6ffcdd5e-e2e4-46ff-a255-92714aac3244"}	355	\N
354	545	sessions_speakers	c0f4babe-3f87-4beb-a6f8-40bc5a2de33c	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"6ffcdd5e-e2e4-46ff-a255-92714aac3244"}	{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201","sessions_id":"6ffcdd5e-e2e4-46ff-a255-92714aac3244"}	355	\N
355	546	sessions	6ffcdd5e-e2e4-46ff-a255-92714aac3244	{"title":"AI in Architecture","type":"panel","start_time":"14:00:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9"},{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":13,"status":"published"}	{"title":"AI in Architecture","type":"panel","start_time":"14:00:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9"},{"speakers_id":"c90d7e62-6cf8-4e45-a053-acc36570f201"}]},"sort":13,"status":"published"}	\N	\N
357	548	sessions	340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4	{"title":"Digital Twins for Urban Planning","type":"talk","start_time":"15:30:00","room":"Room B","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":14,"status":"published"}	{"title":"Digital Twins for Urban Planning","type":"talk","start_time":"15:30:00","room":"Room B","day":"b142016a-85e1-4644-bb53-178c56a2e990","speakers":{"create":[{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a"}]},"sort":14,"status":"published"}	\N	\N
356	547	sessions_speakers	0b6ff5b5-4f5b-4aaa-ac10-9708bb694b2c	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4"}	{"speakers_id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","sessions_id":"340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4"}	357	\N
358	549	sessions	f3a71e8d-a6cf-4949-9db1-5c5cb505111b	{"title":"Closing Remarks & Networking","type":"event","start_time":"16:30:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","sort":15,"status":"published"}	{"title":"Closing Remarks & Networking","type":"event","start_time":"16:30:00","room":"Hall A","day":"b142016a-85e1-4644-bb53-178c56a2e990","sort":15,"status":"published"}	\N	\N
359	551	partners	7555b6c2-97ef-4ed1-a6ef-0c23b830028f	{"name":"Meridian Structures","tier":"gold","logo":"594fa220-8bdf-4c7d-b38c-42c024f40578","website":"https://meridianstructures.com","sort":1,"status":"published"}	{"name":"Meridian Structures","tier":"gold","logo":"594fa220-8bdf-4c7d-b38c-42c024f40578","website":"https://meridianstructures.com","sort":1,"status":"published"}	\N	\N
360	552	partners	03bc9658-fd65-4d83-9e49-952934db45af	{"name":"Axiom Engineering Group","tier":"gold","logo":"9257911c-4480-41eb-8c6f-460df4b3e423","website":"https://axiomengineering.com","sort":2,"status":"published"}	{"name":"Axiom Engineering Group","tier":"gold","logo":"9257911c-4480-41eb-8c6f-460df4b3e423","website":"https://axiomengineering.com","sort":2,"status":"published"}	\N	\N
361	553	partners	d1c1a1de-949a-46bc-adba-124315d106cb	{"name":"Canopy Design Studio","tier":"silver","logo":"ba961b2a-f87c-4b73-9b46-9fde48b18179","website":"https://canopydesign.com","sort":3,"status":"published"}	{"name":"Canopy Design Studio","tier":"silver","logo":"ba961b2a-f87c-4b73-9b46-9fde48b18179","website":"https://canopydesign.com","sort":3,"status":"published"}	\N	\N
362	554	partners	0fbcf083-1af5-416b-886c-4f40ede15ae7	{"name":"Northlight Architecture","tier":"silver","logo":"713df7b0-279f-42ec-a229-2534ee4014af","website":"https://northlightarchitecture.com","sort":4,"status":"published"}	{"name":"Northlight Architecture","tier":"silver","logo":"713df7b0-279f-42ec-a229-2534ee4014af","website":"https://northlightarchitecture.com","sort":4,"status":"published"}	\N	\N
363	555	partners	4b3e651f-63ce-4e6d-a699-e5f8f48554fc	{"name":"Terraverde Materials","tier":"silver","logo":"80d6df78-4eba-4355-9662-655b3d39f7d9","website":"https://terraverde.com","sort":5,"status":"published"}	{"name":"Terraverde Materials","tier":"silver","logo":"80d6df78-4eba-4355-9662-655b3d39f7d9","website":"https://terraverde.com","sort":5,"status":"published"}	\N	\N
364	556	partners	be73c710-fff0-4b88-8b9c-f0a4b09de867	{"name":"Skyline Consulting","tier":"bronze","logo":"5e22b965-bbcd-48b5-8e93-a173288b334b","website":"https://skylineconsulting.com","sort":6,"status":"published"}	{"name":"Skyline Consulting","tier":"bronze","logo":"5e22b965-bbcd-48b5-8e93-a173288b334b","website":"https://skylineconsulting.com","sort":6,"status":"published"}	\N	\N
365	557	partners	dc2a3b30-6fb6-4fda-bd92-c4ac65ce44fc	{"name":"Blueprint Analytics","tier":"bronze","logo":"0434af03-7e74-47b7-a6c8-90740ebb4d94","website":"https://blueprintanalytics.com","sort":7,"status":"published"}	{"name":"Blueprint Analytics","tier":"bronze","logo":"0434af03-7e74-47b7-a6c8-90740ebb4d94","website":"https://blueprintanalytics.com","sort":7,"status":"published"}	\N	\N
366	558	partners	631a0f2d-c537-48e7-8b8a-a683fcc6f41b	{"name":"FormLab Studio","tier":"bronze","logo":"d8ec1e92-f2f5-41f4-ba96-871e02f9b666","website":"https://formlabstudio.com","sort":8,"status":"published"}	{"name":"FormLab Studio","tier":"bronze","logo":"d8ec1e92-f2f5-41f4-ba96-871e02f9b666","website":"https://formlabstudio.com","sort":8,"status":"published"}	\N	\N
367	559	partners	7f5e63f9-2f2a-4ab6-9fc0-b68e5f624494	{"name":"Atlas Construction Partners","tier":"bronze","logo":"a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59","website":"https://atlasconstruction.com","sort":9,"status":"published"}	{"name":"Atlas Construction Partners","tier":"bronze","logo":"a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59","website":"https://atlasconstruction.com","sort":9,"status":"published"}	\N	\N
368	563	directus_fields	238	{"sort":9,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"speakers","field":"date_created"}	{"sort":9,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"speakers","field":"date_created"}	\N	\N
369	564	directus_fields	239	{"sort":10,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"speakers","field":"date_updated"}	{"sort":10,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"speakers","field":"date_updated"}	\N	\N
370	565	directus_fields	240	{"sort":10,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"sessions","field":"date_created"}	{"sort":10,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"sessions","field":"date_created"}	\N	\N
371	566	directus_fields	241	{"sort":11,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"sessions","field":"date_updated"}	{"sort":11,"interface":"datetime","special":["date-updated"],"readonly":true,"hidden":true,"width":"half","collection":"sessions","field":"date_updated"}	\N	\N
372	567	directus_fields	242	{"sort":7,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"schedule_days","field":"date_created"}	{"sort":7,"interface":"datetime","special":["date-created"],"readonly":true,"hidden":true,"width":"half","collection":"schedule_days","field":"date_created"}	\N	\N
378	578	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"pages","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"pages","action":"read","fields":["*"]}	\N	\N
382	582	directus_permissions	5	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"speakers_section","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"speakers_section","action":"read","fields":["*"]}	\N	\N
383	583	directus_permissions	6	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"speakers","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"speakers","action":"read","fields":["*"]}	\N	\N
384	584	directus_permissions	7	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"schedule_days","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"schedule_days","action":"read","fields":["*"]}	\N	\N
385	585	directus_permissions	8	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"sessions","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"sessions","action":"read","fields":["*"]}	\N	\N
386	586	directus_permissions	9	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"sessions_speakers","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"sessions_speakers","action":"read","fields":["*"]}	\N	\N
387	587	directus_permissions	10	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"programme_section","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"programme_section","action":"read","fields":["*"]}	\N	\N
388	588	directus_permissions	11	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"partners","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"partners","action":"read","fields":["*"]}	\N	\N
389	589	directus_permissions	12	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"partners_section","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"partners_section","action":"read","fields":["*"]}	\N	\N
390	590	directus_permissions	13	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"footer","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"footer","action":"read","fields":["*"]}	\N	\N
391	591	directus_permissions	14	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"directus_files","action":"read","fields":["*"]}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","collection":"directus_files","action":"read","fields":["*"]}	\N	\N
392	597	navigation	062851c3-bada-4de3-b2ec-36284802ec21	{"id":"062851c3-bada-4de3-b2ec-36284802ec21","label":"Schedule","url":"#schedule","is_cta":false,"sort":3,"date_created":null,"date_updated":"2026-03-04T20:08:16.581Z"}	{"label":"Schedule","url":"#schedule","date_updated":"2026-03-04T20:08:16.581Z"}	\N	\N
393	598	navigation	50ad2cf6-825e-4221-b095-13563d0bff53	{"id":"50ad2cf6-825e-4221-b095-13563d0bff53","label":"Sponsors","url":"#sponsors","is_cta":false,"sort":4,"date_created":null,"date_updated":"2026-03-04T20:08:40.476Z"}	{"label":"Sponsors","url":"#sponsors","date_updated":"2026-03-04T20:08:40.476Z"}	\N	\N
394	600	directus_fields	248	{"sort":11,"interface":"input","note":"Shortened subtitle for mobile screens","collection":"hero","field":"subtitle_mobile"}	{"sort":11,"interface":"input","note":"Shortened subtitle for mobile screens","collection":"hero","field":"subtitle_mobile"}	\N	\N
395	601	directus_fields	249	{"sort":8,"interface":"input-multiline","note":"Shortened CTA text for mobile screens","collection":"footer","field":"cta_text_mobile"}	{"sort":8,"interface":"input-multiline","note":"Shortened CTA text for mobile screens","collection":"footer","field":"cta_text_mobile"}	\N	\N
396	602	directus_fields	250	{"sort":11,"interface":"input","note":"Shortened role for mobile screens","collection":"speakers","field":"role_mobile"}	{"sort":11,"interface":"input","note":"Shortened role for mobile screens","collection":"speakers","field":"role_mobile"}	\N	\N
397	603	directus_fields	251	{"sort":12,"interface":"input","note":"Shortened company name for mobile screens","collection":"speakers","field":"company_mobile"}	{"sort":12,"interface":"input","note":"Shortened company name for mobile screens","collection":"speakers","field":"company_mobile"}	\N	\N
398	605	hero	6cb11279-54d4-449e-9ac4-c55d43c27d46	{"id":"6cb11279-54d4-449e-9ac4-c55d43c27d46","subtitle":"Architecture & Built Environment Summit","title":"FORMA","year":"2026","tagline":"Shaping Tomorrow's Built Environment","dates":"15–17 October 2026","venue":"The Barbican Centre, London, UK","image":"f6beaffe-9605-43fd-9a94-f9c82172f6cd","cta_label":"Register Now","cta_url":"#register","subtitle_mobile":"Architecture Summit"}	{"subtitle_mobile":"Architecture Summit"}	\N	\N
399	606	footer	acb25ee5-8521-4c69-a5f5-79c495345206	{"id":"acb25ee5-8521-4c69-a5f5-79c495345206","cta_text":"Don't miss FORMA 2026. Three days of ideas that shape how we build.","cta_label":"Register Now","cta_url":"#register","twitter_url":"https://twitter.com/forma2026","instagram_url":"https://instagram.com/forma2026","linkedin_url":"https://linkedin.com/company/forma2026","cta_text_mobile":"Don't miss FORMA 2026."}	{"cta_text_mobile":"Don't miss FORMA 2026."}	\N	\N
400	607	speakers	3c211554-efa2-4bc0-bc41-ab4149e017cc	{"id":"3c211554-efa2-4bc0-bc41-ab4149e017cc","name":"Elena Vasquez","role":"Founding Partner","company":"Studio Vasquez","company_url":null,"headshot":"0f167ca6-6050-406b-a14f-36ad6b08452f","sort":1,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.119Z","role_mobile":"Founding Partner","company_mobile":"Studio Vasquez"}	{"role_mobile":"Founding Partner","company_mobile":"Studio Vasquez","date_updated":"2026-03-04T23:24:03.119Z"}	\N	\N
401	608	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	{"id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","name":"James Okonkwo","role":"Director of Urban Design","company":"Metropolitan Studio","company_url":null,"headshot":"c99b6bac-dcd4-428a-a625-73224bc0545c","sort":2,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.140Z","role_mobile":"Urban Design Director","company_mobile":"Metropolitan Studio"}	{"role_mobile":"Urban Design Director","company_mobile":"Metropolitan Studio","date_updated":"2026-03-04T23:24:03.140Z"}	\N	\N
402	609	speakers	75612f84-bbd9-4f65-96d7-e3568a37ecb9	{"id":"75612f84-bbd9-4f65-96d7-e3568a37ecb9","name":"Lina Petersson","role":"Head of Computational Design","company":"Forma Architects","company_url":null,"headshot":"140025b1-41fc-457b-9c03-5b4d6841608f","sort":3,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.159Z","role_mobile":"Computational Design","company_mobile":"Forma Architects"}	{"role_mobile":"Computational Design","company_mobile":"Forma Architects","date_updated":"2026-03-04T23:24:03.159Z"}	\N	\N
403	610	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	{"id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","name":"Ravi Mehta","role":"Professor of Sustainable Construction","company":"UCL Bartlett School of Architecture","company_url":null,"headshot":"25ec1694-34b1-4582-b4fe-107cf42a0ece","sort":4,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.175Z","role_mobile":"Prof. Sustainable Construction","company_mobile":"UCL Bartlett"}	{"role_mobile":"Prof. Sustainable Construction","company_mobile":"UCL Bartlett","date_updated":"2026-03-04T23:24:03.175Z"}	\N	\N
404	611	speakers	e159b144-6ec8-42a4-b43d-b4a9ccefcb77	{"id":"e159b144-6ec8-42a4-b43d-b4a9ccefcb77","name":"Sophie Laurent","role":"Founder & Director","company":"UrbanLab Paris","company_url":null,"headshot":"6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9","sort":5,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.193Z","role_mobile":"Founder & Director","company_mobile":"UrbanLab Paris"}	{"role_mobile":"Founder & Director","company_mobile":"UrbanLab Paris","date_updated":"2026-03-04T23:24:03.193Z"}	\N	\N
405	612	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	{"id":"c90d7e62-6cf8-4e45-a053-acc36570f201","name":"Marcus Brandt","role":"Innovation Lead","company":"Arup Engineering","company_url":null,"headshot":"fea91a70-407c-4194-8611-3a4b2743d4d9","sort":6,"status":"published","date_created":null,"date_updated":"2026-03-04T23:24:03.211Z","role_mobile":"Innovation Lead","company_mobile":"Arup"}	{"role_mobile":"Innovation Lead","company_mobile":"Arup","date_updated":"2026-03-04T23:24:03.211Z"}	\N	\N
406	614	speakers	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	{"id":"ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a","name":"James Okonkwo","role":"Director of Urban Design","company":"Metropolitan Studio","company_url":null,"headshot":"c99b6bac-dcd4-428a-a625-73224bc0545c","sort":2,"status":"published","date_created":null,"date_updated":"2026-03-04T23:53:04.260Z","role_mobile":"Director of Urban Design","company_mobile":"Metropolitan Studio"}	{"role_mobile":"Director of Urban Design","date_updated":"2026-03-04T23:53:04.260Z"}	\N	\N
407	615	speakers	790a5d8b-c735-439e-a77b-ffa3a2090d4f	{"id":"790a5d8b-c735-439e-a77b-ffa3a2090d4f","name":"Ravi Mehta","role":"Professor of Sustainable Construction","company":"UCL Bartlett School of Architecture","company_url":null,"headshot":"25ec1694-34b1-4582-b4fe-107cf42a0ece","sort":4,"status":"published","date_created":null,"date_updated":"2026-03-04T23:53:04.287Z","role_mobile":"Professor","company_mobile":"UCL Bartlett"}	{"role_mobile":"Professor","date_updated":"2026-03-04T23:53:04.287Z"}	\N	\N
408	616	speakers	c90d7e62-6cf8-4e45-a053-acc36570f201	{"id":"c90d7e62-6cf8-4e45-a053-acc36570f201","name":"Marcus Brandt","role":"Innovation Lead","company":"Arup Engineering","company_url":null,"headshot":"fea91a70-407c-4194-8611-3a4b2743d4d9","sort":6,"status":"published","date_created":null,"date_updated":"2026-03-04T23:53:04.307Z","role_mobile":"Innovation Lead","company_mobile":"Arup Engineering"}	{"company_mobile":"Arup Engineering","date_updated":"2026-03-04T23:53:04.307Z"}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
cc1156d2-0860-48f6-a13b-3bfdd25e0b8e	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
HMoD_0CPcU_G6TbVHKXp8ZvFLHKJPaGS5V7PkyADgJgHlfJebUricAlzK0854DKf	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-06 12:20:44.031+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
lRRy8MzuGesc4apGd-kXOM2mCrtTNkb_gnTeGwre950yah1BBkS98UrjGlujPuuS	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-09 15:02:42.606+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/2.5.25 Chrome/142.0.7444.265 Electron/39.4.0 Safari/537.36	\N	http://localhost:8055	\N
IU6dlEN0Yen3wLpLO94JVCaQPDTMcjnwu4QU--1Su7OxPeehQgEuQdwgjY3zAE6F	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:23:41.982+00	192.168.65.1	curl/8.7.1	\N	\N	\N
lrQGkEE4G1rul6Zc61haKqlx4Ni4KXQlTQQAExcBsTn2o82vrGx7nXseUMlK0Lui	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:28:23.645+00	192.168.65.1	curl/8.7.1	\N	\N	\N
VzB7VNsONO8DHkzuLcKgE2R3vHaKiFCtUYxHQluN2X4NCd-rpbpRHKeDMHoCIoHY	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:39:39.107+00	192.168.65.1	curl/8.7.1	\N	\N	\N
iI9tQcoNYwBZ_R0jbfbRST12lgcFdIF4-2vL9vz0rDdQ_iYAmnK36i5srEmUWBYQ	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:40:43.875+00	192.168.65.1	curl/8.7.1	\N	\N	\N
V7kBuDudNyjB9KdVGCJqiEUCPtzUwMafPv_qcyqb_Ixsc6ETB7mm30-jqfKaZEvN	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:41:11.236+00	192.168.65.1	curl/8.7.1	\N	\N	\N
YA8IJAikaN_rVzTxKv07pFdcZgRD9bZPf_FDNnKAkq_6bkSmpwhj4VNdrwcp1hub	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:43:36.888+00	192.168.65.1	curl/8.7.1	\N	\N	\N
n7jBShTPntzsWDvVrtdE3Y-iN4D0h11uQr4r0YMx-P9DitKuYmFn9_a06uUBiqt4	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:43:44.682+00	192.168.65.1	curl/8.7.1	\N	\N	\N
qlC42Iy8dyHIfWYiGs_SdihXb5lTxpLE1IrMZAxiUFOH4OQgGGGxqCfSzxh7E4C5	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:45:27.79+00	192.168.65.1	curl/8.7.1	\N	\N	\N
Ka_4iP-azABxbeSBSGJVD04bBxJ74zt5h9ckkg7QDI4wZQTXpoijc4juiSP5of8F	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:45:54.361+00	192.168.65.1	curl/8.7.1	\N	\N	\N
o9KyWKr6VgXpAL6IKSQSH0wc_FaIQJL_4AgTYoArs9FrW9jMUPZbGFKhKi_fmDMT	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:46:19.822+00	192.168.65.1	curl/8.7.1	\N	\N	\N
xMPGu3TH-U_jFYfoO5o814ac_wPnbK-ah9V3YfNz3mfPMsvHmQv7-Kzs0cUov1q6	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:46:33.295+00	192.168.65.1	curl/8.7.1	\N	\N	\N
L4yhfbDzWuLqlVpp-yNrA2HOeSq-isIe-VPN_6X6D4YhRhZXuqtyZokwTJw0otk1	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:47:12.941+00	192.168.65.1	curl/8.7.1	\N	\N	\N
Qrlx1ehJ4VnZrBcjI-HArYXSGyDqYZbElDKTFR1xcu699Cgo6YUNZDRidNV_ME67	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:47:23.871+00	192.168.65.1	curl/8.7.1	\N	\N	\N
SBLrPvWNEovNfzn0aY5lswjQb45YMDb9PeoXO8kYCAi-FOE23VieuyiSeeBl5w-G	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:54:53.626+00	192.168.65.1	curl/8.7.1	\N	\N	\N
rgURfln0XoGNxmKMSRbAc1S67PmIpLM0FWj3TdcyD9kfWdqQNHcdPoPIrZWmAm5j	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:55:17.02+00	192.168.65.1	curl/8.7.1	\N	\N	\N
LJvrT2d_GP8C2CYS2ARURSN6qYtdSj7poHI6ml0IMqmROwWXYMkvoZTL77D80Rnj	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:55:23.557+00	192.168.65.1	curl/8.7.1	\N	\N	\N
I_cixdZOt1KLV2SHJm7T9O4QNJAb7ND0rN33GWnpE8rhRe-zs76ytH40X6XrvOki	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 18:55:32.504+00	192.168.65.1	curl/8.7.1	\N	\N	\N
IEagYVsYPpQPTvJUpu5lMcNTLs3LKnIk78OBQrJz8n6eVFF2U0lL2BljwBI4yjh6	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 19:20:35.016+00	192.168.65.1	node	\N	\N	\N
5C6ktp1TibmjiLT_bq2Z9AKivHNd5bN5pTgMspoKuHRNdFfCvRqQYhWolL22s3SS	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 23:16:05.941+00	192.168.65.1	curl/8.7.1	\N	\N	\N
1sikeCrj88HpwbvdA_EqrXiUi3YdShhBaJcpcIMFiofADyXbvAqDfVDubVY0N1ac	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 23:21:12.946+00	192.168.65.1	curl/8.7.1	\N	\N	\N
ZJBx8T1kLEw-WtugDznymfOEaVmWFH3R0Xov9E-6lR7mxFV-uz5qchZff7oVDzpK	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-05 23:28:17.164+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
vopA3XZDWH2K9JZSfA4jLSKi5CEnQXKlI6kTqqetnY0x_V8Sf8CRvfCZQZMzYDff	c0672fd6-e08a-4cc9-9d1a-67294afe926f	2026-03-11 23:53:03.788+00	192.168.65.1	curl/8.7.1	\N	\N	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt, project_owner, project_usage, org_name, product_updates, project_status, ai_openai_api_key, ai_anthropic_api_key, ai_system_prompt, ai_google_api_key, ai_openai_compatible_api_key, ai_openai_compatible_base_url, ai_openai_compatible_name, ai_openai_compatible_models, ai_openai_compatible_headers, ai_openai_allowed_models, ai_anthropic_allowed_models, ai_google_allowed_models, collaborative_editing_enabled) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	019c9f0a-6ed8-7420-84ea-a614c33c1365	f	f	\N	t	\N	pegahcode@gmail.com	personal	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	["gpt-5-nano","gpt-5-mini","gpt-5"]	["claude-haiku-4-5","claude-sonnet-4-5"]	["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"]	f
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
c0672fd6-e08a-4cc9-9d1a-67294afe926f	pegah	fallah	admin@projectdaedalus.dev	$argon2id$v=19$m=65536,t=3,p=4$KVP7Ic/88qr2LmJGD0Yh/g$VOQQ7PHKyQxXLAYhM+oE1MV0XWO6sK6w/F3MkofnAs4	\N	\N	\N	\N	\N	\N	\N	active	cc1156d2-0860-48f6-a13b-3bfdd25e0b8e	\N	2026-03-04 23:53:03.805+00	/settings/data-model/hero	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.footer (id, cta_text, cta_label, cta_url, twitter_url, instagram_url, linkedin_url, cta_text_mobile) FROM stdin;
acb25ee5-8521-4c69-a5f5-79c495345206	Don't miss FORMA 2026. Three days of ideas that shape how we build.	Register Now	#register	https://twitter.com/forma2026	https://instagram.com/forma2026	https://linkedin.com/company/forma2026	Don't miss FORMA 2026.
\.


--
-- Data for Name: hero; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.hero (id, subtitle, title, year, tagline, dates, venue, image, cta_label, cta_url, subtitle_mobile) FROM stdin;
6cb11279-54d4-449e-9ac4-c55d43c27d46	Architecture & Built Environment Summit	FORMA	2026	Shaping Tomorrow's Built Environment	15–17 October 2026	The Barbican Centre, London, UK	f6beaffe-9605-43fd-9a94-f9c82172f6cd	Register Now	#register	Architecture Summit
\.


--
-- Data for Name: navigation; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.navigation (id, label, url, is_cta, sort, date_created, date_updated) FROM stdin;
94557cdb-752c-4bbb-a408-48ea8299e683	About	#about	f	1	\N	\N
34a06d1d-c141-4eb1-ba8d-557eef402762	Speakers	#speakers	f	2	\N	\N
ad24d508-ad16-421a-a43d-bf2d4d25c352	Register	#register	t	5	\N	\N
062851c3-bada-4de3-b2ec-36284802ec21	Schedule	#schedule	f	3	\N	2026-03-04 20:08:16.581+00
50ad2cf6-825e-4221-b095-13563d0bff53	Sponsors	#sponsors	f	4	\N	2026-03-04 20:08:40.476+00
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.pages (id, title, slug, seo_title, seo_description, og_image) FROM stdin;
f422231f-646a-4c6c-a8d8-f55633f80fbd	FORMA 2026	home	FORMA 2026 — Architecture & Built Environment Summit	Three days of ideas that shape how we build. 15-17 October 2026, The Barbican Centre, London.	\N
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.partners (id, name, tier, logo, website, sort, status, date_created, date_updated) FROM stdin;
7555b6c2-97ef-4ed1-a6ef-0c23b830028f	Meridian Structures	gold	594fa220-8bdf-4c7d-b38c-42c024f40578	https://meridianstructures.com	1	published	\N	\N
03bc9658-fd65-4d83-9e49-952934db45af	Axiom Engineering Group	gold	9257911c-4480-41eb-8c6f-460df4b3e423	https://axiomengineering.com	2	published	\N	\N
d1c1a1de-949a-46bc-adba-124315d106cb	Canopy Design Studio	silver	ba961b2a-f87c-4b73-9b46-9fde48b18179	https://canopydesign.com	3	published	\N	\N
0fbcf083-1af5-416b-886c-4f40ede15ae7	Northlight Architecture	silver	713df7b0-279f-42ec-a229-2534ee4014af	https://northlightarchitecture.com	4	published	\N	\N
4b3e651f-63ce-4e6d-a699-e5f8f48554fc	Terraverde Materials	silver	80d6df78-4eba-4355-9662-655b3d39f7d9	https://terraverde.com	5	published	\N	\N
be73c710-fff0-4b88-8b9c-f0a4b09de867	Skyline Consulting	bronze	5e22b965-bbcd-48b5-8e93-a173288b334b	https://skylineconsulting.com	6	published	\N	\N
dc2a3b30-6fb6-4fda-bd92-c4ac65ce44fc	Blueprint Analytics	bronze	0434af03-7e74-47b7-a6c8-90740ebb4d94	https://blueprintanalytics.com	7	published	\N	\N
631a0f2d-c537-48e7-8b8a-a683fcc6f41b	FormLab Studio	bronze	d8ec1e92-f2f5-41f4-ba96-871e02f9b666	https://formlabstudio.com	8	published	\N	\N
7f5e63f9-2f2a-4ab6-9fc0-b68e5f624494	Atlas Construction Partners	bronze	a5e50ac6-1b08-4e3f-a8f8-ebbea4432c59	https://atlasconstruction.com	9	published	\N	\N
\.


--
-- Data for Name: partners_section; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.partners_section (id, label, heading) FROM stdin;
de871392-517b-4863-abc8-a924508c5621	Our Partners	Supported by leaders in the built environment.
\.


--
-- Data for Name: programme_section; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.programme_section (id, label, heading) FROM stdin;
e5967731-32b8-45ac-bae1-98cfe74a7e60	Programme	Three days. Fifteen sessions. One vision.
\.


--
-- Data for Name: schedule_days; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.schedule_days (id, day_number, title, date, sort, date_created, date_updated) FROM stdin;
c3d2337b-3400-4463-9df4-f1d74fa92496	1	Sustainable Futures	2026-10-15	1	\N	\N
c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	2	Urban Landscapes	2026-10-16	2	\N	\N
b142016a-85e1-4644-bb53-178c56a2e990	3	Digital Frontiers	2026-10-17	3	\N	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.sessions (id, title, type, start_time, room, day, sort, status, date_created, date_updated) FROM stdin;
e939e7a1-ff14-4c77-98d5-258a9d7c0543	Opening Keynote	keynote	09:30:00	Hall A	c3d2337b-3400-4463-9df4-f1d74fa92496	1	published	\N	\N
4f98964c-f1f8-48a3-8f40-87f53ba2067f	Net Zero by Design	panel	11:00:00	Hall A	c3d2337b-3400-4463-9df4-f1d74fa92496	2	published	\N	\N
c4491f41-46c4-4e21-965e-6674fa1c5aca	Timber's Second Coming	talk	14:00:00	Room B	c3d2337b-3400-4463-9df4-f1d74fa92496	3	published	\N	\N
dd5770aa-f75c-4aa5-baf1-49d8a667ad53	Cities That Breathe	talk	15:30:00	Hall A	c3d2337b-3400-4463-9df4-f1d74fa92496	4	published	\N	\N
8725c30c-5ced-4355-a93c-302e03048d1a	Life Cycle Assessment Tools	workshop	17:00:00	Room C	c3d2337b-3400-4463-9df4-f1d74fa92496	5	published	\N	\N
a352a1dd-7d60-4f4e-924b-07aa56d72bb3	The 15-Minute City	keynote	09:30:00	Hall A	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	6	published	\N	\N
a3e9e38d-9da6-4645-9166-0cff35a3f265	Housing Without Compromise	talk	11:00:00	Room B	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	7	published	\N	\N
c9283c34-1dbe-4b7f-a668-d03b1a5eb114	Public Space Reimagined	panel	14:00:00	Hall A	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	8	published	\N	\N
3790b8bb-b54c-44da-b55a-5d8ceb27429b	Infrastructure as Architecture	talk	15:30:00	Room B	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	9	published	\N	\N
0e3caaa2-0e5e-42ca-9af9-5b15410c8e68	Community Co-Design Methods	workshop	17:00:00	Room C	c9ef93ee-23c9-4328-a9d4-45ac47a18d2e	10	published	\N	\N
d69d1530-fc05-44c5-bb8d-9665321fb1cb	Algorithms and Aesthetics	keynote	09:30:00	Hall A	b142016a-85e1-4644-bb53-178c56a2e990	11	published	\N	\N
e076e5ad-8e2b-49c2-8c1c-3a58c893afd7	Smart Buildings, Smarter People	talk	11:00:00	Room B	b142016a-85e1-4644-bb53-178c56a2e990	12	published	\N	\N
6ffcdd5e-e2e4-46ff-a255-92714aac3244	AI in Architecture	panel	14:00:00	Hall A	b142016a-85e1-4644-bb53-178c56a2e990	13	published	\N	\N
340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4	Digital Twins for Urban Planning	talk	15:30:00	Room B	b142016a-85e1-4644-bb53-178c56a2e990	14	published	\N	\N
f3a71e8d-a6cf-4949-9db1-5c5cb505111b	Closing Remarks & Networking	event	16:30:00	Hall A	b142016a-85e1-4644-bb53-178c56a2e990	15	published	\N	\N
\.


--
-- Data for Name: sessions_speakers; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.sessions_speakers (id, sessions_id, speakers_id) FROM stdin;
7df6dd63-da50-4173-8bea-07cdf4f7abb1	e939e7a1-ff14-4c77-98d5-258a9d7c0543	3c211554-efa2-4bc0-bc41-ab4149e017cc
fe6bb198-621e-4704-8f0c-c78a9a6a09d0	4f98964c-f1f8-48a3-8f40-87f53ba2067f	3c211554-efa2-4bc0-bc41-ab4149e017cc
e1c677a9-edef-410e-9291-db31e220ed0f	4f98964c-f1f8-48a3-8f40-87f53ba2067f	790a5d8b-c735-439e-a77b-ffa3a2090d4f
65edf82a-13e4-4f71-9367-25be5e2b3f46	c4491f41-46c4-4e21-965e-6674fa1c5aca	790a5d8b-c735-439e-a77b-ffa3a2090d4f
4c46b687-1ccf-450e-b43a-a9173ba882c7	dd5770aa-f75c-4aa5-baf1-49d8a667ad53	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a
113510c4-f186-4490-99ef-38d1449e41ad	8725c30c-5ced-4355-a93c-302e03048d1a	e159b144-6ec8-42a4-b43d-b4a9ccefcb77
ab86fe93-4721-40d5-8040-8d224434673d	a352a1dd-7d60-4f4e-924b-07aa56d72bb3	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a
75b1bf6a-9fd8-4263-ade6-522dafd6034c	a3e9e38d-9da6-4645-9166-0cff35a3f265	e159b144-6ec8-42a4-b43d-b4a9ccefcb77
d1feef3e-357d-4edd-9fe3-9c1f7b5d20f9	c9283c34-1dbe-4b7f-a668-d03b1a5eb114	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a
d2ac1510-16c9-47b9-af85-9cdcdd2e1098	c9283c34-1dbe-4b7f-a668-d03b1a5eb114	e159b144-6ec8-42a4-b43d-b4a9ccefcb77
596e3a30-27f3-4ac9-833b-55e5dc4607d3	3790b8bb-b54c-44da-b55a-5d8ceb27429b	c90d7e62-6cf8-4e45-a053-acc36570f201
34d787e2-0c74-40a1-8c4d-39bc8904ea93	0e3caaa2-0e5e-42ca-9af9-5b15410c8e68	e159b144-6ec8-42a4-b43d-b4a9ccefcb77
fa00a004-87f4-466a-965b-9f33d25f8472	d69d1530-fc05-44c5-bb8d-9665321fb1cb	75612f84-bbd9-4f65-96d7-e3568a37ecb9
4f814c44-e6f7-4b7e-bd8f-7fbb24341515	e076e5ad-8e2b-49c2-8c1c-3a58c893afd7	c90d7e62-6cf8-4e45-a053-acc36570f201
1e3fe179-16c4-48d8-ad30-71bf7c7433ab	6ffcdd5e-e2e4-46ff-a255-92714aac3244	75612f84-bbd9-4f65-96d7-e3568a37ecb9
c0f4babe-3f87-4beb-a6f8-40bc5a2de33c	6ffcdd5e-e2e4-46ff-a255-92714aac3244	c90d7e62-6cf8-4e45-a053-acc36570f201
0b6ff5b5-4f5b-4aaa-ac10-9708bb694b2c	340fee73-4f21-4fdd-ad5a-5d5fdf3ebce4	ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a
\.


--
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.speakers (id, name, role, company, company_url, headshot, sort, status, date_created, date_updated, role_mobile, company_mobile) FROM stdin;
3c211554-efa2-4bc0-bc41-ab4149e017cc	Elena Vasquez	Founding Partner	Studio Vasquez	\N	0f167ca6-6050-406b-a14f-36ad6b08452f	1	published	\N	2026-03-04 23:24:03.119+00	Founding Partner	Studio Vasquez
75612f84-bbd9-4f65-96d7-e3568a37ecb9	Lina Petersson	Head of Computational Design	Forma Architects	\N	140025b1-41fc-457b-9c03-5b4d6841608f	3	published	\N	2026-03-04 23:24:03.159+00	Computational Design	Forma Architects
e159b144-6ec8-42a4-b43d-b4a9ccefcb77	Sophie Laurent	Founder & Director	UrbanLab Paris	\N	6f5d6d97-5d81-41a3-a7d7-3d575ecae1f9	5	published	\N	2026-03-04 23:24:03.193+00	Founder & Director	UrbanLab Paris
ca5fcda0-f97d-4ac5-8bad-b36dc5707f7a	James Okonkwo	Director of Urban Design	Metropolitan Studio	\N	c99b6bac-dcd4-428a-a625-73224bc0545c	2	published	\N	2026-03-04 23:53:04.26+00	Director of Urban Design	Metropolitan Studio
790a5d8b-c735-439e-a77b-ffa3a2090d4f	Ravi Mehta	Professor of Sustainable Construction	UCL Bartlett School of Architecture	\N	25ec1694-34b1-4582-b4fe-107cf42a0ece	4	published	\N	2026-03-04 23:53:04.287+00	Professor	UCL Bartlett
c90d7e62-6cf8-4e45-a053-acc36570f201	Marcus Brandt	Innovation Lead	Arup Engineering	\N	fea91a70-407c-4194-8611-3a4b2743d4d9	6	published	\N	2026-03-04 23:53:04.307+00	Innovation Lead	Arup Engineering
\.


--
-- Data for Name: speakers_section; Type: TABLE DATA; Schema: public; Owner: daedalus
--

COPY public.speakers_section (id, label, heading) FROM stdin;
df2d9f82-4929-4b4e-bd60-f8c850faffe3	Featured Speakers	The sharpest minds in architecture & design.
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 616, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 251, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 14, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 27, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 408, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daedalus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: about about_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.about
    ADD CONSTRAINT about_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_deployment_projects directus_deployment_projects_deployment_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_external_id_unique UNIQUE (deployment, external_id);


--
-- Name: directus_deployment_projects directus_deployment_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_pkey PRIMARY KEY (id);


--
-- Name: directus_deployment_runs directus_deployment_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_pkey PRIMARY KEY (id);


--
-- Name: directus_deployments directus_deployments_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_pkey PRIMARY KEY (id);


--
-- Name: directus_deployments directus_deployments_provider_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_provider_unique UNIQUE (provider);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: hero hero_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_pkey PRIMARY KEY (id);


--
-- Name: navigation navigation_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: partners_section partners_section_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.partners_section
    ADD CONSTRAINT partners_section_pkey PRIMARY KEY (id);


--
-- Name: programme_section programme_section_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.programme_section
    ADD CONSTRAINT programme_section_pkey PRIMARY KEY (id);


--
-- Name: schedule_days schedule_days_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.schedule_days
    ADD CONSTRAINT schedule_days_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions_speakers sessions_speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.sessions_speakers
    ADD CONSTRAINT sessions_speakers_pkey PRIMARY KEY (id);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- Name: speakers_section speakers_section_pkey; Type: CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.speakers_section
    ADD CONSTRAINT speakers_section_pkey PRIMARY KEY (id);


--
-- Name: directus_activity_timestamp_index; Type: INDEX; Schema: public; Owner: daedalus
--

CREATE INDEX directus_activity_timestamp_index ON public.directus_activity USING btree ("timestamp");


--
-- Name: directus_revisions_activity_index; Type: INDEX; Schema: public; Owner: daedalus
--

CREATE INDEX directus_revisions_activity_index ON public.directus_revisions USING btree (activity);


--
-- Name: directus_revisions_parent_index; Type: INDEX; Schema: public; Owner: daedalus
--

CREATE INDEX directus_revisions_parent_index ON public.directus_revisions USING btree (parent);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployment_projects directus_deployment_projects_deployment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_foreign FOREIGN KEY (deployment) REFERENCES public.directus_deployments(id) ON DELETE CASCADE;


--
-- Name: directus_deployment_projects directus_deployment_projects_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployment_runs directus_deployment_runs_project_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_project_foreign FOREIGN KEY (project) REFERENCES public.directus_deployment_projects(id) ON DELETE CASCADE;


--
-- Name: directus_deployment_runs directus_deployment_runs_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployments directus_deployments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: sessions sessions_day_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_day_foreign FOREIGN KEY (day) REFERENCES public.schedule_days(id) ON DELETE SET NULL;


--
-- Name: sessions_speakers sessions_speakers_sessions_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.sessions_speakers
    ADD CONSTRAINT sessions_speakers_sessions_id_foreign FOREIGN KEY (sessions_id) REFERENCES public.sessions(id) ON DELETE SET NULL;


--
-- Name: sessions_speakers sessions_speakers_speakers_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: daedalus
--

ALTER TABLE ONLY public.sessions_speakers
    ADD CONSTRAINT sessions_speakers_speakers_id_foreign FOREIGN KEY (speakers_id) REFERENCES public.speakers(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict EBdCZe0ZMYSQ6eZlsWdun6O7IgtdStnv1ZRI42Hi5crxR2FxPBkcJNxcXRVWXGK

