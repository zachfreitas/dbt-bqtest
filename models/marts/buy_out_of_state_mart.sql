/*with state_match as (
select b.salesid
, b.userid
, b.state
, b.venuestate
, case 
    when lower(trim(b.state)) = lower(trim(b.venuestate)) then 0
    else 1
    end as diff_state    
, 1 as orders    
FROM {{ ref('buyer_mart') }} b
group by 1, 2
)
select 
round(sum(diff_state)/cast(sum(orders) as real) * 100,2) pct_orders_out_of_state
from state_match ;

