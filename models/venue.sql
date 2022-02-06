with venue as (
    
    select 
        VENUEID,
        VENUENAME,
        VENUECITY,
        VENUESEATS
        
    from {{ source('ticket_database', 'venue') }}
)

select * from venue