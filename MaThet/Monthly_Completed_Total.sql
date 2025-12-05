WITH CTE_DELI AS (
	SELECT * FROM [10.Oct_Data_25].[dbo].[IB_MDY]
	where [Consignment Status]='completed'
	UNION ALL
	SELECT * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
	where [Consignment Status]='completed'
	UNION ALL
	SELECT * FROM [10.Oct_Data_25].[dbo].[IB_YGN]
	where [Consignment Status]='completed'
	UNION ALL
	SELECT * FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
	where [Consignment Status]='completed'
	)
select 
	--[To City]
	'Oct' as Month,
	[Destination Branch]
	,[Deliveryman]
	,[Consignment Status]
	,Count(*) as Total
from
CTE_DELI
where
[Consignment Status] = 'Completed'
AND
[Destination Branch] NOT LIKE 'YGN-%'
GROUP BY 
	[Deliveryman]
	,[Destination Branch]
	,[Consignment Status]
	,[To City]
	--ORDER BY [To City]