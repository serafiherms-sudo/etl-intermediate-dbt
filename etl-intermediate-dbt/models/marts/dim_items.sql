with dim_items as (
    select *
    from {{ ref('int_tpch_sf1__items') }}
)

select * from dim_items