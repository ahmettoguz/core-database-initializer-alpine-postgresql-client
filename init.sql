DO $$
BEGIN
    PERFORM pg_terminate_backend(pg_stat_activity.pid)
    FROM pg_stat_activity
    WHERE pg_stat_activity.datname = 'code_stream' AND pid <> pg_backend_pid();
END;
$$;


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS code_stream;
CREATE DATABASE code_stream WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE code_stream OWNER TO admin;

\connect code_stream

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;
CREATE TABLE public.code (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    game_id integer,
    player_id integer,
    is_active boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.code OWNER TO admin;

CREATE SEQUENCE public.code_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.code_id OWNER TO admin;

ALTER SEQUENCE public.code_id OWNED BY public.code.id;


CREATE TABLE public.game (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_deleted boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.game OWNER TO admin;

CREATE TABLE public.game_detail (
    id integer NOT NULL,
    game_id integer,
    description character varying(500) NOT NULL,
    genre character varying(25) NOT NULL,
    is_deleted boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.game_detail OWNER TO admin;

CREATE SEQUENCE public.game_detail_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_detail_id OWNER TO admin;

ALTER SEQUENCE public.game_detail_id OWNED BY public.game_detail.id;


CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_id_seq OWNER TO admin;

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


CREATE TABLE public.player (
    id integer NOT NULL,
    nick_name character varying(25) NOT NULL,
    password character varying(100) NOT NULL,
    is_deleted boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.player OWNER TO admin;

CREATE TABLE public.player_game (
    id integer NOT NULL,
    player_id integer,
    game_id integer
);


ALTER TABLE public.player_game OWNER TO admin;

CREATE SEQUENCE public.player_game_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_game_id OWNER TO admin;

ALTER SEQUENCE public.player_game_id OWNED BY public.player_game.id;


CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_id_seq OWNER TO admin;

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


ALTER TABLE ONLY public.code ALTER COLUMN id SET DEFAULT nextval('public.code_id'::regclass);


ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


ALTER TABLE ONLY public.game_detail ALTER COLUMN id SET DEFAULT nextval('public.game_detail_id'::regclass);


ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


ALTER TABLE ONLY public.player_game ALTER COLUMN id SET DEFAULT nextval('public.player_game_id'::regclass);


COPY public.code (id, code, game_id, player_id, is_active, created_at, updated_at) FROM stdin;
1	ABC123	1	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
2	DEF456	1	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
3	GHI789	1	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
4	JKL012	1	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
5	MNO345	2	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
6	PQR678	2	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
7	STU901	2	1	t	2025-01-09 13:50:24	2025-01-09 13:50:24
8	VWX234	4	2	t	2025-01-09 13:50:24	2025-01-09 13:50:24
9	YZA567	4	2	t	2025-01-09 13:50:24	2025-01-09 13:50:24
10	BCD890	4	2	t	2025-01-09 13:50:24	2025-01-09 13:50:24
\.


COPY public.game (id, name, is_deleted, created_at, updated_at) FROM stdin;
1	Genshin Impact	f	2025-01-09 13:50:24	2025-01-09 13:50:24
2	League of Legends	f	2025-01-09 13:50:24	2025-01-09 13:50:24
3	Fortnite	f	2025-01-09 13:50:24	2025-01-09 13:50:24
4	Alex Legends	f	2025-01-09 13:50:24	2025-01-09 13:50:24
5	Minecraft	f	2025-01-09 13:50:24	2025-01-09 13:50:24
6	Call of Duty: Warzone	f	2025-01-09 13:50:24	2025-01-09 13:50:24
7	Valorant	f	2025-01-09 13:50:24	2025-01-09 13:50:24
8	Cyberpunk 2077	f	2025-01-09 13:50:24	2025-01-09 13:50:24
9	FIFA 21	f	2025-01-09 13:50:24	2025-01-09 13:50:24
10	The Witcher 3	f	2025-01-09 13:50:24	2025-01-09 13:50:24
\.

COPY public.game_detail (id, game_id, description, genre, is_deleted, created_at, updated_at) FROM stdin;
1	1	An open-world action role-playing game developed by miHoYo.	Action, RPG	f	2025-01-09 13:50:24	2025-01-09 13:50:24
2	2	Multiplayer online battle arena game developed by Riot Games.	MOBA	f	2025-01-09 13:50:24	2025-01-09 13:50:24
3	3	Battle royale game developed by Epic Games.	Battle Royale	f	2025-01-09 13:50:24	2025-01-09 13:50:24
4	4	Multiplayer first-person shooter game developed by Respawn Entertainment.	FPS	f	2025-01-09 13:50:24	2025-01-09 13:50:24
5	5	Sandbox video game developed by Mojang Studios.	Sandbox	f	2025-01-09 13:50:24	2025-01-09 13:50:24
6	6	Battle royale game developed by Infinity Ward.	Battle Royale	f	2025-01-09 13:50:24	2025-01-09 13:50:24
7	7	Tactical shooter game developed by Riot Games.	Tactical Shooter	f	2025-01-09 13:50:24	2025-01-09 13:50:24
8	8	Open-world role-playing game developed by CD Projekt.	RPG, Action	f	2025-01-09 13:50:24	2025-01-09 13:50:24
9	9	Football simulation video game developed by EA Sports.	Sports	f	2025-01-09 13:50:24	2025-01-09 13:50:24
10	10	Action role-playing game developed by CD Projekt Red.	RPG	f	2025-01-09 13:50:24	2025-01-09 13:50:24
\.


COPY public.player (id, nick_name, password, is_deleted, created_at, updated_at) FROM stdin;
1	starlight	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
2	blizzard	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
3	phantom	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
4	viper	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
5	neon	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
6	maverick	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
7	zenith	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
8	tornado	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
9	raven	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
10	spectrum	secret	f	2025-01-09 13:50:24	2025-01-09 13:50:24
\.


COPY public.player_game (id, player_id, game_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	2	5
6	2	6
7	3	7
8	3	8
9	3	9
10	3	10
\.


SELECT pg_catalog.setval('public.code_id', 10, true);


SELECT pg_catalog.setval('public.game_detail_id', 10, true);


SELECT pg_catalog.setval('public.game_id_seq', 10, true);


SELECT pg_catalog.setval('public.player_game_id', 10, true);


SELECT pg_catalog.setval('public.player_id_seq', 10, true);


ALTER TABLE ONLY public.code
    ADD CONSTRAINT code_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.game_detail
    ADD CONSTRAINT game_detail_game_id_key UNIQUE (game_id);


ALTER TABLE ONLY public.game_detail
    ADD CONSTRAINT game_detail_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_name_key UNIQUE (name);


ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT player_game_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_nick_name_key UNIQUE (nick_name);


ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.code
    ADD CONSTRAINT code_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE SET NULL;


ALTER TABLE ONLY public.code
    ADD CONSTRAINT code_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE SET NULL;


ALTER TABLE ONLY public.game_detail
    ADD CONSTRAINT game_detail_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE SET NULL;


ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT player_game_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id) ON DELETE SET NULL;


ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT player_game_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE SET NULL;


