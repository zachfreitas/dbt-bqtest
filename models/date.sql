with date as (
    
    select 
        DATEID,
        CALDATE,
        DAY,
        WEEK,
        MONTH,
        QTR,
        YEAR,
        HOLIDAY

    from {{ source('ticket_database', 'date') }}
    where DATEID is not null
)

select * from date