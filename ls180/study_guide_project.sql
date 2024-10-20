DROP TABLE IF EXISTS players_sponsors;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS sponsors;
DROP TABLE IF EXISTS bc;
DROP TABLE IF EXISTS ab;




-- What is a relational database? What about an RDBMS? What problems does the relational data model solve and what does it enable you to do?

-- The relational model is a way to structure data in a way to manage increasing complexity as the dataset grows. The structure added allows for important qualities such as avoided duplication and data integrity. RDBMS's such as PostgreSQL are software used to interact with relational databases (such as SQL based databases) using their specific syntax and interfaces.

-- PostgreSQL has 3 sublanguages: DDL (Data Definition Language), DML (Data Manipulation Language), and DCL (Data Control Language). DDL has to do with creating and modifying the structure of structured data, DML has to do with manipulating and querying the data itself, and DCL has to do with access and permissions for working with both structure and data themselves. 

-- Under DDL are statements with allow you to CREATE, ALTER, and DROP one of DATABASE, TABLE, or COLUMN.

CREATE DATABASE nba;
ALTER DATABASE nba RENAME TO nba_2024;
DROP DATABASE nba_2024;

CREATE TABLE nba_players (
  name varchar(50),
  team varchar(50),
  age integer
);

-- RENAME the table or the COLUMN
ALTER TABLE nba_players RENAME TO players;
ALTER TABLE players RENAME COLUMN name TO full_name;

ALTER TABLE players
  -- Can add new columns
  ADD COLUMN injury_status text DEFAULT 'Ready',

  -- ALTER COLUMN is used for modifying existing column properties like data type and default value or adding a NOT NULL constraint
  ALTER COLUMN full_name TYPE text,
  ALTER COLUMN team TYPE text,
  -- One way of remembering why NOT NULL and DEFAULT can be set via ALTER COLUMN while CHECK and UNIQUE are added via ADD CONSTRAINT is that NOT NULL and DEFAULT apply to single columns, while CHECK and UNIQUE can involve more than one column and therefore apply more logically at the table level
  ALTER COLUMN team SET DEFAULT 'Free Agent', -- DROP DEFAULT
  ALTER COLUMN full_name SET NOT NULL, -- DROP NOT NULL

  ADD CHECK(full_name <> ''), -- This is a table constraint. 
  ADD UNIQUE(full_name),
  --ADD CONSTRAINT unique_full_name UNIQUE(full_name), -- DROP CONSTRAINT constraint_name

  -- Foreign Key
  -- ADD CONSTRAINT constraint_name FOREIGN KEY (team_id) REFERENCES teams(id) [ON DELETE CASCADE];

  -- Primary Key
  ADD PRIMARY KEY(full_name);
    -- Will add a NOT NULL constraint if one doesn't exist
    -- Implicitly adds a unique constraint, which makes the previous UNIQUE(full_name) constraint redundant

\d players

--DML has to do with CRUD operations on data.

--Create or INSERT data:
INSERT INTO players (full_name, team, age) VALUES
  ('Damian Lillard', 'Milwaukee Bucks', 34),
  ('LeBron James', 'Los Angeles Lakers', 39),
  ('Anthony Davis', 'Los Angeles Lakers', 31);

--Read or SELECT data:
-- SELECT [DISTINCT] [function]] (col1_name, col2_name, ...) FROM table_name
--   WHERE condition1 [OR/AND] condition2...,
--   ORDER BY col_name ASC/DESC,
--   LIMIT x,
--   OFFSET x,
-- Functions:
--   String: length(full_name) | trim(leading ' ' from full_name)
--   Date/time: date_part('year', last_login) | age(last_login)
--   AGGREGATE FUNCTIONS w/ GROUP BY
--     COUNT(id), SUM(profit), MIN(height), MAX(age), AVG(cost)
--     Columns in SELECT must either be used by GROUP BY or be involved in the aggregation function

--UPDATE data:
UPDATE players SET injury_status = 'Day to Day' -- ... can have multiple SET clauses
  WHERE full_name = 'Anthony Davis';-- conditions

--DELETE data:
DELETE FROM players WHERE injury_status != 'Ready';

SELECT * FROM players;

-- With these basic operations in mind, we have all the tools we need to create and work with structured data. Let's now expand the scope of our database to include additional information. As the purpose of our application grows and requires additional data, what problems might we start to encounter? How do new features like JOIN tables, sequences, and indexes help create solutions for such problems?

-- Let's say we wanted to add more info to our database, and there ended up being many players from the Lakers or the Bucks. If a team moved cities and we needed to make changes in our database to match, we'd have to update multiple entries. Duplicate entries runs the risk of errors, and perhaps not in our example but others, the risk of unintentionally changing the name of something unintentionally that happened to match the name of the entries we really wanted.

-- What we can do is to break our tables up into different smaller tables/relations, which will represent logical entities in our database. For instance, it might make sense to extract teams into a teams table, and we can imagine that we might add team-specific data like stadium location, seating capacity, roster salary, date founded, etc. that would be out of place in a table that should be dedicated to players.

-- So let's consider this design/setup. The teams table would be a separate entity from the players, and in the players table a column will essentially point to a team - this is called a foreign key. Key implies a value in the teams table that is unique; without such a constraint there would be ambiguity over which entry is referenced, potentially compromising data integrity.

-- For teams, the key could be the team name since logically no two teams should have the same name. We could make the team name a primary key, and then in the players table create a team name foreign key which references the primary key column. Doing so ensures that we can only create a relationship with a team that exists, ensuring data integrity. 

-- In other situations, we could create an arbitrary value whose only purpose is to act as a unique identifier/key associated with a row, called a surrogate key. Doing so will abstract away responsibility for generating key values and ensuring uniqueness. In SQL this can be achieved by defining a column with the serial data type and then making it a primary key. The serial data type will implicitly create a sequence which is a data object that sequentially generates values, ensuring uniqueness.


-- To rework our database to now contain two separate relations (players and teams) linked to each other with a foreign key, we have to do a few things in PostgreSQL.

-- 1) Create new teams table with a primary key (a natural key could work but often best practice to just have a dedicated identification mechanism, which we will create using the serial data type and the PRIMARY KEY constraint).

CREATE TABLE teams (
  id serial PRIMARY KEY,
  name text NOT NULL,
  championships integer DEFAULT 0
);

-- 2) Populate teams table with data
INSERT INTO teams (name, championships) VALUES
  ('Milwaukee Bucks', 3),
  ('Los Angeles Lakers', 21),
  ('New York Knicks', 3);

-- 3) In our original table, we may have to change the data type of the team to match the in this case integer data type for the primary key we want to reference. So for us, we need to set team values to NULL, DROP our DEFAULT string value, and ALTER COLUMN TYPE to integer.

UPDATE players SET team = NULL; 

ALTER TABLE players
  ALTER COLUMN team DROP DEFAULT,
  ALTER COLUMN team TYPE integer USING team::integer;

-- Rename column to more useful name
ALTER TABLE players
  RENAME COLUMN team TO team_id;

-- Add foreign key constraint
ALTER TABLE players
  ADD CONSTRAINT team_id_fkey FOREIGN KEY(team_id) REFERENCES teams(id);

-- Update with foreign keys

UPDATE players SET team_id = 1 WHERE full_name = 'Damian Lillard';
UPDATE players SET team_id = 2 WHERE full_name = 'LeBron James';

SELECT * FROM teams;
SELECT * FROM players;

-- We can now imagine a relational database model where we have different tables representing entities, with entries threaded together through relationships built on foreign keys. What if we wanted a new view of data though with information scattered across multiple tables?

-- We can use keys to follow a chain of referential integrity to piece together the information from one table to another. Whether a natural or surrogate key, key columns sort of issue keys for foreign tables to take and provide for their own table entries, so that when we want to piece together data we can follow the rows accessed by the keys across different entities.

-- There are a few different type of database relationships: One to one, One to many, and many to many. 

-- One to one can be achieved by a foreign key column that is also the PRIMARY KEY of the table.
-- I think a similar result could also be achieved by adding a UNIQUE constraint to a foreign key. This way, once a row in a foreign table is referred to, that key cannot be used again. The foreign key constraint itself is also sufficient for ensuring referential integrity with the other entity.

-- One to many relationships can be achieved with a foreign key column referencing the primary key of another table. Imagine in this setup a customer being associated with multiple orders - we could have an order table where the customer name can be repeated, but each time with a different foreign key referring to a different order. (THIS WAS MY INITIAL ANSWER FROM MEMORY - intuitively awkward). Instead, it makes more sense to have the foreign key be in the orders table, with many orders being able to refer to the same customer table id/primary key. One customer, many orders - Many order table entries being able to reuse/share a single customer key.
-- I think the initial intuition is the simplistic database paradigm where it still felt right to have customer and order information in one place. But the relational model separates out the concerns so that customers is truly just for customers, and orders just for orders - for which customer information is a part of the information for the order as an abstract entity.

-- Many to many relationships can be created by creating two one-to-many relationships, with a shared "one" being a join table that allows multiple entries from one table to be associated with multiple entries from another table. The join table allows for reuse of foreign keys from both tables that is self-contained.

-- In practical terms for SQL, this means creating virtual tables with different JOIN types, which will use keys to figure out how to connect disparate tables. 

-- Next: what are the different types of joins and what might be examples? Practice actual queries to create virtual tables. 

-- INNER JOIN: Return a table with rows where both criteria columns are filled
-- LEFT OUTER JOIN: Return a table with all rows of the first criteria column, regardless of the existence of a value for the second column
-- RIGHT OUTER JOIN: Return a table with all rows of the second criteria column, regardless of the existence of a value for the first column
-- FULL OUTER JOIN: Return a table with all entries for both columns, filling in NULL where a row in one column lacks a corresponding value in another
-- CROSS JOIN: Return a table with all the permutations of first criteria column values and second criteria column values

-- Modality dictates the options for the number of associated entries on each side of a relation. In our basketball example, we can choose to make our team_id column NOT NULL, which alone would make its modality one or more (let's say more if we're keeping track of different teams the player has played for in the past). However, let's say we want the team columns to reflect a modality of just one team - how would that be reflected in SQL? I suppose you could have a unique constraint on the identifying column, which in our case is currently just full_name. 
--EDIT: Modality dictates whether or not a side of the relationship is optional. Cardinality tells us the numerical options for the number of entities on a side of a relationship (mnemonic: cardinal directions maybe?), which is usually 0, 1, or many. Having 0 as a possibility will indicate that that side of the relation is optional. 

-- Exercise: what's a many to many relation I can implement?
  -- Player sponsorships
  -- Sponsor table: sponsor_id, sponsor_name
  -- Join table: the player and sponsor ids, sponsorship deal value

CREATE TABLE sponsors (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE players_sponsors(
  player_name text REFERENCES players(full_name),
  sponsor_id integer REFERENCES sponsors(id),
  deal_value integer CHECK(deal_value >= 0)
);

INSERT INTO players (full_name, team_id, age) VALUES
  ('Giannis', 1, 29);

INSERT INTO sponsors (name) VALUES
  ('Nike'),
  ('Move'),
  ('Pepsi');

INSERT INTO players_sponsors (player_name, sponsor_id, deal_value) VALUES
  ('Damian Lillard', 2, 10000000),
  ('LeBron James', 1, 1000000000),
  ('Giannis', 1, 75000000),
  ('LeBron James', 3, 15000000);

-- Query that uses foreign keys to create desired virtual table: teams associated with which brands through player sponsorships

SELECT teams.name, string_agg(sponsors.name, ', ') AS sponsors, SUM(deal_value) AS total_players_deals_value FROM players_sponsors
  JOIN players ON player_name = players.full_name
  JOIN teams ON team_id = teams.id
  JOIN sponsors ON sponsor_id = sponsors.id
  GROUP BY teams.name
  ORDER BY total_players_deals_value DESC;

CREATE TABLE bc (b integer, c integer);
CREATE TABLE ab (a integer, b integer);

INSERT INTO ab (a, b) VALUES (1, 2), (2, 2), (3,2);
INSERT INTO bc (b, c) VALUES (2, 10), (2, 9), (2, 8);

SELECT * FROM ab
  INNER JOIN bc ON ab.b = bc.b;

SELECT * FROM ab
  LEFT OUTER JOIN bc ON ab.b = bc.b;


SELECT * FROM ab
  RIGHT OUTER JOIN bc ON ab.b = bc.b;