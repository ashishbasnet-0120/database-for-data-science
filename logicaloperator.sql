SELECT *
FROM employee_demographics
;

#logical operators   AND , OR, NOT OR 

SELECT *
FROM employee_demographics
WHERE  age>=55
AND gender="Male";

SELECT *
FROM employee_demographics
WHERE  age>=55
OR gender="Male";


SELECT *
FROM employee_demographics
WHERE  age>=55
OR NOT gender="Male";


SELECT *
FROM employee_demographics
WHERE  age !=55;



