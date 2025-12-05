select cast ([Pickup Date] as Date) as Pickup_Date,
[Branch],[Pickup Man],
cast([Completed Time] as Date) as Complete_Date,
[Status],count(*) as Total
from [dbo].[26 Aug Pickup]
where [Status] = 'Completed' AND
[Branch] NOT LIKE ('YGN-%') AND
[Branch] NOT LIKE ('MDY-%') AND
[Branch] NOT LIKE ('NPW-%') 

--or [Status] ='Cancelled' or [Status] ='Reattempted' 
group by cast ([Pickup Date] as Date),
[Branch],[Pickup Man],
[Status],cast([Completed Time] as Date) 
order by cast ([Pickup Date] as Date) asc