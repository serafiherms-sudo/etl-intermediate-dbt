with supplier_nation as (
    select
        supplier_key,
        supplier_name,
        supplier_address,
        nation.nation_key,
        nation_name,
        supplier_phone,
        supplier_account_balance
    from {{ ref('stg_tpch_sf1__supplier') }} as supplier
    join {{ ref('stg_tpch_sf1__nation') }} as nation
        on supplier.nation_key = nation.nation_key
),

supplier_int as (
    select
        partsupp_key,
        part_key,
        part_supplier.supplier_key,
        part_supplier_available_quantity,
        part_supplier_supply_cost,
        supplier_name,
        supplier_address,
        supplier.nation_key,
        nation_name,
        supplier_phone,
        supplier_account_balance
    from {{ ref('stg_tpch_sf1__partsupp') }} as part_supplier
    join supplier_nation as supplier
        on part_supplier.supplier_key = supplier.supplier_key
)

select * from supplier_int