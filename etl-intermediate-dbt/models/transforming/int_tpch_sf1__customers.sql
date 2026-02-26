with customers_int as (
    select
        customer_key,
        customer_name,
        customer_address,
        {{ firstcap('nation.nation_name') }} as customer_nation,
        customer_phone,
        customer_account_balance,
        {{ firstcap('customer_mkt_segment') }} as customer_mkt_segment
    from {{ ref('stg_tpch_sf1__customers') }} as customers
    join {{ ref('stg_tpch_sf1__nation') }} as nation
        on customers.customer_nation_key = nation.nation_key
)

select * from customers_int