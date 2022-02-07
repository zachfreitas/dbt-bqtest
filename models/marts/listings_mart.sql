with event_mart as (
    SELECT l.LISTID,
    l.SELLERID,
    l.EVENTID,
    l.DATEID,
    l.NUMTICKETS,
    l.PRICEPERTICKET,
    l.TOTALPRICE,
    l.LISTTIME,
    d.CALDATE as listing_date,
    d.DAY as listing_day,
    d.WEEK as listing_WEEK,
    d.MONTH as listing_month,
    d.QTR as listing_QTR,
    d.YEAR as listing_YEAR,
    d.HOLIDAY as listing_HOLIDAY,
    e.*
    FROM {{ ref('stg_listings') }} l
    join {{ ref('event_mart') }} e
    on l.EVENTID = e.EVENTID
    join {{ ref('stg_date') }}  d
    on e.DATEID = d.DATEID
)
select *
from listings_mart;