-- Task 1
USE `little-lemon-db`;

DELIMITER //

CREATE PROCEDURE AddBooking(IN input_bk_id INT, IN input_cu_id INT, IN input_date DATE, input_table INT)
BEGIN
	DECLARE booking_message VARCHAR(255);
	INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES (input_bk_id, input_cu_id, input_date, input_table);
    SET booking_message = 'New booking added';
    SELECT booking_message AS confirmation;
END // 

DELIMITER ;

CALL AddBooking(6, 3, "2022-12-30", 4);

-- Task 2
USE `little-lemon-db`;

DELIMITER //

CREATE PROCEDURE UpdateBooking(IN input_bk_id INT, IN input_date DATE)
BEGIN
	DECLARE booking_message VARCHAR(255);
	UPDATE `little-lemon-db`.`Bookings` SET date = input_date WHERE booking_id = input_bk_id;
    SET booking_message = CONCAT('Booking ', input_bk_id, ' updated');
    SELECT booking_message AS confirmation;
END // 

DELIMITER ;

CALL UpdateBooking(6, "2022-12-31");

-- Task 3
USE `little-lemon-db`;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN input_bk_id INT)
BEGIN
	DECLARE booking_message VARCHAR(255);
	DELETE FROM `little-lemon-db`.`Bookings` WHERE booking_id = input_bk_id;
    SET booking_message = CONCAT('Booking ', input_bk_id, ' cancelled');
    SELECT booking_message AS confirmation;
END // 

DELIMITER ;

CALL CancelBooking(6)



