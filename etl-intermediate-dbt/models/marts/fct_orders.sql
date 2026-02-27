with fct_orders as (
    select *
    from {{ ref('int_tpch_sf1__orders') }}
)

select * from fct_orders