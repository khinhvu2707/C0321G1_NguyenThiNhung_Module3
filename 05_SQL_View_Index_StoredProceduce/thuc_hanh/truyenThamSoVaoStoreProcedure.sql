DELIMITER //

CREATE PROCEDURE get_cus_by_id

(IN cus_num INT(11))

BEGIN

  SELECT * FROM customers WHERE customer_number = cus_num;

END //

DELIMITER ;
call get_cus_by_id(175);

DELIMITER //

CREATE PROCEDURE get_customers_count_by_city(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customer_number)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
CALL get_customers_count_by_city('Lyon',@total);
SELECT @total;



DELIMITER //

CREATE PROCEDURE set_counter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
SET @counter = 1;

CALL set_counter(@counter,1); -- 2

CALL set_counter(@counter,1); -- 3

CALL set_counter(@counter,5); -- 8

SELECT @counter; -- 8