-- 511. Game Play Analysis I

select player_id, min(event_date) as first_login
from activity 
group by player_id

-- 512. Game Play Analysis II

with my_cte as (
select player_id, min(event_date) as first_login
from activity 
group by player_id)

select 
a.player_id,a.device_id
from activity a join 
my_cte m
on a.player_id=m.player_id and a.event_date = m.first_login

--534. Game Play Analysis III

select 
player_id,
event_date,
sum(games_played) over (partition by player_id order by event_date) as games_played_so_far
from activity

--550. Game Play Analysis IV

select 
round(count(distinct b.player_id) / count(distinct a.player_id),2) as fraction
from 
(select player_id,min(event_date) as event_date from activity group by player_id) a
left outer join activity b
on a.player_id=b.player_id and a.event_date+1=b.event_date

--1097. Game Play Analysis V

select c.install_date as install_dt,count(c.player_id) as installs
,round(count(d.player_id)/count(c.player_id),2) as Day1_retention from 
(select player_id, min(event_date) as install_date 
from activity group by player_id) c 
left outer join activity d
on c.player_id=d.player_id 
and c.install_date+1=d.event_date
group by c.install_date

--550. Game Play Analysis IV

select round(count(*)/(select count(distinct player_id) from activity),2) as fraction
from (
select 
distinct a1.player_id
      # 
from 
    (select player_id, min(event_date) as event_date from activity 
     group by player_id
     )
     a1 
join activity a2 
on a1.player_id = a2.player_id 
and datediff(a2.event_date,a1.event_date) between 0 and 1
group by a1.player_id, a1.event_date
having count(a2.event_date) = 2) k1

-- Alternate way
select 
round(count(distinct b.player_id) / count(distinct a.player_id),2) as fraction
from 
(select player_id,min(event_date) as event_date from activity group by player_id) a
left outer join activity b
on a.player_id=b.player_id and a.event_date+1=b.event_date

--1097. Game Play Analysis V

select c.install_date as install_dt,count(c.player_id) as installs
,round(count(d.player_id)/count(c.player_id),2) as Day1_retention from 
(select player_id, min(event_date) as install_date 
from activity group by player_id) c 
left outer join activity d
on c.player_id=d.player_id 
and c.install_date+1=d.event_date
group by c.install_date