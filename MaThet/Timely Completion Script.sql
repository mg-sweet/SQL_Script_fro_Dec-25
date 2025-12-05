WITH CTE_IB AS (
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_MDY]
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
UNION ALL
SELECT * FROM [10.Oct_Data_25].[dbo].[IB_YGN]
)
SELECT top(100)
	[Date]
	,[Waybill No#]
	,[From City]
    ,[Origin Branch]
	,[To City]
    ,[Destination Branch]
	,[Deliveryman]
	,[Consignment Status]
	,[Delivery assigned date]
	,[Delivery Completion Datetime]
	,CAST([Delivery Completion Datetime] AS date) AS [Completetion Date]
	,CONVERT(VARCHAR(5),CAST([Delivery Completion Datetime] AS time),108) AS [Completetion Time]
	,--ROUND(
	DATEPART(HOUR, [Delivery Completion Datetime]) + DATEPART(MINUTE, [Delivery Completion Datetime]) / 60.0  AS [Hour]
	,  HourRange =
    CASE
      -- exact hour (no minutes and no seconds)
      WHEN DATEPART(MINUTE, [Delivery Completion Datetime]) = 0 
			--AND DATEPART(SECOND, [Delivery Completion Datetime]) = 0
        THEN CONCAT(
               CASE WHEN DATEPART(HOUR, [Delivery Completion Datetime]) = 0 THEN 23
                    ELSE DATEPART(HOUR, [Delivery Completion Datetime]) - 1 END,
               ' to ',
               DATEPART(HOUR, [Delivery Completion Datetime])
             )
      -- has fractional part → same-hour to next-hour
      ELSE CONCAT(DATEPART(HOUR, [Delivery Completion Datetime]), ' to ', DATEPART(HOUR, [Delivery Completion Datetime]) + 1)
    END
	,
	-- Estimate column (before 12 PM / after 12 PM)
    Estimate =
        CASE
            WHEN 
                -- Determine start hour of the range
                CASE 
                    WHEN DATEPART(MINUTE, [Delivery Completion Datetime]) = 0 AND DATEPART(SECOND, [Delivery Completion Datetime]) = 0
                    THEN CASE WHEN DATEPART(HOUR, [Delivery Completion Datetime]) = 0 THEN 23
                              ELSE DATEPART(HOUR, [Delivery Completion Datetime]) - 1 END
                    ELSE DATEPART(HOUR, [Delivery Completion Datetime])
                END
            >= 12 THEN 'After 12 PM'
            ELSE 'Before 12 PM'
        END
FROM
	CTE_IB
	where [Consignment Status]='completed'
    AND [Destination Branch] IN ('MLM','HAN','TGI','PTN','MYA','PYY','MGY','POL')
    --and [Waybill No#] = 'AAT577277'

--SELECT top(100) * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
--	where [Consignment Status]='completed'