# Write your MySQL query statement below

with sale_apple as 
(select * from sales 
where fruit="apples")
, sale_orange as 
(select * from sales 
where fruit="oranges")

select 
a.sale_date, (a.sold_num-b.sold_num) as diff
from 
sale_apple a 
join sale_orange b 
on a.sale_date=b.sale_date 
order by 1

---------------------------------------------------------------------------------
--------------------Using Self Joins---------------------------------------------

# Write your MySQL query statement below

select 
a.sale_date, (a.sold_num-b.sold_num) as diff
from 
sales a 
join sales b 
on a.sale_date=b.sale_date 
and a.fruit="apples" and b.fruit="oranges"
order by 1
