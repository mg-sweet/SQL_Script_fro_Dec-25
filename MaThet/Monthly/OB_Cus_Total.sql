with CTE_OB as (
select * from [12.Dec_Data_25].[dbo].[OB_MDY]
union all
select * from [12.Dec_Data_25].[dbo].[OB_NPW]
union all
select * from [12.Dec_Data_25].[dbo].[OB_REG]
union all
select * from [12.Dec_Data_25].[dbo].[OB_YGN]
)
select
Month([Date]) as Month
--TRY_CONVERT(DATE,[Date]) AS Month
,[From City],
case 
when SUBSTRING([Customer Reference No#],1,1)='I' then 'I'
when SUBSTRING([Customer Reference No#],1,1)='E' then 'E'
when SUBSTRING([Customer Reference No#],1,2)='PU' then 'PUB'
when SUBSTRING([Customer Reference No#],1,2)='PT' then 'E'
when SUBSTRING([Customer Reference No#],1,1)='B' then 'BP'
when SUBSTRING([Customer Reference No#],1,2)='CC' then 'CC'
when SUBSTRING([Customer Reference No#],1,1) is NULL then 'I'
when SUBSTRING([Customer Reference No#],1,1)='C' then 'I'
end as Customer_Type ,count(*) as Total
from CTE_OB
--WHERE [Customer Reference No#] IS NULL AND [Waybill No#] IS NULL
group by [Date],[From City],[Customer Reference No#]