with CTE_OB as (
select [Date],[Customer Reference No#],Customer,[From City],[Service],[Waybill No#] from [10.Oct_Data_25].[dbo].[OB_MDY]
union all
select [Date],[Customer Reference No#],Customer,[From City],[Service],[Waybill No#] from [10.Oct_Data_25].[dbo].[OB_NPW]
union all
select [Date],[Customer Reference No#],Customer,[From City],[Service],[Waybill No#] from [10.Oct_Data_25].[dbo].[OB_REG]
union all
select [Date],[Customer Reference No#],Customer,[From City],[Service],[Waybill No#] from [10.Oct_Data_25].[dbo].[OB_YGN_UPDATE]
)
select
Customer
, CustomerType =
case
when [Customer Reference No#] IS null then 'I_Code'
else [Customer Reference No#]
end
,COUNT(*) as Cus_total

from
CTE_OB
where [From City] = 'thayed'
--(
--[Customer Reference No#] like 'bp%'
--or
--[Customer Reference No#] is null
--)
group by [Customer Reference No#],Customer,[From City],[Service]