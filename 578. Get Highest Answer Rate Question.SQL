# Write your MySQL query statement below

select question_id as survey_log from (
select 
q.question_id, 
sum(case when q.answer_id is not null then 1 else 0 end)/count(q.q_num) as ans_rate
from 
surveylog q
group by q.question_id
order by 2 desc, 1
limit 1
) t