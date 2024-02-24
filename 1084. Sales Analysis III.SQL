# Write your MySQL query statement below
--- Using Left Join

SELECT k1.product_id,k1.product_name
FROM 
(
select distinct p.product_id, p.product_name
from 
sales s 
join product p
on s.product_id = p.product_id 
where (sale_date BETWEEN "2019-01-01" and "2019-03-31")
) k1 
LEFT JOIN 
(
select distinct p.product_id
from 
sales s 
join product p
on s.product_id = p.product_id 
where (sale_date < "2019-01-01" or sale_date > "2019-03-31")
) k2
on k1.product_id = k2.product_id 
where k2.product_id is null

---------------------------------------------------------------------------------------------------------------------------------
------------Alternate solution - Having Clause and check binary conditions sum to 0 or 1------------------------------------------

select p.product_id, p.product_name
from 
sales s 
join product p
on s.product_id = p.product_id 
group by p.product_id, p.product_name
having sum(sale_date BETWEEN "2019-01-01" and "2019-03-31")>0
and sum(sale_date < "2019-01-01" or sale_date > "2019-03-31")=0


-----------------------------------------------------------------------------------------------------------------------------------
------------Alternate solution - Having Clause and check binary Max / Min date conditions------------------------------------------


select p.product_id, p.product_name
from 
sales s 
join product p
on s.product_id = p.product_id 
group by p.product_id, p.product_name
having MIN(sale_date) >= "2019-01-01" and MAX(sale_date) <= "2019-03-31"