use stud_data;
-- joins :  used to combine the data from multiple tables
-- inner join : common records 
-- left join :
-- right join :
-- full join :

-- inner join :
select * from tbl1 
inner join 
tbl2 
ON tbl1.col1=tbl2.col2;

select tbl2.* from tbl1 
inner join 
tbl2 
ON tbl1.col1=tbl2.col2;

select tbl2.*,tbl1.* 
from tbl1 
inner join 
tbl2 
ON tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,stud_name,course_name
from student
inner join 
course
on student.roll_no=course.roll_no;

-- left join :
select * from tbl1 
left join 
tbl2 
ON tbl1.col1=tbl2.col2;

select tbl2.*,tbl1.* 
from tbl1 
left join 
tbl2 
ON tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,stud_name,course_name
from student
left join 
course
on student.roll_no=course.roll_no;

-- right join :
select tbl2.*,tbl1.* 
from tbl1 
right join 
tbl2 
ON tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,stud_name,course_name
from student
right join 
course
on student.roll_no=course.roll_no;

-- full join :
-- right join + left join

select tbl2.*,tbl1.* 
from tbl1 
right join 
tbl2 
ON tbl1.col1=tbl2.col2
union
select tbl2.*,tbl1.* 
from tbl1 
left join 
tbl2 
ON tbl1.col1=tbl2.col2;


select student.roll_no,course.roll_no,stud_name,course_name
from student
right join 
course
on student.roll_no=course.roll_no
union 
select student.roll_no,course.roll_no,stud_name,course_name
from student
left join 
course
on student.roll_no=course.roll_no;

/*
select columns
from tbl1
type of join
tbl2
on join condition
type of join
tbl3
on join condition
*/
-- a b and c : 
-- a join b inner join b join c
-- a join b and a join c

select emp_id,emp_name,dept_name,mgr_name,proj_name
from employee e
left join
department d
on e.dept_id=d.dept_id
inner join 
manager m
on m.mgr_id=e.mgr_id
left join 
project p
on e.emp_id=p.team_member_id;


-- subqueries: 
-- query within query
-- select (select

-- scalar subqueries : inner query returns single value

-- details of an emp having max salary
select max(salary) from emp;
select * from emp where salary=10000;

select * from emp where salary=(select max(salary) from emp);

-- second max salary using max function
select * from emp where salary<(select max(salary) from emp);
/*
90
80 second highest salary
70
60
50
*/

select max(salary) from emp where salary<(select max(salary) from emp);

select max(salary) from emp where salary <
(select max(salary) from emp where salary<(select max(salary) from emp));

-- details of an emp having 5th highest salary
select distinct salary from emp order by salary desc limit 4,1;

select * from emp where salary=
(select distinct salary from emp order by salary desc limit 4,1);

select * from emp_data;
-- fetch the name and salary from emp where salary > avg salary of all emp
-- avg salary of all emp
-- salary compare it with the above avg salary

select fname,salary from emp_data where salary >
(select avg(salary) from emp);

-- list the emp from dept 30 having salary > avg salary of dept 20 emp
select * from emp_data;
-- avg salary of dept 20 emp
-- salary of dept 30 emp compare it with the above avg salary

select * from emp_data where salary>(
select avg(salary) from emp_data where dept_id=20)
and dept_id=30;

select * from movies;
-- fetch a movie name which has min budget but max revenue
-- min budget
-- max revenue
-- row /movie name which satisfy both above filters


select * from movies where budget=(select min(budget) from movies);
select * from movies where revenue=(select max(revenue) from movies);

select `movie name` from movies where
budget=(select min(budget) from movies)
and
revenue=(select max(revenue) from movies);

select `movie name` from movies where
budget=(select min(budget) from movies)
or
revenue=(select max(revenue) from movies);

select * from student; -- 101,102,103,104,105
select * from course;  -- 101,102,106,107

-- multirow subquery : inner query returns multiple values

-- read roll no from student which are not prsent in course table
select roll_no from student where roll_no not in (101,102,106,107);
select roll_no from student where roll_no not in (select roll_no from course);

select roll_no from student where roll_no in (select roll_no from course);

select * from emp_data;
select * from dept;

-- select emp id from emp which are present in dept
select empid from emp_data where empid in (select empid from dept);

-- fetch a moview name ,genre,star rating where star rating 
-- = max star rating of either of the genre

select * from movies;

select `movie name`,genre,star_rating from movies where star_rating IN(
select max(star_rating) from movies group by genre);

-- count of rows in the output of union query
select * from tbl1;
select count(*) from tbl1;

select * from (
select * from tbl1
union 
select * from tbl2) as sq
where sq.col1='a';

select count(*) from
(
select * from tbl1
union
select * from tbl2)sq;

select count(*) from 
(
select student.roll_no,stud_name,course_name
from student
right join 
course
on student.roll_no=course.roll_no
union 
select student.roll_no,stud_name,course_name
from student
left join 
course
on student.roll_no=course.roll_no)
sq;

-- Fetch total amount of sales for each artist
-- with their name who have sold at least one painting in gallery

select * from sales;

select * from artists 
inner join
(select artist_id,sum(sales_price) from sales group by artist_id) total_Sales
on artists.id=total_Sales.artist_id;

select id,fname,sale
from artists 
inner join
(select artist_id,sum(sales_price) as sale from sales group by artist_id) total_Sales
on artists.id=total_Sales.artist_id;



























