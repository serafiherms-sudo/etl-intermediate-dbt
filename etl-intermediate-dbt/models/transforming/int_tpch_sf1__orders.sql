with orders_int as (
    select
        order_key,
        customer_key,
        order_status,
        order_total_price,
        to_char(order_date, 'dd-MM-yyyy') as order_date,
        order_priority,
        order_clerk,
        order_ship_priority
    from {{ ref('stg_tpch_sf1__orders') }}
)

select * from orders_int