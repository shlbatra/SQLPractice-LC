/* Write your T-SQL query statement below */
select ad_id,
case when NumofClicks+NumofViews=0 then 0 
     else round((cast(NumofClicks as float) / (NumofClicks+NumofViews))*100,2) end as ctr
from (
select ad_id, 
sum(case when action = 'Clicked' then 1 else 0 end) as NumofClicks,
sum(case when action = 'Viewed' then 1 else 0 end) as NumofViews
from Ads 
group by ad_id
) k1
order by 2 desc, 1