{{
  config(
    materialized='table'
  )
}}

with events as (

    select * from {{ ref('stg_events') }}

)

, event_info as (

    select 
        event_id, 
        session_id, 
        user_id,
        page_url,
        created_at,
        event_type,
        order_id,
        product_id
    from events

)

select * from event_info 