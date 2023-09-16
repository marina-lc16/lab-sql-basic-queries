USE sakila;

-- i.e test if the databases works
SELECT * FROM store; 

-- LAB:

-- 1.- Show all tables.

SHOW TABLES;

-- 2.- Retrieve all the data from the tables actor, film and customer.

SELECT* FROM sakila.actor;
SELECT* FROM sakila.film;
SELECT* FROM sakila.customer;


/*-- 3.- Retrieve the following columns from their respective tables:
3.1 Titles of all films from the film table
3.2. List of languages used in films, with the column aliased as language from the language table
3.3 List of first names of all employees from the staff table
*/

-- 3.1
SELECT title FROM sakila.film;

-- 3.2
SELECT* FROM sakila.language;
SELECT name as "language" FROM sakila.language;

-- 3.3
SELECT* FROM sakila.staff;

-- 4.- Retrieve unique release years.

SELECT * FROM sakila.film;
SELECT distinct(release_year) as num_unique_release_years FROM sakila.film;

/*-- 5.- Counting records for database insights:
5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.
*/
-- 5.1
SELECT*FROM sakila.store;
SELECT count(distinct(store_id)) as num_of_stores FROM sakila.store;

-- 5.2
SELECT*FROM sakila.staff;
SELECT count(distinct(staff_id)) as num_of_employees FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.

SELECT*FROM sakila.rental;
SELECT count(distinct(inventory_id)) as num_of_films_available FROM sakila.rental;
SELECT count(distinct(staff_id)) as num_of_films_rented FROM sakila.renatal;

-- 5.4 Determine the number of distinct last names of the actors in the database

SELECT*FROM sakila.actor;
SELECT count(distinct(last_name)) as num_of_last_names FROM sakila.actor;


-- 6.- Retrieve the 10 longest films.
SELECT * FROM sakila.film;

SELECT title , length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

/*-- 7.- Use filtering techniques in order to:
7.1 Retrieve all actors with the first name "SCARLETT".
7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
Hint: use LIKE operator. More information here.
7.3 Determine the number of films that include Behind the Scenes content
*/

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT*FROM sakila.actor;

SELECT first_name FROM sakila.actor
WHERE first_name  = "SCARLETT";

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here.
SELECT*FROM sakila.film;

SELECT title, length from sakila.film
Where length > 100 
AND (title like "%ARMAGEDDON");

-- 7.3 Determine the number of films that include Behind the Scenes content

SELECT*FROM sakila.film;

SELECT count(title) AS "films_include_behind_scenes" FROM sakila.film
Where (special_features = 'Behind the Scenes');



-- The end --