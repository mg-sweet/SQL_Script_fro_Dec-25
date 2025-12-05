select [Waybill] ,CAST ([Created on] as date) as Created_Date, cast ([To Delivery Date] as Date) as Delivery_Date,
[Branch],[Delivery Man],
cast([Completed Time] as Date) as Complete_Date,
[Status], datediff(day,[Created on],TRY_CONVERT(date, [Assigned Time])) as DateDiff,count(*) as Total
from [JulyData].[dbo].[30 July Deli]
where [Status] = 'Completed' 
or [Status] ='Cancelled' or [Status] ='Reattempted' 
group by cast ([To Delivery Date] as Date),
[Branch],[Delivery Man],
[Status],cast([Completed Time] as Date),
[Waybill] ,CAST ([Created on] as date),
datediff(day,[Created on],TRY_CONVERT(date, [Assigned Time]))
order by cast ([To Delivery Date] as Date) asc

--select  [Waybill],[Created on], [Assigned Time] , datediff(day,[Created on],TRY_CONVERT(date, [Assigned Time])) as DateDiff
--from
--[JulyData].[dbo].[29 July Deli]
--where [Status] = 'Reattempted'
