--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    diameter_in_km integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text
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
-- Name: universe_catalog; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_catalog (
    universe_catalog_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.universe_catalog OWNER TO freecodecamp;

--
-- Name: universe_catalog_universe_catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_catalog_universe_catalog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_catalog_universe_catalog_id_seq OWNER TO freecodecamp;

--
-- Name: universe_catalog_universe_catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_catalog_universe_catalog_id_seq OWNED BY public.universe_catalog.universe_catalog_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_catalog universe_catalog_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog ALTER COLUMN universe_catalog_id SET DEFAULT nextval('public.universe_catalog_universe_catalog_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Aurora Spiral', 'Spiral', 12000, 2500000);
INSERT INTO public.galaxy VALUES (2, 'Nebula Crown', 'Elliptical', 13000, 54000000);
INSERT INTO public.galaxy VALUES (3, 'Twin Vortex', 'Barred Spiral', 9500, 23000000);
INSERT INTO public.galaxy VALUES (4, 'Silver Lantern', 'Spiral', 10500, 8900000);
INSERT INTO public.galaxy VALUES (5, 'Crimson Veil', 'Irregular', 7800, 1600000);
INSERT INTO public.galaxy VALUES (6, 'Ghost Halo', 'Elliptical', 12500, 71000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lumi', 1, true, 3400);
INSERT INTO public.moon VALUES (2, 'Nox', 1, true, 2100);
INSERT INTO public.moon VALUES (3, 'Ember', 2, false, 85);
INSERT INTO public.moon VALUES (4, 'Spark', 2, false, 30);
INSERT INTO public.moon VALUES (5, 'Ripple', 4, true, 1800);
INSERT INTO public.moon VALUES (6, 'Brine', 4, true, 1500);
INSERT INTO public.moon VALUES (7, 'Foam', 4, false, 40);
INSERT INTO public.moon VALUES (8, 'Drift', 5, true, 1200);
INSERT INTO public.moon VALUES (9, 'Gale', 6, true, 2600);
INSERT INTO public.moon VALUES (10, 'Anvil', 7, false, 120);
INSERT INTO public.moon VALUES (11, 'Forge', 7, true, 3100);
INSERT INTO public.moon VALUES (12, 'Haze', 8, false, 60);
INSERT INTO public.moon VALUES (13, 'Prism', 9, true, 2200);
INSERT INTO public.moon VALUES (14, 'Shard', 9, false, 35);
INSERT INTO public.moon VALUES (15, 'Honey', 11, true, 1900);
INSERT INTO public.moon VALUES (16, 'Resin', 11, false, 70);
INSERT INTO public.moon VALUES (17, 'Gloam', 12, false, 45);
INSERT INTO public.moon VALUES (18, 'Fern', 13, true, 2800);
INSERT INTO public.moon VALUES (19, 'Moss', 13, false, 90);
INSERT INTO public.moon VALUES (20, 'Vine', 13, false, 55);
INSERT INTO public.moon VALUES (21, 'Icicle', 14, true, 1600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Verdana', 1, true, 4500);
INSERT INTO public.planet VALUES (2, 'Cindara', 1, false, 4550);
INSERT INTO public.planet VALUES (3, 'Glacia', 1, false, 4400);
INSERT INTO public.planet VALUES (4, 'Tidalis', 2, true, 6100);
INSERT INTO public.planet VALUES (5, 'Dustar', 2, false, 6150);
INSERT INTO public.planet VALUES (6, 'Zephyra', 3, false, 7900);
INSERT INTO public.planet VALUES (7, 'Ironhold', 3, false, 7950);
INSERT INTO public.planet VALUES (8, 'Mistral', 4, false, 3000);
INSERT INTO public.planet VALUES (9, 'Crystallon', 4, false, 3050);
INSERT INTO public.planet VALUES (10, 'Hollow', 4, false, 2900);
INSERT INTO public.planet VALUES (11, 'Amberlyn', 5, false, 2400);
INSERT INTO public.planet VALUES (12, 'Duskfall', 5, false, 2450);
INSERT INTO public.planet VALUES (13, 'Emeraldis', 6, true, 5300);
INSERT INTO public.planet VALUES (14, 'Frostreach', 6, false, 5350);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Helios Prime', 1, 4600, 2480000, 'A stable yellow star that warms Verdana, a living world.');
INSERT INTO public.star VALUES (2, 'Orion Minor', 1, 6200, 2530000, 'An old orange star whose ocean world Tidalis supports life.');
INSERT INTO public.star VALUES (3, 'Solara Beta', 2, 8000, 53950000, 'A very old white star orbited by two barren planets.');
INSERT INTO public.star VALUES (4, 'Vesper', 2, 3100, 54070000, 'A dim red dwarf with three cold, lifeless worlds.');
INSERT INTO public.star VALUES (5, 'Castor Alpha', 3, 2500, 22985000, 'A young, hot blue-white star with no known life nearby.');
INSERT INTO public.star VALUES (6, 'Pollux Beta', 3, 5400, 23040000, 'A mid-aged star whose green world Emeraldis teems with life.');


--
-- Data for Name: universe_catalog; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_catalog VALUES (1, 'Lumi', 1, 1, 1, 1);
INSERT INTO public.universe_catalog VALUES (2, 'Nox', 1, 1, 1, 2);
INSERT INTO public.universe_catalog VALUES (3, 'Ember', 1, 1, 2, 3);
INSERT INTO public.universe_catalog VALUES (4, 'Spark', 1, 1, 2, 4);
INSERT INTO public.universe_catalog VALUES (5, 'Ripple', 1, 2, 4, 5);
INSERT INTO public.universe_catalog VALUES (6, 'Brine', 1, 2, 4, 6);
INSERT INTO public.universe_catalog VALUES (7, 'Foam', 1, 2, 4, 7);
INSERT INTO public.universe_catalog VALUES (8, 'Drift', 1, 2, 5, 8);
INSERT INTO public.universe_catalog VALUES (9, 'Gale', 2, 3, 6, 9);
INSERT INTO public.universe_catalog VALUES (10, 'Anvil', 2, 3, 7, 10);
INSERT INTO public.universe_catalog VALUES (11, 'Forge', 2, 3, 7, 11);
INSERT INTO public.universe_catalog VALUES (12, 'Haze', 2, 4, 8, 12);
INSERT INTO public.universe_catalog VALUES (13, 'Prism', 2, 4, 9, 13);
INSERT INTO public.universe_catalog VALUES (14, 'Shard', 2, 4, 9, 14);
INSERT INTO public.universe_catalog VALUES (15, 'Honey', 3, 5, 11, 15);
INSERT INTO public.universe_catalog VALUES (16, 'Resin', 3, 5, 11, 16);
INSERT INTO public.universe_catalog VALUES (17, 'Gloam', 3, 5, 12, 17);
INSERT INTO public.universe_catalog VALUES (18, 'Fern', 3, 6, 13, 18);
INSERT INTO public.universe_catalog VALUES (19, 'Moss', 3, 6, 13, 19);
INSERT INTO public.universe_catalog VALUES (20, 'Vine', 3, 6, 13, 20);
INSERT INTO public.universe_catalog VALUES (21, 'Icicle', 3, 6, 14, 21);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_catalog_universe_catalog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_catalog_universe_catalog_id_seq', 21, true);


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
-- Name: universe_catalog universe_catalog_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_name_key UNIQUE (name);


--
-- Name: universe_catalog universe_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_pkey PRIMARY KEY (universe_catalog_id);


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
-- Name: universe_catalog universe_catalog_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe_catalog universe_catalog_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe_catalog universe_catalog_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe_catalog universe_catalog_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_catalog
    ADD CONSTRAINT universe_catalog_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

