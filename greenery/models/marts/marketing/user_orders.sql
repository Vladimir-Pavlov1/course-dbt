{{
  config(
    materialized='table'
  )
}}

with users as (

    select * from {{ ref('dim_users') }}

)

, orders as (

    select * from {{ ref('fct_orders') }}

)

, user_orders as (

    select
        orders.order_id
        , orders.user_id
        , orders.created_at
        , orders.order_cost
        , orders.shipping_cost
        , orders.order_total
        , orders.tracking_id
        , orders.shipping_service
        , orders.estimated_delivery_at
        , orders.delivered_at
        , orders.status
        , orders.promo_id
        , orders.discount
        , orders.quantity
        , users.first_name
        , users.last_name
        , users.email
        , users.phone_number
        , users.address
        , users.zipcode
        , users.state
        , users.country
    from users
    left join orders
    on users.user_id = orders.user_id

)

select * from user_orders