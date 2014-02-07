--Joshua D. Zipkin

--Query 1

select name, city
from agents
where name = 'Smith'

--Query 2

select pid, name, quantity
from products
where priceUSD > 1.25

--Query 3

select ordno, aid
from orders

--Query 4

select name, city
from customers
where city = 'Dallas'

--Query 5

select name
from agents
where city != 'New York'
	and city != 'Newark'

--Query 6

select *
from products
where city != 'New York'
	and city != 'Newark'
	and priceUSD >= 1.00

--Query 7

select *
from orders
where mon = 'jan'
	or mon = 'mar'

--Query 8

select *
from orders
where mon = 'feb'
	and dollars < 100

--Query 9

select *
from orders
where cid = 'c001'