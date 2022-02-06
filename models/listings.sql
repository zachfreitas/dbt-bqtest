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
)

select * from listings