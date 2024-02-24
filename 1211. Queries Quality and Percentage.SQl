/* Write your T-SQL query statement below */

------------------------------------------------- SQL SERVER SOLUTION-----------------------------------------------------

with my_cte as (
select distinct *,
case when rating < 3 then 'Poor' else 'Good' end as QueryType,
cast(rating as float) / position as quality
from Queries)

select 
query_name,
round(avg(quality),2) as quality,
round((sum(case when QueryType = 'Poor' then 1 else 0 end)/cast(count(query_name) as float))*100,2) as poor_query_percentage
from my_cte
group by query_name
order by 2 desc, 1

---------------------------------------------------------------------------------------------------------------------------------------
---- MY SQL SOLUTION
---------------------------------------------------------------------------------------------------------------------------------------


with my_cte as (
select query_name, rating / position as quality, 
case when rating < 3 then 1 else 0 end as quality_binary
from queries 
)

select 
query_name, 
round(avg(quality),2) as quality,
round((sum(quality_binary)/count(*))*100,2) as poor_query_percentage
from my_cte
group by query_name 
order by 2 desc, 1