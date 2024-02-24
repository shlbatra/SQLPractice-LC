/* Write your T-SQL query statement below */

with my_cte as(
select 
    customer_id,
    min(order_date) as first_order_date
    from delivery
    group by customer_id 
)
select round((sum(case when order_date =  customer_pref_delivery_date then 1 else 0 end)) / 
cast(count(distinct d.customer_id) as float) * 100,2) as immediate_percentage
from delivery d 
join my_cte m
on d.order_date = m.first_order_date and d.customer_id = m.customer_id