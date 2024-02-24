# Write your MySQL query statement below

SELECT 
p.product_name,s.year,s.price as price
FROM 
sales s 
join product p
on s.product_id = p.product_id 
order by 1,2