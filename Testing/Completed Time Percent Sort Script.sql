WITH BaseData AS (
    SELECT 
        [Branch],
        [Delivery Man],
        CAST([To Delivery Date] AS date) AS Delivery_Date,
        CAST([Completed Time] AS time) AS CompletedTime,
        [Status],
        DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) AS MinDiff,
        CASE
            WHEN CAST([Completed Time] AS time) < '08:00:00' THEN 'Before 8 AM'
            WHEN CAST([Completed Time] AS time) BETWEEN '08:00:00' AND '17:00:00' THEN 'Between 8 AM & 5 PM'
            WHEN CAST([Completed Time] AS time) BETWEEN '17:00:00' AND '18:00:00' THEN 'Between 5 PM & 6 PM'
            WHEN CAST([Completed Time] AS time) > '18:00:00' THEN 'After 6 PM'
        END AS Completed_Status,
        CASE 
            WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) <= 5 THEN 'Within 5 Min'
            WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 6 AND 10 THEN 'Between 6 & 10 Min'
            WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 11 AND 15 THEN 'Between 11 & 15 Min'
            ELSE 'Above 15 Min'
        END AS Min_Diff_Group
    FROM [1.Jan 26].[dbo].[26 Jan Deli]
    WHERE [Status] = 'Completed'
      AND [Branch] NOT LIKE 'YGN%'

)

-- PIVOT for Time Ranges
, TimePivot AS (
    SELECT
        Branch,
        [Delivery Man],
        ISNULL([Before 8 AM], 0) AS [Before 8 AM],
        ISNULL([Between 8 AM & 5 PM], 0) AS [Between 8 AM & 5 PM],
        ISNULL([Between 5 PM & 6 PM], 0) AS [Between 5 PM & 6 PM],
        ISNULL([After 6 PM], 0) AS [After 6 PM],
        ISNULL([Before 8 AM],0)+ISNULL([Between 8 AM & 5 PM],0)+ISNULL([Between 5 PM & 6 PM],0)+ISNULL([After 6 PM],0) AS [Grand Total]
    FROM (
        SELECT Branch, [Delivery Man], Completed_Status
        FROM BaseData
    ) AS src
    PIVOT (
        COUNT(Completed_Status)
        FOR Completed_Status IN ([Before 8 AM],[Between 8 AM & 5 PM],[Between 5 PM & 6 PM],[After 6 PM])
    ) AS pvt
)

-- PIVOT for Minute Difference
, MinutePivot AS (
    SELECT 
        Branch,
        [Delivery Man],
        ISNULL([Within 5 Min], 0) AS [Within 5 Min],
        ISNULL([Between 6 & 10 Min], 0) AS [Between 6 & 10 Min],
        ISNULL([Between 11 & 15 Min], 0) AS [Between 11 & 15 Min],
        ISNULL([Above 15 Min], 0) AS [Above 15 Min],
        ISNULL([Within 5 Min],0)+ISNULL([Between 6 & 10 Min],0)+ISNULL([Between 11 & 15 Min],0)+ISNULL([Above 15 Min],0) AS [Grand Total Min]
    FROM (
        SELECT Branch, [Delivery Man], Min_Diff_Group
        FROM BaseData
    ) AS src
    PIVOT (
        COUNT(Min_Diff_Group)
        FOR Min_Diff_Group IN ([Within 5 Min],[Between 6 & 10 Min],[Between 11 & 15 Min],[Above 15 Min])
    ) AS pvt
)

-- Final Join & % Calculation
SELECT 
    T.Branch,
    T.[Delivery Man],
    T.[Before 8 AM],
    T.[Between 8 AM & 5 PM],
    T.[Between 5 PM & 6 PM],
    T.[After 6 PM],
    T.[Grand Total],
    M.[Within 5 Min],
    M.[Between 6 & 10 Min],
    M.[Between 11 & 15 Min],
    M.[Above 15 Min],
    M.[Grand Total Min],
    -- Percentages (rounded)
    CAST(ROUND(M.[Within 5 Min]*100.0/M.[Grand Total Min],0) AS varchar) + '%' AS [Within 5 Min %],
    CAST(ROUND(M.[Between 6 & 10 Min]*100.0/M.[Grand Total Min],0) AS varchar) + '%' AS [Between 6 & 10 Min %],
    CAST(ROUND(M.[Between 11 & 15 Min]*100.0/M.[Grand Total Min],0) AS varchar) + '%' AS [Between 11 & 15 Min %],
    CAST(ROUND(M.[Above 15 Min]*100.0/M.[Grand Total Min],0) AS varchar) + '%' AS [Above 15 Min %],
    '100%' AS [Total %]
FROM TimePivot AS T
INNER JOIN MinutePivot AS M
    ON T.Branch = M.Branch AND T.[Delivery Man] = M.[Delivery Man]
ORDER BY T.Branch, T.[Delivery Man];