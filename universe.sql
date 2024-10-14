--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric NOT NULL,
    type text NOT NULL,
    habitable boolean NOT NULL,
    explored boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    composition text,
    has_water boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius integer NOT NULL,
    population bigint,
    supports_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location text,
    operational boolean NOT NULL,
    crew_capacity integer NOT NULL
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity integer NOT NULL,
    mass numeric,
    main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 'Spiral', true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12.0, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 10.5, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11.2, 'Elliptical', false, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 9.0, 'Spiral', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 'Silicate', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 'Carbonaceous', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 'Carbonaceous', false);
INSERT INTO public.moon VALUES (4, 'Io', 4, 3643, 'Silicate', false);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3121, 'Water Ice', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268, 'Silicate', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, 'Silicate', false);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, 'Water Ice', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 504, 'Water Ice', true);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 396, 'Water Ice', false);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 2706, 'Water Ice', false);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 1523, 'Water Ice', false);
INSERT INTO public.moon VALUES (13, 'Proxima c1', 8, 1543, 'Rocky', false);
INSERT INTO public.moon VALUES (14, 'Proxima c2', 8, 1440, 'Rocky', false);
INSERT INTO public.moon VALUES (15, 'Sirius B', 9, 1737, 'Rocky', false);
INSERT INTO public.moon VALUES (16, 'Alpha Centauri Bc1', 10, 2400, 'Rocky', false);
INSERT INTO public.moon VALUES (17, 'Betelgeuse e', 11, 2500, 'Rocky', false);
INSERT INTO public.moon VALUES (18, 'Betelgeuse f', 11, 1900, 'Rocky', false);
INSERT INTO public.moon VALUES (19, 'Rigel g', 12, 2000, 'Rocky', false);
INSERT INTO public.moon VALUES (20, 'Rigel h', 12, 1600, 'Rocky', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 7800000000, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, NULL, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, NULL, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 69911, NULL, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 58232, NULL, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 24622, NULL, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, NULL, false);
INSERT INTO public.planet VALUES (8, 'Proxima b', 2, 7140, NULL, true);
INSERT INTO public.planet VALUES (9, 'Sirius A', 3, 12104, NULL, false);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 4, 5500, NULL, true);
INSERT INTO public.planet VALUES (11, 'Betelgeuse c', 5, 69510, NULL, false);
INSERT INTO public.planet VALUES (12, 'Rigel d', 6, 24600, NULL, false);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', 'Orbting Earth', true, 6);
INSERT INTO public.space_station VALUES (2, 'Tiangong', 'Low Earth Orbit', true, 3);
INSERT INTO public.space_station VALUES (3, 'Skylab', 'Deorbited Station', false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 100, 1.0, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 10, 0.12, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 25, 2.1, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 2, 22, 1.1, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 1000, 20.0, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 850, 17.0, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

