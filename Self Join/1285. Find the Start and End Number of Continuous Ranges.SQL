# Write your MySQL query statement below

with my_cte as (
select 
*,
log_id - row_number() over(order by log_id) as rn
from logs
) 
select min(log_id) as start_id, max(log_id) as end_id
from my_cte
group by rn