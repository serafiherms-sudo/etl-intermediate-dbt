with nation_region as (
    select 
    nation_key,
    nation.region_key,
    nation_name,
    region_name,
    from {{ ref('stg_tpch_sf1__nation') }} as nation
    join {{ ref('stg_tpch_sf1__region') }} as region
        on nation.region_key = region.region_key

)
select * from nation_region