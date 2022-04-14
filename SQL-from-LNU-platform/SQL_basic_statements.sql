----------------------
--Basic SQL statements
----------------------

--------------
--LIMIT clause
--------------

--ten most expensive phone models
SELECT * 
FROM cell_phones 
ORDER BY price DESC 
LIMIT 0,10;

--select records from 21st to 30th
SELECT brand, model, price 
FROM cell_phones 
ORDER BY price DESC 
LIMIT 20,10;     

--------------
--WHERE clause
--------------

SELECT * 
FROM cell_phones 
WHERE color = 'black' AND price <= 300;

SELECT title, year 
FROM movies 
WHERE year BETWEEN '1990' AND '1999'  --covers the range between and including the given values
ORDER BY year;

SELECT * 
FROM movies 
WHERE director ='Ridley Scott' OR director = 'Tony Scott';

SELECT * 
FROM cell_phones 
WHERE brand IN ('Apple', 'Samsung', 'Microsoft');

SELECT * 
FROM famous_cats 
WHERE origin NOT IN ('Garfield', 'Smurfs', 'Tom & Jerry');

--Subqueries

--select the phones of your favorite brands from the cell_phones table
SELECT * 
FROM cell_phones 
WHERE brand IN ( SELECT brand FROM favorite_brands );

--from the movies table, display all movies that aren't in the my_movies table
SELECT * 
FROM movies 
WHERE id NOT IN (SELECT id FROM my_movies); 

-------------------------
--LIKE/ NOT LIKE operator
-------------------------
--operator that determines if a character string matches a specified pattern

--Wildcards:
-- %(percent) represents any string of zero or more characters
-- _(underscore) represents any single character

--movies with titles beginning with the letter 'A'
SELECT * 
FROM movies 
WHERE title LIKE 'A%';

--movies where the second letter of the director's surname is 'r'
SELECT * 
FROM movies 
WHERE director LIKE '_r%';

--movies that Clint Eastwood has starred in but didn't direct
SELECT * 
FROM movies 
WHERE [cast] LIKE '%Clint Eastwood%' AND director <> 'Clint Eastwood';

--movies in which Tom Cruise hasn't starred
SELECT * 
FROM movies 
WHERE [cast] NOT LIKE '%Tom Cruise%';

--movies that have single-ended titles 
SELECT * 
FROM movies 
WHERE title NOT LIKE '% %';

---------------------
--AGGREGATE FUNCTIONS
---------------------
--MAX () - returns the maximum value
--MIN () - returns the minimum value
--COUNT () returns the number of rows (NULL not included)
--SUM () - returns the total
--AVG () - returns the average

--calculate how many records from the movies table contain the rating in the range from 7.5 to 8.5, including these values
SELECT COUNT(rating) 
FROM movies 
WHERE rating BETWEEN '7.5' AND '8.5';

--calculate how many different brands contains the cell_phones table 
SELECT COUNT(DISTINCT brand) 
FROM cell_phones;

--calculate the average price of Apple's phones
SELECT AVG(price) 
FROM cell_phones 
WHERE brand = 'Apple';

--display the titles and ratings of movies with a rating greater than or equal to the average of your ratings for all movies in the my_movies table
SELECT title,rating 
FROM movies 
WHERE rating >= (SELECT AVG(my_rating) FROM my_movies) 
ORDER BY rating DESC;

--calculate the total value of tickets issued in Chicago
SELECT SUM(fine) 
FROM tickets 
WHERE location ='Chicago';

--calculate how much fine Fletcher Reede got in Los Angeles
SELECT SUM(fine) 
FROM tickets 
WHERE location = 'Los Angeles' AND driver_id = (select ID from drivers where first_name = "Fletcher" AND family_name = "Reede");

--calculate the lowest price for phone models with an operating system other than Android
SELECT MIN(price) 
FROM cell_phones 
WHERE system <> 'Android'; 		--WHERE system NOT LIKE 'Android'

--find the size of the largest screen of the models that are not red, blue or pink
SELECT MAX(screen)
FROM cell_phones 
WHERE color NOT IN ('red','blue','pink');

----------
--GROUP BY
----------

--how many heroes from each fairy tale contains the famous_cats table
SELECT origin, COUNT(id) 
FROM famous_cats 
GROUP BY origin;

--from the cell_phones table, get the number of models for individual operating systems, sort the results from the group with the largest number of models
SELECT system, COUNT(id) 
FROM cell_phones 
GROUP BY system 
ORDER BY COUNT (id) DESC;


--Aliases

--display the average price for models with the same screen size
SELECT screen, AVG(price) AS avg_price
FROM cell_phones 
GROUP BY screen 
ORDER BY avg_price DESC;

--from the tickets table, display the columns: location and the average value of tickets for the three location where the average amount of tickets is the highest
SELECT location, AVG(fine) AS [average fine] 
FROM tickets 
GROUP BY location 
ORDER BY AVG(fine) DESC 
LIMIT 0,3;

--------
--HAVING
--------

--calculate the sum of the value of fines for individual cities, but only for those with at least three fines (include tickets issued after 1991)
SELECT location, SUM(fine) AS total 
FROM tickets 
WHERE date >= '1992' 	--the field is of the text type
GROUP BY location 
HAVING COUNT(*)> 2;

--display the details of those drivers with issued fines of at least 100 dollars
SELECT driver_id, SUM(fine) AS [total fine] 
FROM tickets 
GROUP BY driver_id 
HAVING SUM(fine) >= 100 
ORDER BY SUM(fine) DESC;

