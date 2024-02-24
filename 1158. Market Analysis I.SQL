# Write your MySQL query statement below

with orders_2019 as 
(
select * from orders
where extract(year from order_date)=2019
)

select 
u.user_id as buyer_id, u.join_date, 
case when count(order_id) is null then 0 else count(order_id) end as "orders_in_2019"
from 
users u
left outer join orders_2019 o 
on u.user_id = o.buyer_id
group by u.user_id, u.join_date