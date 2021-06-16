create database bai2_bt_quanlybanhang;
use bai2_bt_quanlybanhang;
create table Customer(
customer_id int primary key,
customer_name varchar(50),
customer_age int
);
create table `Order`(
order_id int not null auto_increment primary key,
customer_id int not null,
order_date date,
order_totalprice double,
foreign key (customer_id) references Customer(customer_id) 
);
create table Product(
product_id int not null auto_increment primary key,
product_name varchar(50),
product_price int not null
);
create table OrderDetail(
order_id int not null,
product_id int not null,
order_dqty varchar(50),
primary key (order_id,product_id),
foreign key (order_id) references `Order`(order_id),
foreign key (product_id) references Product(product_id)
);
