with CTE_OB as(
select * from [11.Nov_Data_25].[dbo].[OB_MDY]
union
select * from [11.Nov_Data_25].[dbo].[OB_NPW]
union 
select * from [11.Nov_Data_25].[dbo].[OB_REG]
union 
select * from [11.Nov_Data_25].[dbo].[OB_YGN]
)
select [Date],[Waybill No#],[From City],
[Origin Branch],[Customer Reference No#],[Customer],
[To City],[Service Type],
case 
when SUBSTRING([Customer Reference No#],1,1)='I' then 'I'
when SUBSTRING([Customer Reference No#],1,1)='E' then 'E'
when SUBSTRING([Customer Reference No#],1,2)='PU' then 'PUB'
when SUBSTRING([Customer Reference No#],1,2)='PT' then 'E'
when SUBSTRING([Customer Reference No#],1,1)='B' then 'BP'
when SUBSTRING([Customer Reference No#],1,2)='CC' then 'CC'
when SUBSTRING([Customer Reference No#],1,1) is NULL then 'I'
when SUBSTRING([Customer Reference No#],1,1)='C' then 'I'
end as Customer_Type 
from CTE_OB 