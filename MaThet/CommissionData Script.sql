with cte_JulyData as (
select * from [MaThet].[dbo].[MayLowerCommissionData]
UNION ALL
select * from [MaThet].[dbo].MayUpperCommissionData
)
SELECT Date as OB_Date, [Waybill No#],[From City],[Origin Branch],[To City],[Destination Branch], [Delivery Completion Datetime],
[Consignment Status],
DATEDIFF(DAY, Date,[Delivery Completion Datetime]) as DateDiff
FROM
cte_JulyData
WHERE [Consignment Status] = 'Completed'