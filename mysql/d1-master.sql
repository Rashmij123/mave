USE sakila;

-- Fetch static value
SELECT 'AISHWARYA';

SELECT 'AISHWARYA' AS 'CR';

SELECT 100 + 200 AS TOTAL;

SELECT 100 + 200 AS 'TOTAL VALUE';

SELECT 100 + 200 AS "TOTAL VALUE";

SELECT Pi();

SELECT MOD(45, 7);

SELECT Sqrt(25);

-- FETCH RECORDS FROM TABLE
SELECT *
FROM   actor;

SELECT *
FROM   sakila.actor;

-- SORT ORDER
SELECT *
FROM   actor
ORDER  BY first_name;

SELECT *
FROM   actor
ORDER  BY first_name ASC;

SELECT *
FROM   actor
ORDER  BY first_name DESC;

SELECT *
FROM   actor
ORDER  BY 1;

SELECT *
FROM   actor
ORDER  BY 2;

SELECT *
FROM   actor
ORDER  BY 2 DESC;

-- FILTERING
SELECT *
FROM   actor
WHERE  first_name = 'WoODY';

SELECT *
FROM   actor
WHERE  first_name = 'WoODY'
ORDER  BY 3 DESC;

SELECT *
FROM   actor
WHERE  actor_id > 195
ORDER  BY actor_id;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name,
          last_name;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name ASC,
          last_name ASC;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name ASC,
          last_name DESC;

-- EMPTY RESULT SET
SELECT *
FROM   actor
WHERE  false;

SELECT *
FROM   actor
WHERE  1 = 2;

SELECT *
FROM   actor
WHERE  true;

-- COLUMN ALIAS
SELECT rental_date,
       inventory_id,
       return_date
FROM   sakila.rental;

SELECT rental_date  AS DATE_RENTED,
       inventory_id AS 'ID OF INVENTORY',
       return_date
FROM   rental;

-- ARITHMETIC EXPRESSIONS
SELECT *
FROM   film;

SELECT replacement_cost,
       rental_rate,
       replacement_cost - rental_rate AS CostDiff
FROM   film;

SELECT title,
       length      AS 'MINUTES',
       length / 60 AS 'HOURS'
FROM   film;

-- FUNCTIONS - INTEGER OPERATIONS
SELECT *
FROM   payment;

-- AGGREGATE FUNCTION
SELECT amount
FROM   payment;

SELECT amount,
       Round(amount)
FROM   payment;

SELECT amount,
       Round(amount),
       Round(amount, 1),
       Round(amount, 2)
FROM   payment;

SELECT amount,
       Round(amount),
       Floor(amount)
FROM   payment;

SELECT Round(1234.1234);

SELECT Round(1234.5234);

SELECT Round(1234.5234, 0);

SELECT Round(1234.5234, 1);

SELECT Floor(1.2);

SELECT Floor(1.7);

SELECT Ceiling(1.2);

SELECT Ceiling(1.7) AS 'CEILING VALUE';

SELECT Round(1234.5734, 1);

SELECT Round(1234.5734, 2);

SELECT Round(1234.5754, 2);

SELECT Round(1234.5734, -1);

SELECT Round(1235.5734, -1);
SELECT Round(1265.5734, -2);

SELECT Round(1235.5734, -3);

SELECT Round(1735.5734, -3);

SELECT Round(1735.5734, -30);

-- STRING OPERATIONS
SELECT 1 + 1 AS 'ADD';

SELECT '1' + '1' AS 'NO CONCATENATE';

SELECT 'A1' + '10' AS 'NO CONCATENATE';

SELECT Concat ('1', '1') AS 'CONCATENATE';

SELECT Concat (1, 1) AS 'CONCATENATE';

SELECT Concat ('A1', 10) AS 'CONCATENATE';

SELECT first_name,
       last_name
FROM   actor;

SELECT Concat(first_name, last_name) AS FullName
FROM   actor;

SELECT Concat(first_name, ' ', last_name) AS FullName
FROM   actor;

SELECT first_name,
       Length(first_name) AS FullName
FROM   actor;

SELECT first_name,
       last_name,
       LEFT(first_name, 1) AS Initial
FROM   actor;

SELECT Concat(LEFT(first_name, 1), ".", LEFT(last_name, 1)) AS INITIALS
FROM   actor;

SELECT first_name,
       last_name,
       LEFT(first_name, 1)                                  AS Initial,
       Concat(LEFT(first_name, 1), ".", LEFT(last_name, 1)) AS INITIALS
FROM   actor;

SELECT Concat(first_name, "", last_name)          AS Fullname,
       Reverse(Concat(first_name, "", last_name)) AS REVERSENAME
FROM   actor;

SELECT Concat(first_name, "", last_name)          AS Fullname,
       Reverse(Concat(first_name, "", last_name)) AS REVERSENAME
FROM   actor;

SELECT Concat(first_name, "", last_name)                              AS
       Fullname,
       REPLACE (Reverse(Concat(first_name, "", last_name)), 'S', '$') AS
       "REPLACED REVERSED FULL NAME"
FROM   actor;

-- SELECT @CONCATVAR;
SELECT @concatvar := Concat(first_name, "", last_name)
FROM   actor;

SELECT @concatvar := Concat(first_name, "", last_name)
FROM   actor
WHERE  actor_id = 100;

SELECT @reversevar := Reverse(@concatvar)
FROM   actor;

-- DATE OPERATIONS
SELECT LAST_UPDATE FROM ACTOR;
SELECT DATE_FORMAT(LAST_UPDATE,'%m/%d/%y') as LAST_UPDATED, LAST_UPDATE FROM ACTOR;

SELECT DATE_FORMAT(LAST_UPDATE, '%m-%d-%Y') AS LAST_UPDATED, LAST_UPDATE fROM ACTOR;

/* time with microseconds */
SELECT DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdated, LAST_UPDATE fROM ACTOR;

SELECT 	rental_date,
		DAYOFWEEK(rental_date) AS DayOfWeek,
		QUARTER(rental_date) AS Quarter,
		WEEK(rental_date) AS Week,
		MONTHNAME(rental_date) AS MonthName	
FROM sakila.rental;

-- USE DISTINCT OPERATORS
SELECT first_name
FROM sakila.actor
ORDER BY first_name;

SELECT DISTINCT first_name
FROM sakila.actor
ORDER BY first_name;

--TOTAL NUMBER OF ROWS
SELECT COUNT(*) FROM ACTOR;
SELECT COUNT(first_name)
FROM sakila.actor;
SELECT COUNT(DISTINCT first_name)
FROM sakila.actor;

SELECT * FROM ACTOR
WHERE FIRST_NAME LIKE 'PEN%';


--USING THE WHERE CLAUSE
-- WHERE clause Comparison Operators

-- Equal (=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';

-- Less than (<)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name < 'Nick';

-- Greater than (>)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name > 'Nick';

-- Less than or Equal to (<=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <= 'Nick';

-- Greater than or Equal to (>=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id >= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name >= 'Nick';

-- Not equal (<> or !=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name != 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <> 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT first_name IN ('Nick');


--EXPLORE
--DISPLAY ONLY DUPLICATES
SELECT FIRST_NAME, COUNT(FIRST_NAME) FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1

SELECT FIRST_NAME FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1;

SELECT FIRST_NAME FROM ACTOR
WHERE FIRST_NAME IN 
(
SELECT FIRST_NAME FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1
)
ORDER BY FIRST_NAME DESC;

--LOGICAL OPERATORS
-- AND
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 AND last_name = 'TORN';


-- OR
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100; 

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100 OR last_name = 'TEMPLE';


-- NOT
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT actor_id = 5;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 5;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR last_name = 'TEMPLE' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE (first_name = 'KENNETH' AND actor_id < 100) OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 OR last_name = 'TEMPLE');

SELECT *
FROM sakila.actor
WHERE (first_name = 'KENNETH' OR last_name = 'TEMPLE') AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR (last_name = 'TEMPLE' AND actor_id < 100);

SELECT *
FROM sakila.actor
WHERE NOT (first_name = 'KENNETH' OR (last_name = 'TEMPLE' AND actor_id < 100));

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR NOT(last_name = 'TEMPLE' AND actor_id < 100);

-- WHERE clause Comparison Operators
-- Comparison OPERATORS (= != >= <=)  
-- MODIFIED Comparison OPERATORS IN
SELECT *
FROM sakila.actor
WHERE first_name = 'NICK' OR  first_name =  'JOHNNY';


SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY');

SELECT *
FROM sakila.actor
WHERE first_name = 'NICK' OR  first_name =  'JOHNNY';

SELECT *
FROM sakila.actor
WHERE first_name  != 'NICK' AND first_name != 'JOHNNY';

SELECT *
FROM sakila.actor
WHERE actor_id IN (1,2,3,4,5,6,7,8);

SELECT *
FROM sakila.actor
WHERE (actor_id = 1 OR 
		actor_id = 2 OR 
		actor_id = 3 OR 
		actor_id = 4 OR 
		actor_id = 5 OR 
		actor_id = 6 OR 
		actor_id = 7 OR 
		actor_id = 8);

-- NOT IN
SELECT *
FROM sakila.actor
WHERE actor_id NOT IN (1,2,3,4,5,6,7);

-- In Subquery

SELECT actor_id, FIRST_NAME, last_name 
					FROM sakila.actor
					WHERE last_name = 'DEGENERES';

/* (41,107,166) */

SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY','JOE','VIVIEN');

SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY','JOE','VIVIEN')
AND actor_id IN (41,107,166);

-- OUTER QUERY
SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK','JOHNNY','JOE','VIVIEN')
-- 		OR actor_id IN (41, 107, 166)
		AND actor_id IN 
-- INNER QUERY (SUB QUERY)
					(SELECT actor_id 
					FROM sakila.actor
					WHERE last_name = 'DEGENERES');

-- BETWEEN
SELECT *
FROM sakila.actor
WHERE actor_id >= 10 AND actor_id <= 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 10 AND 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 11 AND 19;

SELECT *
FROM sakila.actor
WHERE actor_id NOT BETWEEN 11 AND 19;


-- LIKE WITH WILD CARDS
SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'Alec%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE '%RA%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE '%R%A%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE '%RA';

SELECT *
FROM sakila.actor
WHERE first_name NOT LIKE '%RA';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'AL%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A__E';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A__E%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'A%E%';

SELECT FIRST_NAME
FROM sakila.actor
WHERE NOT (first_name LIKE 'A%E%' AND first_name LIKE 'A%')
ORDER BY FIRST_NAME;

SELECT FIRST_NAME
FROM sakila.actor
WHERE NOT (first_name LIKE 'A%E%' OR first_name LIKE 'A%')
ORDER BY FIRST_NAME;

-- -----------------------------------------------------
-- NULL 
-- -----------------------------------------------------
SELECT ADDRESS,ADDRESS2 
FROM sakila.address;

-- ALL ACTORS WITHOUT A SECOND ADDRESS
SELECT ADDRESS_id, ADDRESS,ADDRESS2 
FROM address
WHERE address2 IS NULL;

UPDATE ADDRESS SET ADDRESS2 = 'ADD2'
WHERE ADDRESS_ID = 5;

UPDATE ADDRESS SET ADDRESS2 = ''
WHERE ADDRESS_ID = 6;

UPDATE ADDRESS SET ADDRESS2 = NULL
WHERE ADDRESS_ID = 6;

SELECT * FROM ADDRESS WHERE ADDRESS2 = '';


UPDATE ADDRESS SET ADDRESS2 = 'NULL'
WHERE ADDRESS_ID = 6;

SELECT ADDRESS,ADDRESS2 
FROM sakila.address
WHERE address2 = 'NULL';

SELECT ADDRESS,ADDRESS2 
FROM address
WHERE address2 IS NOT NULL;

SELECT ADDRESS.ADDRESS2 FROM SAKILA.ADDRESS;


-- NO ADDRESS2      [IS NULL]
-- HAS AN ADDRESS2   [IS NOT NULL]
-- NULL AND '' ARE EQUAL
-- NULL REPRESENTS MISSING INFORMATION
-- '' EMPTY VALUE

























































