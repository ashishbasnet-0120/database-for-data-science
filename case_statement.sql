# case staements


/*
it we can use case statement for multiple when- then conditions  to apply logic

*/


select first_name, last_name,
case
when salary>=60000 then "high salary"
when salary between 20000 and 59000 then "low salary"
else 'medium_salary'
end as salary_level,
case
when salary >50000 then salary * 1.05
when salary <=30000 then salary *1.20
else salary* 1.10

end as salary_hike


from employee_salary

;


select first_name, salary
from employee_salary;