# Write your MySQL query statement below


select name as customer_name,customer_id,order_id,order_date 
from 
(
select c.*,o.order_id,o.order_date,
row_number() over (partition by o.customer_id order by o.order_date desc) as rn
from 
customers c 
join 
orders o
on c.customer_id = o.customer_id 

) t
where rn <=3
#order by 5
order by 1, 2, 4 desc
