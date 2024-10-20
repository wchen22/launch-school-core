CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);

You may have noticed that, when we created the stars and planets tables, we did not do anything to establish a relationship between the two tables. They are simply standalone tables that are related only by the fact that they both belong to the extrasolar database. However, there is no relationship between the rows of each table.

To correct this problem, add a star_id column to the planets table; this column will be used to relate each planet in the planets table to its home star in the stars table. Make sure the column is defined in such a way that it is required and must have a value that is present as an id in the stars table.

ALTER TABLE planets 
  ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

Hmm... it turns out that 25 characters isn't enough room to store a star's complete name. For instance, the star "Epsilon Trianguli Australis A" requires 30 characters. Modify the column so that it allows star names as long as 50 characters.

ALTER TABLE stars
ALTER COLUMN name varchar(50);

FE: Assume the stars table already contains one or more rows of data. What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(25);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

For many of the closest stars, we know the distance from Earth fairly accurately; for instance, Proxima Centauri is roughly 4.3 light years away. Our database, as currently defined, only allows integer distances, so the most accurate value we can enter is 4. Modify the distance column in the stars table so that it allows fractional light years to any degree of precision required.

ALTER TABLE stars
ALTER COLUMN distance TYPE real;

The spectral_type column in the stars table is currently defined as a one-character string that contains one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'. However, there is currently no enforcement on the values that may be entered. Add a constraint to the table stars that will enforce the requirement that a row must hold one of the 7 listed values above. Also, make sure that a value is required for this column.


Assume the stars table contains one or more rows that are missing a spectral_type value, or that have an illegal value. What will happen when you try to alter the table schema? How would you go about adjusting the data to work around this problem. To test this, revert the modification and add some data:

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check,
ALTER COLUMN spectral_type DROP NOT NULL;

INSERT INTO stars (name, distance, companions)
           VALUES ('Epsilon Eridani', 10.5, 0);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, 'X', 0);

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

We will measure Planetary masses in terms of the mass of Jupiter. As such, the current data type of integer is inappropriate; it is only really useful for planets as large as Jupiter or larger. These days, we know of many extrasolar planets that are smaller than Jupiter, so we need to be able to record fractional parts for the mass. Modify the mass column in the planets table so that it allows fractional masses to any degree of precision required. In addition, make sure the mass is required and positive.

ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
ALTER COLUMN designation SET NOT NULL;

Add a semi_major_axis column for the semi-major axis of each planet's orbit; the semi-major axis is the average distance from the planet's star as measured in astronomical units (1 AU is the average distance of the Earth from the Sun). Use a data type of numeric, and require that each planet have a value for the semi_major_axis.

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

Further Exploration
Assume the planets table already contains one or more rows of data. What will happen when you try to run the above command? What will you need to do differently to obtain the desired result? To test this, delete the semi_major_axis column and then add a row or two of data (note: your stars table will also need some data that corresponds to the star_id values):


-- Add a Moons Table
-- Someday in the future, technology will allow us to start observing the moons of extrasolar planets. At that point, we're going to need a moons table in our extrasolar database. For this exercise, your task is to add that table to the database. The table should include the following data:

-- id: a unique serial number that auto-increments and serves as a primary key for this table.
-- designation: the designation of the moon. We will assume that moon designations will be numbers, with the first moon discovered for each planet being moon 1, the second moon being moon 2, etc. The designation is required.
-- semi_major_axis: the average distance in kilometers from the planet when a moon is farthest from its corresponding planet. This field must be a number greater than 0, but is not required; it may take some time before we are able to measure moon-to-planet distances in extrasolar systems.
-- mass: the mass of the moon measured in terms of Earth Moon masses. This field must be a numeric value greater than 0, but is not required.
-- Make sure you also specify any foreign keys necessary to tie each moon to other rows in the database.

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK(designation > 0),
  semi_major_axis numeric CHECK(semi_major_axis > 0.0),
  mass numeric CHECK(mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets(id)
);


