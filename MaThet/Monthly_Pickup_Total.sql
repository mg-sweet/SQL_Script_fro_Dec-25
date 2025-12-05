WITH CTE_DELI AS (
	SELECT * FROM [Aug_Data_25].[dbo].[OB_REG]
	UNION ALL
	SELECT * FROM [Aug_Data_25].[dbo].[OB_MDY]
	UNION ALL
	SELECT * FROM [Aug_Data_25].[dbo].[OB_NPW]
	UNION ALL
	SELECT * FROM [Aug_Data_25].[dbo].[OB_YGN]
	)
	
select 
--[From City]
'August' as Month,
 [CTE_DELI].[Origin Branch]
,[CTE_DELI].[Pickupman]
,COUNT(*) AS Total
FROM
CTE_DELI
WHERE [Pickupman] is not null
	AND
	[Origin Branch] NOT LIKE 'YGN-%'
GROUP BY [Origin Branch], [Pickupman]