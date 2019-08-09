#Table Creation in Hbase Shell

create 'emp', 'personal data', 'professional data'

create 'country', 'CM govern','Central Govern'
--------------------

#Disable a Table before you Delete it

disable 'table name'
disable 'emp'

#To Delete a Table then,

drop 'emp'
---------------------
#Enable a Table 

enable 'table name'
enable emp;
--------------------
#Alter a Table (Column / Column Family)

ALTER TABLE_NAME , COLUMN_NAME -> ' ', CHANGE_COLUMNS 

ALTER TABLE_NAME, 'COLUMN_NAME ->'OLD_COLUMN', ''NEW_COLUMN'

Alter 'emp',NAME -> 'emp_id', VERSIONS -> 5
(Here Max Number of cells is set to 5 and for the next example is set to 10)
Alter 'emp', NAME -> 'location', VERSIONS -> 10
---------------------
#Alter query to Delete Column Family

ALTER 'emp' , 'DELETE' -> 'emp_id'

--------------------
#Inserting a Data into Tables via put command

put 'table_name', 'row', 'columnfamily:column_name', 'value'

put 'emp', '1', 'personal data:name', 'manthan'

put 'emp','1','personal data:city', 'Toronto'

put 'emp','1','professional data:designation', 'Manager'

put 'emp','1', 'professional data:salary', '40000'

------------------

#Updating a Data in Hbase

put 'emp','1', 'personal data:name', 'mj'

put 'emp','1', 'personal data:city', 'Mississauga'

------------------
# To Read a Data through Get command

get 'table-name', 'row-number'

get 'emp', 'row1'

To get a specific column

get 'emp','row1', Column (personal data:name)
------------------

Delete a cell in Hbase

delete 'table_name','row','column name','time stamp'

delete 'emp','1','personal data:city',141741848375

delete 'emp','2','professional data:salary',141741848375

------------------
Delete all cells from a Table

deleteall 'table name','row'

deleteall 'emp','1'
-----------------

To truncate a table 

truncate 'table_name'

truncate 'emp'

to view tables :-  scan emp
to count tables:- count emp
-----------------
#Grant Privileges 

grant user <permissions>,[table_name] [column_family]

grant 'manthan_jha',' RWXCA'
-------------------

#Revoke Permissions

revoke 'user name'

revoke 'manthan_jha'
------------------
To List out what permissions are given to a table do the following:
	
user_permission 'table_name'

user_permission 'emp'