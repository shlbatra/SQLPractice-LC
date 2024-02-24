# Write your MySQL query statement below

WITH global_avg as 
(
select avg(duration) as g_avg from calls
),
country_avg as 
(
select c.name, avg(c1.duration) as c_avg
from country c
join person p on convert(c.country_code,char)=substring(p.phone_number,1,3)
join calls c1 on p.id = c1.caller_id or p.id = c1.callee_id
group by c.name
)
#select * from country_avg
select name as country
from country_avg 
cross join 
global_avg
where c_avg > g_avg


--------------------------------------------------------------------------------------------------------
--------------------------------- Alternate way with Having Clause -------------------------------------


# Write your MySQL query statement below

select c.name as country
from country c
join person p on convert(c.country_code,char)=substring(p.phone_number,1,3)
join calls c1 on p.id = c1.caller_id or p.id = c1.callee_id
group by c.name
having avg(c1.duration) > (select avg(duration) as ww_duration from calls)