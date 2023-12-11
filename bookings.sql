-- Task 1
INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES ('1', '1', '2022-10-10', '5');
INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES ('2', '3', '2022-11-12', '3');
INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES ('3', '2', '2022-10-11', '2');
INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES ('4', '1', '2022-10-13', '2');

-- Task 2
USE `little-lemon-db`;

DELIMITER //

CREATE PROCEDURE CheckBooking(IN input_date DATE, IN input_table INT)
BEGIN
	DECLARE booking_message VARCHAR(255);
	IF EXISTS (SELECT * FROM Bookings WHERE date = input_date AND table_number = input_table) THEN
    SET booking_message = CONCAT('Table ', input_table, ' is already booked');
    SELECT booking_message AS booking_status;
    END IF;
END // 

DELIMITER ;

CALL CheckBooking("2022-11-12", 3);

-- Task 3
USE `little-lemon-db`;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN input_date DATE, IN input_table INT)
BEGIN
	DECLARE booking_message VARCHAR(255);
	START TRANSACTION;
		INSERT INTO `little-lemon-db`.`Bookings` (`booking_id`, `customer_id`, `date`, `table_number`) VALUES ('5', '1', input_date, input_table);
		IF EXISTS (SELECT * FROM Bookings WHERE booking_id <> 5 AND date = input_date AND table_number = input_table) THEN
			ROLLBACK;
			SET booking_message = CONCAT('Table ', input_table, ' is already booked - booking cancelled');
			SELECT booking_message AS booking_status;
		ELSE
			COMMIT;
			SET booking_message = CONCAT('Table ', input_table, ' has been successfully booked');
			SELECT booking_message AS booking_status;
		END IF;
END // 

DELIMITER ;

CALL AddValidBooking("2022-11-12", 6);
