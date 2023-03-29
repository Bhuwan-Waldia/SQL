-- data : contact,photos,user id ,password
-- database or files 

-- amount of data
-- relational database     -- table/relation format,structured data
-- non relational database -- mongoDB , json

/*
emp : table
empid,empname,salary,loc  -- columns/fields/attributes/features
1001  Rahul   80000  pune -- row/record

project:
proj_id,proj_name,no_of_emp,emp_id
10       axis      20       1001
11.      mgmt.     10.      1001
*/
-- empid,empname,proj_id,proj_name

-- oracle,mysql,db2,teradata,sql server,postgresql,mariaDB
-- mysql: RDBMS (relational database management system)

-- DBMS:
-- to store and manage the data
-- to read data for analytics

-- data gathering
-- flask

-- database server
-- user interface -- workbench
-- connection

-- SQL: structured query language
-- domain specific language
-- non procedural programming language: what to do
-- non-case sensitive
-- each sql statement is called as QUERY
-- syntax , each query should be ended with a semicolan
-- sequal : simple english query language

-- comments:
-- single line comments
/*
multiline
comment
*/

-- databases : database : tables/views  : rows and columns

-- SQL commands:
-- DDL(data definition language)    : CREATE,ALTER,TRUNCATE,DROP -- structure (auto committed)
-- DML(data manipulation language)  : INSERT,UPDATE,DELETE -- Data 
-- DCL(data control language)       : GRANT, REVOKE (DBA)
-- TCL(transaction control language): COMMIT(save),ROLLBACK(undo),SAVEPOINT
-- DQL(data query language)         : SELECT


/*
-- transaction:
customer:
cust_id,cust_name,ac_no ,ac_balance
101      rahul     1234  9000  -- update

transaction:
tran_id,tran_type,amount,cust_id
10      credit    90000   101.   -- insert
11      debit     5000    101
*/

/*
insert
insert
commit;
insert
insert
update
insert
savepoint A
insert
rollback;
rollback to savepoint A;
*/

-- 1000 : 901 failed : savepoint at each 200 records

-- databases : database : tables/views  : rows and columns

-- create database
-- create database db_name;
-- db_test

create database db_test;
show databases;

use db_test;

-- create table
/*
emp : table
empid,empname,salary,loc 
*/
-- create table table_name(columns datatypes,columns datatypes,...); -- table definition/table ddl 

create table emp (empid int,empname varchar(10),salary int,loc varchar(15));

-- varchar(size) : alphanumeric values,variable length datatype
-- char(size)    : alphanumeric values,fixed length datatype

show tables;

-- describe a table
desc emp;
show create table emp;

-- ALTER : used to change the table structure
/*
emp : table
empid,empname,salary,loc   contact
1001  rahul   9000   pune  8983720070
*/

-- add column
-- modify datatype
-- rename column
-- rename table
-- drop column
-- add constraints 

-- 1. add column
-- alter table table_name add column column_definition;
alter table emp add column contact int;

-- row id as first column
alter table emp add column row_id int FIRST;

-- GENDER after empname
alter table emp add column gender char(1) AFTER empname;

desc emp;

-- modify column
-- alter table table_name modify column updated_column_definition;
alter table emp modify column contact varchar(10);
alter table emp modify column empname varchar(15);

-- rename column/rename table
-- alter table table_name rename column existing_col_name to new_col_name;
alter table emp rename column contact to mob_no;
alter table emp rename to emp_info;
alter table emp_info rename to emp;

desc emp_info;

-- drop column
-- alter table table_name drop column column_name;
alter table emp drop column mob_no;
alter table emp drop column row_id,drop column gender;

desc emp;
-- alter table table_name add column col_defi,add column col_defi;
-- alter table table_name modify column col_defi,modify column col_defi;
-- alter table table_name rename col exi to new,rename column exi to new;
-- alter table table_name drop column col_name,drop column col_name;

-- alter table table_name add column col_defi,modify column new_col_defi;

-- truncate : empty the table
-- truncate table table_name;
truncate table emp;
select * from stud_data.join_op;
truncate table stud_data.join_op;

select * from stud_data.join_op;
desc stud_data.join_op;

-- DROP  : delete data as well as structure 
-- drop table table_name;
drop table emp;
drop database db_test;

















