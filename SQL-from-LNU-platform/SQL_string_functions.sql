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
WHERE LIKE ('%!%%',password,'!') 
	OR LIKE ('%!_%',password,'!');


--GLOB operator

--Wildcards:
--asterisk (*) matches any number of characters
--question mark (?) matches exactly one character
--list wildcard [] matches one character from a list of characters


SELECT * 
FROM cats 
WHERE name GLOB '?a*';

SELECT * 
FROM tests 
WHERE SN GLOB '*[abc]';

--in the pass table, look for records where the value in the password field starts with a lowercase letter, ends with a number, and contains both characters: * and ?
SELECT * 
FROM pass 
WHERE password GLOB '[a-z]*[*]*[0-9]' 
	AND password GLOB '*[?]*';

--SN field: strings must be five characters long, the first character must be a number, the second character must be a letter from among the standard ASCII letters (whether it's upper or lower case).
CREATE TABLE valves 
(
	id INTEGER PRIMARY KEY,
	SN TEXT NOT NULL CHECK (SN GLOB '[0-9][a-zA-Z]???')
);

--NOT GLOB and [^]

--display only those records from the cats table that do not contain any digits in the name field
SELECT * 
FROM cats 
WHERE name NOT GLOB '*[0-9]*';


--GLOB() function
--GLOB(pattern,string)

SELECT * 
FROM famous_cats 
WHERE GLOB ('[A-M]*',name) 
ORDER BY name;


--TRIM() function 
--TRIM(string, character)
--remove characters from the beginning and the end of a string

SELECT TRIM('201101abc121', '012');

SELECT TRIM(district, '_') 
FROM crimes;

SELECT TRIM(name)  --character by default is a space
FROM famous_cats;  

--change the data in the source table so that passwords do not contain spaces
UPDATE pass 
SET password = TRIM(password);


--LTRIM()-remove characters at the beginning of the string
--RTRIM()-remove characters at the end of the string

SELECT Color, LTRIM(Hex,'#') AS Hex, TRIM(Dec,'()') AS Dec 
FROM colors;


--LENGTH() function
--return the number of characters in a string

SELECT length('123456789');		
--result: 9

--display the number of characters that consists of passwords in the pass table
SELECT user_id,password, length(password) AS length 
FROM pass 
ORDER BY length DESC;

--display data for the movie that has the longest description in the table
SELECT Title, Description, length(Description) AS Length 
FROM movies 
ORDER BY Length DESC 
LIMIT 1;


--SUBSTR() function
--SUBSTR(string, start, length)
--extract and returns a substring with a predefined length starting at a specified position in a source string

SELECT SUBSTR('abcdefgh', 5, 2 );
--result: ef

--display all records of the women's tickets from the table
--penultimate number in the PESEL is used to determine gender: an even number means a woman, an odd number a man
SELECT * 
FROM tickets 
WHERE SUBSTR(driver_id,-2,1)%2 = 0;

--the date column shows the date of issue in the YYYY-MM-DD format (year, month, day)
--arrange the year, month, and date in three separate columns
SELECT ticket_nr,
	SUBSTR(date,1,4) AS year, 
	LTRIM(SUBSTR(date,6,2),'0') AS month, 
	LTRIM(SUBSTR(date,9,2),'0') AS day, 
FROM tickets;


--REPLACE() function
--return a copy of a string with each instance of a substring replaced by another substring

--REPLACE(string,pattern,replacement_string)

SELECT REPLACE('abc123ghi', '123', 'def');
--result: abcdefghi

SELECT Title, REPLACE(Genre,'Sci-Fi','SF') As Genre
FROM movies;

UPDATE tests 
SET SN = REPLACE(SN,'As','Qs');


--UPPER() function
--converts a string to uppercase

UPDATE vehicles 
SET model = UPPER(model);

--For each engine, display the number of tests performed on it.
--Do not take into account the distinction between the type of valves used, which have been marked with a lower or upper case letter in the serial number
SELECT UPPER(SN) AS SN, COUNT(*) AS [tests] 
FROM tests 
GROUP BY UPPER(SN) 
ORDER BY tests DESC;


--LOWER() function
--converts a string to lowercase

--create login for each car owner 
--login consists of the first three letters of the name and the first three letters of the surname combined into one word
--login contains only lowercase letters and must be unique
SELECT DISTINCT o_first_name, o_family_name, LOWER(SUBSTR(o_first_name,1,3))||LOWER(SUBSTR(o_family_name,1,3)) AS login 
FROM vehicles 
ORDER BY login;


--INSTR() function
--find a substring in a string and returns an integer indicating the position of the first occurrence of the substring

SELECT INSTR('1234abc89', 'abc');
--result: 5

--view the titles of all movies in the movies table and their directors' initials
SELECT title, SUBSTR(director,1,1) || SUBSTR(director,INSTR(director,' ') +1,1) AS initials 
FROM movies;


--CHAR() function
--returns the character based on the ASCII code

--the cell_phones table in the price field shows the price of the phones in dollars. 
--view information about the brand, phone model and price in euros (UNIODE nr 8364), rounded to the nearest euro cents
SELECT brand, model, ROUND(price/1.15,2) ||' ' || CHAR(8364)AS price 
FROM cell_phones;


