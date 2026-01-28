WITH OB AS (
SELECT [Waybill No#],[Customer Reference No#] FROM [10.Oct_Data_25].[dbo].[OB_MDY] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [10.Oct_Data_25].[dbo].[OB_NPW] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [10.Oct_Data_25].[dbo].[OB_REG] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [10.Oct_Data_25].[dbo].[OB_YGN_UPDATE] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [11.Nov_Data_25].[dbo].[OB_MDY] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [11.Nov_Data_25].[dbo].[OB_NPW] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [11.Nov_Data_25].[dbo].[OB_REG] UNION ALL
SELECT [Waybill No#],[Customer Reference No#] FROM [11.Nov_Data_25].[dbo].[OB_YGN]
)
SELECT
	TK.[Mths],
	TK.[Waybill No],
	OB.[Customer Reference No#],
	case 
when SUBSTRING(OB.[Customer Reference No#],1,1)='I' then 'Express'
when SUBSTRING(OB.[Customer Reference No#],1,1)='E' then 'E-code'
when SUBSTRING(OB.[Customer Reference No#],1,2)='PU' then 'PUB'
when SUBSTRING(OB.[Customer Reference No#],1,2)='PT' then 'E-code'
when SUBSTRING(OB.[Customer Reference No#],1,1)='B' then 'BP'
when SUBSTRING(OB.[Customer Reference No#],1,2)='CC' then 'CC'
when SUBSTRING(OB.[Customer Reference No#],1,1) is NULL then 'Express'
when SUBSTRING(OB.[Customer Reference No#],1,1)='C' then 'Express'
end as [Service Type]
FROM OB
RIGHT JOIN [MaThet].[dbo].[Ticket Oct Nov] TK
ON OB.[Waybill No#] = TK.[Waybill No]
GROUP BY [Customer Reference No#], Mths, [Waybill No]