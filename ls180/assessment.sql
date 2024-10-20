DROP TABLE IF EXISTS books_authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

CREATE TABLE books(
  id serial PRIMARY KEY,
  title text NOT NULL,
  year_published integer NOT NULL CHECK (year_published BETWEEN 1000 AND 9999),
  page_count integer
);

INSERT INTO books (title, year_published, page_count) VALUES
  ('A Closed and Common Orbit', 2016, NULL),
  ('A Fall of Moondust', 1961, 224),
  ('Cat''s Cradle', 1963, 304),
  ('Dune', 1965, 412),
  ('Project Hail Mary', 2021, 496),
  ('Record of a Spaceborn Few', 2018, NULL),    
  ('The Difference Engine', 1990, 383),
  ('The Dispossessed', 1974, 341),
  ('The Galaxy, and the Ground Within', 2021, NULL),
  ('The Lathe of Heaven', 1971, 184),
  ('The Left Hand of Darkness', 1969, 286),
  ('The Long Tomorrow', 1955, 222),
  ('The Sirens of Titan', 1959, 319)
;

-- Question 3 3 Points
-- Write a SQL statement that returns a list of the 4 longest books (in terms of pages) published in 2017 or earlier, with the longest books first. The output should look exactly as shown below:

-- Book Title            | Published | Page Count
-- ----------------------+-----------+------------
-- Dune                  |      1965 |        412
-- The Difference Engine |      1990 |        383
-- The Dispossessed      |      1974 |        341
-- The Sirens of Titan   |      1959 |        319
-- (4 rows)

SELECT title AS "Book Title",
       year_published AS "Published",
       page_count AS "Page Count"
  FROM books
  WHERE page_count IS NOT NULL AND
    year_published <= 2017
  ORDER BY page_count DESC
  LIMIT 4
;

-- Write the SQL to create another table, authors, which should have columns for id (the primary key) and name. All rows are required to have a value in the name column.

-- Do not add any unnecessary constraints to the schema.

CREATE TABLE authors (
  id integer PRIMARY KEY,
  name text NOT NULL
);

-- Once you have created the table, populate it with the following authors:

-- Authors
INSERT INTO authors (id, name) VALUES
  (1, 'Arthur C. Clarke'),
  (2, 'Becky Chambers'),
  (3, 'Bruce Sterling'),
  (4, 'Frank Herbert'),
  (5, 'Kurt Vonnegut, Jr.'),
  (6, 'Leigh Brackett'),
  (7, 'Ursula K. Le Guin'),
  (8, 'Victoria Aveyard'),
  (9, 'William Gibson')
;

SELECT * FROM authors;

-- We want to be able to write queries that let us determine the author that wrote each of these novels, and a list of the novels written by each author. Using the data shown below, for instance, we should be able to tell that Kurt Vonnegut, Jr., wrote Cat's Cradle and The Sirens of Titan. We should also be able to tell that Dune was written by Frank Herbert.

-- books	authors
-- A Closed and Common Orbit	Becky Chambers
-- A Fall of Moondust	Arthur C. Clarke
-- Cat's Cradle	Kurt Vonnegut, Jr.
-- Dune	Frank Herbert
-- Project Hail Mary	
-- Record of a Spaceborn Few	Becky Chambers
-- Victoria Aveyard
-- The Difference Engine	William Gibson, Bruce Sterling
-- The Dispossessed	Ursula K. Le Guin
-- The Galaxy, and the Ground Within	Becky Chambers
-- The Lathe of Heaven	Ursula K. Le Guin
-- The Left Hand of Darkness	Ursula K. Le Guin
-- The Long Tomorrow	Leigh Brackett
-- The Sirens of Titan	Kurt Vonnegut, Jr.
-- Make the necessary changes to the database to ensure that we can make these queries. Note that The Difference Engine is a collaboration between two different authors. We also lack an author for Project Hail Mary, and no books are listed for Victoria Aveyard.

-- Unlike most questions on this exam, you should use all constraints and options recommended in the Launch School course material, even those we haven't specified in this question.

-- Please include in your answer a list of all of the books and their IDs and a list of all of the authors and their IDs. This list is needed in case your IDs don't match ours.

-- Let's make primary key column use a serial data type instead of integer to automate the key generation to be safe

ALTER TABLE authors DROP COLUMN id;
ALTER TABLE authors ADD COLUMN id serial PRIMARY KEY;

-- So for this database, a book can have multiple authors, and an author can have multiple books - therefore the cardinality of the relationship between authors and books is many to many. The modality for both is optional since we can have an author without any books and a book without any authors.

-- Since it is a many-to-many relationship, a join table is needed to store the author-book relationships

CREATE TABLE books_authors (
  book_id integer REFERENCES books(id) ON DELETE CASCADE NOT NULL,
  author_id integer REFERENCES authors(id) ON DELETE CASCADE NOT NULL,
  UNIQUE(book_id, author_id)
);

-- Input the author-book relationship info
INSERT INTO books_authors (book_id, author_id) VALUES
  (1, 2),
  (2, 1),
  (3, 5),
  (4, 4),
  (6, 2),
  (7, 9),
  (7, 3),
  (8, 7),
  (9, 2),
  (10, 7),
  (11, 7),
  (12, 6),
  (13, 5)
;


SELECT * FROM books;
--  id |               title               | year_published | page_count 
-- ----+-----------------------------------+----------------+------------
--   1 | A Closed and Common Orbit         |           2016 |           
--   2 | A Fall of Moondust                |           1961 |        224
--   3 | Cat's Cradle                      |           1963 |        304
--   4 | Dune                              |           1965 |        412
--   5 | Project Hail Mary                 |           2021 |        496
--   6 | Record of a Spaceborn Few         |           2018 |           
--   7 | The Difference Engine             |           1990 |        383
--   8 | The Dispossessed                  |           1974 |        341
--   9 | The Galaxy, and the Ground Within |           2021 |           
--  10 | The Lathe of Heaven               |           1971 |        184
--  11 | The Left Hand of Darkness         |           1969 |        286
--  12 | The Long Tomorrow                 |           1955 |        222
--  13 | The Sirens of Titan               |           1959 |        319
-- (13 rows)

SELECT * FROM authors;
--         name        | id 
-- --------------------+----
--  Arthur C. Clarke   |  1
--  Becky Chambers     |  2
--  Bruce Sterling     |  3
--  Frank Herbert      |  4
--  Kurt Vonnegut, Jr. |  5
--  Leigh Brackett     |  6
--  Ursula K. Le Guin  |  7
--  Victoria Aveyard   |  8
--  William Gibson     |  9
-- (9 rows)

SELECT * FROM books_authors;
--  book_id | author_id 
-- ---------+-----------
--        1 |         2
--        2 |         1
--        3 |         5
--        4 |         4
--        6 |         2
--        7 |         9
--        7 |         3
--        8 |         7
--        9 |         2
--       10 |         7
--       11 |         7
--       12 |         6
--       13 |         5
-- (13 rows)


-- Write an SQL query to determine which books were written by Becky Chambers, then write another query to determine which authors collaborated to write the book The Difference Engine Your queries should provide the following answers:

SELECT books.title AS "Which books did Becky Chambers Write?"
  FROM books
  LEFT JOIN books_authors ON books.id = book_id
  JOIN authors ON authors.id = author_id
  WHERE authors.name = 'Becky Chambers';

-- Which books did Becky Chambers Write?Copy Code
-- A Closed and Common Orbit
-- Record of a Spaceborn Few
-- The Galaxy, and the Ground Within

SELECT authors.name AS "Which authors collaborated on The Difference Engine?"
  FROM books
  LEFT JOIN books_authors ON books.id = book_id
  JOIN authors ON authors.id = author_id
  WHERE books.title = 'The Difference Engine';

-- Which authors collaborated on The Difference Engine?Copy Code
-- Bruce Sterling
-- William Gibson
-- Do not look up the book and author IDs manually. Your query must look up the appropriate ID(s) and then use those ID(s) to locate the desired information.


-- Write a SQL query that displays a list of all authors who have written two or more books. The output should look like this:

SELECT authors.name AS "Author", COUNT(book_id) AS "Number of Books"
  FROM authors
  LEFT JOIN books_authors ON authors.id = author_id
  GROUP BY authors.name
  HAVING COUNT(book_id) >= 2;

--        Author       | Number of Books
-- --------------------+-----------------
--  Becky Chambers     |               3
--  Kurt Vonnegut, Jr. |               2
--  Ursula K. Le Guin  |               3
-- (3 rows)
-- The order of the output does not matter in this case.

-- Write a SQL query to determine the number of books and the average number of pages for the books that each author either wrote or collaborated with another author. The output should look like this:

SELECT authors.name AS "Author", COUNT(book_id) AS "Number of Books", ROUND(AVG(page_count)) AS "Average Page Count"
  FROM authors
  LEFT JOIN books_authors ON authors.id = author_id
  LEFT JOIN books ON books.id = book_id
  GROUP BY authors.name
  ORDER BY "Number of Books" DESC, "Average Page Count" DESC;

-- Copy Code
--        Author       | Number of Books | Average Page Count
-- --------------------+-----------------+--------------------
--  Becky Chambers     |               3 |
--  Ursula K. Le Guin  |               3 |                270
--  Kurt Vonnegut, Jr. |               2 |                311
--  Frank Herbert      |               1 |                412
--  William Gibson     |               1 |                383
--  Bruce Sterling     |               1 |                383
--  Arthur C. Clarke   |               1 |                224
--  Leigh Brackett     |               1 |                222
--  Victoria Aveyard   |               0 |
-- (9 rows)
-- The output should be sorted such that authors that worked on the most books appear first. Where there's a tie, the author with the longest average page count should appear first. (Thus, Leigh Brackett follows Arthur C. Clarke since Brackett's book is shorter than Clark's.)

-- Write a SQL query to determine which authors in the authors table did not work on any of the books in the books table (at least according to the data provided in this assessment). The output should look like this:

SELECT authors.name AS "Author"
  FROM authors
  LEFT JOIN books_authors ON authors.id = author_id
  WHERE book_id IS NULL;

-- Copy Code
--       Author
-- ------------------
--  Victoria Aveyard
-- (1 row)

-- Next, write a SQL query to determine which books in the books table have no authors listed in the authors table. The output should look like this:

SELECT books.title AS "Book Title"
  FROM books
  LEFT JOIN books_authors ON books.id = book_id
  WHERE author_id IS NULL;

  -- Add a constraint to the books table that ensures that the year_published can't be in the future. You can use date_part('YEAR', current_date) to determine the current year. Create a test statement attempting to insert a book with a year in the future to verify the constraint works.

  ALTER TABLE books
  ADD CHECK(year_published <= date_part('YEAR', current_date));

  INSERT INTO books (title, year_published, page_count) VALUES
    ('Test', 2025, 10);