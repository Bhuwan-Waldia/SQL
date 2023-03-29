use stud_data;
-- DDL : create,alter,truncate,drop
-- DML+ DQL: CRUD : create data,read dtaa,update, delete

-- insert 
-- insert into table_name (columns) values (set of values)

-- read
-- select * from table_name;
-- select columns from table_name where condition;

-- update data
-- update table set column=new value;
-- update table set column=new,column2=new value value where condition;

-- case statement used for conditional update

-- delete 
-- delete from table_name;
-- delete from table_name where condition;

-- constraints: limitations/rules
-- manage the data

-- check   : checks for a condiion before inserting data into a column
-- not null: restricts the entry of null values
-- unique  : restrict the duplicate values, allows null
-- primary key: not null + unique
-- foreign key: used to define a realtion between multiple tables
-- default : set a deafult value for a column
-- auto increment : used to increment a col value by 1

-- not null:
create table emp_nn (empid int,empname varchar(10) NOT NULL,salary int NOT NULL);
desc emp_nn;
insert into emp_nn values(1001,'snehal',null);

select * from student;
delete from student where roll_no is null;
alter table student modify column roll_no int NOT NULL;
desc student;

alter table student modify column roll_no int;

-- unique: 
create table emp_unq (empid int UNIQUE,empname varchar(10) ,salary int);
insert into emp_unq values(1001,'snehal',null);

select * from emp_unq;
insert into emp_unq values(null,'snehal',null);

alter table student modify column roll_no int UNIQUE;
desc student;

alter table student drop index roll_no;

-- primary key : not null + unique

create table emp_pk (empid int PRIMARY KEY,empname varchar(10) ,salary int);

insert into emp_pk values(1001,'snehal',null);
select * from emp_pk;
insert into emp_pk values(null,'snehal',null);
insert into emp_pk (empname,salary) values('snehal',null);

alter table student modify column roll_no int primary key;
desc student;
alter table student drop primary key;

-- foreign key :
/*
student                        course                              faculty
roll_no,stud_name,add          course_id ,course_name , rollno    id,name,salary
101     rahul    pune          10         data science, 101       id :pk
							   11.        sql.          101
roll_no : primary key          roll_no : foreign key
							   id      : foreign key
parent table                   child table
referenced table.              referencing table
*/

-- 101,102,103,104,105  >> 101,102      106(not allowed)
-- 102,103,104,105  >> 101,102


alter table student modify column roll_no int primary key;

create table course1 (courseid int,coursename varchar(20),rollno int,
foreign key(rollno) references student(roll_no)
on delete cascade
on update cascade);

select * from student;
insert into course1 values(10,'data sci',101);
select * from course1;

insert into course1 values(10,'data sci',106);

delete from student where roll_no=101;

delete from course1 where rollno=101;
delete from student where roll_no=101;

-- on delete cascade
insert into course1 values(10,'data sci',102);
delete from student where roll_no=102;

-- on update cascade
insert into course1 values(10,'data sci',103);
update student set roll_no=113 where roll_no=103;

-- check : 
create table emp_chk (empid int ,empage int check(empage>20));
insert into emp_chk values (1001,25);
select * from emp_chk;
insert into emp_chk values (1001,19);

select * from student;
alter table student modify column roll_no int check(roll_no>100);

show create table student;
-- alter table student drop constraint constraint_name;
alter table student drop constraint student_chk_1;

-- default : 
create table emp_dflt (empid int , loc varchar(10), proj varchar(15) default 'bench');
insert into emp_dflt values(1001,'rahul','axis');
select * from emp_dflt;
insert into emp_dflt (empid,loc) values(1001,'rahul');

alter table student modify column address varchar(15) default 'pune';
select * from student;
alter table student alter address drop default;

-- auto_increment :
create table emp_auc (empid int auto_increment primary key,ename varchar(10));
insert into emp_auc (ename) values ('rahul');
select * from emp_auc;
insert into emp_auc (ename) values ('rohit');

alter table emp_auc auto_increment=100;
insert into emp_auc (ename) values ('snehal');
insert into emp_auc (ename) values ('dhiraj');

/*
not null       : restrict null value
unique         : restrict duplicates,but allows null
primary key    : not null + unique
foreign key    : define relation between tables
check          : checks for a conditon before inserting data
default        : used to set a dafault value for a column
auto_increment : auto increment a column value by 1
*/

-- clauses : 
-- order by 
-- distinct 
-- group by 
-- joins 

-- limit

-- order by :
select * from emp;
select * from emp order by salary;
select * from emp order by dept_name,salary;

select * from emp order by salary desc;
select * from emp order by dept_name,salary desc;

-- sort salaries of IT emp 
select * from emp where dept_name='IT' order by salary;

https://acp8.medium.com/solving-the-mysql-server-is-running-with-the-secure-file-priv-option-so-it-cannot-execute-this-d319de864285


















 