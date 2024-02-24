# Write your MySQL query statement below

select sales_agg.seller_id from 
(
select seller_id,sum(price) as total_price 
from 
sales 
group by seller_id) sales_agg 
join (
select sum(price) as total_price_max from sales 
group by seller_id 
order by 1 desc 
limit 1
) sales_agg_max
on sales_agg.total_price = sales_agg_max.total_price_max

---------------------------------------------------------------------------------
-----------------------------Alternate solution---------------------------------

select seller_id
from 
sales 
group by seller_id
having sum(price)=
(
select sum(price) as total_price_max from sales 
group by seller_id 
order by 1 desc 
limit 1
) 