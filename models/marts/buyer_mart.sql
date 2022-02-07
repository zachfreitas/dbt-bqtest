with buyer_mart as (
    SELECT *
    FROM {{ ref('sales_mart') }} u
    join {{ ref('stg_sales') }} s
    on u.userid = s.BUYERID
    join {{ ref('stg_event') }} e
    on s.eventid = e.eventid
    join {{ ref('stg_category') }} c
    on e.catid = c.catid
)
select *
from buyer_mart;