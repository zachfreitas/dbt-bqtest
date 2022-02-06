with event as (
    
    select 
        EVENTID,
        VENUEID,
        CATID,
        DATEID,
        EVENTNAME,
        STARTTIME

    from {{ source('ticket_database', 'allevents') }}
)

select * from event