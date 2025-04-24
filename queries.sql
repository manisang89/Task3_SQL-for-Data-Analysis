-- Question:
-- 1.	Get all products in the "Electronics" category, ordered by price descending.
-- 2.	List customers who signed up after January 1, 2024.
-- 3.	Show total number of orders placed by each customer.
-- 4.	Find all products priced between $50 and $1000.
-- 5.	List product categories and the number of products in each category.
-- 6.	List all orders with customer name and order date (INNER JOIN).
-- 7.	Show all customers and their orders (LEFT JOIN — include customers with no orders).
-- 8.	Find customers who have placed more than 1 order.
-- 9.  What is the average price of all products?
-- 10. Create a view that shows the names of all products and their categories.



-- Queries:






-- query 1
select name from products where category='Electronics' order by price desc
------

-- query 2
select name from customers where signup_date > '2024-01-01'
------

-- query 3
select c.name,count(o.order_id) as totalorders
from customers c
join orders o on c.customer_id=o.customer_id
group by c.customer_id;
------

-- query 4
select name from products where price>50 and price<1000;
------

-- query 5
select category,count(*) as product_count
from products 
group by category;
------

-- query 6
select o.order_id, c.name as customer_name, o.order_date
from orders o
inner join customers c on o.customer_id = c.customer_id;
------

-- query 7
select c.name, o.order_id, o.order_date
from customers c
left join orders o on c.customer_id = o.customer_id;
------

-- query 8
select name from customers
where customer_id not in(
select customer_id from orders
);
------

-- query 9
select avg(price) as average_price from products;
------

-- query 10
create view prod_categ_view as
select name,category
from products;

select * from prod_categ_view;