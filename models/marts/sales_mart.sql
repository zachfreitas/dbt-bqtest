with sales_mart as (
    SELECT s.SALESID,
    s.QTYSOLD,
    s.PRICEPAID,
    s.COMMISSION,
    s.SALETIME,
    d.CALDATE as sales_date,
    d.DAY as sales_day,
    d.WEEK as sales_WEEK,
    d.MONTH as sales_month,
    d.QTR as sales_QTR,
    d.YEAR as sales_YEAR,
    d.HOLIDAY as sales_HOLIDAY,
    b.USERNAME as Buyer_USERNAME,
    b.FIRSTNAME as Buyer_FIRSTNAME,
    b.LASTNAME as Buyer_LASTNAME,
    b.CITY as Buyer_City,
    b.STATE as Buyer_STATE,
    EMAIL as Buyer_EMAIL, 
    PHONE as Buyer_PHONE,
    LIKESPORTS as Buyer_LIKESPORTS,
    liketheatre as Buyer_liketheatre,
    likeconcerts as Buyer_likeconcerts,
    likejazz as Buyer_likejazz,
    likeclassical as Buyer_likeclassical,
    likeopera as Buyer_likeopera,
    likerock as Buyer_likerock,
    likevegas as Buyer_likevegas,
    likebroadway as Buyer_likebroadway
    FROM {{ ref('stg_sales') }} s
    join {{ ref('stg_date') }}  d
    on s.DATEID = d.DATEID
    join {{ ref('stg_users') }}  b
    on s.BUYERID = b.USERID
)
select *
from sales_mart