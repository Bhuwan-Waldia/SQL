use engg_data;

select * from customer;
select * from salesman;

-- Cust info along with the salesman information where grade >100 and commission >14

select customerid,custname,grade,fname,c.city
from customer c
inner join 
salesman s
on c.salesmanid=s.salesmanid
where grade>100
and commision>14;

-- clone a table/create a table from existing table
create table emp_bkp as select * from emp;

create table join_df as
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

select * from join_df;

-- window functions/analytical functions:
select min(salary) from emp;
select salary,salary*0.25 as per_sal from emp;

-- over : helping clause
-- partition by : used to define a partition of rows
-- order by     : used to sort the data within partition

select *,
min(salary) over () as min_sal,
max(salary) over () as max_sal 
from emp;

select *,
min(salary) over (partition by dept_name) as min_sal,
max(salary) over (partition by dept_name) as max_sal 
from emp;

-- row_number():
-- assign a sequence value to each row of the partition
select *,
row_number() over () as rn
from emp;

select *,
row_number() over (partition by dept_name) as rn
from emp;

-- fetch the first 2 emp from each dept to join the company

select * from emp;

select * from(
select *,
row_number() over (partition by dept_name order by emp_id) as rn
from emp ) sq
where rn<3;

-- rank() and dense_rank():
-- rank() : it assignes ranks to each row of the partition with gaps
-- dense_rank():it assignes ranks to each row of the partition without gaps

select *,
rank() over (order by salary) as rnk,
dense_rank() over (order by salary) as dense_rnk
from emp;

select *,
rank() over (partition by dept_name order by salary) as rnk,
dense_rank() over (partition by dept_name order by salary) as dense_rnk
from emp;


select * from stud_data.student_mark;
-- a sub with min mark for each student
select * from(
select *,
rank() over (partition by rollno order by marks) as rnk
from stud_data.student_mark) sq
where rnk=1;

-- fetch the top 3 emp from each dept earning the max salary
select * from (
select *,
rank() over (partition by dept_name order by salary desc) as rnk,
dense_rank() over ( partition by dept_name order by salary desc) as dense_rnk
from emp) sq
where dense_rnk<4;

-- lead and lag :
select * from emp;
-- lead(column_name,offset,default value): fetch the next nth row from currunt row
-- lag(column_name,offset,default value) : fetch the previous nth row from current row

select *,
lead(salary) over() as next_sal,
lag(salary) over () as priv_sal,
salary-lead(salary) over () as diff
from emp; 

select *,
lead(salary) over(partition by dept_name) as next_sal,
lag(salary) over (partition by dept_name) as priv_sal
from emp; 

select *,
lead(salary,2) over(partition by dept_name) as next_sal,
lag(salary,2) over (partition by dept_name) as priv_sal
from emp; 

select *,
lead(salary,2,0) over(partition by dept_name) as next_sal,
lag(salary,2,0) over (partition by dept_name) as priv_sal
from emp; 

use stud_data;
select * from cars;

-- distance travlled by each car per day
select *,
lag(distance_travlled,1,0) over (partition by cars) ,
distance_travlled-lag(distance_travlled,1,0) over (partition by cars) as dis_per_day
from cars;

select * from join_op;
drop table join_op;




