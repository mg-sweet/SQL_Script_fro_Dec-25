WITH RankedRows AS (
    SELECT 
        [To Delivery Date],
        [Waybill],
        [Completed Time],
        [Status],
        [Delivery Man],
        ROW_NUMBER() OVER (
            PARTITION BY [Waybill]
            ORDER BY 
                CASE WHEN [Status] = 'Completed' THEN 1 ELSE 2 END,
                [Waybill] ASC
        ) AS RN
    FROM [Oct 25].[dbo].[10 Oct Deli]
)
DELETE T
FROM [Oct 25].[dbo].[9 Oct Deli] AS T
JOIN RankedRows AS R
    ON T.[Waybill] = R.[Waybill]
   AND T.[Completed Time] = R.[Completed Time]
   AND T.[Status] = R.[Status]
   AND T.[Delivery Man] = R.[Delivery Man]
WHERE R.RN > 1;
