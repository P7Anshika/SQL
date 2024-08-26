SELECT * FROM sakila.film;
select * from film  
where rating='PG-13' and rental_rate<='2.99'; 

select * from film 
where special_features like '%Deleted Scenes';

select * from customer;

select * from customer where active in('1');

select count(*), active
from customer
group by active;

select * from rental;

select c.first_name, c.last_name, r.rental_date
from customer as c 
join rental as r on c.customer_id=r.customer_id
having date(rental_date) in('2005-07-26');

select concat(c.first_name,' ' ,c.last_name) as 'cust_name' , r.rental_date
from customer as c 
join rental as r on c.customer_id=r.customer_id
having date(rental_date) in('2005-07-26');

select distinct concat(c.first_name,' ' ,c.last_name) as 'cust_name' , r.rental_date
from customer as c 
join rental as r on c.customer_id=r.customer_id
having date(rental_date) in('2005-07-26');

select count(distinct(last_name))
from customer;

select count(*), date(rental_date) as date
from rental
group by date(rental_date);

select count(*), date(rental_date) as date
from rental 
group by date(rental_date) order by count(*) desc limit 1;

select * from category;

select * from film_category;

select * from film;

select c.name, f.title
from category as c
join film_category as fc on fc.category_id=c.category_id
join film as f on f.film_id=fc.film_id
where c.name= 'Sci-Fi';

select r.customer_id, count(*), concat(c.first_name,' ',c.last_name) as name
from rental as r
join customer as c on c.customer_id=r.customer_id
group by customer_id;

select * from inventory;
select * from rental;

select inventory_id, count(*)
from rental
group by inventory_id
having count(*)<='1'
order by count(*) desc; 

select r.inventory_id, count(*), f.title
from rental r
join inventory as i on i.inventory_id=r.inventory_id
join film as f on f.film_id=i.film_id
group by r.inventory_id
having count(*)<='1';

with low_rental as(
select inventory_id, count(*)
from rental
group by inventory_id
having count(*)<='1')
select low_rental.inventory_id, i.film_id, f.title
from low_rental
join inventory as i on i.inventory_id=low_rental.inventory_id
join film as f on f.film_id=i.film_id;

select * from rental 
where return_date is null;

select f.title, i.film_id, r.return_date
from rental r
join inventory as i on i.inventory_id = r.inventory_id
join film as f on f.film_id = i.film_id
where r.return_date is null
order by f.title;