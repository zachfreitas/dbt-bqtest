with event as (
    
    select 
        EVENTID,
        VENUEID,
        CATID,
        DATEID,
        EVENTNAME,
        STARTTIME

    from {{ source('ticket_database', 'allevents') }}
    where EVENTID is not null
)

select * from event