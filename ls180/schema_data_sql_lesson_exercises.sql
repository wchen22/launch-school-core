Write a SQL statement that will create the following table, people:

name	age	occupation
Abby	34	biologist
Mu'nisah	26	NULL
Mirabelle	40	contractor

CREATE TABLE people (
  name varchar(25),
  age integer,
  occupation varchar(25)
);

Write SQL statements to insert the data shown in #1 into the table.

INSERT INTO people (name, age, occupation) VALUES
  ('Abby', 34, 'biologist'),
  ('Mu''nisah', 26, NULL),
  ('Mirabelle', 40, 'contractor');

Write 3 SQL queries that can be used to retrieve the second row of the table shown in #1 and #2.

SELECT * FROM people WHERE name = 'Mu''nisah';
SELECT * FROM people WHERE age < 30;
SELECT * FROM people WHERE occupation IS NULL;

Write a SQL statement that will create a table named birds that can hold the following values:

name	length	wingspan	family	extinct
Spotted Towhee	21.6	26.7	Emberizidae	f
American Robin	25.5	36.0	Turdidae	f
Greater Koa Finch	19.0	24.0	Fringillidae	t
Carolina Parakeet	33.0	55.8	Psittacidae	t
Common Kestrel	35.5	73.5	Falconidae	f

CREATE TABLE birds (
  name varchar(50),
  length decimal(3,1),
  wingspan numeric(3,1),
  family varchar(50),
  extinct boolean
);

Using the table created in #4, write the SQL statements to insert the data as shown in the listing.

INSERT INTO birds (name, length, wingspan, family, extinct) VALUES
  ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', 'f'),
  ('American Robin', 25.5, 36.0, 'Turdidae', FALSE),
  ('Greater Koa Finch', 19.0, 24.0, 'Fringilidae', 't'),
  ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
  ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

Write a SQL statement that finds the names and families for all birds that are not extinct, in order from longest to shortest (based on the length column's value).

SELECT name, family FROM birds
  WHERE extinct = FALSE
  ORDER BY length DESC;

Use SQL to determine the average, minimum, and maximum wingspan for the birds shown in the table.

SELECT round(avg(wingspan),1), min(wingspan), max(wingspan) FROM birds;

Write a SQL statement to create the table shown below, menu_items:

item	prep_time	ingredient_cost	sales	menu_price
omelette	10	1.50	182	7.99
tacos	5	2.00	254	8.99
oatmeal	1	0.50	79	5.99

CREATE TABLE menu_items (
  item varchar(50),
  prep_time integer CHECK(prep_time >= 0),
  ingredient_cost numeric(3,2) CHECK(ingredient_cost >= 0),
  sales integer CHECK(sales >= 0),
  menu_price numeric(3,2) CHECK(menu_price >=0)
);

Write SQL statements to insert the data shown in #8 into the table.

INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price) VALUES
('omelette', 10, 1.5, 182, 7.99),
('tacos', 5, 2, 254, 8.99),
('oatmeal', 1, 0.50, 7.9, 5.99);

Using the table and data from #8 and #9, write a SQL query to determine which menu item is the most profitable based on the cost of its ingredients, returning the name of the item and its profit.

SELECT item, (menu_price - ingredient_cost) AS profit FROM menu_items
ORDER BY profit DESC LIMIT 1;

Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first. Keep in mind that prep_time is represented in minutes and ingredient_cost and menu_price are both in dollars and cents:

labor cost is prep_time * 13.0/60

SELECT item, menu_price, ingredient_cost, round(prep_time * 13.0/60, 2) AS labor, menu_price - ingredient_cost - round(prep_time * 13.0/60, 2) AS profit FROM menu_items ORDER BY profit DESC ;

--

           title           | year |   genre
---------------------------+------+-----------
 Die Hard                  | 1988 | action
 Casablanca                | 1942 | drama
 The Conversation          | 1974 | thriller

Write a SQL statement that returns all rows in the films table with a title shorter than 12 letters.

SELECT * FROM films WHERE length(title) < 12;


Write the SQL statements needed to add two additional columns to the films table: director, which will hold a director''s full name, and duration, which will hold the length of the film in minutes.

ALTER TABLE films
ADD COLUMN director text;

ALTER TABLE films
ADD COLUMN duration integer;

Write SQL statements to update the existing rows in the database with values for the new columns:

title	director	duration
Die Hard	John McTiernan	132
Casablanca	Michael Curtiz	102
The Conversation	Francis Ford Coppola	113

UPDATE films
  SET duration = 132, director = 'John McTiernan'
   WHERE title = 'Die Hard';

UPDATE films
  SET duration = 102,
    director = 'Michael Curtiz'
  WHERE title = 'Casablanca';

UPDATE films
  SET duration = 113,
    director = 'Francis Ford Coppola'
  WHERE title LIKE '%Conversation';


Write SQL statements to insert the following data into the films table:

title	year	genre	director	duration
1984	1956	scifi	Michael Anderson	90
Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson	127
The Birdcage	1996	comedy	Mike Nichols	118

INSERT INTO films (title, "year", genre, director, duration) VALUES
  ('1984', 1956, 'scifi', 'Michael Anderson', 90),
  ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
  ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

Write a SQL statement that will return the title and age in years () of each movie, with newest movies listed first:

SELECT title, 2024-year AS age_years FROM films
ORDER BY age_years ASC;

Write a SQL statement that will return the title and duration of each movie longer than two hours, with the longest movies first.

SELECT title, duration FROM films WHERE duration > 120 ORDER BY duration DESC;

Write a SQL statement that returns the title of the longest film.

SELECT title FROM films ORDER BY duration DESC LIMIT 1;

~~~~~~~~ More Single Table Queries (resident data dump) ~~~~~~~~
Write a SQL query to list the ten states with the most rows in the people table in descending order.

SELECT state, COUNT(id) FROM people GROUP BY state ORDER BY count DESC LIMIT 10;

Write a SQL query that lists each domain used in an email address in the people table and how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

SELECT split_part(email, '@',2) AS domain,
  COUNT(id)
 FROM people
GROUP BY domain
ORDER BY count DESC;

Write a SQL statement that will delete the person with ID 3399 from the people table.

DELETE FROM people WHERE id = 3399;

Write a SQL statement that will delete all users that are located in the state of California (CA).

DELETE FROM people WHERE state = 'CA';

Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
SET given_name = UPPER(given_name)
WHERE email LIKE '%teleworm.us';

Lesson 9) NOT NULL and Default Values

1-What is the result of using an operator on a NULL value?

The resulting value will also be NULL, which signifies the absence of a value.

Set the default value of column department to "unassigned". Then set the value of the department column to "unassigned" for any rows where it has a NULL value. Finally, add a NOT NULL constraint to the department column.

ALTER TABLE employees
ALTER COLUMN department
SET DEFAULT 'unassigned';

UPDATE employees
SET department = 'unassigned' WHERE department IS NULL;

ALTER TABLE employees
ALTER COLUMN department
SET NOT NULL;

Write the SQL statement to create a table called temperatures to hold the following data:

    date    | low | high
------------+-----+------
 2016-03-01 | 34  | 43
 2016-03-02 | 32  | 44
 2016-03-03 | 31  | 47
 2016-03-04 | 33  | 42
 2016-03-05 | 39  | 46
 2016-03-06 | 32  | 43
 2016-03-07 | 29  | 32
 2016-03-08 | 23  | 31
 2016-03-09 | 17  | 28

CREATE TABLE temperatures (
  date date NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL
 );

Write the SQL statements needed to insert the data shown in #3 into the temperatures table.

INSERT INTO temperatures (date, low, high) VALUES
('2016-03-02', 32, 44),
('2016-03-03', 31, 47),
('2016-03-04', 33, 42),
('2016-03-05', 39, 46),
('2016-03-06', 32, 43),
('2016-03-07', 29, 32),
('2016-03-08', 23, 31),
('2016-03-09', 17, 28);

Write a SQL statement to determine the average (mean) temperature (divide the sum of the high and low temperatures by two) for each day from March 2, 2016 through March 8, 2016. Make sure to round each average value to one decimal place.

SELECT date, ROUND((high + low)/2.0,1) AS average 
  FROM temperatures 
  WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

Write a SQL statement to add a new column, rainfall, to the temperatures table. It should store millimeters of rain as integers and have a default value of 0.

ALTER TABLE temperatures
  ADD COLUMN rainfall integer DEFAULT 0;

Each day, it rains one millimeter for every degree the average temperature goes above 35. Write a SQL statement to update the data in the table temperatures to reflect this.

Should be the floor of (average - 35)

UPDATE temperatures
SET rainfall = (high + low) / 2 - 35
WHERE (high + low) / 2 > 35;

A decision has been made to store rainfall data in inches. Write the SQL statements required to modify the rainfall column to reflect these new requirements.

ALTER TABLE temperatures ALTER COLUMN rainfall TYPE numeric(6,3);
UPDATE temperatures SET rainfall = 0.0393 * rainfall;

Write a SQL statement that renames the temperatures table to weather.

ALTER TABLE temperatures RENAME TO weather;

What PostgreSQL program can be used to create a SQL file that contains the SQL commands needed to recreate the current structure and data of the weather table?

pg_dump -d sql-course -t weather --inserts > dump.sql


~~~~~~~~~~~~~~~~10. More Constraints~~~~~~~~~~~~~~
1) Import this file into a PostgreSQL database

psql -d sql-course < films2.sql

Modify all of the columns to be NOT NULL

ALTER TABLE films ALTER COLUMN title SET NOT NULL;
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;

Add a constraint to the table films that ensures that all films have a unique title.

ALTER TABLE films ADD CONSTRAINT unique_title UNIQUE(title);

Write a SQL statement to remove the constraint added in #4.

ALTER TABLE films DROP CONSTRAINT unique_title;

Add a constraint to films that requires all rows to have a value for title that is at least 1 character long.

ALTER TABLE films ADD CONSTRAINT title_at_least_1_char CHECK(length(title) >0);

Add a constraint to the table films that ensures that all films have a year between 1900 and 2100.

ALTER TABLE films ADD CONSTRAINT valid_film_year CHECK(year BETWEEN 1900 AND 2100);

Add a constraint to films that requires all rows to have a value for director that is at least 3 characters long and contains at least one space character ().

ALTER TABLE films ADD CONSTRAINT director_name CHECK(length(director)>=3 AND director LIKE '% %');

Write an UPDATE statement that attempts to change the director for "Die Hard" to "Johnny". Show the error that occurs when this statement is executed.

  UPDATE films
  SET director='Johnny' WHERE title='Die Hard';

  ERROR:  new row for relation "films" violates check constraint "director_name"
  DETAIL:  Failing row contains (Die Hard, 1988, action, Johnny, 132).

List three ways to use the schema to restrict what values can be stored in a column.

- Data type
- NOT NULL
- UNIQUE
- CHECK constraints

Is it possible to define a default value for a column that will be considered invalid by a constraint? Create a table that tests this.

CREATE TABLE paradox (
  conflicted_column text DEFAULT NULL NOT NULL
);

Yes, but when you go to insert data that uses the default value an error will be thrown.


~~~~~~~~11. Using Keys~~~~~~~~

Surrogate Keys
Perhaps the most common surrogate key in use today is an auto-incrementing integer. This is a value that is added to each row in a table as it is created. With each row, this value increases in order to remain unique in each row.

CREATE TABLE colors (id serial, name text);

But how are these incrementing values determined? It turns out that serial columns in PostgreSQL are actually a short-hand for a column definition that is much longer:

-- This statement:
CREATE TABLE colors (id serial, name text);

-- is actually interpreted as if it were this one:
CREATE SEQUENCE colors_id_seq;
CREATE TABLE colors (
    id integer NOT NULL DEFAULT nextval('colors_id_seq'),
    name text
);

Different teams and software packages may have varying conventions, but contemporary database development within the Ruby, JavaScript, and other communities has settled on the following conventions for working with tables and primary keys:

All tables should have a primary key column called id.
The id column should automatically be set to a unique value as new rows are inserted into the table.
The id column will often be an integer, but there are other data types (such as UUIDs) that can provide specific benefits.
Do you have to declare a column as a PRIMARY KEY in every table? Technically, no. But doing so is generally a good idea.

Practice Problems
Write a SQL statement that makes a new sequence called "counter".

CREATE SEQUENCE counter;

Write a SQL statement to retrieve the next value from the sequence created in #1.

SELECT nextval('counter');

Write a SQL statement that removes a sequence called "counter".

DROP SEQUENCE counter;

Is it possible to create a sequence that returns only even numbers? 

CREATE SEQUENCE even_counter MINVALUE 0 INCREMENT BY 2;

What will the name of the sequence created by the following SQL statement be?

CREATE TABLE regions (id serial PRIMARY KEY, name text, area integer);

-> regions_id_seq

Write a SQL statement to add an auto-incrementing integer primary key column to the films table.

ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

-- So PRIMARY KEY essentially enforces NOT NULL and UNIQUE on a column which makes it eligible to act as an index for the table. serial is needed if we want the auto-incrementing default behavior for new entries

What error do you receive if you attempt to update a row to have a value for id that is used by another row?

ERROR:  duplicate key value violates unique constraint "films_pkey"

What error do you receive if you attempt to add another primary key column to the films table?

ERROR:  multiple primary keys for table "films" are not allowed

Write a SQL statement that modifies the table films to remove its primary key while preserving the id column and the values it contains.

ALTER TABLE films DROP CONSTRAINT films_pkey;


~~~~~~ 12) GROUP BY and Aggregate Functions ~~~~~~~

$ psql -d films < films4.sql

Write SQL statements that will insert the following films into the database:

title	year	genre	director	duration
Wayne's World	1992	comedy	Penelope Spheeris	95
Bourne Identity	2002	espionage	Doug Liman	118

INSERT INTO films (title, year, genre, director, duration) VALUES
  ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
  ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

'
Write a SQL query that lists all genres for which there is a movie in the films table.

SELECT DISTINCT genre FROM films;

Write a SQL query that returns the same results as the answer for #3, but without using DISTINCT.

SELECT genre FROM films GROUP BY genre;

Write a SQL query that determines the average duration across all the movies in the films table, rounded to the nearest minute.

SELECT ROUND(avg(duration),0) FROM films;

Write a SQL query that determines the average duration for each genre in the films table, rounded to the nearest minute.

SELECT genre, ROUND(avg(duration),0) AS average_duration 
  FROM films GROUP BY genre;

Write a SQL query that determines the average duration of movies for each decade represented in the films table, rounded to the nearest minute and listed in chronological order.

SELECT year/10 * 10 as decade, ROUND(avg(duration)) as average_duration
FROM films GROUP BY decade ORDER BY decade;

Write a SQL query that finds all films whose director has the first name John.

SELECT * FROM films WHERE director LIKE 'John %';

Write a SQL query that will return the following data:

   genre   | count
-----------+-------
 scifi     |     5
 comedy    |     4
 drama     |     2
 espionage |     2
 crime     |     1
 thriller  |     1
 horror    |     1
 action    |     1
(8 rows)

SELECT genre, count(id) FROM films GROUP BY genre ORDER BY count DESC;


Write a SQL query that will return the following data:

 decade |   genre   |                  films
--------+-----------+------------------------------------------
   1940 | drama     | Casablanca
   1950 | drama     | 12 Angry Men
   1950 | scifi     | 1984
   1970 | crime     | The Godfather
   1970 | thriller  | The Conversation
   1980 | action    | Die Hard
   1980 | comedy    | Hairspray
   1990 | comedy    | Home Alone, The Birdcage, Wayne's World
   1990 | scifi     | Godzilla
   2000 | espionage | Bourne Identity
   2000 | horror    | 28 Days Later
   2010 | espionage | Tinker Tailor Soldier Spy
   2010 | scifi     | Midnight Special, Interstellar, Godzilla
(13 rows)

'

SELECT year/10 * 10 AS decade, genre, string_agg(title, ', ') AS films
  FROM films GROUP BY decade, genre ORDER BY decade, genre;

  Write a SQL query that will return the following data:

   genre   | total_duration
-----------+----------------
 horror    |            113
 thriller  |            113
 action    |            132
 crime     |            175
 drama     |            198
 espionage |            245
 comedy    |            407
 scifi     |            632
(8 rows)

SELECT genre, sum(duration) AS total_duration 
  FROM films GROUP BY genre ORDER BY total_duration, genre ASC;