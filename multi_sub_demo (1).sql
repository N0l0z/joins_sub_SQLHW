-- MULTI JOIN

SELECT * 
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id;


SELECT * from film_actor;

SELECT * 
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id

SELECT * from film;

SELECT title, fa.film_id
from film_actor as fa
INNER JOIN film
ON fa.film_id = film.film_id;

SELECT * from actor;

SELECT first_name, last_name, title
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id;

SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id;


SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE title like 'Wo%'
ORDER BY first_name


-- SUB QUERIES!!!

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) < -15000
ORDER BY sum(amount)

SELECT first_name, last_name, email
from customer


-- SELECT first_name, last_name, email
-- from customer
-- WHERE customer_id IN (
--     SELECT customer_id, SUM(amount)  --> err, can only have one column in here!
--     FROM payment
--     GROUP BY customer_id
--     HAVING sum(amount) < -15000
--     ORDER BY sum(amount)
-- )


SELECT first_name, last_name, email
from customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) < -15000
    ORDER BY sum(amount)
)

-- Sub queries can occur in WHERE, FROM, and SELECT
--                              SELECT CLAUSE USE NOT REALLY A THING. . . 

-- FROM clause


SELECT first_name, last_name
FROM (
    SELECT first_name, last_name, title
    FROM film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film_actor.film_id = film.film_id
) AS multi_join
WHERE title = 'Alone Trip'


-- SELECT clause
SELECT first_name, last_name, (
    SELECT COUNT(rental_id)
    from rental
)
from customer
