--Course SQL Level 1 and SQL Level 2 from LNU platform
--Learning Notes
--SQLite

----------------------
--Basic SQL statements
----------------------

--LIMIT clause

--dane dziesieciu najdrozszych modeli telefonow
SELECT * 
FROM cell_phones 
ORDER BY price DESC 
LIMIT 0,10;

--wybrac rekordy od miejsca 21 do 30
SELECT brand, model, price 
FROM cell_phones 
ORDER BY price DESC 
LIMIT 20,10;     


--WHERE clause

SELECT * 
FROM cell_phones 
WHERE color = 'black' AND price <= 300;

SELECT title, year 
FROM movies 
WHERE year BETWEEN '1990' AND '1999'  --obejmuje zakres pomiedzy podanymi wartosciami wlacznie z nimi
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

--z tabeli cell_phones wybierz telefony Twoich ulubionych marek
SELECT * 
FROM cell_phones 
WHERE brand IN ( SELECT brand FROM favorite_brands );

-- z tabeli movies wyswietl wszystkie filmy, ktorych id nie ma w tabeli my_movies
SELECT * 
FROM movies 
WHERE id NOT IN (SELECT id FROM my_movies); 


--LIKE/ NOT LIKE operator
--operator that determines if a character string matches a specified pattern

--Wildcards:
-- %(percent) represents any string of zero or more characters
-- _(underscore) represents any single character

--filmy, ktorych tytuly zaczynaja sie od litery 'A'
SELECT * 
FROM movies 
WHERE title LIKE 'A%';

--w ktorych druga litera nazwiska rezysera to 'r’
SELECT * 
FROM movies 
WHERE director LIKE '_r%';

--z tabeli movies wybierz filmy, w ktorych zagral Clint Eastwood, ale ktorych nie rezyserowal
SELECT * 
FROM movies 
WHERE [cast] LIKE '%Clint Eastwood%' AND director <> 'Clint Eastwood';

--wybierz wszystkie filmy, w ktorych nie zagral Tom Cruise
SELECT * 
FROM movies 
WHERE [cast] NOT LIKE '%Tom Cruise%';

--z tabeli movies wybierz filmy, ktore maja tytuly jednoczlonowe 
SELECT * 
FROM movies 
WHERE title NOT LIKE '% %';


--AGGREGATE FUNCTIONS

--MAX () - returns the maximum value
--MIN () - returns the minimum value
--COUNT () returns the number of rows (NULL not included)
--SUM () - returns the total
--AVG () - returns the average


--oblicz ile rekordow z tabeli movies zawiera ocene (pole rating) mieszczaca sie w przedziale od 7.5 do 8.5 wlacznie z tymi wartosciami
SELECT COUNT(rating) 
FROM movies 
WHERE rating BETWEEN '7.5' AND '8.5';

--oblicz ile roznych marek (pole brand) zawiera tabela cell_phones
SELECT COUNT(DISTINCT brand) 
FROM cell_phones;

--pobierz srednia cene telefonow marki Apple
SELECT AVG(price) 
FROM cell_phones 
WHERE brand = 'Apple';

--wyswietl tytuly i oceny tych filmow z tabeli movies, ktorych ocena jest wieksza lub rowna sredniej z Twoich ocen wszystkich filmow z tabeli my_movies
SELECT title,rating 
FROM movies 
WHERE rating >= (SELECT AVG(my_rating) FROM my_movies) 
ORDER BY rating DESC;

--obliczenia sumarycznej wartosci mandatow wystawionych w Chicago
SELECT SUM(fine) 
FROM tickets 
WHERE location ='Chicago';

--oblicz na jaka sume dostal mandaty Fletcher Reede w Los Angeles
SELECT SUM(fine) 
FROM tickets 
WHERE location = 'Los Angeles' AND driver_id = (select ID from drivers where first_name = "Fletcher" AND family_name = "Reede");

--najnizsza cene sposrod modeli telefonow z systemem operacyjnym innym niz Android
SELECT MIN(price) 
FROM cell_phones 
WHERE system <> 'Android'; 		--WHERE system NOT LIKE 'Android'

--rozmiar najwiekszego ekranu sposrod modeli, ktore nie sa koloru czerwonego, niebieskiego ani rozowego;
SELECT MAX(screen) 
FROM cell_phones 
WHERE color NOT IN ('red','blue','pink');


--GROUP BY

--ilu bohaterow z poszczegolnych bajek zawiera tabela famous_cats
SELECT origin, COUNT(id) 
FROM famous_cats 
GROUP BY origin;

--z tabeli cell_phones uzyskaj liczby modeli dla poszczegolnych systemow operacyjnych, posortuj wyniki od grupy o najwiekszej liczbie modeli
SELECT system, COUNT(id) 
FROM cell_phones 
GROUP BY system 
ORDER BY COUNT (id) DESC;


--ALIASES

--wyswietl srednia cene dla modeli o tym samym rozmiarze ekranu
SELECT screen, AVG(price) AS avg_price
FROM cell_phones 
GROUP BY screen 
ORDER BY avg_price DESC;

--z tabeli tickets wyswietl kolumny: location oraz sredni a wartosc wystawionych mandatow dla trzech  miejscowosci, w ktorych srednia wysokosc wystawionych mandatow jest najwyzsza
SELECT location, AVG(fine) AS [average fine] 
FROM tickets 
GROUP BY location 
ORDER BY AVG(fine) DESC 
LIMIT 0,3;


--HAVING

--uwzgledniajac mandaty wystawione po roku 1991, oblicz sumy wartosci mandatow dla poszczegolnych miast, ale tylko tych, w ktorych wystawiono przynajmniej trzy mandaty
SELECT location, SUM(fine) AS total 
FROM tickets 
WHERE date >= '1992' 	--pole data zawiera dane typu text
GROUP BY location 
HAVING COUNT(*)> 2;

--wyswietl dane tych kierowcow, dla ktorych suma wystawionych mandatow wynosi co najmniej 100 dolarow
SELECT driver_id, SUM(fine) AS [total fine] 
FROM tickets 
GROUP BY driver_id 
HAVING SUM(fine) >= 100 
ORDER BY SUM(fine) DESC;

