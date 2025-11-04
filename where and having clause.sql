
# differnce of where and having clause 

# having is used after group by  to filter aggregrate function whereas where is used after from___ >

SELECT occupation, avg(salary), min(salary)
FROM  employee_salary 
where occupation like "city%"
group by occupation
having min(salary) > 80000;





# LIMIT  and ALISAING 

# alising means giving another name 




SELECT *
FROM employee_demographics
order by gender, age asc
limit 3;


SELECT *
FROM employee_demographics
order by gender, age asc
limit 1,2;                          # 1, 2 means skip the first row and return the next 2 rows 




# as 


SELECT gender ,count(age), min(age) as a
FROM employee_demographics
group by  gender 
having a>30;



