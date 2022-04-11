
-----------
--SQL Joins
-----------

--A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

SELECT name, title, authors 
FROM cartoons 
JOIN famous_cats 
	ON title = origin; 
	

--INNER JOIN
--selects records that have matching values in both tables.

SELECT first_name, last_name, SUM(fine) AS sum 
FROM tickets 
INNER JOIN drivers 
	ON driver_id = id 
GROUP BY driver_id 
ORDER BY SUM(fine) DESC;


--NATURAL JOIN
--joins two tables based on same attribute name and datatypes

SELECT ticket_nr, vehicles.licence_plate AS licence_plate, model 
FROM tickets 
INNER JOIN vehicles 
	ON tickets.licence_plate = vehicles.licence_plate;
	
	
SELECT ticket_nr, vehicles.licence_plate AS licence_plate, model 
FROM tickets 
NATURAL JOIN vehicles;


--USING
--is used to match only one column when more than one column matches

SELECT title, my_movies.rating AS rating 
FROM movies 
JOIN my_movies 
	USING(id);


--CROSS JOIN
--returns all records from both tables (table1 and table2)

SELECT name, title 
FROM cartoons 
CROSS JOIN famous_cats;


--Join multiple tables

SELECT title, first_name, last_name, publisher 
FROM books 
JOIN authors 
	ON author_id = authors.id 
JOIN publishers 
	ON publisher_id = publishers.id;


--LEFT JOIN
--returns all records from the left table (table1), and the matching records from the right table (table2)
--the result is 0 records from the right side, if there is no match

SELECT name, alive, liability, value, deadline 
FROM debtors 
LEFT JOIN debts 
	USING (debtor_id) 
ORDER BY name;


--For all drivers from the drivers table, display their names and surnames and the average amount of fines they have received

SELECT first_name, last_name, ROUND(AVG(fine),2) AS avg 
FROM drivers 
LEFT JOIN tickets 
	ON id = driver_id 
GROUP BY id 
ORDER BY avg DESC;




	