with 

source as (

    select * from {{ source('tpch_sf1', 'lineitem') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(['l_orderkey', 'l_linenumber']) }} as item_key,
        l_orderkey as order_key,
        l_partkey as part_key,
        l_suppkey as supplier_key,
        l_linenumber as item_number,
        l_quantity as item_quantity,
        l_extendedprice as item_extended_price,
        l_discount as item_discount,
        l_tax as item_tax,
        l_returnflag as item_return_flag,
        l_linestatus as item_status,
        l_shipdate as item_ship_date,
        l_commitdate as item_commit_date,
        l_receiptdate as item_receipt_date,
        l_shipinstruct as item_ship_instruct,
        l_shipmode as item_ship_mode,
        l_comment as item_comment

    from source

)

select * from renamed