with deli_completed as (
select * from [1.Jan 26].[dbo].[4 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[5 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[6 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[7 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[8 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[9 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[10 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[11 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[12 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[13 Jan Deli] where Status = 'completed' union all
select * from [1.Jan 26].[dbo].[14 Jan Deli] where Status = 'completed'
)
SELECT
	--[Waybill],
	--[Branch]
	[To Delivery Date],
	COUNT(*) as Total
FROM
	deli_completed
group by [To Delivery Date]


-- OB Rate
with OB_Total as (
select * from [1.Jan 26].[dbo].[4 Jan OB] union all
select * from [1.Jan 26].[dbo].[5 Jan OB] union all
select * from [1.Jan 26].[dbo].[6 Jan OB] union all
select * from [1.Jan 26].[dbo].[7 Jan OB] union all
select * from [1.Jan 26].[dbo].[8 Jan OB] union all
select * from [1.Jan 26].[dbo].[9 Jan OB] union all
select * from [1.Jan 26].[dbo].[10 Jan OB] union all
select * from [1.Jan 26].[dbo].[11 Jan OB] union all
select * from [1.Jan 26].[dbo].[12 Jan OB] union all
select * from [1.Jan 26].[dbo].[13 Jan OB] union all
select * from [1.Jan 26].[dbo].[14 Jan OB]
)
SELECT
	--[Waybill],
	--[Branch]
	--[Waybill Date],
	--COUNT(*) as Total
	*
FROM
	OB_Total
where [Waybill Date] is null
--group by [Waybill Date]

