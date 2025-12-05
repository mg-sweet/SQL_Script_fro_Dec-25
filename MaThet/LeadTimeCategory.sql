with CTE_OB as (
select * from Sep_Data.[dbo].[OB_MDY]
union 
select * from Sep_Data.[dbo].[OB_NPW]
union 
select * from Sep_Data.[dbo].[OB_YGN]
union 
select * from Sep_Data.[dbo].[OB_REG]),
CTE_IB as ( 
SELECT [Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status]
FROM 
	Sep_Data.[dbo].[IB_MDY]
where
	[Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status]
FROM 
	Sep_Data.[dbo].[IB_NPW]
where
	[Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status]
FROM
	Sep_Data.[dbo].[IB_YGN]
where
	[Consignment Status]='Completed'
UNION ALL
SELECT [Waybill No#],[Destination Branch],[Delivery Completion Datetime],[Consignment Status]
FROM
	Sep_Data.[dbo].[IB_REG]
where
	[Consignment Status]='Completed'	
)
select 'September' as Month,
	TRY_CONVERT(DATE,O.[Date]) AS OB_Date,
	I.[Waybill No#],
	O.[From City], [Origin Branch],
	O.[To City], I.[Destination Branch],
	try_convert (date,I.[Delivery Completion Datetime]) as Completed_Date,
	I.[Consignment Status],
	DATEDIFF(day,TRY_CONVERT(DATE,O.[Date]),try_convert (Date,I.[Delivery Completion Datetime])) as Lead_Time
	--CASE 
	--    WHEN DATEDIFF(day, [Date], [Delivery Completion Datetime]) BETWEEN 1 AND 30 THEN 'Day ' + CAST(DATEDIFF(day, [Date], [Delivery Completion Datetime]) as varchar)
	--    ELSE 'Lead Time > 30 Days'
	--  END AS LeadTimeCategory

	from CTE_OB O 
	left join CTE_IB I on O.[Waybill No#]=I.[Waybill No#]
	WHERE 
	I.[Consignment Status]='Completed'
	and
	--O.[From City] = 'Mandalay'
	O.[From City] = 'Yangon'
	and
	O.[To City] IN
		(
		'Bago','Pathein','Hpa-an','Mawlamyine','Taunggyi','Mandalay','Naypyidaw','Pyin Oo Lwin'
		)
	order by O.[Date] asc