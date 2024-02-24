# Write your MySQL query statement below

#Consecutive day problem - do self join 

select c.id,a.name
from  
(
SELECT distinct
l1.id,count(distinct l2.login_date)
from logins l1
join logins l2
on l1.id = l2.id and l2.login_date >= l1.login_date
where datediff(l2.login_date,l1.login_date) between 1 and 4
group by l1.id , l1.login_date                              #Group by login date as well - if have 6 consective days then get 1->1,2,3,4  else get 1->5 without logindate in groupby
having count(distinct l2.login_date) = 4
) c
join accounts a 
on c.id=a.id 
order by 1

