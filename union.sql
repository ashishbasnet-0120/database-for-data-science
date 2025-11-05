                           #union 

/*union is uesd to merge rows of two tables or same table . it is used with two or more select statement
# union is distinct itself means it only returns non repeated rows 
# we can also use UNION DISTINCT and UNION ALL if we want all rows with duplication 

# NOTE: SELECT statement in a UNION must return same no of columns and same and compatible data types 

# you can label with the help of as example "old man " as label 

# MOST IMP 
#All SELECT statements must have:
#The same number of columns
#Compatible data types
*/


select first_name, last_name , "old man" as label
from employee_demographics
where age >60 and gender="male"
union distinct
select first_name, last_name , "old women " as label
from employee_demographics
where age >60 and gender="female"
union distinct
select first_name, last_name , "high paid job holder " as label
from employee_salary
where salary >60000;


select * 
from employee_demographics;


select *
from employee_salary;