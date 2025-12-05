SELECT top(100)
	[Waybill],
	[Branch],
	[Delivery Man], 
	[Assigned Time], 
	[Completed Time],
	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) / 60 as varchar), 2)
	+ ':' +
	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) % 60 as varchar), 2)
	as HoursMinutesDifferencek	,
	CASE 
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) <= 5 then 'Within 5 Min'
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 5 AND 10  then 'Between 5 & 10 Min'
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 10 AND 15  then 'Between 10 & 15 Min'
	--WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) > 15  then
	ELSE 'Above 15 Min'
	END AS Min_Diff
FROM
[Sep 25].[dbo].[14 Sep Deli]
WHERE Status = 'Completed'
	AND Branch NOT LIKE 'YGN-*'