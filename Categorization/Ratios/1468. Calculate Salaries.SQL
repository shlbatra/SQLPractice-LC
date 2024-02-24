# Write your MySQL query statement below

with max_salary_cte as (
select company_id, max(salary) as max_salary 
from salaries 
group by company_id
)

select e.company_id, employee_id, employee_name,  
case when max_salary < 1000 then round(salary - salary*(0/100),0) 
     when max_salary <= 10000 then round(salary - salary*(24/100),0) 
     else round(salary - salary*(49/100),0) end as salary
from salaries e
join max_salary_cte m 
on e.company_id = m.company_id