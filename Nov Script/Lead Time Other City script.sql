WITH CTE_IB as ( 
SELECT [Date],[Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status],[From City],[To City]
FROM [10.Oct_Data_25].[dbo].[IB_MDY]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Date],[Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status],[From City],[To City]
FROM [10.Oct_Data_25].[dbo].[IB_NPW]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Date],[Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status],[From City],[To City]
FROM [10.Oct_Data_25].[dbo].[IB_YGN]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Date],[Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status],[From City],[To City]
FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
where [Consignment Status]='Completed'
)
--UNION ALL	
--select  [Date],[Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status],[From City],[To City]
--FROM [10.Oct_Data_25].[dbo].NovDeliCombine
--where [Consignment Status]='Completed'		
--)
select  [Date],[Waybill No#],[From City],[To City],
try_convert (date,[Delivery Completion Datetime]) as Completed_Date,
[Consignment Status],
DATEDIFF(day,[Date],try_convert (Date,[Delivery Completion Datetime])) as Lead_Time
--COUNT(*) AS TOTAL
from CTE_IB 

where
[Date] BETWEEN '2025-10-01' AND '2025-10-31'
AND
[From City] in (
-- SGG Region
	'Monywa','Sagaing','Shwebo','Myinmu','Kalay')
--AND
--[To City] = 'Amarapura'
and [Consignment Status]='completed'




--Lead time 
with CTE_OB as (
select 
	[Date],[Waybill No#],[From City],[To City],[Destination Branch]
	from [10.Oct_Data_25].dbo.[OB_MDY]
union
select 
	[Date],[Waybill No#],[From City],[To City],[Destination Branch]
from [10.Oct_Data_25].dbo.[OB_NPW]
union 
select 
	[Date],[Waybill No#],[From City],[To City],[Destination Branch]
from [10.Oct_Data_25].dbo.[OB_REG]
union 
select
	[Date],[Waybill No#],[From City],[To City],[Destination Branch]
from [10.Oct_Data_25].dbo.[OB_YGN_UPDATE]
)
SELECT OB.[Date],OB.[Waybill No#],OB.[From City],OB.[To City],
try_convert (date,DELI.[Delivery Completion Datetime]) as Completed_Date,
DELI.[Consignment Status],
DATEDIFF(day,OB.[Date],try_convert (Date,DELI.[Delivery Completion Datetime])) as Lead_Time
FROM
CTE_OB OB
left JOIN 
[10.Oct_Data_25].[dbo].[NovDeliCombine] DELI ON OB.[Waybill No#] = DELI.[Waybill No#]
WHERE
OB.[From City] in (
-- SGG Region
	'Monywa','Sagaing','Shwebo','Myinmu','Kalay'
	)
AND
DELI.[Consignment Status]='Completed'


