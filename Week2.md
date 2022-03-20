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

Good indicators: 

- frequency of actions
- session duration
- number of orders
- actions during promotions

Not Purchase Again:
- sessions without purchases
- long delivery times

New Features:
- reviews
- shipping type


3. Explain the marts models you added. Why did you organize the models in the way you did?
The marts model has the three indicated folder types. In the core file I have:
dim_products - A dimension table that gives more data about the products 
dim_users - A dimension table that gives more data about the users
fct_events - A fact table that gives more data about the events
fct_order - A fact table that gives more data about the orders

The core models had these in there because it combines data from the staging models that creates a more complete view of the products, users
events and orders that can be more helpful as they are used downstream. Dimensional tables are labeled as such because they deal with things and their
information. The fact tables are labeled as such because they deal with what has already occured, such as events and orders. 

TESTS
1. What assumptions are you making about each model? (i.e. why are you adding each test?)
For the primary key tests I assumed that each one had to be not null and unique. I also added some positive values tests to order values 
since those have to be above zero if something is purchased and I also added accepted values for a few fields that could only be binary values. 

2. Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
I didnt find any bad tests yet

3. Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
I would make it so that dbt automatically runs at regular intervals and checks to see that everything compiles successfully. 



