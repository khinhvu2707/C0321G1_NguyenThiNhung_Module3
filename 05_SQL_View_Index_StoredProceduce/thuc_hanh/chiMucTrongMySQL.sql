USE classicmodels;
SELECT * FROM customers;
SELECT * FROM customers WHERE customer_name = 'Land of Toys Inc.'; 
EXPLAIN SELECT * FROM customers WHERE customer_name = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_customer_name(customer_name);
EXPLAIN SELECT * FROM customers WHERE customer_name = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_full_name(contact_first_name, contact_last_name);
EXPLAIN SELECT * FROM customers WHERE contact_first_name = 'Jean' or contact_first_name = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;