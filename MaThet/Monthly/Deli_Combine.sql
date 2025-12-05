with CTE_Deli as(
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status] 
from 
	[11.Nov 25].[dbo].[1 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[2 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[3 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[4 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[5 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from
	[11.Nov 25].[dbo].[6 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[7 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[8 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from 
	[11.Nov 25].[dbo].[9 Nov Deli]
union all 
select [To Delivery Date],[Waybill],[Branch],[Delivery Man],
[Assigned Time],[Completed Time],[Status]
from
	[11.Nov 25].[dbo].[10 Nov Deli]
)
select [To Delivery Date], Waybill AS [Waybill No#],Branch AS [Destination Branch],[Delivery Man] AS [Deliveryman],
CAST([Assigned Time] AS DATE) AS [Delivery assigned date],CAST([Completed Time] AS DATE) AS
[Delivery Completion Datetime],[Status] AS [Consignment Status]
from CTE_Deli
