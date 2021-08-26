USE sakila;
SHOW TABLES;
DESCRIBE film;
DESCRIBE actor;
DESCRIBE inventory;
DESCRIBE film_actor;

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_list;
SELECT * FROM film_actor;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM staff_list;
SELECT * FROM country;
SELECT * FROM language;

SELECT first_name, last_name FROM actor;
SELECT last_name FROM actor WHERE first_name = 'John';
SELECT first_name, last_name FROM actor WHERE last_name = 'Neeson';
SELECT first_name, last_name FROM actor WHERE actor_id%10 = 0;
SELECT description FROM film WHERE film_id = 100;
SELECT title FROM film WHERE rating = 'R';
SELECT title FROM film WHERE rating != 'R';
SELECT title FROM film ORDER BY length ASC LIMIT 10;

#Q9 BOTH WAYS
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;

SELECT title, length
FROM (
SELECT title, length, row_number() OVER (ORDER BY length DESC) AS ROWNUM
FROM film
) T
WHERE ROWNUM <11;

#Q10 AND ON
SELECT title, special_features FROM film WHERE special_features LIKE "%Deleted Scenes%";

SELECT first_name, last_name, COUNT(last_name) AS ct 
FROM actor
GROUP BY last_name 
HAVING ct = 1
ORDER BY last_name DESC;

SELECT first_name, last_name, COUNT(last_name) as ct
FROM actor
GROUP BY last_name
ORDER BY ct DESC;

SELECT first_name, last_name, COUNT(film_id) AS ct FROM actor a JOIN film_actor f ON f.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY ct DESC;

SELECT rental_duration FROM film WHERE title = 'Academy Dinosaur';
SELECT category, AVG(length) FROM film_list GROUP BY category;
SELECT title FROM film WHERE description LIKE "%Robot%";
SELECT COUNT(title) FROM film WHERE release_year=2010;
SELECT title FROM film_list WHERE category = 'Horror';
SELECT first_name, last_name FROM staff WHERE staff_id = 2;
SELECT title FROM film_list where actors LIKE "%Fred Costner%";
SELECT COUNT(DISTINCT(country)) FROM country;
SELECT name FROM language ORDER BY name DESC;
SELECT first_name, last_name FROM actor WHERE last_name LIKE "%son" ORDER BY first_name;
SELECT category, MAX(length) FROM film_list GROUP BY category ORDER BY category DESC LIMIT 1;