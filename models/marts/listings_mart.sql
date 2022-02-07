with listings_mart as (
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
    VENUEID,
    CATID,
    EVENTNAME,
    STARTTIME,
    CATGROUP,
    CATNAME,
    CATDESC,
    VENUENAME,
    VENUECITY,
    VENUESTATE,
    VENUESEATS,
    event_date,
    event_day,
    event_WEEK,
    event_month,
    event_QTR,
    event_YEAR,
    event_HOLIDAY,
    s.USERNAME as Seller_USERNAME,
    s.FIRSTNAME as Seller_FIRSTNAME,
    s.LASTNAME as Seller_LASTNAME,
    s.CITY as Seller_City,
    s.STATE as Seller_STATE,
    EMAIL as Seller_EMAIL, 
    PHONE as Seller_PHONE,
    LIKESPORTS as Seller_LIKESPORTS,
    liketheatre as Seller_liketheatre,
    likeconcerts as Seller_likeconcerts,
    likejazz as Seller_likejazz,
    likeclassical as Seller_likeclassical,
    likeopera as Seller_likeopera,
    likerock as Seller_likerock,
    likevegas as Seller_likevegas,
    likebroadway as Seller_likebroadway
    FROM {{ ref('stg_listings') }} l
    join {{ ref('event_mart') }} e
    on l.EVENTID = e.EVENTID
    join {{ ref('stg_date') }}  d
    on e.DATEID = d.DATEID
    join {{ ref('stg_users') }}  s
    on l.SELLERID = s.USERID
)
select *
from listings_mart;