DROP DATABASE IF EXISTS assign2;
CREATE DATABASE Assign2;
USE Assign2;
CREATE TABLE Paye(
checkNumber VARCHAR(50) primary key,
paymentDate DATE,
amount DECIMAL(10,2)
);
CREATE TABLE ORD(
orderNumber INT PRIMARY KEY,
orderDate Date,
requiredDate Date,
state VARCHAR (20)
);
insert Into Paye (checkNumber,paymentDate, amount)
values('A1', '2005-04-18', 2200.00),('A2','2005-04-19',33000.05);
insert Into ORD (orderNumber,orderDate, requiredDate,state)
values('1','2024-01-18','2024-05-19','Pending'),('2','2024-01-10','2024-06-20','Done');
