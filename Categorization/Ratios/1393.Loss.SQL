/* Write your T-SQL query statement below */

select stock_name,
sum(price_calc) as capital_gain_loss
from (
SELECT stock_name,
case when operation = 'Buy' then -1*price else price end as price_calc
FROM 
STOCKS
) k1
group by stock_name

---------------------------------------------------------------------

SELECT stock_name,
sum(case when operation = 'Buy' then -1*price else price end) as capital_gain_loss
FROM 
STOCKS
group by stock_name