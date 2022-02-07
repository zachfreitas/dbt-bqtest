-- 
with venue_sales_mart as (
  SELECT *
  FROM {{ ref('stg_sales') }} s
  join {{ ref('stg_event') }} e
  on s.eventid = e.eventid
  join {{ ref('stg_venue') }} v
  on v.venueid = e.venueid
)
select *
from venue_sales_mart;