-- Task 1
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(quantity) AS `Max Quantity in Order` FROM `little-lemon-db`.Orders;

-- Task 2

USE `little-lemon-db`;

PREPARE GetOrderDetail FROM 'SELECT order_id, quantity, total_cost FROM Orders WHERE customer_id = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3

DELIMITER //  

CREATE PROCEDURE CancelOrder(IN input_id INT)
BEGIN
	DECLARE confirmation_message VARCHAR(255);
	DELETE FROM `little-lemon-db`.Orders WHERE order_id = input_id;
	SET confirmation_message = CONCAT('Order ', input_id, ' is cancelled');
    SELECT confirmation_message AS confirmation;
END // 

DELIMITER ;

CALL CancelOrder(3);

