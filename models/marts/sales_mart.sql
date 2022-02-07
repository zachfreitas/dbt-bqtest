with daily_sales as (
SELECT *
  FROM {{ ref('stg_sales') }} s
  left join {{ ref('stg_date') }}  d
  on s.dateid = d.dateid
)
select *
from daily_sales