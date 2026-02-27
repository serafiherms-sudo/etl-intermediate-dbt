select *
from {{ ref('int_tpch_sf1__items') }}
where item_ship_date > item_receipt_date