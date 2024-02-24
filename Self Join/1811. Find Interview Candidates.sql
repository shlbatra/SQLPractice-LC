# Write your MySQL query statement below

with my_cte1 as 
(select gold_medal as user_id,count(contest_id) as contestsgoldwon
from contests group by gold_medal having count(contest_id) >= 3)
,my_cte as 
(
    select contest_id,gold_medal as user_id from contests
    union all
    select contest_id,silver_medal as user_id from contests
    union all
    select contest_id,bronze_medal as user_id from contests
)
,my_cte2 as
(
select distinct c1.user_id
from my_cte c1,
     my_cte c2,
     my_cte c3
where 
     c1.contest_id - c2.contest_id = 1
     and c2.contest_id - c3.contest_id = 1
     and c1.user_id = c2.user_id
     and c2.user_id = c3.user_id
)
select t2.name, t2.mail
from 
(select user_id from my_cte1
 union 
 select user_id from my_cte2) t1
 join users t2
 on t1.user_id = t2.user_id
 