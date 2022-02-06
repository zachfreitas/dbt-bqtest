with category as (
    
    select 
        CATID,
        CATGROUP,
        CATNAME,
        CATDESC
        
    from {{ source('ticket_database', 'category') }}
    where CATID is not null
)

select * from category