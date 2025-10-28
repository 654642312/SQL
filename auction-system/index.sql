SELECT users.id, users.first_name, users.last_name, users.email, balance.amount
FROM users
LEFT JOIN balance ON users.id = balance.user_id;

SELECT product.id, product.title, product.description, product.starting_price, SUM(offer.amount) AS total_offers
FROM product
LEFT JOIN offer ON product.id = offer.product_id
GROUP BY product.id;

