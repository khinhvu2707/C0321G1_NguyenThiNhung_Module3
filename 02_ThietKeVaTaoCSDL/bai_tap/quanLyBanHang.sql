create database bai2_bt_quanlybanhang;
use bai2_bt_quanlybanhang;
create table Customer(
cID int primary key,
cName varchar(50),
cAge int
);
create table Orderr(
oID int not null auto_increment primary key,
cID int not null,
oDate datetime,
oTotalPrice double not null,
foreign key (cID) references Customer(cID) 
);
create table Product(
pID int not null auto_increment primary key,
pName varchar(50),
pPrice int not null
);
create table OrderDetail(
oID int not null,
pID int not null,
odQTY varchar(50),
primary key (oID,pID),
foreign key (oID) references Orderr(oID),
foreign key (pID) references Product(pID)
);
