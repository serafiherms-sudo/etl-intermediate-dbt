select *
from {{ ref('dim_items') }}
where item_ship_date > item_receipt_date