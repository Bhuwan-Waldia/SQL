use stud_data;
-- clauses :
-- order by : sort the data
-- select * from table order by column_name;
-- select * from table order by column_name desc;

-- distinct : unique
select * from emp;
select distinct dept_name from emp;
select * from emp_data;
select distinct loc from emp_data;
select distinct gender from emp_data;

select * from emp;
/*
101,mohan,admin,4000
101,mohan,admin,4000
*/

-- unique records from a table
select distinct * from emp;
select * from emp order by dept_name;

select distinct dept_name,salary from emp order by dept_name;
select distinct dept_name,salary,emp_id,emp_name from emp order by dept_name;

-- limit : 
-- limit offset,no of rows to read
-- offset : no of rows to skip from top , default value of offset is 0

-- top 5 rows
select * from emp;
select * from emp limit 0,5;
select * from emp limit 5;

-- top 5 salary values
select salary from emp order by salary desc limit 5;

-- read rows from 10 to 20
select * from emp limit 9,11;

-- 9th row
select * from emp limit 8,1;

-- nth row
-- select * from table limit n-1,1;

-- second highest salary 
select * from emp order by salary desc;
select salary from emp order by salary desc limit 1,1;

-- 4th highest salary
select distinct salary from emp order by salary desc limit 3,1;

-- nth highest salary
-- select distinct salary from table order by salary desc limit n-1,1;

-- union and union all
-- union all
select col1 from tbl1
union all
select col2 from tbl2
union all
select col1 from tbl1; 

-- 10 + 5 >> 15 rows

select col1 from tbl1
union 
select col2 from tbl2;
-- 10 + 5 (3 are common) >> 10+5-3 = 12 rows

select * from employee;
select * from department;

select dept_id,emp_name from employee
union 
select dept_id,dept_name from department;

-- aggregate functions
-- min,max,avg,sum,count

select * from emp;
select min(salary) from emp;
select max(salary) from emp;
select sum(salary),avg(salary) from emp;

select count(*) from emp;
select count(1) from emp;
select count(emp_id) from emp; -- count of non null values

select * from student;
insert into student values(106,null,null);
select count(*) from student;
select count(roll_no) from student;
select count(address) from student;

select * from movies;
-- avg budget of movies relesed during normal days
select avg(budget) from movies where `release period`='normal';

-- budget(inr) : `budget(inr)`
-- revenue(inr) : `revenue(inr)`

-- total no of screens on which drama movies were released
select sum(`number of screens`) from movies where genre='drama';

select * from placement;
-- avg cgpa of mech students
select avg(cgpa) from placement where branch='mechanical';

select min(salary) from emp;
select * from emp;

-- group by : creates group of data based on simillar values
-- 100 : comp(20),civil(20),mech(20),entc(20),food(20)
-- comp(20)   : working(10) and non working(10)
-- working(10): day shift(5) and night shift(5)

select distinct dept_name from emp;
select min(salary) from emp where dept_name='admin';
select min(salary) from emp where dept_name='hr';
select min(salary) from emp where dept_name='finance';
select min(salary) from emp where dept_name='it';

select * from emp;
select min(salary) from emp group by dept_name;
select dept_name,min(salary),count(emp_id) from emp group by dept_name;

select * from student_mark;
-- percentage for each student
-- sum(marks)/sum(out_of)*100

select rollno,sum(marks)/sum(out_of)*100
from student_mark
group by rollno;

-- alias
-- alias can be given to a column, table or a subquery
-- import pandas as pd

select salary,salary+100 as sal,salary*0.25 per_sal from emp e;

-- list of all students
select * from placement;

-- count of all students
select count(*) from placement; -- 2966

-- list students cgpa>5,no backlogs and have done atleast one internship
select * from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1;

-- count of these students
select count(*) from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1; -- 1293

-- branchwise count

select branch,count(*) from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch;

-- how many placed and how many not
select * from placement;

select branch,placedornot,count(*) from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot;

select branch,placedornot,count(*) 
from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
order by branch;

select branch,placedornot,count(*) 
from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
order by branch
limit 3,2;

-- select from where group by order by limit

-- fetch only groups where count of students is greater than 100

select branch,placedornot,count(*) 
from placement
where
cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
having count(*)>100
order by branch;

-- where : row level data,added before group by in a query
-- having: grouped data,added after group by in a query

select * from movies;
-- count of movies which are released during normal days 
-- and their avg revenue from each genre

select  genre,count(`movie name`),avg(revenue) 
from movies 
where `release period`='normal'
group by genre;

select * from cars;

-- total distance travlled by each car
select cars,sum(distance_travlled) from cars group by cars;

/*
order by : sort the data
distinct : to fetch unique values
limit    : limits the no of rows in the output
group by : craetes groups of data based on simillar values
where    : filter row level data
having   : filter grouped data

select from where group by having order by limit
*/

-- joins : combine data from multiple tables
-- inner join/join           :  common records
-- left join/left outer join :  inner join + remaining from left table
-- right join/right outer join :  inner join + remaining from right table
-- full join/full outer join   :  left join union right join

/*
tbl1 left join tbl2 : tbl1 is the left table and tbl2 is the right table
tbl1 right join tbl2 : tbl1 is the left table and tbl2 is the right table

tbl1. tbl2
1.     2
2.     3. inner join : 2 left join : 1 null ,2 2 right join : 2 2,3 null 
full join:1 null 2 3 null 3
*/






























