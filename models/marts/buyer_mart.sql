with buyer_mart as (
    SELECT *
    FROM {{ ref('stg_sales') }} s
    join {{ ref('stg_users') }} u
    on u.userid = s.SELLERID
    -- left join {{ ref('stg_date') }}  d
    -- on u.userid = s.BUYERID
    -- join {{ ref('stg_event') }} e
    -- on s.eventid = e.eventid
    -- join {{ ref('stg_category') }} c
    -- on e.catid = c.catid
)
select *
from buyer_mart;