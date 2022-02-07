with event_mart as (
    SELECT *
    FROM {{ ref('stg_event') }} e
    left join {{ ref('stg_category') }} c
    on u.CATID = c.CATID
    left join {{ ref('stg_venue') }}  v
    on e.VENUEID = v.VENUEID
    join {{ ref('stg_date') }}  d
    on e.DATEID = d.DATEID
)
select *
from event_mart;