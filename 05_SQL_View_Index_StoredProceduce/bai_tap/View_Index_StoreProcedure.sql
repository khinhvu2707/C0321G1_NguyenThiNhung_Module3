create database bai5_bt_demo;
use bai5_bt_demo;
create table Product(
id int auto_increment primary key,
product_code varchar(50) unique,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);
insert into Product(product_code,product_name,product_price,product_amount,product_description,product_status)
values ("SP1","Hoa Sen",10,5,"Hoa Sen Huế","đang bán"),
("SP2","Hoa Ly",10,7,"Hoa Ly Huế","đang bán"),
("SP3","Hoa Hồng",13,0,"Hoa Hồng Đà Lạt","hết hàng"),
("SP4","Hoa Tulip",9,1,"Hoa Tulip Hà Nội","đang bán");
-- index --
create unique index product_index on product(product_code);

alter table product add index product_index2 (product_name,product_price);

explain select *
from product
where product_name = "Hoa Tu Lip";

 -- 2. View -- 
     -- tạo view --
 create view product_view as
 select *
 from product;
 
 select * from product_view;
     -- sửa view -- 
CREATE OR REPLACE VIEW product_view  AS
select id,product_code, product_name, product_price, product_status
from product
where product_name = "Hoa Hồng";
 
 select * from product_view;
    -- sửa view 2 -- 
    update product_view
    set product_name = "Hoa Lan"
    where product_name = "Hoa hồng";
   -- xóa view --
drop view product_view;

-- 3. store procedure --
  -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product --
  delimiter //
  create procedure test_procedure()
  begin
  select *
  from product;
  end //
  delimiter ;
  call test_procedure();

  -- Tạo store procedure thêm một sản phẩm mới --
  delimiter //
  drop procedure if exists `test_procedure` //
  create procedure test_procedure()
  begin
  insert into Product(product_code,product_name,product_price,product_amount,product_description,product_status)
  values ("SP5","Hoa Hướng Dương",12,9,"Hoa Hướng Dương Đà Lạt ","đang bán");
  end //
  delimiter ;
  
  -- Tạo store procedure sửa thông tin sản phẩm theo id --
   delimiter //
  drop procedure if exists `test_procedure` //
  create procedure test_procedure(in new_name varchar(30),in edit_id int)
  begin
  update product
 set product_name = new_name
 where id = edit_id;
  end //
  delimiter ;
  call test_procedure("Hoa Mai",2);
  
  -- Tạo store procedure xoá sản phẩm theo id --
    delimiter //
  drop procedure if exists `test_procedure` //
  create procedure test_procedure(in delete_id int)
  begin
  delete  from product
 where id = delete_id;
  end //
  delimiter ;
  call test_procedure(2);
  