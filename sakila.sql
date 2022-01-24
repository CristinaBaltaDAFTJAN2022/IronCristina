SHOW DATABASES;
SHOW FULL TABLES;
-- Review the tables in the database.
select * from sakila.actor;
select * from sakila.address;
select * from sakila.category;
select * from sakila.city;
select * from sakila.country;
select * from sakila.customer;
select * from sakila.film;
select *from sakila.film_actor;
select * from sakila.film_category;
select * from sakila.film_text;
select * from sakila.inventory;
select *from sakila.language;

-- I find the film titles
select Title from sakila.film;

-- Select one column from a table and alias it. 
select Actor_id from Actor;

-- Get unique list of film languages under the alias language.
select distinct (Language_id) from Film;
select distinct Name from Language;

-- Find out how many stores does the company have?
select * from sakila.store;


-- Find out how many employees staff does the company have?
select staff_id from sakila.staff

SELECT COUNT(staff_id) FROM staff

-- Return a list of employee first names only
select first_name from Staff