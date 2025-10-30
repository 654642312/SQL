-- Retrieve users along with their balance amounts
SELECT users.id, users.first_name, users.last_name, users.email, balance.amount
FROM users
LEFT JOIN balance ON users.id = balance.user_id;


-- Retrieve products along with the total sum of offers made on each product
SELECT product.id, product.title, product.description, product.starting_price, SUM(offer.amount) AS total_offers
FROM product
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

-- Count the total number of users
SELECT COUNT(id) FROM users;

-- Count the total number of products
SELECT COUNT(id) FROM product;

-- count offer number for each product
SELECT product.id, product.title, COUNT(offer.id) AS offer_count
FROM product
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

-- average offer amount for each product
SELECT product.id, product.title, AVG(offer.amount) AS offer_avg
FROM product
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

-- min offer amount for each product
SELECT product.id, product.title, MIN(offer.amount) AS offer_min
FROM product 
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

-- max offer amount for each product
SELECT product.id, product.title, MAX(offer.amount) AS offer_max
FROM product 
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

