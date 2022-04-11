
---------------------------
--SQL additional techniques
---------------------------


--CASE statement
--goes through conditions and returns a value when the first condition is met
--if no conditions are true, it returns the value in the ELSE clause


--CASE x WHEN v1 THEN a WHEN v2 THEN b WHEN v3 THEN c ... ELSE n END
--if there is no ELSE part and no conditions are true, it returns NULL

SELECT id, symbol, 
CASE symbol 
	WHEN "R6D5" THEN "astromech" 
	WHEN "C5P1" THEN "protocol" 
	WHEN "T-1100" THEN "assassin" 
	ELSE "unknown" 
END AS function 
FROM droids;


--CASE WHEN condition_1 THEN value_1 WHEN condition_2 THEN value_2 ... ELSE value_n END

SELECT title,type, 
CASE 
	WHEN rating >8.4 THEN "excellent" 
	WHEN rating <=8.4 AND rating > 7.6 THEN "good" 
	WHEN rating <=7.6 AND rating > 7.0 THEN "OK" 
	ELSE "poor" 
END AS recommendation 
FROM movies 
ORDER BY rating DESC;


SELECT ward, y_15, y_16, y_16 - y_15 AS diff, 
CASE 
	WHEN y_16 - y_15 >0 THEN CHAR(9650) 
	WHEN y_16 - y_15 <0 THEN CHAR(9660) 
	ELSE "equal" 
END AS change 
FROM crimes;


--IS NULL/ IS NOT NULL operator 

SELECT * 
FROM authors 
WHERE date_of_death IS NULL;

SELECT * 
FROM authors 
WHERE middle_name IS NOT NULL;



--IFNULL() function
--return the specified value IF the expression is NULL, otherwise return the expression

SELECT IFNULL( NULL, 300);
--300

SELECT IFNULL( 100, 300);
--100

SELECT nazwisko, IFNULL( data_œmierci, "autor ¿yje" ) AS data_œmierci 
FROM autorzy;