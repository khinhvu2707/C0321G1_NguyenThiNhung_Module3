create database bai12_quanlysanpham;

select * from product ;
create table product(
id int auto_increment primary key,
ten_san_pham varchar(120),
gia_san_pham int,
mo_ta_san_pham varchar(120),
hang_san_xuat varchar(50)
);
create table time(
id_time int auto_increment primary key,
id int not null,
nsx date,
hsd date,
foreign key (id) references product(id)
);