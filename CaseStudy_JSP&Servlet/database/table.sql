create database furama_JSP;
use furama_JSP;
create table customer_type(
customer_type_id int primary key not null,
customer_type_name varchar(45) not null);


create table customer(
customer_id int primary key auto_increment,
-- customer_code varchar(10) unique,
customer_type_id int not null,
foreign key (customer_type_id) references customer_type(customer_type_id) on delete cascade on update cascade,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45));

create table service_type(
service_type_id int primary key,
service_type_name varchar(45)
);


create table rent_type(
rent_type_id int primary key,
rent_type_name varchar(45),
rent_type_cost double
);

create table service(
service_id int auto_increment primary key,
-- service_code varchar(10) unique,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,foreign key (rent_type_id) references rent_type(rent_type_id) on delete cascade on update cascade,
service_type_id int,foreign key (service_type_id) references service_type(service_type_id) on delete cascade on update cascade,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floor int
);


create table `position`(
position_id int primary key,
position_name varchar(45)
);

create table education_degree(
education_degree_id int primary key,
education_degree_name varchar(45)
);


create table division(
division_id int primary key,
division_name varchar(45)
);

-- create table `role`(
-- role_id int auto_increment primary key,
-- role_name varchar(225)
-- );
-- create table `user`(
-- username varchar(225) primary key,
-- password varchar(225)
-- );
-- create table user_role(
-- role_id int ,foreign key (role_id) references `role`(role_id) on delete cascade on update cascade,
-- username varchar(225) ,foreign key (username) references `user`(username) on delete cascade on update cascade
-- );

create table employee(
employee_id int auto_increment primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double(15,0),
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,foreign key(position_id) references `position`(position_id) on delete cascade on update cascade,
education_degree_id int,foreign key(education_degree_id) references education_degree(education_degree_id) on delete cascade on update cascade,
division_id int,foreign key (division_id) references division (division_id) on delete cascade on update cascade,
username varchar(225)
);


create table attach_service(
attach_service_id int  primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);


create table contract(
contract_id int auto_increment primary key,
contract_start_date date,
contract_end_date date,
contract_deposit double,
contract_total_money double,
employee_id int,foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade,
customer_id int,foreign key (customer_id) references customer(customer_id) on delete cascade on update cascade,
service_id int,foreign key (service_id) references service(service_id) on delete cascade on update cascade
);


create table contract_detail(
contract_detail_id int auto_increment primary key,
contract_id int,foreign key(contract_id) references contract(contract_id) on delete cascade on update cascade,
attach_service_id int,foreign key (attach_service_id) references attach_service(attach_service_id) on delete cascade on update cascade,
quantity int
);
