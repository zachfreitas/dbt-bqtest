with event_mart as (
    SELECT e.eventid,
    e.VENUEID,
    e.CATID,
    e.DATEID,
    e.EVENTNAME,
    e.STARTTIME,
    c.CATGROUP,
    c.CATNAME,
    c.CATDESC,
    v.VENUENAME,
    v.VENUECITY,
    v.VENUESTATE,
    v.VENUESEATS,
    d.CALDATE as event_date,
    d.DAY as event_day,
    d.WEEK as event_WEEK,
    d.MONTH as event_month,
    d.QTR as event_QTR,
    d.YEAR as event_YEAR,
    d.HOLIDAY as event_HOLIDAY
    FROM {{ ref('stg_event') }} e
    join {{ ref('stg_category') }} c
    on e.CATID = c.CATID
    join {{ ref('stg_venue') }}  v
    on e.VENUEID = v.VENUEID
    join {{ ref('stg_date') }}  d
    on e.DATEID = d.DATEID
)
select *
from event_mart;