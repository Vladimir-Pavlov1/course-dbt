{{
  config(
    materialized='table'
  )
}}

with products as (

    select * from {{ ref('stg_products') }}

)

, dim_products as (

    select 
        product_id
        , name
        , price
        , inventory 
    from products

)

select * from dim_products