with sales as (
    
    select 
        SALESID,
        LISTID,
        SELLERID,
        BUYERID,
        EVENTID,
        DATEID,
        QTYSOLD,
        PRICEPAID,
        COMMISSION,
        SALETIME
        
    from {{ source('ticket_database', 'sales') }}
)

select * from sales