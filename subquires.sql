# subqueries 


select *
from employee_salary;

select employee_id, first_name, last_name
from employee_salary
where salary >(
					select avg(salary)
                    from employee_salary
                    );
                    
                    
#  subquery  with the help of select 


/*select first_name, last_name,
(select employee_id
from employee_salary
where occupation like "%manager" ) as managers_role
from employee_salary
;  */     # it returns more than one row   


#note  subquery in selct statement  should return only one  row 


select first_name, last_name,
(select salary 
from employee_salary
where salary >70000
limit 1 ) as managers_role
from employee_salary
;


select * 
from employee_salary;




select * 
from employee_demographics;


select gender
from(select gender,first_name, last_name, max(age) as old 
from employee_demographics
)