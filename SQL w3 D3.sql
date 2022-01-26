-- How many copies of the film Hunchback Impossible exist in the inventory system?
select * from 

select film_id, count(film_id) from inventory
where film_id = (select film_id from film where title ="Hunchback Impossible")
group by film_id;

-- 2) List all films whose length is longer than the average of all the films.

select title, length from film
where length > (select avg(length) from film);

-- 3) Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name from actor
inner join film_actor using (actor_id)
    where film_id=( select film_id from film where title="Alone Trip")
group by actor_id
 
-- 4)Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film
inner join film_category using(film_id)
where category_id=( select category_id from category where name="Family")

-- 5) Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select first_name, last_name, email from customer
inner join address
using(address_id)
inner join city
using(city_id)
where country_id=(select country_id from country where country="Canada")

create temporary table cities_in_canada
select city_id from city
where country_id = (select country_id from country where country = "Canada");

select * from cities_in_canada;

create temporary table cities_and_addresses
select address_id from address
where city_id in (select * from cities_in_canada);

select * from cities_and_addresses;

select first_name, last_name, email from customer
where address_id in (select * from cities_and_addresses);


