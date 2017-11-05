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