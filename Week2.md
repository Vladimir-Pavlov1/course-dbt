What is our user repeat rate? Repeat Rate = Users who purchased 2 or more times / users who purchased

with user_count as (

select
  user_id, COUNT(order_id) as order_count
from
  dbt_vladimir_p.fct_orders
group by  
  user_id
)

select 
sum(case when order_count > 1 then 1 else 0 end) :: float  
/ count(0) :: float as repeat_buyer_rate
from user_count

What are good indicators of a user who will likely purchase again? What about indicators of users who
are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
