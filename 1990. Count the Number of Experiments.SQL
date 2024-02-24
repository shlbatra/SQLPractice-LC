# Write your MySQL query statement below

with cte as 
(
select * from 
(
select 'Android' as platform
union 
select 'IOS'
union 
select 'Web') k1 
cross join 
(
select 'Reading' as experiment_name
union 
select 'Sports'
union 
select 'Programming'
) k2 
)

select c.platform,c.experiment_name,
case when count(experiment_id) is null then 0 else count(experiment_id) end as num_experiments 
from cte c 
left outer join experiments p 
on c.platform = p.platform and c.experiment_name = p.experiment_name
group by c.platform,c.experiment_name