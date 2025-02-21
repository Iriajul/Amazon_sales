SELECT * FROM amazon;
-- Top-selling products based on rating count --

SELECT product_id, product_name, category, rating, rating_count
FROM amazon
ORDER BY rating_count DESC
LIMIT 10;

-- Average discount percentage per category
SELECT category, AVG(discount_percentage) AS avg_discount
FROM amazon
GROUP BY category
ORDER BY avg_discount DESC;

-- Products with high discounts but low ratings
SELECT product_id, product_name, discount_percentage, rating, rating_count
FROM amazon
WHERE discount_percentage > 40 AND rating < 3.5;

-- Most active reviewers
SELECT user_id, user_name, COUNT(review_id) AS total_reviews
FROM amazon
GROUP BY user_id, user_name
ORDER BY total_reviews DESC
LIMIT 10;

-- Average rating given by each user
SELECT user_id, user_name, AVG(rating) AS avg_rating
FROM amazon
GROUP BY user_id, user_name
ORDER BY avg_rating DESC;

-- Find users who have reviewed the same product multiple times
SELECT user_id, product_id, COUNT(review_id) AS review_count
FROM amazon
GROUP BY user_id, product_id
HAVING review_count > 1;

-- Products with high demand (many reviews and high rating)
SELECT product_id, product_name, rating, rating_count
FROM amazon
WHERE rating > 4.0
ORDER BY rating_count DESC
LIMIT 10;

-- Top categories by total reviews
SELECT category, COUNT(review_id) AS total_reviews
FROM amazon
GROUP BY category
ORDER BY total_reviews DESC;

-- Average price by category
SELECT category, AVG(discounted_price) AS avg_price
FROM amazon
GROUP BY category
ORDER BY avg_price DESC;

-- Categories with the highest number of products
SELECT category, COUNT(product_id) AS total_products
FROM amazon
GROUP BY category
ORDER BY total_products DESC;

-- Identify price fluctuations for specific products over time 
SELECT product_id, product_name, actual_price, discounted_price
FROM amazon
ORDER BY product_id, discounted_price DESC;




