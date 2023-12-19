

-- 1. List all customers who live in Texas (use
-- JOINs)
select first_name, last_name, postal_code
from customer
inner JOIN address
on customer.address_id = address.address_id

--filtering with 77 as my zipcode for TX 
-- the customers names who live in Tx are 
--STEVE MACKENZIE, SARAH LEWIS, DAVE GARDINER, 
--BENJAMIN VARNEY, PEGGY MEYERS, IAN STILL,
--NELSON CHRISTENSON, MEGAN PALMER, SUSAN WILSON, 
--ADRIAN CLARY, LESLIE GORDON, LILLIE KIM
--

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount
from customer
INNER JOIN payment
on payment.customer_id = customer.customer_id
-- filtering amount greater than 6.99 
--mary smith - 7.53, douglas graf - 931.67, mary smith - 89.95
--mary smith - 992.45, alfredo mcadams 86.94, harold martino 93.99

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

select first_name, last_name
from customer
WHERE customer_id in (
    select customer_id
    from payment
    GROUP by customer_id
    HAVING SUM(amount) > 175
    order by sum(amount)
)
-- mary smith and peter menard.
--# couldnt figure out how to get the amount as well on table read. 

-- 4. List all customers that live in Nepal (use the city
-- table)
select country, country_id
from country
WHERE country = 'Nepal';
--66
select city, city_id
from city
WHERE country_id IN (
    SELECT country_id
    from country
    GROUP BY country.country_id
    having country_id = 66);
--81
SELECT address_id from address
WHERE city_id = 81;
--326
SELECT first_name, last_name
from customer
where address_id = 326
--Kevin Schuler


-- 5. Which staff member had the most
-- transactions?
select staff_id, payment_id from payment
ORDER BY staff_id
select* from staff

select sum(payment_id)
FROM payment
WHERE staff_id = 1 --mike hillyer
--180801324
select sum(payment_id)
FROM payment
WHERE staff_id = 2 --jon stephens
--181218873 
-- Staff Jon has most transactions.

-- 6. How many movies of each rating are
-- there?
SELECT rating, count(distinct title)
FROM film
GROUP BY film.rating
--G 178, PG 194, PG-13 224, R 196, NC-17 209.

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

select count(distinct customer_id), customer_id, amount
from payment
WHERE amount > 6.99
GROUP BY payment.amount, payment.customer_id

-- 8. How many free rentals did our store give away?

select count(rental_id), amount
from payment 
WHERE amount <= 1
GROUP BY payment.amount