with CTE_OB as (
select * from [11.Nov_Data_25].[dbo].[OB_MDY]
union
select * from [11.Nov_Data_25].[dbo].[OB_NPW]
union 
select * from [11.Nov_Data_25].[dbo].[OB_REG]
union 
select * from [11.Nov_Data_25].[dbo].[OB_YGN]),
CTE_IB as ( 
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
 FROM [11.Nov_Data_25].[dbo].[IB_MDY]
--where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [11.Nov_Data_25].[dbo].[IB_NPW]
--where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [11.Nov_Data_25].[dbo].[IB_REG]
--where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [11.Nov_Data_25].[dbo].[IB_YGN]
--where [Consignment Status]='Completed'	
UNION ALL	
select  [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
from [11.Nov_Data_25].[dbo].[1_10 Dec Deli]
--where [Consignment Status]='Completed'	
)
select O.[Date],O.[Waybill No#],O.[From City],O.[To City],
try_convert (date,I.[Delivery Completion Datetime]) as Completed_Date,
I.[Consignment Status],
DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) as Lead_Time,
case
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 0 then '0 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 1 then '1 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 2 then '2 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 3 then '3 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 4 then '4 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 5 then '5 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 6 then '6 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 7 then '7 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 8 then '8 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 9 then '9 Day'
	when DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) = 10 then '10 Day'
	else 'Over 10 Day' End as By_Day
from CTE_OB O 
left join CTE_IB I on O.[Waybill No#]=I.[Waybill No#]
where 
	O.[To City] not in
	('Mandalay','Naypyidaw',
	'Yangon','Taikkyi','Twantay','Hmawbi','Kawhmu','Hlegu','Thongwa','Kyauktan','Kungyangone','Ahpyauk',
	'Mandalay','Patheingyi','Amarapura','Myintnge','Ohn Chaw',
	'Tharwutti')

--and I.[Consignment Status]='Completed'
order by O.[Date] asc