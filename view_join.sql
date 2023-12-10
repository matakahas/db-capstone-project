
-- Task 1
CREATE VIEW OrdersView AS SELECT order_id, quantity, total_cost FROM `little-lemon-db`.Orders;

SELECT * FROM OrdersView;

-- Task 2
USE `little-lemon-db`;

SELECT
    C.customer_id,
    C.customer_name,
    O.order_id,
    O.total_cost,
    M.menu_name,
    MI.course_name,
    MI.starter_name
FROM
    Customers AS C
JOIN
    Orders AS O ON C.customer_id = O.customer_id
JOIN
    Menu AS M ON O.menu_id = M.menu_id
JOIN
    MenuItems AS MI ON M.menu_id = MI.menu_id;
    
-- Task 3
SELECT menu_name FROM `little-lemon-db`.Menu
WHERE menu_id = ANY (SELECT menu_id FROM Orders WHERE quantity > 2)


