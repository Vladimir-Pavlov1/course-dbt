{{
  config(
    materialized='table'
  )
}}

with users as (

    select * from {{ ref('stg_users') }}

)

, addresses as (

    select * from {{ ref('stg_addresses') }}

)

, user_data as (

    select 
        users.user_id
        , users.first_name
        , users.last_name
        , users.email
        , users.phone_number
        , addresses.address
        , addresses.zipcode
        , addresses.state
        , addresses.country
        from addresses 
        left join users 
        on addresses.address_id = users.address_id

)

select * from user_data