insert into customer_type
values (1,"Diamond"),(2,"Platinium"),(3,"Gold"),(4,"Silver"),(5,"Member");

insert into customer (customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
values(1,"Dương Dương",'1990-11-28',0,787656543,0909857601,'a@gmail.com','Đà Nẵng'),
(3,"Hoàng Anh",'1991-11-28',0,787656543,0909857602,'b@gmail.com','Huế'),
(2,"Nguyệt Ly",'1992-11-28',1,787656543,0909857603,'c@gmail.com','Nghệ An'),
(4,"Sở Dương",'1990-11-28',0,787656543,0909857604,'d@gmail.com','Đà Nẵng'),
(5,"Trúc Anh",'1991-11-28',1,787656543,0909857605,'e@gmail.com','Đà Nẵng'),
(3,"Diệc Phàm",'1992-11-28',0,787656543,0909857606,'c@gmail.com','Hà Nội'),
(4,"Tiêu Viêm",'1992-11-28',0,787656543,0909857607,'c@gmail.com','Nghệ An');

insert into service_type
values (1,"Villa"),(2,"House"),(3,"Room");

insert into rent_type
values (1,"Year",100000000),(2,"Month",10000000),(3,"Day",500000),(4,"Hour",100000);

insert into service(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience,pool_area,number_of_floor)
values('Vip1',300,5000000,10,1,1,'5sao','Drink Free',30,5),
('Vip2',200,4000000,15,1,1,'5sao','Drink Free',30,9),
('Vip3',300,5000000,7,1,2,'5sao','Drink Free',35,7),
('Vip4',200,4000000,10,1,2,'5sao','Drink Free',30,4),
('Vip5',300,5000000,15,1,3,'5sao','Drink Free',50,9),
('Vip6',200,4000000,9,1,3,'5sao','Drink Free',20,7);

insert into `position`
values (1,"Lễ Tân"),(2,"Phục Vụ"),(3,"Chuyên Viên"),(4,"Giám Sát"),(5,"Quản Lý"),(6,"Giám Đốc");

insert into education_degree
values (1,"Trung Cấp"),(2,"Cao Đẳng"),(3,"Đại Học"),(4,"Sau Đại Học");

insert into division
values (1,"Sale – Marketing"),(2,"Hành Chính"),(3,"Phục Vụ"),(4,"Quản Lý");

insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username)
values ('Tình Tuyết',"1995-07-27",34346456,10000000,0909857611,'tinhtuyet@gmail','Đà Nẵng',6,4,4,'tinhtuyet'),
('Linh Lung','1998-11-30',3896456,8000000,0909857612,'linhlung@gmail','Huế',5,3,1,'linhlung'),
('Tiểu Thần Hi','1995-10-04',35346456,7000000,0909857613,'tieuthanhi@gmail','Đà Nẵng',3,2,3,'tieuthanhi'),
('Thiên Vũ','1997-01-30',35346456,8000000,0909857614,'thienvu@gmail','Hà Nội',5,3,2,'thienvu'),
('Bạch Quyết','1994-05-24',35346456,10000000,0909857615,'bachquyet@gmail','Quảng Bình',4,3,4,'bachquyet');

insert into attach_service
values (1,"massage",500000,1,"empty"),
(2,"karaoke",400000,1,"empty"),
(3,"food",200000,1,"empty"),
(4,"drinks",100000,1,"empty"),
(5,"car",500000,1,"empty");

insert into contract (contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id)
values ('2020-1-1','2020-1-10',1000000,10000000,2,2,3),
('2020-11-19','2020-12-10',2000000,150000000,3,3,4),
('2020-1-1','2020-1-10',1000000,10000000,5,5,2),
('2020-1-1','2020-1-10',1000000,10000000,3,4,2),
('2020-1-1','2020-1-10',1000000,10000000,2,6,1); 

insert into contract_detail (contract_id,attach_service_id,quantity)
values (13,1,1),
(12,2,1),
(14,4,1),
(12,5,1),
(15,3,1),
(13,2,1);