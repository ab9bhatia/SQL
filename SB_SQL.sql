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

select * from country where NOT(SELECT * FROM COUNTRY is NOT null);


select COUNT(*) from country where (
SELECT concat_ws(select g FROM SELECT group_CONCAT(column_name) AS G FROM (select COLUMN_NAME from information_schema.columns where table_schema='world' and table_name = 'country')A)
FROM 
country
SELECT group_CONCAT(column_name) AS G FROM (select COLUMN_NAME from information_schema.columns where table_schema='world' and table_name = 'country')A
) IS NULL;

select * from information_schema.columns where table_schema='world' and table_name = 'country' AND table_rows is null

SELECT (
  select COLUMN_NAME from information_schema.columns where table_schema='world' and table_name = 'country'
) FROM COUNTRY


;with xmlnamespaces('http://www.w3.org/2001/XMLSchema-instance' as ns)
select 
       (
          select T1.*
          for xml path('row'), elements xsinil, type 
       ).value('count(//*/@ns:nil)', 'int') as NullCount
from @T as T1
