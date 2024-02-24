# Write your MySQL query statement below

with my_cte as (
select fail_date as calendar_date,'failed' as period_state
from failed
where fail_date between "2019-01-01" and "2019-12-31"
union 
select success_date as calendar_date, 'succeeded' as period_state
from succeeded
where success_date between "2019-01-01" and "2019-12-31"
),
my_cte1 as 
(
select *, 
DATE_SUB(calendar_date, INTERVAL row_number() over (partition by period_state order by calendar_date) DAY) as rn
from my_cte
)
select 
period_state, min(calendar_date) as start_date, max(calendar_date) as end_date
from my_cte1
group by period_state,rn
order by 2