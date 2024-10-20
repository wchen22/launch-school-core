After creating the database, set up the 3 tables using the following specifications:

bidders
id of type SERIAL: this should be a primary key
name of type text: this should be NOT NULL

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

items
id of type SERIAL: this should be a primary key
name of type text: this should be NOT NULL
initial_price and sales_price: These two columns should both be of type numeric. Each column should be able to hold a positive number as high as 1000 dollars with 2 decimal points of precision.
The initial_price represents the starting price of an item when it is first put up for auction. This column should never be NULL.
The sales_price represents the final price at which the item was sold. This column may be NULL, as it is possible to have an item that was never sold off.

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6,2) NOT NULL CHECK (initial_price <= 1000 AND initial_price > 0),
  sales_price numeric(6,2), CHECK (sales_price <= 1000 AND sales_price > 0)
);

\copy items (id, name, initial_price, sales_price) FROM 'items.csv' WITH CSV HEADER DELIMITER ',';


bids
id of type SERIAL: this should be a primary key
bidder_id, item_id: These will be of type integer and should not be NULL. This table connects a bidder with an item and each row represents an individual bid. There should never be a row that has bidder_id or item_id unknown or NULL. Nor should there ever be a bid that references a nonexistent item or bidder. If the item or bidder associated with a bid is removed, that bid should also be removed from the database.
Create your bids table so that both bidder_id and item_id together form a composite index for faster lookup.
amount - The amount of money placed for each individual bid by a bidder. This column should be of the same type as items.initial_price and have the same constraints.

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6,2) CHECK(amount <= 1000 AND amount > 0 )
);

CREATE INDEX ON bids(bidder_id, item_id);

\copy bids(id, bidder_id, item_id, amount) FROM 'bids.csv' WITH HEADER CSV;

> Conditional Subqueries: IN
Write a SQL query that shows all items that have had bids put on them. Use the logical operator IN for this exercise, as well as a subquery.

Here is the expected output:

 Bid on Items
---------------
 Video Game
 Outdoor Grill
 Painting
 Tent
 Vase
(5 rows)

Algorithm: I want the items.name for the items
  where bids.item_id exist

SELECT name AS "Bid on Items" FROM items
WHERE id IN (SELECT item_id FROM bids);

> Conditional Subqueries: NOT IN
Write a SQL query that shows all items that have not had bids put on them. Use the logical operator NOT IN for this exercise, as well as a subquery.

Here is the expected output:

 Not Bid On
------------
 Television
(1 row)

SELECT name AS "Not Bid On" FROM items
WHERE id NOT IN (SELECT item_id FROM bids);

> Conditional Subqueries: EXISTS
Write a SELECT query that returns a list of names of everyone who has bid in the auction. While it is possible (and perhaps easier) to do this with a JOIN clause, we're going to do things differently: use a subquery with the EXISTS clause instead. Here is the expected output:

      name
-----------------
 Alison Walker
 James Quinn
 Taylor Williams
 Alexis Jones
 Gwen Miller
 Alan Parker
(6 rows)'

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

Further Exploration
More often than not, we can get an equivalent result by using a JOIN clause, instead of a subquery. Can you figure out a SELECT query that uses a JOIN clause that returns the same output as our solution above?

SELECT DISTINCT(bidders.name)
  FROM bidders
  JOIN bids ON bidders.id = bids.bidder_id;

SELECT bidders.name
  FROM bidders
  JOIN bids ON bidders.id = bids.bidder_id
  GROUP BY bidders.id
  ORDER BY bidders.id;

> Query From a Transient Table
For this exercise, we'll make a slight departure from how we've been using subqueries. We have so far used subqueries to filter our results using a WHERE clause. In this exercise, we will build that filtering into the table that we will query. Write an SQL query that finds the largest number of bids from an individual bidder.

For this exercise, you must use a subquery to generate a result table (or transient table), and then query that table for the largest number of bids.

Your output should look like this:

  max
------
    9
(1 row)

SELECT max(count) FROM
  (SELECT COUNT(bidder_id) FROM bids AS count
  GROUP BY bidder_id) AS max;

> Scalar Subqueries
For this exercise, use a scalar subquery to determine the number of bids on each item. The entire query should return a table that has the name of each item along with the number of bids on an item.

Here is the expected output:

    name      | count
--------------+-------
Video Game    |     4
Outdoor Grill |     1
Painting      |     8
Tent          |     4
Vase          |     9
Television    |     0
(6 rows)

SELECT name, (SELECT count(item_id) FROM bids WHERE items.id = bids.item_id)
  FROM items;

> Further Exploration

If we wanted to get an equivalent result, without using a subquery, then we would have to use a LEFT OUTER JOIN. Can you come up with the equivalent query that uses LEFT OUTER JOIN?

SELECT items.name, COUNT(bids.item_id)
  FROM items
  LEFT OUTER JOIN bids ON items.id = bids.item_id
  GROUP BY items.id
  ORDER BY items.id;

> Row Comparison

We want to check that a given item is in our database. There is one problem though: we have all of the data for the item, but we don't know the id number. Write an SQL query that will display the id for the item that matches all of the data that we know, but does not use the AND keyword. Here is the data we know:

'Painting', 100.00, 250.00

SELECT id FROM items
WHERE ROW('Painting', 100.00, 250.00) = 
      ROW(name, initial_price, sales_price);

> EXPLAIN
For this exercise, let's explore the EXPLAIN PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

First use just EXPLAIN, then include the ANALYZE option as well. For your answer, list any SQL statements you used, along with the output you get back, and your thoughts on what is happening in both cases.

EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

 QUERY PLAN                                
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

QUERY PLAN  
---------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.151..0.156 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.069..0.070 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.058..0.059 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.035..0.037 rows=6 loops=1)
               Group Key: bids.bidder_id
               Batches: 1  Memory Usage: 40kB
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.014..0.018 rows=26 loops=1)
 Planning Time: 0.244 ms
 Execution Time: 0.270 ms
(11 rows)

> Comparing SQL Statements
In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. These two statements are actually from the "Query From a Virtual Table" exercise in this set. In that exercise, we stated that our subquery-based solution:

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

was actually faster than the simpler equivalent without subqueries:

EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

In this exercise, we will demonstrate this fact.

Run EXPLAIN ANALYZE on the two statements above. Compare the planning time, execution time, and the total time required to run these two statements. Also compare the total "costs". Which statement is more efficient and why?


QUERY PLAN                       
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.045..0.046 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.038..0.041 rows=6 loops=1)
         Group Key: bids.bidder_id
         Batches: 1  Memory Usage: 40kB
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.014..0.018 rows=26 loops=1)
 Planning Time: 0.129 ms
 Execution Time: 0.089 ms
(7 rows)

QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.133..0.133 rows=1 loops=1)
   ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.131..0.132 rows=1 loops=1)
         Sort Key: (count(bidder_id)) DESC
         Sort Method: top-N heapsort  Memory: 25kB
         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.042..0.044 rows=6 loops=1)
               Group Key: bidder_id
               Batches: 1  Memory Usage: 40kB
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.023..0.025 rows=26 loops=1)
 Planning Time: 2.323 ms
 Execution Time: 0.195 ms
(10 rows)

2nd one has slightly lower cost, even though the actual planning and execution time are significantly higher. It largely seems to do with the fact that the second query requires a sort method. 