SELECT 
    TRY_CAST([To Delivery Date] AS DATE) AS Delivery_Date,
    [Branch],
    [Delivery Man],
    [Status],

    TRY_CAST([Completed Time] AS DATETIME) AS Completed_Time,

    CASE
        WHEN TRY_CAST([Completed Time] AS TIME) < '08:00:00' THEN 'Before 8 AM'
        WHEN TRY_CAST([Completed Time] AS TIME) BETWEEN '08:00:00' AND '17:00:00' THEN 'Between 8 AM & 5 PM'
        WHEN TRY_CAST([Completed Time] AS TIME) BETWEEN '17:00:00' AND '18:00:00' THEN 'Between 5 PM & 6 PM'
        WHEN TRY_CAST([Completed Time] AS TIME) > '18:00:00' THEN 'After 6 PM'
        ELSE 'Unknown'
    END AS Completed_Status,

    -- Duration (HH:MM format)
    RIGHT('0' + CAST(DATEDIFF(MINUTE, 
        TRY_CAST([Assigned Time] AS DATETIME), 
        TRY_CAST([Completed Time] AS DATETIME)) / 60 AS VARCHAR), 2)
    + ':' +
    RIGHT('0' + CAST(DATEDIFF(MINUTE, 
        TRY_CAST([Assigned Time] AS DATETIME), 
        TRY_CAST([Completed Time] AS DATETIME)) % 60 AS VARCHAR), 2)
    AS HoursMinutesDifference,

    -- Duration category
    CASE 
        WHEN DATEDIFF(MINUTE, TRY_CAST([Assigned Time] AS DATETIME), TRY_CAST([Completed Time] AS DATETIME)) <= 5 THEN 'Within 5 Min'
        WHEN DATEDIFF(MINUTE, TRY_CAST([Assigned Time] AS DATETIME), TRY_CAST([Completed Time] AS DATETIME)) BETWEEN 6 AND 10 THEN 'Between 6 & 10 Min'
        WHEN DATEDIFF(MINUTE, TRY_CAST([Assigned Time] AS DATETIME), TRY_CAST([Completed Time] AS DATETIME)) BETWEEN 11 AND 15 THEN 'Between 11 & 15 Min'
        ELSE 'Above 15 Min'
    END AS Min_Diff

FROM [Oct 25].[dbo].[9 Oct Deli]
WHERE 
    [Status] = 'Completed'
    AND [Branch] NOT LIKE 'YGN%'
    AND TRY_CAST([To Delivery Date] AS DATE) IS NOT NULL
    AND TRY_CAST([Completed Time] AS DATETIME) IS NOT NULL
    AND TRY_CAST([Assigned Time] AS DATETIME) IS NOT NULL

GROUP BY 
    TRY_CAST([To Delivery Date] AS DATE),
    [Branch],
    [Delivery Man],
    [Status],
    TRY_CAST([Completed Time] AS DATETIME),
    TRY_CAST([Completed Time] AS TIME),
    [Assigned Time]

ORDER BY 
    TRY_CAST([To Delivery Date] AS DATE) ASC
