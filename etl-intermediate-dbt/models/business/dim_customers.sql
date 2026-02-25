with dim_customers as (
    select * from {{ ref('int_tpch_sf1__customers') }}
)

select * from dim_customers
