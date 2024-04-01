USE Projects

SELECT * FROM Netflix

SELECT count(type) FROM Netflix WHERE type = 'Movie'
SELECT count(type) FROM Netflix WHERE type = 'Tv Show'

SELECT * FROM Netflix WHERE country like '%India%'

select count(show_id) from Netflix where country like '%United States%'

SELECT COUNT(show_id) FROM Netflix WHERE country like '%India%'

SELECT * FROM Netflix WHERE cast like '%Anupam Kher%'


--- Total Cast
SELECT COUNT(DISTINCT(TRIM(SPLIT.VALUE))) as Total_cast
FROM Netflix
CROSS APPLY string_split(CAST,',') AS SPLIT
WHERE VALUE != 'Unknown'

SELECT show_id, TRIM(SPLIT.value) as Total_cast
FROM Netflix
CROSS APPLY string_split(CAST,',') AS SPLIT
WHERE VALUE != 'Unknown'

---- Total Director
SELECT count(TRIM(SPLIT.VALUE)) as Total_Director
FROM Netflix
CROSS APPLY string_split(director, ',') AS SPLIT
WHERE value != 'Unknown'

SELECT show_id, TRIM(DIRECTOR_SPLIT.value) as Total_Director
FROM Netflix
CROSS APPLY string_split(director, ',') AS DIRECTOR_SPLIT
WHERE value != 'Unknown'

--- Total listed in

select show_id, trim(split.value) as listed_in
from Netflix
cross apply string_split(listed_in, ',') as split
where value != 'Unknown'

--- Number of countries
SELECT COUNT(DISTINCT TRIM(COUNTRY.VALUE)) AS COUNTRIES
FROM Netflix
CROSS APPLY string_split(country, ',') AS COUNTRY
WHERE value != 'Unknown'

SELECT show_id, TRIM(SPLIT.value) AS COUNTRIES
FROM Netflix
CROSS APPLY string_split(COUNTRY, ',') AS SPLIT
WHERE value != 'Unknown'

SELECT DISTINCT TRIM(SPLIT.value) AS COUNTRIES, COUNT(VALUE) AS CNT
FROM Netflix
CROSS APPLY string_split(COUNTRY, ',') AS SPLIT
WHERE value != 'Unknown'
GROUP BY TRIM(value)
ORDER BY CNT DESC

--- Shows Released year
SELECT RELEASE_YEAR, COUNT(TITLE) AS SHOWS
FROM Netflix
GROUP BY release_year
ORDER BY RELEASE_YEAR

--- Shows Added By Year 
SELECT year(date_added) as Year , COUNT(TITLE) AS SHOWS
FROM Netflix
GROUP BY year(date_added)
ORDER BY year(date_added)

SELECT *
FROM Netflix
WHERE listed_in LIKE '%Romantic%' and country like '%India%'

--- Rating 
SELECT rating, COUNT(title) AS COUNT
FROM Netflix
GROUP BY rating
ORDER BY COUNT

select * from Netflix

-- listed_in -- There are total 42 Categories
select distinct ltrim(split.value) as Categories
from Netflix
cross apply string_split(listed_in, ',') as split

select *
from Netflix
where listed_in like '%Horror%' and country like '%indi%'

select trim(split.value) as cast, count(value) as cnt
from Netflix
cross apply string_split(cast, ',') as split
where value != 'Unknown'
group by trim(value)
order by cnt desc

select type, COUNT(type) as cnt
from Netflix
group by type

-- End