with category as (
    
    select 
        CATID,
        CATGROUP,
        CATNAME,
        CATDESC
        
    from {{ source('ticket_database', 'category') }}
)

select * from category