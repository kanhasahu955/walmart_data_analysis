select *
from walmart;
-- select count(*) from walmart;
select payment_method,
    count(*)
from walmart
group by payment_method;
select count(distinct branch)
from walmart;
select MAX(quantity)
from walmart;
select MIN(quantity)
from walmart;
-- business problems
-- [1]. what are the different payment methods , and how many transactions and items were sold with each method?
select payment_method,
    count(*) as number_of_transactions,
    SUM(quantity) as number_of_sold
from walmart
group by payment_method;
-- which category received the highest average rating in each branch?
select *
from (
        select branch,
            category,
            AVG(rating) as avg_rating,
            rank() over(
                partition by branch
                order by avg(rating) DESC
            ) as rank
        from walmart
        group by 1,
            2
        order by 1,
            3 DESC
    )
where rank = 1;