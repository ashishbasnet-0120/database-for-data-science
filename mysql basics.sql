-- start of sql

create database college;
use college;

create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)

);

insert into student(rollno, name, marks,grade,city) values
(20, "Manish", 82, "B","kathmandu"),
(15, "Anish", 62, "B","kathmandu"),
(5, "Suman", 90, "A","pokhara"),
(1, "Rakesh", 83, "A","surkhet"),
(18, "Sangam", 82, "B","Butwal");

select * from student;

select name , city from student;

select distinct city from student; #it shows only non repeating items from the column 



### use of where clause

select marks from student where marks>70;

select *
 from student
 where city="pokhara";
 
 ## finding the students whose marks will exceeds 100 after adding the 12
 select * 
 from student
 where marks+12>100;



## AND operator . It is used to check the both condition must be true

select*
from student
where marks>70 and city="kathmandu";


##  OR operator . It is used to check for one condition  to be true 
select*
from student
where marks>70 or city="pokhara";

## BETWEEN operator . it is used to select for a given range 
## select * from student where marks between 80 and 90 . in this case 80 and 90 are inclusive

select *
 from student 
 where marks between 80 and 90;
 
 
 ## IN operator. it matches any value in the list .
 
 select * 
 from student
 where city in ("Kathmandu","pokhara");
 
 ## not . to neglate the given condition 
 select * 
 from student
 where city not in ("Kathmandu","pokhara");



## limit clause . it is usd to set upper limit on no of rows to be returned 

select *
from student
limit 4;


## order by clause 
# helps in sort in ascending and descending order  ASC, desc

select * 
from student
where marks > 50
order by marks DESC
limit 4;

## Aggregrate functions perform a calculation on a set of values, and return a single value
# count(), Max(), Min(), Sum(), Avg()

select Max(marks)
from student;


select Avg(marks)
from student;


## group by clause 
#1. groups rows that have the same values into the summary
#2. collects the data from multiple records and groups the result by one or more column 
#3. generally we use teh group by with some aggregation functions


select city, count(name)
from student
group by city;



## having clause 
# similar to where ie  applies on same condition on rows used when we want to apply any condition after
# grouping

#selecting the group of city where marks >50 and counting 

select city, count(name)
from student
group by city
having Max(marks)>50;

## Table related queries

## safe mode 
# SET SQL_SAFE_UPDATES=0;    YOU CA OFF THE SAFE MODE 
# SET SQL_SAFE_UPDATES=1;      YOU CAN ON THE  SAFE MODE IT IS ON BY DEFAULT IN SQL 

SET SQL_SAFE_UPDATES=0;

update student
set grade="c"
where marks<=63;


SELECT * FROM STUDENT;


# DELETE 
# TO DELETE THE EXISTING ROW

DELETE FROM STUDENT
WHERE MARKS <50;
