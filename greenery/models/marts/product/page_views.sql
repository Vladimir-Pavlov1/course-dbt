{{
  config(
    materialized='table'
  )
}}

with events as (

    select * from {{ ref('fct_events') }}

)

, users as (

    select * from {{ ref('dim_users') }}

)

, products as (

    select * from {{ ref('dim_products') }}

)

, page_views as (

    select 
        events.event_id
        , events.session_id
        , events.user_id
        , events.product_id
        , events.order_id
        , events.event_type
        , events.page_url
        , events.created_at
        , users.first_name
        , users.last_name
        , users.address
        , products.name as product_name
        from events 
        left join users 
        on events.user_id = users.user_id
        left join products 
        on products.product_id = events.product_id

)

select * from page_views