

# joins
# inner join 
# outer join

select * 
from employee_salary;

select * 
from employee_demographics;

select *
from employee_salary as a
inner join employee_demographics as b
	on a.employee_id =b.employee_id;
    
    
select *
from employee_salary as a
left join employee_demographics as b
	on a.employee_id =b.employee_id;
    
select b.employee_id,b.first_name
from employee_salary as a
right join employee_demographics as b
	on a.employee_id =b.employee_id;
    
    
    
    
# self join
 select a.employee_id, a.first_name as santa_firstname,a.last_name as santa_last_name,
		b.employee_id, b.first_name,b.last_name
from employee_salary as a
 join employee_salary as b
	on a.employee_id +1 =b.employee_id;
    
    
    
    
    
# joining multiple tables 
select *
from parks_departments;


select *
from  employee_salary;



select *
from employee_salary as a
inner join employee_demographics as b
	on a.employee_id =b.employee_id
inner join parks_departments as c
	on a.dept_id =c.department_id
;

       
