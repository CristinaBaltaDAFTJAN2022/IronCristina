SHOW DATABASES;
SHOW FULL TABLES;
-- 1) Which actor has appeared in the most films?

select first_name, last_name, count(film_id) as n_films
from sakila.actor as a
inner join sakila.film_actor as b
on a.actor_id = b.actor_id
group by a.actor_id
order by n_films desc limit 1;

-- 2) Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(rental_id) as n_rentals
from customer as a
inner join sakila.rental as b
on a.customer_id = b.customer_id
group by a.customer_id
order by n_rentals desc limit 1;

-- 3) List number of films per category.

select name, count(film_id) from sakila.category as a
inner join sakila.film_category as b
on a.category_id = b.category_id
group by a.category_id;

-- 4) Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address from sakila.staff as a
inner join sakila.address as b
on a.address_id = b.address_id;

-- 5) Display the total amount rung up by each staff member in August of 2005.
select a.staff_id, first_name, last_name, sum(amount) from sakila.staff as a
inner join sakila.payment as b
on a.staff_id = b.staff_id
where payment_date like "2005-08-%"
group by a.staff_id;

-- 6) List each film and the number of actors who are listed for that film.

select title, count(actor_id) from sakila.film as a
inner join sakila.film_actor as b
on a.film_id = b.film_id
group by title;

-- 7) list the total paid by each customer. List the customers alphabetically by last name.
select first_name, last_name, sum(amount) from sakila.customer as a
inner join sakila.payment as b
on a.customer_id = b.customer_id
group by a.customer_id
order by last_name;

-- BONUS --

-- Which is the most rented film? 
select title, a.film_id, count(rental_id) as n_rentals from film as a
inner join sakila.inventory as b
on a.film_id = b.film_id
inner join rental as c
on b.inventory_id = c.inventory_id
group by film_id
order by n_rentals desc
limit 1




