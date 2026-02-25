with dim_localisation as (
    select *
    from {{ ref('int_tpch_sf1__localisation') }}
)

select * from dim_localisation
