use bai2_bt_quanlybanhang;
-- Thêm dữ liệu --
insert into customer(cid,cname,cage)
values (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
insert into orderr(oid,cid,odate)
values (1,1,"2006-03-21"),
(2,2,"2006-03-23"),
(3,1,"2006-03-16");
insert into product(pid,pname,pprice)
values (1,"May giat",3),
(2,"Tu lanh",5),
(3,"Dieu hoa",7),
(4,"Quat",1),
(5,"Bep dien",2);
insert into orderdetail(oid,pid,odQTY)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Truy vấn --
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order --
select oid,odate,ototalprice
from orderr;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
select customer.cid,customer.cname,product.pname
from(((customer
inner join orderr on customer.cid = orderr.cid)
inner join orderdetail on orderr.oid = orderdetail.oid)
inner join product on orderdetail.pid = product.pid);
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --
select customer.cname
from customer
where customer.cid not in (select orderr.cid from orderr);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) --
select orderr.oid,orderr.odate,sum(orderdetail.odQTY*product.pprice) as total
from ((orderr
inner join orderdetail on orderr.oid = orderdetail.oid)
inner join product on orderdetail.pid = product.pid)
group by orderdetail.oid;