
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


--CAST function
--to convert a value from a data type to another data type

CAST(expression AS data_type)

SELECT country, GDP_2016, CAST(GDP_2016 AS FLOAT)/population AS [GDP per capita] 
FROM GDP 
ORDER BY [GDP per capita] DESC;