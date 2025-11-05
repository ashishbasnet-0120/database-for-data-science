/*
string functions  allows you to manipulate the string (text)
some of them are as follows 

1.concat()     combine strings

2.length()   returns string length

3. upper()/lower()    change case 

4.substring( first_name, start, end )   extract some part of string 

IMPORTANT   here if  substring(Ashish,2,1)   it returns  "sh "   KEEP IN MIND  most important concept


5. trim()  remove white spaces 
!  ltrim()
! rtrim ()    removes right or left white spaces only


6. replace()   replace substring 

7. we can combine two or more substrings    imp concept 

*/


# length()

select first_name , length(first_name) as len
from employee_salary;

# concat 

select first_name, last_name,
	concat(first_name, " ",last_name ) as full_name
from employee_salary;






# substring()


select first_name, substring(first_name,3,4) as extract
from employee_salary;

# upper() and lower()

select  first_name , 
	upper(first_name)
from employee_demographics
;



# replace 

select first_name,
		replace(first_name , "a", "s") as new_word
from employee_demographics
;






# trim()
select "  mother      ", trim("mother") as trimmed 
 ;
 
 
 select "  mother      ", ltrim("mother");
 
 select "  mother      ", rtrim("mother");
 
 
 
 
 # combination of two string functions 
 
 select first_name, last_name ,
	upper(concat(first_name, " ", last_name)) as modified_name
from employee_demographics;