select Month([Pickup Date]) as Month,[Branch/Name],[Pickup Man/Name],
[Status],
SUM([Waybills]) as Total_Bill
from [Aug_Data].[dbo].[29 Aug Pickup]
where
--[Status]='Completed' 
--and 
[Branch/Name] not like 'YGN%'
group by  Month([Pickup Date]),[Pickup Man/Name],[Branch/Name],[Status]
order by [Branch/Name] asc