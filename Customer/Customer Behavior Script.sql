WITH OB	AS (
SELECT * FROM [11.Nov_Data_25].[dbo].[OB_MDY]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[OB_NPW]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[OB_REG]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[OB_YGN]

),
IB AS (
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_MDY]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_NPW]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_REG]
UNION ALL
SELECT * FROM [11.Nov_Data_25].[dbo].[IB_YGN]
)
SELECT
	OB.[Date],
	OB.[Customer Reference No#],
	OB.[Customer],
	OB.[From City],
	OB.[To City],
	OB.[Waybill No#],
	OB.[Service Type],
	IB.[Consignment Status]
FROM
	OB
LEFT JOIN IB ON OB.[Waybill No#] = IB.[Waybill No#]
--WHERE
	--IB.[Consignment Status] = 'completed'