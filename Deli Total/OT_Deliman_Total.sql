SELECT
	[Branch]
	,[Delivery Man]
	,[To Delivery Date] as [Completed Date]
	,[Status]
	,Count(*) as [Total Completed]
FROM
	[11.Nov 25].[dbo].[4 Nov Deli]
WHERE
	Branch = 'YGN'
AND
	Status = 'completed'
GROUP BY [Branch]
	,[Delivery Man]
	,[To Delivery Date]
	,[Status]