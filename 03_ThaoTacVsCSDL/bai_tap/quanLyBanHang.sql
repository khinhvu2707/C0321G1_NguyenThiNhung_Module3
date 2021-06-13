use bai2_bt_quanlybanhang;
-- Thêm dữ liệu --
insert into customer(customer_id,customer_name,customer_age)
values (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
insert into orderr(order_id,customer_id,order_date)
values (1,1,"2006-03-21"),
(2,2,"2006-03-23"),
(3,1,"2006-03-16");
insert into product(product_id,product_name,product_price)
values (1,"May giat",3),
(2,"Tu lanh",5),
(3,"Dieu hoa",7),
(4,"Quat",1),
(5,"Bep dien",2);
insert into orderdetail(order_id,product_id,order_dQTY)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Truy vấn --
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order --
select order_id,order_date,order_totalprice
from orderr;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
select customer.customer_id,customer.customer_name,product.product_name
from(((customer
inner join orderr on customer.customer_id = orderr.customer_id)
inner join orderdetail on orderr.order_id = orderdetail.order_id)
inner join product on orderdetail.product_id = product.product_id);
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --
select customer.customer_name
from customer
where customer.customer_id not in (select orderr.customer_id from orderr);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) --
select orderr.order_id,orderr.order_date,sum(orderdetail.order_dQTY*product.product_price) as total
from ((orderr
inner join orderdetail on orderr.order_id = orderdetail.order_id)
inner join product on orderdetail.product_id = product.product_id)
group by orderdetail.order_id;