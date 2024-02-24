# Write your MySQL query statement below

select 
p.product_id,
case when sum(quantity) is null then 0 else sum(quantity) end as total_quantity
from 
product p
join sales s
on p.product_id = s.product_id 
group by p.product_id