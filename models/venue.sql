with venue as (
    
    select 
        VENUEID,
        VENUENAME,
        VENUECITY,
        VENUESEATS
        
    from {{ source('ticket_database', 'venue') }}
    where VENUEID is not null
)

select * from venue