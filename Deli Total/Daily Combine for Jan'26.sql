WITH CTE_OB AS	(
SELECT * FROM [1.Jan 26].[dbo].[4 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[5 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[6 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[7 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[8 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[9 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[10 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[11 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[12 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[13 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[14 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[15 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[16 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[17 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[18 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[19 Jan OB] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[20 Jan OB] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[21 Jan OB]
)
SELECT
	CAST([Waybill Date] as date) AS Date,
	COUNT(*) as Total
FROM
	CTE_OB
--where [Waybill Date] is null
GROUP BY [Waybill Date]
order by [Waybill Date]


WITH CTE_OB AS	(
SELECT * FROM [1.Jan 26].[dbo].[4 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[5 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[6 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[7 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[8 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[9 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[10 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[11 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[12 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[13 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[14 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[15 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[16 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[17 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[18 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[19 Jan Deli] UNION ALL
SELECT * FROM [1.Jan 26].[dbo].[20 Jan Deli] UNION ALL SELECT * FROM [1.Jan 26].[dbo].[21 Jan Deli]
)