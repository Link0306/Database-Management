--Joshua Zipkin

--Query 1

select agents.city
from customers, agents, orders
where customers.cid = orders.cid
  and agents.aid = orders.aid
  and customers.name = 'Basics'
order by city asc;

--Query 2

select *
from customers c
inner join orders o
   on c.cid = o.cid;
   

--Query 3

select name
from customers
where cid not in (select cid
		  from orders);

--Query 4

select c.name
from customers c
left outer join orders o
  on c.cid = o.cid
where o.cid is null;

--Query 5

select *
from customers c, agents a, orders o
where c.cid = o.cid
  and a.aid = o.aid

--Query 6

select c.name, a.name, c.city
from customers c, agents a
where c.city = a.city;

--Query 7

select c.name, c.city
from customers c, products p
where c.city = p.city
group by c.name, c.city;