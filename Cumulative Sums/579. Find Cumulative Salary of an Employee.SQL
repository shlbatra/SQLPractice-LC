# Write your MySQL query statement below


with my_cte as (
select id,max(month) as month from Employee group by id
)

SELECT 
e1.id, e1.month, sum(e2.salary) as Salary 
#,datediff(e1.month,e2.month)
FROM 
Employee e1 
join Employee e2 
on e1.id = e2.id and e1.month >= e2.month 
and e1.month-e2.month between 0 and 2
and (e1.id, e1.month) not in (select * from my_cte)
group by e1.id, e1.month
order by 1,2 desc