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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    celestial_bodies_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass double precision NOT NULL,
    size_in_meters integer NOT NULL,
    age_in_years integer NOT NULL,
    description text,
    mass_in_kilograms numeric
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: celestial_bodies_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_bodies_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_body_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_bodies_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_bodies_body_id_seq OWNED BY public.celestial_bodies.celestial_bodies_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass double precision NOT NULL,
    size_in_light_years integer NOT NULL,
    number_of_stars integer NOT NULL,
    description text
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
    mass double precision NOT NULL,
    radius_in_kilometers integer NOT NULL,
    distance_from_planet_in_kilometers integer NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_atmosphere boolean
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
    mass double precision NOT NULL,
    radius_in_kilometers integer NOT NULL,
    distance_from_star_in_light_years integer NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_atmosphere boolean
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
    name character varying(255) NOT NULL,
    mass double precision NOT NULL,
    temperature_kelvin integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: celestial_bodies celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN celestial_bodies_id SET DEFAULT nextval('public.celestial_bodies_body_id_seq'::regclass);


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
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES (2, 'Comet Halley', 140000000000000, 100, 1000, 'Famous periodic comet.', 200000000000000);
INSERT INTO public.celestial_bodies VALUES (3, 'Comet Hale-Bopp', 220000000000000, 150, 2000, 'Bright comet with a long period.', 300000000000000);
INSERT INTO public.celestial_bodies VALUES (4, 'Comet NEOWISE', 10000000000000, 80, 500, 'Discovered by NEOWISE space telescope.', 15000000000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 580000000000, 100000, 200, 'Milky Way, a barred spiral.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1760000000000, 150000, 300, 'Andromeda, closest spiral to Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 18000000000, 5000, 50, 'Triangulum, a small spiral.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 6400000000000, 8000, 100, 'Messier 87, a giant elliptical.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100000000000, 7000, 80, 'Whirlpool, a classic spiral.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 320000000000, 9000, 120, 'Sombrero, a spiral in Virgo.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 7.342e+22, 1737, 384400, 12, 'Earth''s natural satellite.', false);
INSERT INTO public.moon VALUES (22, 'Phobos', 1.0659e+16, 11, 9378, 13, 'Mars''s innermost moon.', false);
INSERT INTO public.moon VALUES (23, 'Callisto', 1.0759e+23, 2400, 1882700, 14, 'One of Jupiter''s Galilean moons.', false);
INSERT INTO public.moon VALUES (24, 'Titan', 1.3455e+23, 2576, 1221870, 15, 'Saturn''s largest moon with a thick atmosphere.', true);
INSERT INTO public.moon VALUES (25, 'Umbriel', 1.27e+21, 585, 266300, 16, 'Uranus''s third-largest moon.', false);
INSERT INTO public.moon VALUES (26, 'Triton', 2.1400000000000002e+22, 1353, 354760, 17, 'Neptune''s largest moon with a retrograde orbit.', true);
INSERT INTO public.moon VALUES (27, 'Charon', 1.586e+21, 604, 19571, 18, 'Pluto''s largest moon and a binary partner.', false);
INSERT INTO public.moon VALUES (28, 'Hydra', 4.2e+16, 30, 64738, 18, 'Pluto''s small irregular moon.', false);
INSERT INTO public.moon VALUES (29, 'Phoebe', 8.292e+18, 107, 12947600, 19, 'Saturn''s irregular moon with a retrograde orbit.', false);
INSERT INTO public.moon VALUES (30, 'Rhea', 2.31e+21, 764, 527108, 15, 'Saturn''s second-largest moon.', false);
INSERT INTO public.moon VALUES (31, 'Oberon', 3.014e+21, 761, 583520, 16, 'Uranus''s second-largest moon.', false);
INSERT INTO public.moon VALUES (32, 'Nereid', 3.1e+19, 170, 5513530, 17, 'Neptune''s third-largest moon.', false);
INSERT INTO public.moon VALUES (33, 'Styx', 8.4e+16, 5, 4257280, 18, 'Pluto''s small moon.', false);
INSERT INTO public.moon VALUES (34, 'Lysithea', 6.3e+16, 18, 11719000, 10, 'Jupiter''s irregular moon.', false);
INSERT INTO public.moon VALUES (35, 'Nix', 4.5e+16, 46, 4878000, 18, 'Pluto''s irregular moon.', false);
INSERT INTO public.moon VALUES (36, 'Aegir', 6.7e+16, 19, 20610000, 16, 'Uranus''s irregular moon.', false);
INSERT INTO public.moon VALUES (37, 'Galatea', 2.12e+17, 88, 61953, 17, 'Neptune''s inner satellite moon.', false);
INSERT INTO public.moon VALUES (38, 'Neso', 2.02e+16, 60, 50000000, 17, 'Neptune''s irregular moon.', false);
INSERT INTO public.moon VALUES (39, 'Sycorax', 2.2e+17, 75, 12179000, 17, 'Neptune''s irregular moon.', false);
INSERT INTO public.moon VALUES (40, 'Proteus', 4.4e+19, 210, 117647, 17, 'Large irregular moon of Neptune.', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Mercury', 3.285e+23, 2439, 0, 1, 'Smallest planet.', false);
INSERT INTO public.planet VALUES (11, 'Venus', 4.867e+24, 6052, 1, 1, 'Thick atmosphere, extreme temperatures.', true);
INSERT INTO public.planet VALUES (12, 'Earth', 5.972e+24, 6371, 1, 1, 'Only known planet with life.', true);
INSERT INTO public.planet VALUES (13, 'Mars', 6.39e+23, 3389, 2, 1, 'Red Planet, thin atmosphere.', true);
INSERT INTO public.planet VALUES (14, 'Jupiter', 1.898e+27, 69911, 5, 2, 'Largest gas giant.', true);
INSERT INTO public.planet VALUES (15, 'Saturn', 5.683e+26, 58232, 10, 2, 'Known for stunning rings.', true);
INSERT INTO public.planet VALUES (16, 'Uranus', 8.681e+25, 25362, 19, 2, 'Ice giant with unique axis.', true);
INSERT INTO public.planet VALUES (17, 'Neptune', 1.0239999999999999e+26, 24622, 30, 2, 'Ice giant, deep blue color.', true);
INSERT INTO public.planet VALUES (18, 'Kepler-22b', 6.399999999999999e+24, 24753, 600, 3, 'Exoplanet in habitable zone.', true);
INSERT INTO public.planet VALUES (19, 'HD 209458 b', 1.149e+25, 71500, 150, 4, 'Extrasolar gas giant.', false);
INSERT INTO public.planet VALUES (20, 'Gliese 581g', 3.1e+25, 34000, 20, 5, 'Exoplanet potentially habitable.', true);
INSERT INTO public.planet VALUES (21, 'Trappist-1e', 4.8e+24, 8050, 0, 6, 'Exoplanet with potential for liquid water.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.989e+30, 5778, 4600, 'Sun, a G-type star.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2.02e+30, 9940, 200, 'Sirius, brightest in Canis Major.', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2.24e+30, 5790, 5000, 'Alpha Centauri A, part of its system.', 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2.42e+29, 3042, 1000, 'Proxima Centauri, red dwarf, closest.', 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 7.9e+31, 3500, 800, 'Betelgeuse, red supergiant in Orion.', 4);
INSERT INTO public.star VALUES (6, 'Vega', 2.135e+30, 9602, 400, 'Vega, brightest in Lyra.', 1);


--
-- Name: celestial_bodies_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_bodies_body_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


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
-- Name: celestial_bodies unique_name_celestial_bodies; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT unique_name_celestial_bodies UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


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

