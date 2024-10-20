For this set of exercises we'll want to create a new database and some tables to work with. The theme for the exercise is that of a workshop. Create a database to store information and tables related to this workshop.

One table should be called devices. This table should have columns that meet the following specifications:

Includes a primary key called id that is auto-incrementing.
A column called name, that can contain a String. It cannot be NULL.
A column called created_at that lists the date this device was created. It should be of type timestamp and it should also have a default value related to when a device is created.

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

In the workshop, we have several devices, and each device should have many different parts. These parts are unique to each device, so one device can have various parts, but those parts won't be used in any other device. Make a table called parts that reflects the information listed above. Table parts should have the following columns that meet the following specifications:

An id which auto-increments and acts as the primary key
A part_number. This column should be unique and not null.
A foreign key column called device_id. This will be used to associate various parts with a device.

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices(id)
);

Insert Data for Parts and Devices
Now that we have the infrastructure for our workshop set up, let's start adding in some data. Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts. The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.

INSERT INTO devices (name) VALUES ('Accelerometer'), ('Gyroscope');

workshop=# SELECT * FROM devices;
 id |     name      |         created_at         
----+---------------+----------------------------
  1 | Accelerometer | 2024-08-25 16:57:42.916007
  2 | Gyroscope     | 2024-08-25 16:57:42.916007

INSERT INTO parts (part_number, device_id) VALUES
  (200, 1),
  (350, 1),
  (400, 1),
  (150, 2),
  (1000, 2),
  (1500, 2),
  (1250, 2),
  (300, 2),
  (474, NULL),
  (500, NULL),
  (675, NULL);

> INNER JOIN
Write an SQL query to display all devices along with all the parts that make them up. We only want to display the name of the devices. Its parts should only display the part_number.

Expected output:

     name      | part_number
---------------+-------------
 Accelerometer |          12
 Accelerometer |          14
 Accelerometer |          16
 Gyroscope     |          31
 Gyroscope     |          33
 Gyroscope     |          35
 Gyroscope     |          37
 Gyroscope     |          39
(8 rows)
NOTE: The part numbers and sequence may vary from those shown above.

SELECT devices.name, parts.part_number
  FROM devices INNER JOIN parts
  ON parts.device_id = devices.id;


> SELECT part_number
We want to grab all parts that have a part_number that starts with 3. Write a SELECT query to get this information. This table may show all attributes of the parts table.

SELECT * FROM parts WHERE part_number::text LIKE ('3%');

> Aggregate Functions
Write an SQL query that returns a result table with the name of each device in our database together with the number of parts for that device.

SELECT devices.name, COUNT(parts.device_id) FROM devices
  LEFT OUTER JOIN parts ON devices.id = parts.device_id
  GROUP BY devices.name;


>ORDER BY
In the previous exercise, we had to use a GROUP BY clause to obtain the expected output. In that exercise, we used an SQL query like:

SELECT devices.name AS name, COUNT(parts.device_id)
FROM devices
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name;

Now, we want to work with the same query, but we want to guarantee that the devices and the count of their parts are listed in descending alphabetical order. Alter the SQL query above so that we get a result table that looks like the following.

name          | count
--------------+-------
Gyroscope     |     5
Accelerometer |     3
(2 rows)

SELECT devices.name AS name, COUNT(parts.device_id)
FROM devices
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name
ORDER BY devices.name DESC;

> IS NULL and IS NOT NULL
Write two SQL queries:

One that generates a listing of parts that currently belong to a device.
One that generates a listing of parts that dont belong to a device.
Do not include the id column in your queries.

Expected Output:

part_number | device_id
------------+-----------
         12 |         1
         14 |         1
         16 |         1
         31 |         2
         33 |         2
         35 |         2
         37 |         2
         39 |         2
(8 rows)

SELECT part_number, device_id FROM parts WHERE device_ID IS NOT NULL;



part_number | device_id
------------+-----------
         50 |
         54 |
         58 |
(3 rows)

SELECT part_number, device_id FROM parts WHERE device_ID IS NULL;


> Oldest Devices

Insert one more device into the devices table. You may use this SQL statement or create your own.

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);
Assuming nothing about the existing order of the records in the database, write an SQL statement that will return the name of the oldest device from our devices table.

SELECT name AS oldest_device
 FROM devices
ORDER BY created_at ASC
LIMIT 1;

Further Exploration
What do you think would happen if we had two devices with the same created_at value that happened to be the oldest timestamp? How might this affect what we can infer from the data we get when using a LIMIT clause? Try inserting two devices with the same INSERT statement, and then find the 'newest' device using ORDER BY and LIMIT.

INSERT INTO devices (name) VALUES ('Radio'), ('Compass');

SELECT name AS newest_devices
 FROM devices
ORDER BY created_at DESC
LIMIT 2;

- seems to rely on id as second sort criteria


> UPDATE device_id
We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".

UPDATE parts SET device_id = 1
WHERE part_number = 300 OR part_number = 1250;

Further Exploration
What if we wanted to set the part with the smallest part_number to be associated with "Gyroscope"? How would we go about doing that?


UPDATE parts SET device_id = 2
WHERE id = (SELECT id FROM parts ORDER BY part_number ASC LIMIT 1);

> Delete Accelerometer
Our workshop has decided to not make an Accelerometer after all. Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.

DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE name = 'Accelerometer';


Further Exploration
This process may have been a bit simpler if we had initially defined our devices tables a bit differently. We could delete both a device and its associated parts with one SQL statement if that were the case. What change would have to be made to table parts to make this possible? Also, what SQL statement would you have to write that can delete both a device and its parts all in one go?

ALTER TABLE parts 
  DROP CONSTRAINT parts_device_id_fkey,
  ADD FOREIGN KEY (device_id) REFERENCES device(id) ON DELETE CASCADE;