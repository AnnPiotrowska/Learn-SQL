
----------------------------
--SQL Format Number Options
----------------------------

--MODULO operator(%)
--Returns the remainder of one number divided by another A%B

--To find even values	 column_name % 2 = 0
--TO find odd values	 column_name % 2 <> 0


SELECT * 
FROM vehicles 
WHERE model = 'Ford' AND year%2 <> 0;


SELECT id, ((test_1+test_2+test_3)/3)*factor AS average 
FROM samples 
WHERE id%2 = 0 
GROUP BY id 
ORDER BY average DESC;


--CAST() function
--to convert a value from a data type to another data type

CAST(expression AS data_type)

SELECT country, GDP_2016, CAST(GDP_2016 AS FLOAT)/population AS [GDP per capita] 
FROM GDP 
ORDER BY [GDP per capita] DESC;


--ROUND() function
--rounded value to the specified length or precision

--ROUND(value,precision)

SELECT ROUND (price, 2) 
FROM orders;


SELECT system, ROUND(AVG(price),2) AS [avg price] 
FROM cell_phones 
GROUP BY system;

SELECT model, ROUND(price) AS price --defaults to zero
FROM cell_phones;

/*
Africa population. For each country, display the population change between 2015 and 2010 in numbers and percentages. Round off the percentage change to the nearest whole per mille.
*/
SELECT country, Y2015-Y2010 AS change, ROUND(((Y2015-Y2010)*100)/CAST(Y2010 AS FLOAT),1) AS [%] 
FROM population 
ORDER BY [%] DESC;

/*
For each district, display the number of crimes committed between 2012 and 2016 per capita.
*/
SELECT district, ROUND((SUM(y_12)+SUM(y_13)+SUM(y_14)+SUM(y_15)+SUM(y_16))/CAST(SUM(population) AS FLOAT),2) AS [crimes per capita] 
FROM crimes 
GROUP BY district 
ORDER BY [crimes per capita] DESC;


--ABS() function
--returns the absolute value of a number

SELECT ABS(1 - 4);
--result: 3

SELECT SUM(ABS(floor))*2*2.5 AS distance 
FROM elevator;

/*
Calculate the average value of expenses. Amount is the transaction amount in PLN; positive values are the proceeds to the account, negative values are the expenses from the account.
*/
SELECT ROUND(AVG(ABS(amount)),2) AS avg_exp 
FROM account 
WHERE amount <0;


--RANDOM() function
--generates a random number

SELECT RANDOM()

SELECT RANDOM() % 5;
--return one of the values (0, 1, 2, 3, 4) or ( -1, -2, -3, -4)

SELECT ABS( RANDOM() ) % 5;
--return one of the values (0, 1, 2, 3, 4)

/*
write a query that return randomize a number between 1 and 10
*/
SELECT ABS(RANDOM()) % 10 + 1;

/*
write a query that randomly selects one record from the movies table
*/
SELECT * 
FROM movies 
WHERE id = (ABS (RANDOM()) % (SELECT COUNT(*) FROM movies) + 1);



 