with CTE_IB as(
select * from [10.Oct_Data_25].[dbo].[IB_MDY]
union
select * from [10.Oct_Data_25].[dbo].[IB_NPW]
union 
select * from [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
union 
select * from [10.Oct_Data_25].[dbo].[IB_YGN]
)
select Month([Date]) as Month,[To City],
case 
when SUBSTRING([Customer Reference No#],1,1)='I' then 'I'
when SUBSTRING([Customer Reference No#],1,1)='E' then 'E'
when SUBSTRING([Customer Reference No#],1,2)='PU' then 'PUB'
when SUBSTRING([Customer Reference No#],1,2)='PT' then 'E'
when SUBSTRING([Customer Reference No#],1,1)='B' then 'BP'
when SUBSTRING([Customer Reference No#],1,2)='CC' then 'CC'
when SUBSTRING([Customer Reference No#],1,1) is NULL then 'I'
when SUBSTRING([Customer Reference No#],1,1)='C' then 'I'
end as Customer_Type,count(distinct [Waybill No#]) as Total
from CTE_IB
Group by Month([Date]),[To City],[Customer Reference No#]
order by [To City] asc