-- DML : insert,update,delete
-- student : rollno,stud_name,gender,cgpa,branch

create database colg_data;
use colg_data;

create table student (rollno int,stud_name varchar(10),gender char(1),cgpa float,branch varchar(15));
desc student;

-- CRUD      : create data,read  ,update,delete
-- DML + DQL : insert     ,select,update,delete

-- insert :
-- insert into table_name (columns) values(set of values);
insert into student(rollno,stud_name,gender,cgpa,branch) values (101,'rahul','M',6.5,'entc');
insert into student values (102,'rohit','M',7.5,null);
insert into student (rollno,stud_name,gender,branch) values (103,'snehal','F','entc');

insert into student values(104,'dhiraj','M',8,'comp'),
						  (105,'neha','F',7.8,'comp');
                          
-- select :
-- select : the columns in output
-- *      : represents all columns
-- from  : specify a data source, it can either be a table,view or a subquery

-- select * from table_name;
select * from student; -- all columns and all rows
select rollno,stud_name from student; -- specific columns ,all rows

-- specific rows of table
-- where : it helps you access the particular rows of table
-- always applied on a row level data

select * from student where rollno=102;
select * from student where branch='comp';

-- rollno=101,103,105

/*
= : equal to
!=: not equal to
> : greater than
< : less than
>=: greater than equal to
<=: less than equal to
IN: used to specify multiple possible values
between : used to specify a range
is null : used to check for null values in a column
*/

-- specific rows , all columns

select * from student where rollno!=103;
select * from student where cgpa>7;
select * from student where cgpa<7;
select * from student where cgpa>=7;
select * from student where cgpa<=7;

select * from student where rollno IN (101,103,105);
select * from student where rollno IN (101,103,108);
select * from student where rollno=108;

select * from student where rollno NOT IN (101,103,108);

select * from student where rollno between 102 and 105; -- includes start and end value both
select * from student where rollno between 102 and 109;

select * from student;
select * from student where rollno not between 102 and 105;

select * from student where cgpa is null;
select * from student where cgpa is not null;

select * from student where branch is null;
select * from student where branch is not null;

-- combine multiple conditions:
-- AND and OR :
-- AND : all the conditions specified must be satisfied by a row
-- OR  : either of the condition should be satisfied by a row

select * from student where rollno=101 and rollno=104;
select * from student where rollno=101 or rollno=104;

select * from student;
select * from student where rollno=102 and stud_name='rohit';
select * from student where branch='comp' and gender='M';
select * from student where branch='comp' and gender='g';
select * from student where branch='comp' or cgpa>7;

select rollno,cgpa,branch from student where branch='comp' and gender='m';

/*
select * from table_name; -- all columns ,all rows
select columns from table_name; -- specific columns,all rows
select * from table_name where condition; -- all columns, specific rows
select columns from table_name where condition; -- specific columns, specific rows
*/

-- data gathering :
-- phase1 : read all 40 tables
-- phase 2: imp data in 5 tables
-- phase 3:
/*
table1 : 10 columns : 5 columns
table2 : 8 columns  : 8 columns
table3 : 5 columns  : 3 columns
table4 : 7 columns  : 7 columns
table5 : 5 columns  : 2 columns
-- 35 total columns : 25 columns

-- phase 4: create dataframe with above output
-- feature analysis
-- EDA
*/

-- update : 
select * from student;
update student set branch='civil';

-- internship
alter table student add column internship int;
update student set internship=2;

-- 102 and 103 branch=comp
update student set branch='comp' where rollno IN(102,103);

-- update cgpa=7 and branch=entc where cgpa is null
update student set branch='entc',cgpa=7 where cgpa is null;

/*
rollno 101 internship 2
rollno 102 intersnhip 3
rollno 104 internship 1
*/

-- case statement
update student set internship=
case 
rollno
when 101 then 2
when 102 then 3
when 104 then 1
end;

select * from student;

update student set internship=
case 
rollno
when 101 then 2
when 102 then 3
when 104 then 1
else 0
end;


/*
rollno 103 internship 5
rollno 105 intersnhip 3
*/

update student set internship=
case 
rollno
when 103 then 5
when 105 then 3
else internship
end;

-- delete :
-- select * from table_name;
-- delete from table_name;

delete from student; -- delete all rows
truncate table student; -- empty the table

delete from student where rollno=105;
select * from student;

update student set internship=null where rollno=104;
desc student;
show create table student;

drop table student;
drop database colg_data;

/*
update student set internship=
case 
when rollno= 101 and branch='comp'  then 2
end;
*/

/*
update student set internship=
case 
when rollno= 101 and 
(case when branch='comp'  then 2
end)
end;










