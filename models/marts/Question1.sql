--Question 1. What days were outliers for the number of ticket sales?

with daily_sales as (
SELECT d.caldate,
       sum(qtysold) as qtysold   
  FROM {{ ref('stg_sales') }} s
  left join {{ ref('stg_date') }}  d
  on s.dateid = d.dateid
  group by 1
), var_calc as (
select 
caldate
, avg(qtysold) over () as avg
, (qtysold - avg(qtysold) over ())*(qtysold - avg(qtysold) over ()) as var
from daily_sales
), CI as (
select 
max(avg) as average
, pow(sum(var)/count(caldate),0.5) as std_dev
, max(avg) + 2*(pow(sum(var)/count(caldate),0.5)) as upper_CI
, max(avg) - 2*(pow(sum(var)/count(caldate),0.5)) as lower_CI
from var_calc
)
select *
from daily_sales
where qtysold >= (select upper_CI from CI)
or qtysold <= (select lower_CI from CI);
