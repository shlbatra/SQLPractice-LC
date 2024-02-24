# Write your MySQL query statement below

select p1.buyer_id 
from (
select distinct buyer_id
from 
sales s 
join product p
on s.product_id = p.product_id 
where p.product_name = "S8") p1
LEFT join
(select distinct buyer_id
from 
sales s 
join product p
on s.product_id = p.product_id 
where p.product_name = "iPhone") p2
on p1.buyer_id = p2.buyer_id
where p2.buyer_id is null


--------------------------------------------------------------------------------------------------
---------------------------- Alternate---------------------------------------------

-- Not sure why it works for product name and not product id 

select buyer_id
from sales s 
join product p
on s.product_id = p.product_id 
group by buyer_id
having sum(product_name="S8")>0 and sum(product_name="iPhone")=0
