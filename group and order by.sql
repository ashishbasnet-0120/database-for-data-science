# group by

SELECT gender, age,MIN(age), COUNT(gender)
FROM employee_demographics
GROUP BY gender;


# order by
SELECT *
FROM employee_demographics
ORDER BY age, gender ASC;

SELECT *
FROM employee_demographics
ORDER BY gender , age  DESC;
