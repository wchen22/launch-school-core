DROP TABLE IF EXISTS lists;
DROP TABLE IF EXISTS todos;

CREATE TABLE lists (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  name text NOT NULL,
  completed boolean NOT NULL DEFAULT false,
  list_id integer NOT NULL REFERENCES lists(id)
);