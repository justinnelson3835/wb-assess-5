/* Problem 1 */
SELECT email
FROM customers
ORDER BY email ASC;

/* Problem 2 */
SELECT id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE fname = 'Elizabeth' AND lname = 'Crocker');

/* Problem 3 */
SELECT SUM(num_cupcakes) AS total_cupcakes_unprocessed
FROM orders
WHERE processed = 'f';

/* Problem 4 */
SELECT cupcakes.name AS cupcake_name, SUM(orders.num_cupcakes) AS total_ordered
FROM cupcakes
LEFT JOIN orders ON cupcakes.id = orders.cupcake_id
GROUP BY cupcakes.name
ORDER BY cupcake_name ASC;

/* Problem 5 */
SELECT customers.email AS customer_email, SUM(orders.num_cupcakes) AS total_ordered_cupcakes
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customer_email
ORDER BY total_ordered_cupcakes DESC;

/* Problem 6 */
SELECT DISTINCT customers.fname AS first_name, customers.lname AS last_name, customers.email AS email
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
WHERE orders.processed = 't' AND orders.cupcake_id = (SELECT id FROM cupcakes WHERE name = 'funfetti');
