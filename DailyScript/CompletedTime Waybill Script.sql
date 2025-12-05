select cast ([To Delivery Date] as Date) as Delivery_Date,[Waybill],
[Branch],[Delivery Man],[Completed Time],Status,
case
when cast ([Completed Time] as time)<'8:00:00' then 'Before 8 AM'
when cast ([Completed Time] as time) between '8:00:00' and '17:00:00' then 'Between 8 AM & 5 PM'
when cast ([Completed Time] as time) between '17:00:00' and '18:00:00' then 'Between 5 PM & 6 PM'
when cast ([Completed Time] as time)>'18:00:00' then 'After 6 PM'
end as Completed_Status
,count(*) as Total
from [Sep 25].[dbo].[3 Sep Deli]
where
cast ([Completed Time] as time) < '8:00:00'
AND
[Status] = 'Completed' 
--or [Status] ='Cancelled' or [Status] ='Reattempted' 
and [Branch] not like 'YGN%'
group by cast ([To Delivery Date] as Date),
[Branch],[Delivery Man],[Completed Time],[Waybill],
[Status],cast([Completed Time] as Date), cast ([Completed Time] as time)
order by cast ([To Delivery Date] as Date) asc