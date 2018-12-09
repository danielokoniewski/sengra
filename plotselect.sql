.mode csv
.output temperaturdata/plotdata.csv

select
    dt
  , ifnull([s1], 0) as [s1]
  , ifnull([s2], 0) as [s2]
  , ifnull([s3], 0) as [s3]
from (
select 
   strftime('%Y-%m-%d %H:%M', measuretime) as dt
   --strftime('%Y-%m-%d %H:%M', measuretime) as dt
, max(case when sensor = 1 then value_num else null end ) as [s1]
, max(case when sensor = 2 then value_num else null end ) as [s2]
, max(case when sensor = 3 then value_num else null end ) as [s3]
from sensordata s
where measuretime > date('now', '-1 day')
group by dt
) a
order by dt
