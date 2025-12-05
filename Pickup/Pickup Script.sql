SELECT
	CONVERT(DATE, [Pickup Date]) AS [Pickup Date]
	,[Branch/Name]
	,[Customer Name/Internal Reference]
	,[Customer Name/Name]
	,[Pickup No#]
	,[Waybills]
	,[Pickup Man/Name]
	,[Status]
	,COUNT(*) AS Total_Status
FROM
	[11.Nov 25].[dbo].[Nov Pickup Up to 24]
WHERE 
		Status IN ('COMPLETED','CANCELLED')
	AND [Pickup Date] BETWEEN '2025-11-01' AND '2025-11-23'
	AND [Pickup Man/Name] IS NOT NULL
	--AND [Branch/Name] IN ('TGI','MLM')
GROUP BY
	[Pickup Date]
	,[Branch/Name]
	,[Customer Name/Internal Reference]
	,[Customer Name/Name]
	,[Pickup No#]
	,[Waybills]
	,[Pickup Man/Name]
	,[Status]