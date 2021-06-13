create database bai2_bt_quanlybanhang;
use bai2_bt_quanlybanhang;
create table Customer(
customer_ID int primary key,
customer_Name varchar(50),
customer_Age int
);
create table Orderr(
order_ID int not null auto_increment primary key,
customer_ID int not null,
order_Date date,
order_TotalPrice double,
foreign key (customer_ID) references Customer(customer_ID) 
);
create table Product(
product_ID int not null auto_increment primary key,
product_Name varchar(50),
product_Price int not null
);
create table OrderDetail(
order_ID int not null,
product_ID int not null,
order_dQTY varchar(50),
primary key (order_ID,product_ID),
foreign key (order_ID) references Orderr(order_ID),
foreign key (product_ID) references Product(product_ID)
);
