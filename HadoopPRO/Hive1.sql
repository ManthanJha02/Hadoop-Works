# How to create database in HIVE 

create Database IF NOT EXIST hivetest;

show databases;
------------------------
#Drop database 

DROP database IF EXISTS hivetest;

-----------------------
#Create Table command

create table IF NOT EXISTS employee (
eid int, name String, salary float, destination String
)
COMMENT 'Employee details'
ROW FORMAT delimited
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\ n'
STORED AS TEXTFILE;
------------------------

#LOAD the data into table

LOAD DATA LOCAL inpath '/home/user/loadexp.txt'
OVERWRITE into TABLE employee;
------------------

#ALTER table commands;

->		ALTER table employee RENAME to emp;

->		ALTER table employee CHANGE name ename String;

->		ALTER table employee CHANGE salary salary Double;

-> 	ALTER table employee add columns (dept STRING COMMENT 'department name');

->		ALTER table employee REPLACE COLUMNS(
		eid INT empid Int,
		ename STRING name String);
-----------------------

#DROP table

DROP table IF EXISTS employee;

SHOW TABLES;
--------------------------

#Hive-Partitioning 

ALTER TABLE employee
ADD PARTITION (year = '2012')
location '/2012/part2012';

#Renaming a Partition
ALTER TABLE  employee
PARTITION (YEAR = '2013')
RENAME TO PARTITION (Yoj = '2013');
---------------------

ALTER TABLE employee DROP 
PARTITION (year = '2013');

----------------------

#HiveView
CREATE VIEW EMP_30000 
AS
SELECT * FROM EMPLOYEE 
WHERE SALARY >= 30,000;

#TO DROP A VIEW 
DROP VIEW EMP_30000;
-----------------------

#HIVEIndex

CREATE INDEX index_salary 
ON employee(salary)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexhandler';
--------------------------

#Dropping an Index
DROP INDEX  index_salary
ON employee;
-----------------------

#OrderBY clause in Hive
SELECT * FROM employee
ORDER BY department_name;
---------------------

#GroupBy clause in Hive
SELECT dept, count(*) FROM employee
GROUP BY department;
------------------
#EXERCISES 

ALTER TABLE htab REPLACE COLUMNS(
x_col int new_col INT);

ALTER TABLE  htab
CHANGE COLUMN new_cpl int
BEFORE x_col;




