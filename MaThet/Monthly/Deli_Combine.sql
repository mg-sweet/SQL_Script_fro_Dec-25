with CTE_Deli as(
--select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
--[Assigned Time],[Completed Time],[Status] 
--from 
--	[12.Dec 25].[dbo].[1 Dec Deli]
--union all 
--select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
--[Assigned Time],[Completed Time],[Status]
--from 
--	[12.Dec 25].[dbo].[2 Dec Deli]
--union all 
--select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
--[Assigned Time],[Completed Time],[Status]
--from 
--	[12.Dec 25].[dbo].[3 Dec Deli]
--union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[1.Jan 26].[dbo].[4 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[1.Jan 26].[dbo].[5 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from
	[1.Jan 26].[dbo].[6 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[1.Jan 26].[dbo].[7 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[1.Jan 26].[dbo].[8 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[1.Jan 26].[dbo].[9 Jan Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from
	[1.Jan 26].[dbo].[10 Jan Deli]
)
select [To Delivery Date], Waybill AS [Waybill No#],Branch AS [Destination Branch],[Delivery Man] AS [Deliveryman],
CAST([Assigned Time] AS DATE) AS [Delivery assigned date],CAST([Completed Time] AS DATE) AS
[Delivery Completion Datetime],[Status] AS [Consignment Status]
from CTE_Deli
