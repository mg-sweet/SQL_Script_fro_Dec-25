with CTE_OB as (
select * from [OB_MDY]
union
select * from [OB_NPW]
union 
select * from [OB_REG]
union 
select * from [OB_YGN]),
CTE_IB as ( 
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
 FROM [IB_MDY]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [IB_NPW]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [IB_REG]
where [Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
FROM [IB_YGN]
where [Consignment Status]='Completed'	
UNION ALL	
select  [Waybill No#],[Destination Branch],
[Delivery Completion Datetime],[Consignment Status]
from [dbo].[1_10 July Deli]
where [Consignment Status]='Completed'		
)
select O.[Date],O.[Waybill No#],O.[From City],O.[To City],
try_convert (date,I.[Delivery Completion Datetime]) as Completed_Date,
I.[Consignment Status],
DATEDIFF(day,O.[Date],try_convert (Date,I.[Delivery Completion Datetime])) as Lead_Time
from CTE_OB O 
left join CTE_IB I on O.[Waybill No#]=I.[Waybill No#]
where O.[From City] in
--('Yangon','Taikkyi','Twantay','Hmawbi','Kawhmu','Hlegu','Thongwa','Kyauktan','Kungyangone','Ahpyauk',
--'Mandalay','Patheingyi','Amarapura','Myintnge','Ohn Chaw',
--'Naypyidaw','Tharwutti','Taunggyi') 
--('Yangon','Taikkyi','Twantay','Hmawbi','Kawhmu','Hlegu','Thongwa','Kyauktan','Kungyangone','Ahpyauk')
('Mandalay','Patheingyi','Amarapura','Myintnge','Ohn Chaw',
'Naypyidaw','Tharwutti','Taunggyi') 
and I.[Consignment Status]='Completed'
order by O.[Date] asc