# Write your MySQL query statement below

with RECURSIVE my_cte as (
    select employee_id from employees
    where manager_id=1
    union 
    select e.employee_id from 
    employees e
    join my_cte m
    on e.manager_id = m.employee_id
)
select * from my_cte
where employee_id != 1
order by employee_id


---------------------------------------------------------------------------------------------------
------------------ Alternative Solution -----------------------------------------------------------

# Write your MySQL query statement below

SELECT  
distinct e1.employee_id
from employees e1 
join employees e2 
on e1.manager_id = e2.employee_id
join employees e3
on e2.manager_id = e3.employee_id and e3.manager_id=1 
and e1.employee_id != 1
order by e1.employee_id