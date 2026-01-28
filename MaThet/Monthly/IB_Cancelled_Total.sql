with CTE_IB AS (
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_MDY]
	where [Consignment Status]='Cancelled'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_NPW]
	where [Consignment Status]='Cancelled'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_YGN]
	where [Consignment Status]='Cancelled'
    UNION ALL
    SELECT * FROM [10.Oct_Data_25].[dbo].[IB_REG_UPDATE]
	where [Consignment Status]='Cancelled'
)
select 'Dec' as Month,
[To City],[Consignment Status],count(*) as Total
from CTE_IB
group by [To City],[Consignment Status]
order by [To City] asc