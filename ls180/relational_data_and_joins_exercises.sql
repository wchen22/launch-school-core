theater_full.sql Import

Write a query that determines how many tickets have been sold.

Expected Output

count
-------
3783
(1 row)

SELECT count(id) FROM tickets;

Write a query that determines how many different customers purchased tickets to at least one event.

SELECT COUNT(DISTINCT(customer_id)) FROM tickets;

Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

SELECT ROUND( 100 * COUNT(DISTINCT(tickets.customer_id)) 
            / COUNT(DISTINCT(customers.id))::decimal, 
            2 ) 
       AS percent
  FROM customers 
  LEFT OUTER JOIN tickets
  ON tickets.customer_id = customers.id;



Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

Expected Output

            name            | popularity
----------------------------+------------
  A-Bomb                     |        555
  Captain Deadshot Wolf      |        541
  Illustrious Firestorm      |        521
  Siren I                    |        457
  Kool-Aid Man               |        439
  Green Husk Strange         |        414
  Ultra Archangel IX         |        359
  Red Hope Summers the Fated |        307
  Magnificent Stardust       |        134
  Red Magus                  |         56
(10 rows)

SELECT name, COUNT(event_id) AS popularity
  FROM events LEFT OUTER JOIN tickets 
  ON events.id = tickets.event_id 
  GROUP BY name 
  ORDER BY popularity DESC;

SELECT e.name, COUNT(t.id) AS popularity
  FROM events AS e
  LEFT OUTER JOIN tickets AS t
    ON t.event_id = e.id
  GROUP BY e.id
  ORDER BY popularity DESC;


Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

Expected Output

  id   |                email                 | count
-------+--------------------------------------+-------
  141  | isac.hayes@herzog.net                |     3
  326  | tatum.mraz@schinner.org              |     3
  624  | adelbert.yost@kleinwisozk.io         |     3
  1719 | lionel.feeney@metzquitzon.biz        |     3
  2058 | angela.ruecker@reichert.co           |     3
  3173 | audra.moore@beierlowe.biz            |     3
  4365 | ephraim.rath@rosenbaum.org           |     3
  6193 | gennaro.rath@mcdermott.co            |     3
  7175 | yolanda.hintz@binskshlerin.com       |     3
  7344 | amaya.goldner@stoltenberg.org        |     3
  7975 | ellen.swaniawski@schultzemmerich.net |     3
  9978 | dayana.kessler@dickinson.io          |     3
(12 rows)

SELECT c.id, c.email, COUNT(DISTINCT(t.event_id)) as count FROM customers as c
  LEFT OUTER JOIN tickets as t
  ON c.id = t.customer_id
  GROUP BY c.id
  HAVING COUNT(DISTINCT(t.event_id))  = 3;



Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report should include the event name and starts_at and the seat's section name, row, and seat number.

Expected Output

        event        |      starts_at      |    section    | row | seat
--------------------+---------------------+---------------+-----+------
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
(7 rows)

tickets: fkeys event_id, customer_id, seat_id (fkeys section_id)
customer: WHERE email address is 'gennaro.rath@mcdermott.co'
events: event, starts_at

SELECT e.name AS event, 
       e.starts_at, 
       sections.name AS section, 
       seats.row, 
       seats.number AS seat 
  FROM tickets as t
  INNER JOIN customers as c
  ON t.customer_id = c.id
  INNER JOIN events as e
  ON t.event_id = e.id
  INNER JOIN seats
  ON t.seat_id = seats.id
  INNER JOIN sections
  ON seats.section_id = sections.id
  WHERE email = 'gennaro.rath@mcdermott.co';

~~~~~ 7) Foreign Keys ~~~~~~~
Update the orders table so that referential integrity will be preserved for the data between orders and products.

ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


Use psql to insert the data shown in the following table into the database:

Quantity	Product
10	small bolt
25	small bolt
15	large bolt

foreign-keys=# INSERT INTO products (name) VALUES ('small bolt');
INSERT 0 1
foreign-keys=# INSERT INTO products (name) VALUES ('large bolt');
INSERT 0 1
foreign-keys=# SELECT * FROM products;
 id |    name
----+------------
  1 | small bolt
  2 | large bolt
(2 rows)

foreign-keys=# INSERT INTO orders (product_id, quantity) VALUES (1, 10);
INSERT 0 1
foreign-keys=# INSERT INTO orders (product_id, quantity) VALUES (1, 25);
INSERT 0 1
foreign-keys=# INSERT INTO orders (product_id, quantity) VALUES (2, 15);
INSERT 0 1


Write a SQL statement that returns a result like this:

 quantity |    name
----------+------------
       10 | small bolt
       25 | small bolt
       15 | large bolt
(3 rows)


SELECT quantity, name FROM orders
  INNER JOIN products
  ON orders.product_id = products.id;

Can you insert a row into orders without a product_id? Write a SQL statement to prove your answer.

Yes, there's no NOT NULL constraint on product_id

INSERT INTO orders (quantity) VALUES (50);

Write a SQL statement that will prevent NULL values from being stored in orders.product_id. What happens if you execute that statement?

ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;
-> ERROR:  column "product_id" contains null values

Make any changes needed to avoid the error message encountered in #6.

DELETE FROM orders WHERE product_id IS NULL;
ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;

Create a new table called reviews to store the data shown below. This table should include a primary key and a reference to the products table.

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  product_id integer REFERENCES products(id),
  review text NOT NULL
);

Write SQL statements to insert the data shown in the table in #8.

INSERT INTO reviews (product_id, review) VALUES
  (1, 'a little small'),
  (1, 'very round!'),
  (2, 'could have been smaller');

True or false: A foreign key constraint prevents NULL values from being stored in a column.

False - NOT NULL needs to be added as a constraint in addition to the foreign key constraint if we want that behavior.


~~~~~ 8) One to Many Relationships ~~~~~~~

-> Update, insertion, and deletion anomalies can be mitigated by normalization of data using additional tables and foreign keys tying data together
- Update anomaly: e.g. multiple rows with duplicate data for a single entity; updating one doesn't update all other instances
- Insertion anomaly: When due to schema, you're funneled into inserting new entries with information that might not exist or be relevant yet (e.g. a simplified call table with contacts: cant insert contact info without making an entry for the call)
- Deletion anomaly: When you delete certain data and in the process delete data you may wish to preserve (e.g. deleting calls gets rid of contact info stored therein)


Write a SQL statement to add the following call data to the database:

when	duration	first_name	last_name	number
2016-01-18 14:47:00	632	William	Swift	7204890809

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-18 14:47:00', 632, 6);

Write a SQL statement to retrieve the call times, duration, and first name for all calls not made to William Swift.

SELECT "when", duration, contacts.first_name
  FROM calls INNER JOIN contacts
  ON calls.contact_id = contacts.id
  WHERE contacts.id <> 6;

  or better yet if want to check against string:
  WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';


Write SQL statements to add the following call data to the database:

when	duration	first_name	last_name	number
2016-01-17 11:52:00	175	Merve	Elk	6343511126
2016-01-18 21:22:00	79	Sawa	Fyodorov	6125594874

INSERT INTO contacts(first_name, last_name, number) VALUES
  ('Merve', 'Elk', '6343511126'),
  ('Sawa', 'Fyodorov', '6125594874');

INSERT INTO calls("when", duration, contact_id) VALUES
  ('2016-01-17 11:52:00', 175, 26),
  ('2016-01-18 21:22:00', 79, 27);

Add a constraint to contacts that prevents a duplicate value being added in the column number.

ALTER TABLE contacts ADD CONSTRAINT unique_number UNIQUE(number);

Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?

INSERT INTO contacts (first_name, last_name, number) VALUES ('Robert', 'Smith', 5702700921);

ERROR:  duplicate key value violates unique constraint "unique_number"
DETAIL:  Key (number)=(5702700921) already exists.

Why does "when" need to be quoted in many of the queries in this lesson?

Because when is an SQL reserved word, and ""


Draw an entity-relationship diagram for the data we've been working with in this assignment.

call 3-o---  contact



~~~~~ Extracting a 1:M Relationship from Existing Data ~~~~~~~

In this assignment, we'll walk through the process of separating the data in a single table into two tables, and creating a foreign key to connect values that are now stored in two tables instead of one.

Here's a look at the data currently in the films table:

films=# SELECT * FROM films;
           title           | year |   genre   |       director       | duration
---------------------------+------+-----------+----------------------+----------
 Die Hard                  | 1988 | action    | John McTiernan       |      132
 Casablanca                | 1942 | drama     | Michael Curtiz       |      102
 The Conversation          | 1974 | thriller  | Francis Ford Coppola |      113
 1984                      | 1956 | scifi     | Michael Anderson     |       90
 The Godfather             | 1972 | crime     | Francis Ford Coppola |      175
 Tinker Tailor Soldier Spy | 2011 | espionage | Tomas Alfredson      |      127
 The Birdcage              | 1996 | comedy    | Mike Nichols         |      118
(7 rows)

There are a few issues with this schema, as we saw in the last assignment:

We can't store a director in the database unless they also have a film we want to add. Likewise, if we remove a film, it can entirely remove a director from the system.
The name of the director is duplicated in each row. When a director's name changes, which does happen, we'll have to be sure to update every row accordingly.

To solve these issues, we'll create a new table to store the data for directors:

CREATE TABLE directors (id serial PRIMARY KEY, name text NOT NULL);

Next up, we'll insert the data for the directors into the new table:

INSERT INTO directors (name) VALUES ('John McTiernan'), ('Michael Curtiz'), ('Francis Ford Copppola'), ('Michael Anderson'), ('Tomas Alfredson'), ('Mike Nichols');
 id |         name
----+----------------------
  1 | John McTiernan
  2 | Michael Curtiz
  3 | Francis Ford Coppola
  4 | Michael Anderson
  5 | Tomas Alfredson
  6 | Mike Nichols
(6 rows)

Next we'll create a relationship between the new directors table and the films table.

ALTER TABLE films ADD COLUMN director_id integer REFERENCES directors(id);

Note how we don't set director_id to be NOT NULL at this point. If we did, the change would be rejected since each row in the table would contain a NULL value for director_id. To fill in those values, we need to insert the appropriate value:

films=# UPDATE films SET director_id=1 WHERE director = 'John McTiernan';
UPDATE 1
films=# UPDATE films SET director_id=2 WHERE director = 'Michael Curtiz';
UPDATE 1
films=# UPDATE films SET director_id=3 WHERE director = 'Francis Ford Coppola';
UPDATE 2
films=# UPDATE films SET director_id=4 WHERE director = 'Michael Anderson';
UPDATE 1
films=# UPDATE films SET director_id=5 WHERE director = 'Tomas Alfredson';
UPDATE 1
films=# UPDATE films SET director_id=6 WHERE director = 'Mike Nichols';
UPDATE 1
films=# SELECT * FROM films;
           title           | year |   genre   |       director       | duration | director_id
---------------------------+------+-----------+----------------------+----------+-------------
 Die Hard                  | 1988 | action    | John McTiernan       |      132 |           1
 Casablanca                | 1942 | drama     | Michael Curtiz       |      102 |           2
 The Conversation          | 1974 | thriller  | Francis Ford Coppola |      113 |           3
 1984                      | 1956 | scifi     | Michael Anderson     |       90 |           4
 The Godfather             | 1972 | crime     | Francis Ford Coppola |      175 |           3
 Tinker Tailor Soldier Spy | 2011 | espionage | Tomas Alfredson      |      127 |           5
 The Birdcage              | 1996 | comedy    | Mike Nichols         |      118 |           6
(7 rows)

Now we have some cleanup to do:

Set films.director_id to be NOT NULL now that all the rows contain a value in that column:

ALTER TABLE films ALTER COLUMN director_id SET NOT NULL;

Drop the director column from films, as it is now redundant.

ALTER TABLE films DROP COLUMN director;

Restore the constraint that was on the films.director column to directors.name:

ALTER TABLE directors ADD CONSTRAINT valid_name
  CHECK(length(name) >= 1 AND position(' ' in name) > 0);

By using an INNER JOIN and specifying a particular select list, we can retrieve the same data in the same structure as we had before this change was made:

SELECT films.title, films.year, directors.name as director, films.duration
  FROM films INNER JOIN directors
  ON films.director_id = directors.id;


  ~~~ 12) Many to Many Relationships ~~~

  The books_categories table from this database was created with foreign keys that don't have the NOT NULL and ON DELETE CASCADE constraints. Go ahead and add them now.

                   List of relations
 Schema |       Name        |   Type   |   Owner    
--------+-------------------+----------+------------
 public | books             | table    | wilsonchen
 public | books_categories  | table    | wilsonchen
 public | books_id_seq      | sequence | wilsonchen
 public | categories        | table    | wilsonchen
 public | categories_id_seq | sequence | wilsonchen

ALTER TABLE books_categories
 ALTER COLUMN book_id SET NOT NULL;

ALTER TABLE books_categories
 ALTER COLUMN category_id SET NOT NULL;

ALTER TABLE books_categories
 DROP CONSTRAINT "books_categories_book_id_fkey",
 DROP CONSTRAINT "books_categories_category_id_fkey",
 ADD CONSTRAINT "books_categories_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
 ADD CONSTRAINT "books_categories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;

> Write a SQL statement that will return the following result:

 id |     author      |           categories
----+-----------------+--------------------------------
  1 | Charles Dickens | Fiction, Classics
  2 | J. K. Rowling   | Fiction, Fantasy
  3 | Walter Isaacson | Nonfiction, Biography, Physics
(3 rows)

SELECT books.id, books.author, string_agg(categories.name, ', ') as categories
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id ASC;

3) Write SQL statements to insert the following new books into the database. What do you need to do to ensure this data fits in the database?

Author	Title	Categories
Lynn Sherr	Sally Ride: America's First Woman in Space	Biography, Nonfiction, Space Exploration
Charlotte Brontë	Jane Eyre	Fiction, Classics
Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine	Cookbook, Nonfiction, South Asia

Enter new books based on title and author
Change character varying type for title to something longer

ALTER TABLE books
ALTER COLUMN title SET DATA TYPE varchar(64);

INSERT INTO books (author, title) VALUES
('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
('Charlotte Brontë', 'Jane Eyre'),
('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

Enter new categories: Space Exploration, Cookbook, South Asia

INSERT INTO categories (name) VALUES
('Space Exploration'),
('Cookbook'),
('South Asia');

Enter new book-category relationships
INSERT INTO books_categories (book_id, category_id) VALUES
(4, 5),
(4, 1),
(4, 7),
(5, 2),
(5, 4),
(6, 8),
(6, 1),
(6, 9);

4) Write a SQL statement to add a uniqueness constraint on the combination of columns book_id and category_id of the books_categories table. This constraint should be a table constraint; so, it should check for uniqueness on the combination of book_id and category_id across all rows of the books_categories table.

ALTER TABLE books_categories
ADD UNIQUE(book_id, category_id);

5) Write a SQL statement that will return the following result:
      name        | book_count |                                 book_titles
------------------+------------+-----------------------------------------------------------------------------
Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
Classics          |          2 | A Tale of Two Cities, Jane Eyre
Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
Fantasy           |          1 | Harry Potter
Fiction           |          3 | Jane Eyre, Harry Potter, A Tale of Two Cities
Nonfiction        |          3 | Sally Ride: America's First Woman in Space, Einstein: His Life and Universe, Vij's: Elegant and Inspired Indian Cuisine
Physics           |          1 | Einstein: His Life and Universe
South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
Space Exploration |          1 | Sally Ride: America's First Woman in Space

SELECT categories.name, count(books.id) AS book_count, string_agg(books.title, ', ' ORDER BY books.title DESC) AS book_titles
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY categories.name
  ORDER BY categories.name ASC;

~~~13) Converting a 1:M to M:M Relationship~~~

List of relations
 Schema |       Name       |   Type   |   Owner    
--------+------------------+----------+------------
 public | directors        | table    | wilsonchen
 public | directors_id_seq | sequence | wilsonchen
 public | films            | table    | wilsonchen
 public | films_id_seq     | sequence | wilsonchen
(4 rows)

Write the SQL statement needed to create a join table that will allow a film to have multiple directors, and directors to have multiple films. Include an id column in this table, and add foreign key constraints to the other columns.'

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors(id) ON DELETE CASCADE,
  film_id integer REFERENCES films(id) ON DELETE CASCADE,
  UNIQUE(director_id, film_id)
);

Note: The convention for naming (join?) tables in SQL is to use alphabetical order when the table name consists of more than one word.

Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

INSERT INTO directors_films (film_id, director_id) VALUES
  (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,3), (8,7), (9,8), (10,4);

Write a SQL statement to remove any unneeded columns from films.

ALTER TABLE films DROP COLUMN director_id;

Write a SQL statement that will return the following result:

           title           |         name
---------------------------+----------------------
 12 Angry Men              | Sidney Lumet
 1984                      | Michael Anderson
 Casablanca                | Michael Curtiz
 Die Hard                  | John McTiernan
 Let the Right One In      | Michael Anderson
 The Birdcage              | Mike Nichols
 The Conversation          | Francis Ford Coppola
 The Godfather             | Francis Ford Coppola
 Tinker Tailor Soldier Spy | Tomas Alfredson
 Wayne's World             | Penelope Spheeris
(10 rows)'

SELECT films.title, directors.name
  FROM films
    LEFT OUTER JOIN directors_films ON films.id = directors_films.film_id
    LEFT OUTER JOIN directors ON directors_films.director_id = directors.id
  ORDER BY films.title ASC;

Write SQL statements to insert data for the following films into the database:

Film	Year	Genre	Duration	Directors
Fargo	1996	comedy	98	Joel Coen
No Country for Old Men	2007	western	122	Joel Coen, Ethan Coen
Sin City	2005	crime	124	Frank Miller, Robert Rodriguez
Spy Kids	2001	scifi	88	Robert Rodriguez

INSERT INTO films (title, year, genre, duration) VALUES
  ('Fargo', 1996, 'comedy', 98),
  ('No Country for Old Men', 2007, 'western', 122),
  ('Sin City', 2005, 'crime', 124),
  ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors (name) VALUES ('Joel Coen'), ('Ethan Coen'), ('Frank Miller'), ('Robert Rodriguez');

INSERT INTO directors_films (film_id, director_id) VALUES
  (11, 9), (12, 9), (12, 10), (13, 11), (13, 12), (14, 12);

Write a SQL statement that determines how many films each director in the database has directed. Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT directors.name, string_agg(films.title, ' ')
  FROM directors
  INNER JOIN directors_films ON directors.id = directors_films.id
  INNER JOIN films ON directors_films.id = films.id
GROUP BY directors.name
;

SELECT directors.name AS director, COUNT(films.id) AS count
  FROM directors
  INNER JOIN directors_films ON directors.id = directors_films.director_id
  INNER JOIN films ON directors_films.film_id = films.id
GROUP BY directors.name
ORDER BY count DESC, director ASC;

LS solution actually more efficient given we dont need film names: 

SELECT directors.name AS director, COUNT(directors_films.film_id) AS films
  FROM directors
    INNER JOIN directors_films ON directors.id = directors_films.director_id
  GROUP BY directors.id
  ORDER BY films DESC, directors.name ASC;
