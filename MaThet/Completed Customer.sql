select cast ([To Delivery Date] as Date) as Delivery_Date,
[Branch],[Delivery Man],
--substring ([Sender Internal Reference],1,2) as [Customer Type],
case
when SUBSTRING([Sender/Internal Reference], 1, 1) = 'I' then 'I'
when SUBSTRING([Sender/Internal Reference], 1, 1) = 'E' then 'E'
when SUBSTRING([Sender/Internal Reference], 1, 2) = 'BP' then 'BP'
WHEN SUBSTRING([Sender/Internal Reference], 1, 2) = 'PU' then 'PUB'
WHEN SUBSTRING([Sender/Internal Reference], 1, 2) = 'CC' then 'CC'
WHEN [Sender/Internal Reference] IS NULL THEN 'I'
when SUBSTRING([Sender/Internal Reference], 1, 1) = 'C' THEN 'I'
WHEN SUBSTRING([Sender/Internal Reference], 1, 2) = 'PT' THEN 'E'
END AS Customer_Type,
cast([Completed Time] as Date) as Complete_Date,
[Status],count(*) as Total
from [August].[dbo].[21 Aug Deli]
where [Status] ='Completed'
or [Status] ='Cancelled' or [Status] ='Reattempted' 
group by cast ([To Delivery Date] as Date),
[Branch],[Delivery Man],
[Sender/Internal Reference],
[Status],cast([Completed Time] as Date) 
order by [Branch] asc