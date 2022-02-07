with listings as (
    
    select 
        LISTID,
        SELLERID,
        EVENTID,
        DATEID,
        NUMTICKETS,
        PRICEPERTICKET,
        TOTALPRICE,
        LISTTIME
        
    from {{ source('ticket_database', 'listings') }}
    where LISTID is not null
)

select * from listings