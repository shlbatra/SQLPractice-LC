with RECURSIVE my_cte as (
select 1 as id
union all 
select id+1
from my_cte 
where id+1 <= (select max(customer_id) from customers)
)
select c1.id as ids from my_cte c1
left join customers c2
on c1.id = c2.customer_id
where c2.customer_id is null