with freq_together as (
SELECT s1.buyerid
       , s2.buyerid
       , count(distinct s1.eventid) number_of_events
       , max(count(distinct s1.eventid)) over () as max
FROM {{ ref('stg_sales') }} s1
left join {{ ref('stg_sales') }} s2
on  s1.eventid = s2.eventid
and s1.buyerid < s2.buyerid
where s1.buyerid != s2.buyerid
group by 1,2
order by 3 DESC
)
select *
from freq_together
--where  number_of_events = max;
