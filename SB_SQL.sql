SELECT COUNT(*) FROM CITY WHERE DISTRICT ='Maharashtra'

SELECT DISTINCT DISTRICT FROM CITY ORDER BY DISTRICT;

--Q6 https://learn.upgrad.com/v/course/77/session/8501/segment/41100
SELECT LANGUAGE,count(*) FROM COUNTRYLANGUAGE  group by LANGUAGE order by count(*) desc LIMIT 1

--Q7 https://learn.upgrad.com/v/course/77/session/8501/segment/41100
SELECT LANGUAGE,count(*) FROM COUNTRYLANGUAGE  WHERE IsOfficial = 'T' group by LANGUAGE 
HAVING LANGUAGE IN('Tamil','Portuguese','Dutch','Turkish') order by count(*) desc LIMIT 1

--Q8 https://learn.upgrad.com/v/course/77/session/8501/segment/41100
SELECT count(*) FROM CITY  WHERE COUNTRYCODE IN(SELECT COUNTRYCODE FROM COUNTRYLANGUAGE WHERE LANGUAGE ='English'
AND IsOfficial = 'T' AND COUNTRYCODE IN(SELECT CODE FROM COUNTRY WHERE continent ='North America'))

--Q9 https://learn.upgrad.com/v/course/77/session/8501/segment/41100

select name,population from city where name in ('Phoenix','Los Angeles','Chicago','New York') order by population desc;

--Q10 https://learn.upgrad.com/v/course/77/session/8501/segment/41100

SET @whereClause = (select CONCAT(REPLACE(group_CONCAT(COLUMN_NAME),',',' IS NULL OR '),' IS NULL') 
from information_schema.columns where table_schema='world' and table_name = 'country');
SET @query = CONCAT("SELECT * FROM country WHERE ",@whereClause); 
PREPARE stmt FROM @query;
EXECUTE stmt;

Q11 SELECT * FROM COUNTRY WHERE NAME LIKE 'I%' AND NAME LIKE '%A'

Q12 SELECT CONTINENT,SUM(SURFACEAREA) FROM COUNTRY GROUP BY CONTINENT ORDER BY SUM(SURFACEAREA) LIMIT 1

GradedI
https://learn.upgrad.com/v/course/77/session/8500/segment/41098
1a|1d,2b|1c,2b
GradedII
https://learn.upgrad.com/v/course/77/session/8500/segment/41099
1b,2d,3a,4a,5b,6b,7b,8b,9d

-- SQL Assignment/TASK2
-- A
SELECT SUM(SALES) AS total_sales, AVG(SALES) AS avg_sales FROM MARKET_FACT

-- B
SELECT REGION,COUNT(CUST_ID) AS no_of_customers FROM CUST_DIMEN GROUP BY REGION ORDER BY no_of_customers DESC

-- C
SELECT REGION,max(no_of_customers) FROM
	(SELECT REGION,COUNT(CUST_ID) AS no_of_customers FROM CUST_DIMEN GROUP BY REGION ORDER BY no_of_customers DESC) AS T
-- or
-- SELECT REGION,COUNT(CUST_ID) AS no_of_customers FROM CUST_DIMEN GROUP BY REGION ORDER BY no_of_customers DESC LIMIT 1

-- D
SELECT PROD_ID AS product_id, COUNT(ORD_ID) AS no_of_products_sold FROM MARKET_FACT GROUP BY PROD_ID 
ORDER BY no_of_products_sold DESC

-- E
SELECT C.customer_name,COUNT(M.ORD_ID) AS no_of_tables_purchased FROM CUST_DIMEN AS C INNER JOIN MARKET_FACT AS M 
ON C.CUST_ID = M.CUST_ID AND C.REGION='ATLANTIC' 
AND M.PROD_ID IN(SELECT PROD_ID FROM PROD_DIMEN WHERE PRODUCT_SUB_CATEGORY ='TABLES')
GROUP BY C.customer_name;
