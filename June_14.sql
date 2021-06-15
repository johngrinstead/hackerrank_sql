-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three  characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT Name 
FROM Students 
WHERE Marks > 75 
ORDER BY substr(Name, -3), ID;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

select name
from Employee
order by name;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

select name
from Employee
where salary > 2000
and months < 10
order by employee_id;

-- Query the following two values from the STATION table:
    -- The sum of all values in LAT_N rounded to a scale of  decimal places.
    -- The sum of all values in LONG_W rounded to a scale of  decimal places.
    
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.

select round(sum(LAT_N),4)
from STATION
where LAT_N > 38.7880
and LAT_N < 137.2345;

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

select round(max(LAT_N),4)
from STATION
where LAT_N < 137.2345;

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.

select round(LONG_W, 4)
from STATION
where LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.

select round(min(LAT_N), 4)
from STATION
where LAT_N > 38.7780
order by LAT_N;

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.

select round(LONG_W,4)
from STATION
where LAT_N = (
    select min(LAT_N) 
    from STATION 
    where LAT_N>38.7780
);

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 

select * from (select city c, length(city) l
from   station
order by l desc, c asc)
where rownum = 1;

select * from (select city c, length(city) l
from   station
order by l asc, c asc)
where rownum = 1;

