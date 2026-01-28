SELECT
	
	try_convert(date,[Waybill Date]) as Date,
	[Waybill No],
	[From City],
	[From City Short Code],
	--TRY_CONVERT(time(0), [Created on]) as CreatedTim,
	FORMAT([Created on], 'hh:mm:ss tt') as Created_Time,
	case
		when cast(try_convert(Time ,[Created on]) as Time) > '21:00:00' THEN 'LATE'
		--when cast(try_convert(Time ,[Created on]) as Time) < '21:00:00' THEN 'ON TIME'
		end as Remark
FROM
	[1.Jan 26].[dbo].[26 Jan OB]
WHERE
	cast(try_convert(Time ,[Created on]) as Time) > '21:00:00'
	AND [From City] <> 'yangon'