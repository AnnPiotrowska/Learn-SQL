

--https://www.sqlitetutorial.net/sqlite-string-functions/

------------------------
--SQL String Functions
------------------------

--Concatenation Operator ||
--Concatenate two strings into a single string.

SELECT first_name || ' ' ||  family_name 
FROM drivers


--LIKE() function
--LIKE(pattern,string)

SELECT * 
FROM cats 
WHERE LIKE ('A%', name);

SELECT * 
FROM crimes 
WHERE LIKE('%Cambridgeshire%',district);


--Escaping Characters
--LIKE(pattern,string,escape_character)

SELECT * 
FROM cats 
WHERE LIKE ('%!%%', name, '!');


SELECT * 
FROM pass 
WHERE LIKE ('%!%%',password,'!') OR LIKE ('%!_%',password,'!');


--GLOB operator

--Wildcards:
--asterisk (*) wildcard matches any number of characters
--question mark (?) wildcard matches exactly one character
--use the list wildcard [] to match one character from a list of characters


SELECT * 
FROM cats 
WHERE name GLOB '?a*';

SELECT * 
FROM tests 
WHERE SN GLOB '*[abc]';


--Unlike the LIKE operator,the GLOB operator:
--is case sensitive
--uses the UNIX wildcards
--the GLOB patterns do not have escape characters


