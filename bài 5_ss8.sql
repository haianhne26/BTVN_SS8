SELECT SUM(total_amount) AS total_revenue
FROM Sales;

SELECT COUNT(*) AS total_transactions
FROM Sales;

SELECT AVG(total_amount) AS average_transaction_value
FROM Sales;

SELECT MAX(total_amount) AS highest_transaction_value
FROM Sales;

SELECT MIN(total_amount) AS lowest_transaction_value
FROM Sales;

SELECT MIN(transaction_date) AS first_transaction_date
FROM Sales;

SELECT MAX(transaction_date) AS last_transaction_date
FROM Sales;
