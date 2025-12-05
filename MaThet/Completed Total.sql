WITH CTE_Complete as (
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
SELECT 'Oct' as Month, [Destination Branch], [Consignment Status], COUNT(*) AS TOTAL
FROM
CTE_Complete
GROUP BY [Destination Branch], [Consignment Status]