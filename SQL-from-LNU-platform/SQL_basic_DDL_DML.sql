
-----------------------------------
--Basic SQL statements: DDL and DML
-----------------------------------

--Data Definition Language (DDL) statements defines data structures.
--Data Manipulation Language (DML) affect the information stored in the database.


--Drop an existing table in a database
DROP TABLE party;

--Create table
CREATE TABLE bikes 
(
	model TEXT, 
	price FLOAT, 
	stock INTEGER
);

-------------
--CONSTRAINTS
-------------

--Constraint NOT NULL
--enforces a column to NOT accept NULL values

CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL
);

--Constraint DEFAULT
CREATE TABLE guest_list 
(
	first_name TEXT, 
	last_name TEXT NOT NULL, 
	meal TEXT DEFAULT 'standard'
);

--Constraint CHECK
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

--Constraint PRIMARY KEY
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


