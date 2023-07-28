--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_km integer,
    distance_earth integer,
    composition text,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars text,
    distance_from_earth integer,
    age text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_celestial_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer NOT NULL,
    is_spherical boolean,
    orbital_speed_kms integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: moon_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_celestial_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    star_id integer NOT NULL,
    galaxy_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: planet_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_celestial_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    apprent_magnitude numeric(5,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: star_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_celestial_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_celestial_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_celestial_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_celestial_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 414, 'C-type_caebonaceous', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 940, 414, 'V-type_basaltic', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 414, 'B-type_metallic', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Antennae Galaxies', 'Unknown', NULL, '13.6 billion');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Unknown', NULL, 'Unknown');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', '10 billion', 17000000, 'Unknown');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 'Unknown', 400000000, 'Unknown');
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', '100 to 400 billion', NULL, '13.6 billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', '1 trillion', 2500000, '13.6 billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Fobos', 5, true, 2138);
INSERT INTO public.moon VALUES (2, 'Deimos', 5, true, 1351);
INSERT INTO public.moon VALUES (3, 'Ariel', 6, true, 5513);
INSERT INTO public.moon VALUES (4, 'Umbriel', 6, true, 4669);
INSERT INTO public.moon VALUES (5, 'Caliban', 6, true, 2356);
INSERT INTO public.moon VALUES (6, 'Titania', 6, true, 3644);
INSERT INTO public.moon VALUES (7, 'Sycorax', 6, true, 2119);
INSERT INTO public.moon VALUES (8, 'Setebos', 6, true, 1773);
INSERT INTO public.moon VALUES (10, 'Moon', 1, true, 3683);
INSERT INTO public.moon VALUES (12, 'Europa', 8, false, 47878);
INSERT INTO public.moon VALUES (13, 'Ganymede', 8, false, 37320);
INSERT INTO public.moon VALUES (14, 'Callisto', 8, false, 30844);
INSERT INTO public.moon VALUES (9, 'Stephano', 6, false, 4814);
INSERT INTO public.moon VALUES (15, 'Dione', 9, true, 10018);
INSERT INTO public.moon VALUES (16, 'Tethys', 9, true, 11750);
INSERT INTO public.moon VALUES (17, 'Rhea', 9, true, 8483);
INSERT INTO public.moon VALUES (18, 'Iapetus', 9, true, 3168);
INSERT INTO public.moon VALUES (11, 'Io', 8, true, 42576);
INSERT INTO public.moon VALUES (19, 'Triton', 7, true, 4392);
INSERT INTO public.moon VALUES (20, 'Miranda', 6, false, 23976);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri b', 2, 2, false);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 1, false);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 1, false);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 1, false);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 1, false);
INSERT INTO public.planet VALUES (7, 'Netuno', 1, 1, false);
INSERT INTO public.planet VALUES (8, 'Jupiter', 1, 1, false);
INSERT INTO public.planet VALUES (9, 'Saturn', 1, 1, false);
INSERT INTO public.planet VALUES (10, 'Kepler-456b', 7, 1, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1 d', 8, 1, false);
INSERT INTO public.planet VALUES (12, 'HD 209458', 9, 1, false);
INSERT INTO public.planet VALUES (14, 'WASP-76b', 11, 1, false);
INSERT INTO public.planet VALUES (13, 'Gliese 581', 10, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 6000, 0.010);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 300, 1.420);
INSERT INTO public.star VALUES (4, 'Adhil', 2, NULL, 4.880);
INSERT INTO public.star VALUES (6, 'Nembus', 2, NULL, 3.570);
INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, -26.710);
INSERT INTO public.star VALUES (5, 'Mirach', 2, NULL, 2.060);
INSERT INTO public.star VALUES (7, 'Kepler-453', 1, NULL, 12.000);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 1, NULL, 18.800);
INSERT INTO public.star VALUES (9, 'HD 209458', 1, NULL, 7.650);
INSERT INTO public.star VALUES (10, 'Gliese 581', 1, NULL, 10.560);
INSERT INTO public.star VALUES (11, 'WASP-76', 1, NULL, 9.520);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_celestial_id_seq', 6, true);


--
-- Name: moon_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_celestial_id_seq', 20, true);


--
-- Name: planet_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_celestial_id_seq', 14, true);


--
-- Name: star_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_celestial_id_seq', 11, true);


--
-- Name: asteroid asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: asteroid name_asteroid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT name_asteroid UNIQUE (name);


--
-- Name: moon name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon UNIQUE (name);


--
-- Name: planet name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet UNIQUE (name);


--
-- Name: star name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

