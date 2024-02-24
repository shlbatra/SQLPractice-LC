# Write your MySQL query statement below

with orders_second_cte as
(
SELECT *,
nth_value(item_id,2) over (partition by seller_id order by order_date asc rows between 
                          unbounded preceding and unbounded following) as second_item
from orders
)

select 
u.user_id as seller_id, 
case when i.item_brand = u.favorite_brand then "yes" else "no" end as "2nd_item_fav_brand"
from 
users u 
left outer join 
(select distinct seller_id,second_item from orders_second_cte) o
on u.user_id = o.seller_id
left outer join items i 
on o.second_item = i.item_id

------------------------------------------------------------------------------------------------------------------------------
------------------Alternate Solution - using 2 inner sub queries to find the second date-------------------------------------

# Write your MySQL query statement below
select u.user_id as seller_id,
case when t.item_brand is null then "no" else "yes" end as "2nd_item_fav_brand"
from users u 
left outer join 
(
select seller_id, item_brand
from orders join items
on orders.item_id=items.item_id 
where (seller_id,order_date) in 
    (
    select seller_id, min(order_date) as order_date
    from orders
    where (seller_id,order_date) not in 
        (
        select seller_id, min(order_date) as order_date
        from orders
        group by 1
        )
    group by 1
    )
) as t
on u.user_id = t.seller_id and u.favorite_brand=t.item_brand