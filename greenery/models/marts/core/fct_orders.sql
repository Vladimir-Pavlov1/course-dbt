{{
  config(
    materialized='table'
  )
}}

with orders as (

    select * from {{ ref('stg_orders') }}

)

, items as (

    select * from {{ ref('stg_order_items') }}

)

, promos as (

    select * from {{ ref('stg_promos') }}

)

, order_details as (

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
        , promos.promo_id
        , promos.discount
        , items.quantity
        from orders
        left join items
        on orders.order_id = items.order_id
        left join promos
        on orders.promo_id = promos.promo_id
    
)

select * from order_details