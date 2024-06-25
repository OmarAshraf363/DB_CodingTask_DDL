create schema tsk;
go
--1.	Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table tsk.Employee(
ID int primary key ,
Name varchar(20),
Salary decimal,
);
--2.	Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table tsk.Employee
add Department varchar(50)
--3.	Remove the "Salary" column from the "Employees" table.
alter table tsk.Employee
 DROP COLUMN Salary;

 --	Rename the "Department" column in the "Employees" table to "DeptName".
exec sp_rename 'tsk.Employee.Department','DeptName'

--5.	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table tsk.Projects(
ProjectID int primary key ,
ProjectName varchar
);
--6.	Add a primary key constraint to the "Employees" table for the "ID" column.
alter table tsk.Employee
add constraint PK_Employee  primary key (ID)
--7.	Add a unique constraint to the "Name" column in the "Employees" table.
alter table tsk.Employee
add constraint un_name Unique(Name)
--8.	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table tsk.Customers(
CustomerID int primary key,
FirstName varchar(15),
LastName varchar(15),
Email varchar(30),
Status varchar(10),
);
--9.	Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
alter table tsk.Customers
add constraint un_Allname Unique(FirstName,LastName)
--10.	Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
create table tsk.Orders(
OrderID int primary key,
CustomerID int,
OrderDate datetime,
TotalAmount decimal,
FOREIGN KEY (CustomerID)
REFERENCES tsk.Customers (CustomerID)
);
--11.	Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table tsk.Orders
add constraint ch_const check(TotalAmount>0)
--12.	Create a schema named "Sales" and move the "Orders" table into this schema.
create schema Sales;
go
--
alter schema Sales
transfer tsk.Orders
go
--13.	Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Order', 'SalesOrders'
