WITH CTE_IB AS (
SELECT * FROM [11.Nov 25].[dbo].[30 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[29 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[28 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[27 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[26 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[25 Nov Deli]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[24 Nov Deli]
),
CTE_OB AS (
SELECT * FROM [11.Nov 25].[dbo].[30 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[29 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[28 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[27 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[26 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[25 Nov OB]
UNION ALL
SELECT * FROM [11.Nov 25].[dbo].[24 Nov OB]
--UNION ALL
--SELECT * FROM [11.Nov 25].[dbo].[23 Nov OB]
--UNION ALL
--SELECT * FROM [11.Nov 25].[dbo].[22 Nov OB]
)
SELECT
	[Date]
	,[Waybill No]
	,[From City]
    --,[Origin Branch]
	,[To City]
    ,IB.[Branch]
	,IB.[Delivery Man]
	,IB.[Status]
	--,[Delivery assigned date]
	,[Completed Time]
	,CAST(IB.[Completed Time] AS date) AS [Completetion Date]
	,CONVERT(VARCHAR(5),CAST(IB.[Completed Time] AS time),108) AS [Completetion Time]
	,--ROUND(
	DATEPART(HOUR, IB.[Completed Time]) + DATEPART(MINUTE, IB.[Completed Time]) / 60.0  AS [Hour]
	,  HourRange =
    CASE
      -- exact hour (no minutes and no seconds)
      WHEN DATEPART(MINUTE, IB.[Completed Time]) = 0 
			--AND DATEPART(SECOND, [Delivery Completion Datetime]) = 0
        THEN CONCAT(
               CASE WHEN DATEPART(HOUR, IB.[Completed Time]) = 0 THEN 23
                    ELSE DATEPART(HOUR, IB.[Completed Time]) - 1 END,
               ' to ',
               DATEPART(HOUR, IB.[Completed Time])
             )
      -- has fractional part → same-hour to next-hour
      ELSE CONCAT(DATEPART(HOUR, IB.[Completed Time]), ' to ', DATEPART(HOUR, IB.[Completed Time]) + 1)
    END
	,
	-- Estimate column (before 12 PM / after 12 PM)
    Estimate =
        CASE
            WHEN 
                -- Determine start hour of the range
                CASE 
                    WHEN DATEPART(MINUTE, IB.[Completed Time]) = 0 AND DATEPART(SECOND, IB.[Completed Time]) = 0
                    THEN CASE WHEN DATEPART(HOUR, IB.[Completed Time]) = 0 THEN 23
                              ELSE DATEPART(HOUR, IB.[Completed Time]) - 1 END
                    ELSE DATEPART(HOUR, IB.[Completed Time])
                END
            >= 12 THEN 'After 12 PM'
            ELSE 'Before 12 PM'
        END
FROM
	CTE_IB AS IB
    RIGHT JOIN CTE_OB AS OB ON IB.[Waybill] = OB.[Waybill No] 
	where IB.[Status]='completed'
    AND 
        --IB.[Branch] IN ('MLM','HAN','TGI','PTN','MYA','PYY','MGY','POL')
        IB.[Branch] IN ('MDY','NPW','TGI','PTN','POL','MLM')
    --and [Waybill No#] = 'AAT577277'

--SELECT top(100) * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
--	where [Consignment Status]='completed'