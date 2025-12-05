with CTE_Table as (
SELECT * FROM Jun_Data.[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Jun_Data.[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Jun_Data.[dbo].[IB_REG]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Jun_Data.[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'Jun' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] like 'HAN'
	AND
	[Deliveryman] = 'AungYeKyawHAN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc



with CTE_Table as (
SELECT * FROM July_Data.[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM July_Data.[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM July_Data.[dbo].[IB_REG]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM July_Data.[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'July' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] = 'TTN'
	--AND
	--[Deliveryman] = 'LaMinKhant‌TTN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc



with CTE_Table as (
SELECT * FROM Sep_Data.[dbo].[IB_MDY]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Sep_Data.[dbo].[IB_NPW]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Sep_Data.[dbo].[IB_REG]
WHERE [Consignment Status]='Completed'
UNION 
SELECT * FROM Sep_Data.[dbo].[IB_YGN]
WHERE [Consignment Status]='Completed'
)
SELECT 'Sep' as Month,[Destination Branch],[Deliveryman],
[Consignment Status],count(*) as Total
FROM CTE_Table
WHERE [Destination Branch] IN ('MYK','KTG','MWD')
	--AND
	--[Deliveryman] = 'LaMinKhant‌TTN'
GROUP BY [Destination Branch],[Deliveryman],[Consignment Status]
ORDER BY [Destination Branch] asc