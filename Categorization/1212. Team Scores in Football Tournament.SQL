# Write your MySQL query statement below

select 
t.team_id,t.team_name,
sum(
case when t.team_id=h.host_team and host_goals > guest_goals then 3
     when t.team_id=h.guest_team and host_goals < guest_goals then 3
     when t.team_id=h.host_team and host_goals = guest_goals then 1
     when t.team_id=h.guest_team and host_goals = guest_goals then 1
     else 0 end) as num_points
from teams t 
left join matches h 
on t.team_id = h.host_team
or t.team_id = h.guest_team
group by t.team_id,t.team_name
order by 3 desc, 1
