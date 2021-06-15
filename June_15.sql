-- Query the average population for all cities in CITY, rounded down to the nearest integer.

select round(avg(POPULATION),0)
from CITY;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

select sum(POPULATION)
from CITY
where COUNTRYCODE = 'JPN';

-- Query the difference between the maximum and minimum populations in CITY.

select (max(POPULATION) - min(POPULATION))
from CITY;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

-- ceil(float) will round a decimal number the the next higher whole number
select ceil(avg(Salary) - avg(replace(Salary, 0, '')))
from EMPLOYEES;

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

select CITY.NAME
from CITY
join COUNTRY on CITY.COUNTRYCODE = COUNTRY.CODE
where COUNTRY.CONTINENT = 'Africa';

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

-- floor(float) will round a decimal to the next lower whole number 
select COUNTRY.Continent, floor(avg(CITY.Population))
from CITY
join COUNTRY on CITY.COUNTRYCODE = COUNTRY.CODE
group by COUNTRY.Continent;

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT * FROM (
    SELECT  months*salary, COUNT(*) 
    FROM employee 
    GROUP BY months*salary 
    ORDER BY months*salary DESC)
WHERE ROWNUM = 1;

-- Query the average population of all cities in CITY where District is California.

select avg(POPULATION)
from CITY
where DISTRICT = 'California';

-- Query the total population of all cities in CITY where District is California.

select sum(POPULATION)
from CITY
where DISTRICT = 'California';

-- Query a count of the number of cities in CITY having a Population larger than .

select count(*)
from CITY
where POPULATION > 100000;

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

select sum(CITY.POPULATION)
from CITY
join COUNTRY on CITY.COUNTRYCODE = COUNTRY.CODE
where COUNTRY.CONTINENT = 'Asia';

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
    -- Equilateral: It's a triangle with  sides of equal length.
    -- Isosceles: It's a triangle with  sides of equal length.
    -- Scalene: It's a triangle with  sides of differing lengths.
    -- Not A Triangle: The given values of A, B, and C don't form a triangle.
    
SELECT
  CASE 
    WHEN A + B <= C or A + C <= B or B + C <= A THEN 'Not A Triangle'
    WHEN A = B and B = C THEN 'Equilateral'
    WHEN A = B or A = C or B = C THEN 'Isosceles'
    WHEN A <> B and B <> C THEN 'Scalene'
  END tuple
FROM TRIANGLES;