with users as (
    
    select 
        USERID,
        USERNAME,
        FIRSTNAME,
        LASTNAME,
        CITY,
        STATE,
        EMAIL,
        PHONE,
        LIKESPORTS,
        liketheatre,
        likeconcerts,
        likejazz,
        likeclassical,
        likeopera,
        likerock,
        likevegas,
        likebroadway
        
    from {{ source('ticket_database', 'users') }}
    where USERID is not null
)

select * from users