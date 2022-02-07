with sales_events as (
    select *
    FROM {{ ref('stg_listings') }} l
    join {{ ref('sales_mart') }} s
    on l.eventid = s.eventid
)
select *
from sales_events