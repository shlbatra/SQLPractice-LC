select * from ( 
    select ename, sal, 
    dense_rank() over(order by sal desc) as r 
    from Employee) 
where r=&n


--------------------------------------------------------------------------------
---------------------- Akternate ----------------------------------------------

SELECT name, salary 
FROM #Employee e1 
WHERE N-1 = (SELECT COUNT(DISTINCT salary) FROM #Employee e2 WHERE e2.salary > e1.salary)

