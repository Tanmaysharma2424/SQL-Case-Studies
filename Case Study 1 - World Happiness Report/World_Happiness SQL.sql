create database world_happiness_report;
use world_happiness_report;

/*1.List all countries and their happiness scores in 2019.*/

select Country as all_countries, `happiness score` from report_2019;

/*2.Find the happiest country in 2017.*/

select Country, `happiness score` from report_2017
order by `happiness score` desc
limit 1;

/*3.	Show all countries with a happiness score greater than 7.5 in 2015.*/

select * from report_2015
where `Happiness Score` >= 7.5;

/*4.List countries from 2016 where the 'Economy (GDP per Capita)' is above 1.5.*/

select * from report_2016
where `Economy (GDP per Capita)` >= 1.5;

/*5.Get all countries where 'Trust (Government Corruption)' is less than 0.1 in 2018.*/

select * from report_2018
where `Perceptions of corruption` >= 0.1;

/*Show countries where 'Generosity' is greater than 0.4 in any year.*/

WITH full_report AS (
    SELECT Country, Generosity AS score, 2015 AS year FROM report_2015
    UNION ALL
    SELECT Country, Generosity AS score, 2016 FROM report_2016
    UNION ALL
    SELECT Country, Generosity AS score, 2017 FROM report_2017
    UNION ALL
    SELECT Country , Generosity AS score, 2018 FROM report_2018
    UNION ALL
    SELECT Country , Generosity AS score, 2019 FROM report_2019
)
SELECT DISTINCT Country, year, score as Generosity_score
FROM full_report
WHERE score >= 0.4
ORDER BY Country, year;

/*7.	List the top 10 happiest countries in 2019.*/

select `Happiness Rank` , Country as Countries from report_2019
order by `Happiness Rank` asc
limit 10;

/*8.List the bottom 10 happiest countries in 2016.*/

select `Happiness Rank` , Country as Countries from report_2016
order by `Happiness Rank` desc
limit 10;

/*9.Find the average happiness score globally in each year.*/

with avg_happiness as
(SELECT 2015 as Year,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2015
GROUP BY Country
union all
SELECT 2016,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2016
GROUP BY Country
union all
SELECT 2017,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2017
GROUP BY Country
union all
SELECT 2018,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2018
GROUP BY Country
union all
SELECT 2019,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2019
GROUP BY Country)
SELECT Year, ROUND(AVG(avg_score), 2) AS avg_score
FROM avg_happiness
GROUP BY Year
ORDER BY Year, avg_score DESC;

/*10.	Which region had the highest average happiness score in 2015?*/

SELECT Region, ROUND(AVG(`Happiness Score`), 2) AS avg_score
FROM report_2015
GROUP BY Region
ORDER BY avg_score DESC
LIMIT 1;

# 11.	Find the top 5 countries with highest 'Freedom to make life choices' in 2018.

select * from report_2018
order by `Freedom to make life choices` desc
limit 5;

/*12.	List countries that had a 'Healthy life expectancy' above the global average in 2019*/

SELECT Country, `Healthy life expectancy`
FROM report_2019
WHERE `Healthy life expectancy` > (
    SELECT AVG(`Healthy life expectancy`)
    FROM report_2019
)
ORDER BY `Healthy life expectancy` DESC;

/*13."Which country had the highest GDP per capita in each year from 2015 to 2019?".*/

select '2015'Year,Country, MAX(`Economy (GDP per Capita)`) as Highest_GDP from report_2015
GROUP BY Year,COUNTRY
LIMIT 1
UNION ALL
create database world_happiness_report;
use world_happiness_report;

/*1.List all countries and their happiness scores in 2019.*/

select Country as all_countries, `happiness score` from report_2019;

/*2.Find the happiest country in 2017.*/

select Country, `happiness score` from report_2017
order by `happiness score` desc
limit 1;

/*3.	Show all countries with a happiness score greater than 7.5 in 2015.*/

select * from report_2015
where `Happiness Score` >= 7.5;

/*4.List countries from 2016 where the 'Economy (GDP per Capita)' is above 1.5.*/

select * from report_2016
where `Economy (GDP per Capita)` >= 1.5;

/*5.Get all countries where 'Trust (Government Corruption)' is less than 0.1 in 2018.*/

select * from report_2018
where `Perceptions of corruption` >= 0.1;

/*Show countries where 'Generosity' is greater than 0.4 in any year.*/

WITH full_report AS (
    SELECT Country, Generosity AS score, 2015 AS year FROM report_2015
    UNION ALL
    SELECT Country, Generosity AS score, 2016 FROM report_2016
    UNION ALL
    SELECT Country, Generosity AS score, 2017 FROM report_2017
    UNION ALL
    SELECT Country , Generosity AS score, 2018 FROM report_2018
    UNION ALL
    SELECT Country , Generosity AS score, 2019 FROM report_2019
)
SELECT DISTINCT Country, year, score as Generosity_score
FROM full_report
WHERE score >= 0.4
ORDER BY Country, year;

/*7.	List the top 10 happiest countries in 2019.*/

select `Happiness Rank` , Country as Countries from report_2019
order by `Happiness Rank` asc
limit 10;

/*8.List the bottom 10 happiest countries in 2016.*/

select `Happiness Rank` , Country as Countries from report_2016
order by `Happiness Rank` desc
limit 10;

/*9.Find the average happiness score globally in each year.*/

with avg_happiness as
(SELECT 2015 as Year,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2015
GROUP BY Country
union all
SELECT 2016,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2016
GROUP BY Country
union all
SELECT 2017,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2017
GROUP BY Country
union all
SELECT 2018,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2018
GROUP BY Country
union all
SELECT 2019,Country, AVG(`Happiness Score`) AS avg_score
FROM report_2019
GROUP BY Country)
SELECT Year, ROUND(AVG(avg_score), 2) AS avg_score
FROM avg_happiness
GROUP BY Year
ORDER BY Year, avg_score DESC;

/*10.	Which region had the highest average happiness score in 2015?*/

SELECT Region, ROUND(AVG(`Happiness Score`), 2) AS avg_score
FROM report_2015
GROUP BY Region
ORDER BY avg_score DESC
LIMIT 1;

# 11.	Find the top 5 countries with highest 'Freedom to make life choices' in 2018.

select * from report_2018
order by `Freedom to make life choices` desc
limit 5;

/*12.	List countries that had a 'Healthy life expectancy' above the global average in 2019*/

SELECT Country, `Healthy life expectancy`
FROM report_2019
WHERE `Healthy life expectancy` > (
    SELECT AVG(`Healthy life expectancy`)
    FROM report_2019
)
ORDER BY `Healthy life expectancy` DESC;

/* 13. "Which  top  7 countries had a Happiness Score above 6 and also had a high Economy (GDP per Capita) in the year 2019?"*/

SELECT '2019' as year, Country, `Happiness Score`, `GDP per capita` FROM report_2019
where `Happiness Score` > 6
order by `GDP per capita` desc
limit 7;

/*14.	Show the total number of countries surveyed in each year.*/

select '2015' as Year,count(DISTINCT (Country)) as Total_num_countries from report_2015
union all
select '2016' as Year,count(DISTINCT (Country)) as Total_num_countries from report_2016
union all
select '2017' as Year,count(DISTINCT (Country)) as Total_num_countries from report_2017
union all
select '2018' as Year,count(DISTINCT (Country)) as Total_num_countries from report_2018
union all
select '2019' as Year,count(DISTINCT (Country)) as Total_num_countries from report_2019;

/*15.	Find the bottom 5 happiest countries for each year.*/

-- 2015
WITH Ranked_Countries AS (
  SELECT Country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` ASC) AS rnk
  FROM report_2015
)
SELECT '2015' as Year,Country, `Happiness Score`, rnk
FROM Ranked_Countries
WHERE rnk <= 5;

-- 2016
with ranked as
(select '2016'  as Year,Country, `Happiness Score`, rank() over(order by `Happiness Score` asc) as rnk
from report_2016)
select * from ranked
where rnk <= 5;

-- 2017
with ranked as
(select '2017'  as Year,Country, `Happiness Score`, rank() over(order by `Happiness Score` asc) as rnk
from report_2017)
select * from ranked
where rnk <= 5;

-- 2018
with ranked as
(select '2018'  as Year,Country, `Happiness Score`, rank() over(order by `Happiness Score` asc) as rnk
from report_2018)
select * from ranked
where rnk <= 5;

-- 2019
with ranked as
(select '2019'  as Year,Country, `Happiness Score`, rank() over(order by `Happiness Score` asc) as rnk
from report_2019)
select * from ranked
where rnk <= 5;

/*16.	Find countries ranked in the top 10 for each year.*/
-- 2015
with ranked_2015 as
(select '2015' as Year, country, `happiness score`, rank() over (order by `happiness score` desc) as rnk from report_2015)
select * from ranked_2015 where rnk <= 10;

-- 2016
with ranked_2016 as
(select '2016' as Year, country, `happiness score`, rank() over (order by `happiness score` desc) as rnk from report_2016)
select * from ranked_2016 where rnk <= 10;

-- 2017
with ranked_2017 as
(select '2017' as Year, country, `happiness score`, rank() over (order by `happiness score` desc) as rnk from report_2017)
select * from ranked_2017 where rnk <= 10;

-- 2018
with ranked_2018 as
(select '2018' as Year, country, `happiness score`, rank() over (order by `happiness score` desc) as rnk from report_2018)
select * from ranked_2018 where rnk <= 10;

-- 2019
with ranked_2019 as
(select '2019' as Year, country, `happiness score`, rank() over (order by `happiness score` desc) as rnk from report_2019)
select * from ranked_2019 where rnk <= 10;

/*17.	Display the rank of India across all five years.*/

-- 2015
WITH ranked_2015 AS (
  SELECT country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` DESC) AS rnk
  FROM report_2015
)
SELECT country, `Happiness Score`, rnk
FROM ranked_2015
WHERE country = 'India';

-- 2016
WITH ranked_2016 AS (
  SELECT country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` DESC) AS rnk
  FROM report_2016
)
SELECT country, `Happiness Score`, rnk
FROM ranked_2016
WHERE country = 'India';

-- 2017
WITH ranked_2017 AS (
  SELECT country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` DESC) AS rnk
  FROM report_2017
)
SELECT country, `Happiness Score`, rnk
FROM ranked_2017
WHERE country = 'India';

-- 2018
WITH ranked_2018 AS (
  SELECT country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` DESC) AS rnk
  FROM report_2018
)
SELECT country, `Happiness Score`, rnk
FROM ranked_2018
WHERE country = 'India';

-- 2019
WITH ranked_2019 AS (
  SELECT country, `Happiness Score`,
         RANK() OVER (ORDER BY `Happiness Score` DESC) AS rnk
  FROM report_2019
)
SELECT country, `Happiness Score`, rnk
FROM ranked_2019
WHERE country = 'India';

/*19.Create a view that shows each country's happiness score in 2019 along with its rank.*/

create view happiness_rank as
select country, `happiness score`, rank() over(order by `happiness score`) as happiness_rank from report_2019;

select * from happiness_rank;

/*20.	Compare happiness scores of Nordic countries (Finland, Denmark, Norway, Iceland, Sweden) over the years.*/

SELECT 
  rt_15.country,
  rt_15.`Happiness Score` AS happiness_2015,
  rt_16.`Happiness Score` AS happiness_2016,
  rt_17.`Happiness Score` AS happiness_2017,
  rt_18.`Happiness Score` AS happiness_2018,
  rt_19.`Happiness Score` AS happiness_2019
FROM report_2015 AS rt_15
LEFT JOIN report_2016 AS rt_16
  ON rt_15.country = rt_16.country
  LEFT JOIN report_2017 AS rt_17
  ON rt_16.country = rt_17.country
  LEFT JOIN report_2018 AS rt_18
  ON rt_17.country = rt_18.country
  LEFT JOIN report_2019 AS rt_19
  ON rt_18.country = rt_19.country
WHERE rt_15.country IN ('Finland', 'Denmark', 'Norway', 'Iceland', 'Sweden');

/* 21. Show a country-wise comparison of happiness score between 2015 and 2019.*/

SELECT 
  rt_15.country,
  rt_15.`Happiness Score` AS happiness_2015,
  rt_16.`Happiness Score` AS happiness_2016,
  rt_17.`Happiness Score` AS happiness_2017,
  rt_18.`Happiness Score` AS happiness_2018,
  rt_19.`Happiness Score` AS happiness_2019
FROM report_2015 AS rt_15
LEFT JOIN report_2016 AS rt_16
  ON rt_15.country = rt_16.country
  LEFT JOIN report_2017 AS rt_17
  ON rt_16.country = rt_17.country
  LEFT JOIN report_2018 AS rt_18
  ON rt_17.country = rt_18.country
  LEFT JOIN report_2019 AS rt_19
  ON rt_18.country = rt_19.country;

----- End Of Project