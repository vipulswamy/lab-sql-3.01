/*

+------------+
| Activity 1 |
+------------+

*/
USE SAKILA;
/*
1. Drop column picture from staff.
*/
ALTER TABLE SAKILA.STAFF
DROP column picture;

select * from sakila.staff;

/*
2.A new person is hired to help Jon. 
Her name is TAMMY SANDERS, and she is a customer. 
Update the database accordingly.
*/

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id,active, username, password)
VALUES
(3,'Tammy','Sanders',79,'TAMMY.SANDERS@sakilastaff.com',2,1,'Tammy','');
select * from sakila.staff;

/*
3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
You can use current date for the rental_date column in the rental table. 
Hint: Check the columns in the table rental and see what information you would need to add there. 
You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
*/

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- 130

-- Use similar method to get inventory_id,staff_id.
select * from rental; -- inventory id is 367, staffid is 1

select film_id,title from sakila.film
where title like '%Academy%'; -- film id is 1

-- group by customer_id = 130;

-- we first create columnns film_id in the existing table and then
ALTER TABLE sakila.rental
ADD COLUMN film_id INT AFTER rental_id;

select * from sakila.rental;
-- we update the table film_id = 1 containing customer_id = 130, staff_id = 1, inventory_id=367


INSERT INTO sakila.rental (film_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values ('1','2005-05-24 22:53:30',367,130,'2005-05-24 22:53:30',1,'2006-02-15 21:30:53'); 
