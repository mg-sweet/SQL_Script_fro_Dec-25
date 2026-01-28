with CTE_Table as (
SELECT * FROM [9.Sep_Data_25].[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [9.Sep_Data_25].[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [9.Sep_Data_25].[dbo].[IB_REG]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [9.Sep_Data_25].[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'Sep' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] = 'ysg'
	--AND
	--[Deliveryman] = 'AungYeKyawHAN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc



with CTE_Table as (
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'Oct' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] = 'ysg'
	--AND
	--[Deliveryman] = 'LaMinKhant‌TTN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc



with CTE_Table as (
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_REG]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'Nov' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] = 'ysg'
	--AND
	--[Deliveryman] = 'LaMinKhant‌TTN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc