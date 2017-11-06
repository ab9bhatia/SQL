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
SET @query = CONCAT("SELECT * FROM MOVIE WHERE ",@whereClause); 
PREPARE stmt FROM @query;
EXECUTE stmt;

