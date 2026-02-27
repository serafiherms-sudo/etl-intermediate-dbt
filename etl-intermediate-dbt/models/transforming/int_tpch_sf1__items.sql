with items_int as (
    select 
        item_key,
        order_key,
        lineitem.part_key,
        part_name,
        part_manufacturer,
        part_brand,
        {{ firstcap('part_type') }} as part_type,
        part_size,
        {{ firstcap('part_container') }} as part_container,
        part_retail_price,
        supplier_key,
        item_quantity,
        item_extended_price,
        item_discount,
        item_tax,
        item_return_flag,
        item_status,
        item_ship_date,
        item_commit_date,
        item_receipt_date,
        datediff('day', item_ship_date, item_receipt_date) as delivery_time,
        {{ firstcap('item_ship_instruct') }} as item_ship_instruct,
        {{ firstcap('item_ship_mode') }} as item_ship_mode
    from {{ ref('stg_tpch_sf1__lineitem') }} as lineitem
    join {{ ref('stg_tpch_sf1__part') }} as part 
        on lineitem.part_key = part.part_key
)

select * from items_int