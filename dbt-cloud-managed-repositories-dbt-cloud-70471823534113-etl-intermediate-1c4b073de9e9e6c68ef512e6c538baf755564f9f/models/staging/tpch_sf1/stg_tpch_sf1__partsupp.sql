with 

source as (

    select * from {{ source('tpch_sf1', 'partsupp') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key(['ps_partkey', 'ps_suppkey'])}} as partsupp_key,
        ps_partkey as part_key,
        ps_suppkey as supplier_key,
        ps_availqty as part_supplier_available_quantity,
        ps_supplycost as part_supplier_supply_cost,
        ps_comment as part_supplier_comment

    from source

)

select * from renamed