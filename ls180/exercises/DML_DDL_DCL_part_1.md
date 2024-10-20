1) SQL consists of 3 different sublanguages. For example, one of these sublanguages is called the Data Control Language (DCL) component of SQL. It is used to control access to a database; it is responsible for defining the rights and roles granted to individual users. Common SQL DCL statements include:

GRANT
REVOKE

Name and define the remaining 2 sublanguages, and give at least 2 examples of each.

> DDL stands for Data Definition Language and has to do with defining the schema and structure of our data. This includes column names, column data types, and constraints on data input. Some commands involved might be: CREATE, ALTER, DROP.

DML stands for Data Manipulation Language and is concerned with manipulating data in an already defined table of a database. This includes functions like inserting, updating, deleting, and selecting records. Some commands involved might be: INSERT, DELETE, UPDATE, SELECT, etc.

2) Does the following statement use the Data Definition Language (DDL) or the Data Manipulation Language (DML) component of SQL?

SELECT column_name FROM my_table;

> This SELECT statement is querying data from an existing table - it can be considered manipulating the data because it is concerned with returning a particular view of the existing data. It would not be considered part of DDL because it does not work with the structure of the data.

1) Does the following statement use the DDL or DML component of SQL?

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);

> This CREATE TABLE statement is concerned with the creation of a table and the structure of data to be stored within: the expected attributes and their datatypes as well as constraints. Therefore it can be considered as defining data and part of DDL.

4) Does the following statement use the DDL or DML component of SQL?

ALTER TABLE things
DROP CONSTRAINT things_item_key;

> This ALTER statement is removing a previous constraint and therefore manipulating the structure of the table's data, so it's part of DDL.

5) Does the following statement use the DDL or DML component of SQL?

INSERT INTO things VALUES (3, 'Scissors', 'Metal');

> This INSERT statement uses the DML component of SQL because it is manipulating data by inserting a data record into the table, and not working with the structure of the data.

6) Does the following statement use the DDL or DML component of SQL?

UPDATE things
SET material = 'plastic'
WHERE item = 'Cup';

> This UPDATE statement manipulates certain records in the `things` table and so can be considered part of DML.

7) Does the following statement use the DDL, DML, or DCL component of SQL?

\d things

None, \d is a `psql` meta-command, not executable SQL.

8) Does the following statement use the DDL or DML component of SQL?

DELETE FROM things WHERE item = 'Cup';

> DML; this statement deletes specific records/rows and so it manipulates data rather than its structure.

9) Does the following statement use the DDL or DML component of SQL?

DROP DATABASE xyzzy;

> DDL; this statement drops or deletes a database. Even though this does very much have an effect on data, the primary purpose of DROP is considered to be operating on data definitions, with data deletion as a side effect.

10) Does the following statement use the DDL or DML component of SQL?

CREATE SEQUENCE part_number_sequence;

> DDL; this CREATE SEQUENCE statement introduces a sequence object to the database structure.