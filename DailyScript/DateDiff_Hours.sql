SELECT 
	[Waybill],
	[Branch],
	[Delivery Man], 
	[Assigned Time], 
	[Completed Time],
	--DATEDIFF(hh, [Assigned Time], [Completed Time]) as Hours_Different
	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) / 60 as varchar), 2)
	+ ':' +
	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) % 60 as varchar), 2)
	as HoursMinutesDifferencek

FROM
[Sep 25].[dbo].[10 Sep Deli]
WHERE Status = 'Completed'
	AND Branch NOT LIKE 'YGN-*'

