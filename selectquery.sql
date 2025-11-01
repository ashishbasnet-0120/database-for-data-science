SELECT * 
FROM employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;



SELECT first_name,occupation
FROM employee_salary;

SELECT distinct gender 
FROM employee_demographics;


SELECT first_name,
last_name,
salary,
(salary+10000)-1000
FROM employee_salary;

#comments    follows  PEMDAS means parenthesis, exponential, multiplication , division, addition , subtraction
