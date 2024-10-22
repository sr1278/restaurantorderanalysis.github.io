use restaurant_db;
SELECT * FROM menu_items; 
SELECT COUNT(*) FROM menu_items; 

SELECT * FROM menu_items 
WHERE category = 'Italian'
ORDER BY price DESC; 

SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category; 

SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category; 

SELECT * FROM order_details
ORDER BY order_date; 

SELECT MIN(order_date), MAX(order_date) FROM order_details; 

SELECT COUNT(DISTINCT order_id) FROM order_details; 
SELECT COUNT(*) FROM order_details; 

SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC; 

SELECT COUNT(*) FROM 
(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders; 

SELECT * 
FROM order_details od
LEFT JOIN menu_items mi 
ON od.item_id = mi.menu_item_id;  

SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od 
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC; 

SELECT order_id, SUM(price) AS total_spend
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC; 

SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category; 

SELECT category, order_id, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id, category; 
