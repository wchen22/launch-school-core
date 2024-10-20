DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');  
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');  
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');  

-- CREATE TABLE stars (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(25) UNIQUE NOT NULL,
--   distance int NOT NULL CHECK (distance > 0),
--   spectral_type CHAR(1) CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
--   companions int NOT NULL CHECK (companions >= 0)
-- );