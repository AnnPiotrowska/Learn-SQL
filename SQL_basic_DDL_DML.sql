-----------------------------------
--Basic SQL statements: DDL and DML
-----------------------------------

--Data Definition Language (DDL) statements defines data structures.
--Data Manipulation Language (DML) affect the information stored in the database.

--------------
--CREATE TABLE
--------------

CREATE TABLE bikes 
(
	model TEXT, 
	price FLOAT, 
	stock INTEGER
);

-------------
--CONSTRAINTS
-------------

--NOT NULL Constraint
--enforces a column to NOT accept NULL values

CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL
);

--DEFAULT Constraint

CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard'
);

--CHECK Constraint
--is used to limit the value range that can be placed in a column

CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard', 
	sex TEXT CHECK (sex IN('M','W'))
);

CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard', 
	sex TEXT, 
	[table] INTEGER, 
		CHECK (sex IN ('M','W') AND [table] > 0) 
);

CREATE TABLE contest 
(
	name TEXT NOT NULL, 
	result FLOAT CHECK (result>=0)	--positive value
);

--PRIMARY KEY Constraint
--Primary keys must contain UNIQUE values, and cannot contain NULL values

CREATE TABLE guest_list 
(
	id INTEGER PRIMARY KEY, 
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard', 
	sex TEXT, 
	[table] INTEGER, 
		CHECK (sex IN ('M','W') AND [table] > 0) 
);

--AUTOINCREMENT Field
--allows a unique number to be generated automatically when a new record is inserted into a table

CREATE TABLE barbie 
(
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	year INTEGER NOT NULL, 
	career TEXT NOT NULL, 
	description TEXT DEFAULT 'AWESOME!', 
	hair TEXT CHECK (hair IN ('blond','brunette'))
);

--UNIQUE Constraint
--ensures that all values in a column are different

CREATE TABLE guest_list 
(
	id INTEGER PRIMARY KEY, 
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard', 
	sex TEXT, 
	[table] INTEGER, 
		CHECK (sex IN ('M', 'W' AND table > 0), 
	disguise TEXT UNIQUE NOT NULL 
);


-------------
--ALTER TABLE 
-------------
--to add one or more columns to a table

ALTER TABLE party 
ADD COLUMN smoking TEXT CHECK ( smoking IN ('Y', 'N') );


ALTER TABLE best_albums 
ADD COLUMN 
	songs_nr INTEGER CHECK ( songs_nr > 0 ),
	band TEXT NOT NULL,
	year INTEGER NOT NULL;


-------------
--DELETE FROM 
-------------
--to delete existing records in a table
--the WHERE clause specifies which records should be deleted

DELETE FROM famous_cats 
WHERE id = 1 OR id = 10;

--If you omit the WHERE clause, all records in the table will be deleted!
DELETE FROM best_movies_ever;


--delete the four lowest rated movies
DELETE FROM movies 
WHERE type = 'SF' 
ORDER BY rating LIMIT 4; 


-------------
--INSERT INTO 
-------------
--is used to insert new records in a table

INSERT INTO table1 (column1,column2 ,..)
VALUES 
   (value1,value2 ,...),
   (value1,value2 ,...);

   
INSERT INTO my_dolls (year, career, hair, name) 
VALUES (1965, 'astronaut', 'blond', 'Ripley');


INSERT INTO my_dolls (year, career, description, hair, name) 
VALUES 
	('1999', 'pilot', 'World''s best!', 'blond', 'Amelia'), 
	('2016', 'president', 'Women rule!', 'brunette', 'Hillary');
	

--------
--UPDATE
--------	
--is used to modify the existing records in a table

UPDATE movies 
SET rating = '7.8' 
WHERE title = 'Gran Torino';

UPDATE cell_phones 
SET price=price-50 
WHERE color IN ('silver', 'grey', 'red', 'blue');

--If you omit the WHERE clause, all records in the table will be updated!

UPDATE vehicles 
SET model = UPPER(model);


------------
--DROP TABLE
------------
--Drop an existing table in a database

DROP TABLE party;

