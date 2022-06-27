#1 Write a query to display for each store its store ID, city, and country.
SELECT T1.store_id AS StoreID , T3.city AS City , T4.country AS Countr FROM sakila.Store AS T1
INNER JOIN sakila.address AS T2 ON T1.address_id = T2.address_id
INNER JOIN sakila.city AS T3 ON T2.city_id = T3.city_id
INNER JOIN sakila.country AS T4 ON T3.country_id = T4.country_id;
#2 Write a query to display how much business, in dollars, each store brought in.
SELECT T3.store_id AS Store, SUM(T2.amount) AS "Business($)" 
FROM sakila.staff AS T1
JOIN sakila.payment AS T2 ON T1.staff_id = T2.staff_id
JOIN sakila.store AS T3 ON T1.store_id = T3.store_id
GROUP BY Store;
#3 Which film categories are longest?
SELECT T3.name AS Category , AVG(T1.length) AS Av_Length
FROM sakila.film AS T1
INNER JOIN sakila.film_category AS T2 ON T1.film_id = T2.film_id
INNER JOIN sakila.category AS T3 ON T2.category_id = T3.category_id
GROUP BY Category
ORDER BY Av_Length
LIMIT 5;
#4 Display the most frequently rented movies in descending order.
SELECT T1.title AS Film, COUNT(T3.rental_id) AS ‘Freq’
FROM sakila.film AS T1
JOIN sakila.inventory AS T2 ON T1.film_id = T2.film_id
JOIN sakila.rental AS T3 ON T2.inventory_id = T3.inventory_id
GROUP BY Film
ORDER BY Freq DESC;
#5 List the top five genres in gross revenue in descending order.
SELECT t3.name AS Genre, SUM(t6.amount) AS Gross_Revenue
FROM sakila.Film AS t1
JOIN sakila.film_category AS t2 ON t1.film_id = t2.film_id
JOIN sakila.category AS t3 ON t2.category_id = t3.category_id
JOIN sakila.inventory AS t4 ON t1.film_id = t4.film_id
JOIN sakila.rental AS t5 ON t4.inventory_id = t5.inventory_id
JOIN sakila.payment AS t6 ON t5.rental_id = t6.rental_id
GROUP BY Genre
ORDER BY Gross_Revenue DESC
LIMIT 5;
#6 Is “Academy Dinosaur” available for rent from Store 1?
SELECT t3.store_id AS Store,t1.title AS Film, COUNT(t1.title) AS Stock
FROM sakila.film AS t1
JOIN sakila.inventory AS t2 ON t1.film_id = t2.film_id
JOIN sakila.store AS t3 ON t2.store_id = t3.store_id
GROUP BY store, Film
HAVING Film = "Academy Dinosaur"
AND Store = 1;
#7 Get all pairs of actors that worked together.
SELECT t1.actor_id AS Actor1, t2.actor_id AS Actor2
FROM sakila.film_actor AS t1
INNER JOIN sakila.film_actor AS t2 ON t1.actor_id != t2.actor_id
WHERE t1.actor_id < t2.actor_id
AND t1.film_id = t2.film_id;	
#8 Get all pairs of customers that have rented the same film more than 3 times.
SELECT	
columns
customers
customers
tables;
#9 For each film, list actor that has acted in more films.
SELECT t1.first_name, t1.last_name, t3.title
FROM sakila.actor AS t1
JOIN sakila.film_actor AS t2 ON t1.actor_id = t2.actor_id
JOIN sakila.film AS t3 ON t2.film_id = t3.film_id
GROUP BY t1.actor_id
ORDER BY COUNT(t3.film_id) DESC;