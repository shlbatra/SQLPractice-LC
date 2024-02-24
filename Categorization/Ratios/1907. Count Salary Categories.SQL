with category_cte as (
select 'Low Salary'  as category, 0 as accounts_count
union select 'Average Salary', 0 
union select 'High Salary', 0 
)

select cc.category, 
case when ac.accounts_count is null then cc.accounts_count else ac.accounts_count end as accounts_count 
from (
select case when income < 20000 then 'Low Salary' 
     when income <= 50000 then 'Average Salary'
     else 'High Salary' end as category,
count(*) as accounts_count
from accounts
group by 1
) ac
right outer join category_cte cc
on ac.category = cc.category