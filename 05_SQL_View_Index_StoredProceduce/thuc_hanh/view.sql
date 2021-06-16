-- Tạo view --
CREATE VIEW customer_views AS

SELECT customer_number, customer_name, phone

FROM  customers;
-- Lấy gt --
select * from customer_views;
-- Cập nhật view --
CREATE OR REPLACE VIEW customer_views AS

SELECT customer_number, customer_name, contact_first_name, contact_last_name, phone

FROM customers

WHERE city = 'Nantes';
-- Xóa view -- 
DROP VIEW customer_views;