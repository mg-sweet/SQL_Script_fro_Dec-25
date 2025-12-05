WITH CTE_IB AS (
SELECT * FROM [10.Oct_Data_25].[dbo].IB_MDY
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].IB_NPW
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].IB_REG_UPDATE
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].IB_YGN

)
SELECT
	--[Waybill No#],
	[To City]
	,[Destination Branch]
,COUNT([Destination Branch]) AS Total
FROM
CTE_IB
WHERE 
    ([To City] = 'taunggyi'      AND [Destination Branch] = 'tgi') OR
    ([To City] = 'pyin oo lwin'  AND [Destination Branch] = 'pol') OR
    ([To City] = 'hpa-an'        AND [Destination Branch] = 'han') OR
    ([To City] = 'bago'          AND [Destination Branch] = 'bgo') OR
    ([To City] = 'gyobingauk'    AND [Destination Branch] = 'gbg') OR
    ([To City] = 'pathein'       AND [Destination Branch] = 'ptn') OR
    ([To City] = 'mawlamyine'    AND [Destination Branch] = 'MLM')

			--and [Destination Branch] is not null
			--and [Consignment Status] = 'completed'
GROUP BY [Destination Branch], [To City] 