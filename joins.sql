create database animal;
use animal;

create table employee(
id int primary key,
name varchar(15) unique,
city varchar(50) not null
);

create table salary(
id int primary key,
amount int default 50000,
overtime varchar(3)
);

insert into employee values
(100, "manish", "pokhara"),
(101, "anish", "KTM"),
(102, "suman", "ramechaap"),
(103, "gyanu", "biratnagar"),
(104, "ramechaap", "doti");


insert into salary (id, amount, overtime)values 
(100,20000,"yes"),
(101,40000,"no"),
(102,60000,"yes"),
(103, default,"no");

select * 
from salary;


select * 
from employee;



# inner  join
select *
from employee as e 
inner join salary as s
on e.id=s.id;


# right join
select *
from employee as e
right join salary as s
on e.id= s.id;

# left join
select *
from employee as e
left join salary as s
on e.id= s.id;

# full join

select *
from employee as e
right join salary as s
on e.id= s.id;

UNION  ##  not valid becasue The UNION operator requires both SELECT statements to have exactly the same number of columns and compatible data types.

select *
from employee as e
left join salary as s
on e.id= s.id;

