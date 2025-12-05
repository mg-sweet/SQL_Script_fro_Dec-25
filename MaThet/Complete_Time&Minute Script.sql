select cast ([To Delivery Date] as Date) as Delivery_Date,
[Branch],[Delivery Man],[Completed Time],Status,
case
when cast ([Completed Time] as time)<'8:00:00' then 'Before 8 AM'
when cast ([Completed Time] as time) between '8:00:00' and '17:00:00' then 'Between 8 AM & 5 PM'
when cast ([Completed Time] as time) between '17:00:00' and '18:00:00' then 'Between 5 PM & 6 PM'
when cast ([Completed Time] as time)>'18:00:00' then 'After 6 PM'
end as Completed_Status,
--,count(*) as Total,

--With Minute

	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) / 60 as varchar), 2)
	+ ':' +
	RIGHT('0' + CAST(DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) % 60 as varchar), 2)
	as HoursMinutesDifference,
	CASE 
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) <= 5 then 'Within 5 Min'
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 6 AND 10  then 'Between 6 & 10 Min'
	WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) BETWEEN 11 AND 15  then 'Between 11 & 15 Min'
	--WHEN DATEDIFF(MINUTE, [Assigned Time], [Completed Time]) > 15  then
	ELSE 'Above 15 Min'
	END AS Min_Diff

--End
	
	--COUNT(*) AS Total
	
from [11.Nov 25].[dbo].[12 Nov Deli]
where [Status] = 'Completed'
--or [Status] ='Cancelled' or [Status] ='Reattempted' 
and [Branch] not like 'YGN%'
--AND Branch LIKE 'MDY-%' OR Branch LIKE 'NPW-%'
group by cast ([To Delivery Date] as Date),
[Branch],[Delivery Man],[Completed Time],
[Status],cast([Completed Time] as Date), cast ([Completed Time] as time),
[Assigned Time]

order by cast ([To Delivery Date] as Date) asc