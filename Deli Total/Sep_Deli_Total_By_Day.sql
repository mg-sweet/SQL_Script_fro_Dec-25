WITH CTE_DeliCombine AS (
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[1 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[2 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[3 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[4 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[5 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[8 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[9 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[10 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[11 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[12 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[13 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[14 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[15 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[16 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[17 Oct Deli] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[18 Oct Deli] UNION ALL
SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[19 Delivery] UNION ALL SELECT [To Delivery Date],[Branch], [Delivery Man], [Status] FROM [Oct 25].[dbo].[20 Oct Deli]
)
SELECT
	[To Delivery Date]
	,[Branch]
	,[Delivery Man]
	,Count(*) AS Total
	FROM
	CTE_DeliCombine
	WHERE
		Status = 'Completed'
	AND
		Branch NOT LIKE 'YGN-%'
	AND
		[Delivery Man] = 'LinLinZaw'
	GROUP BY 
	[Branch]
	,[Delivery Man]
	,[To Delivery Date]