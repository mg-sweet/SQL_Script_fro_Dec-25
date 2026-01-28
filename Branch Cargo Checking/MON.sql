select
	CAST([Waybill Date] AS date) as [Date]
	,[Sender Internal Reference] = 
	CASE
	WHEN [Sender Internal Reference] is null then [Customer Type]
	WHEN [Sender Internal Reference] is not null then [Sender Internal Reference]
	END
	,[Waybill No]
	,[From City]
    --,[From City Short Code] 
	,[Branch Name]
    ,[To City]
    ,[To City Short Code]
    ,[Service Type]
    ,[Status]
from
	[1.Jan 26].[dbo].[15 Jan OB]
WHERE
[From City]
	in (
	'Mottama','Mudon','Mawlamyine','Thanbyuzayat','Chaungzone','Paung',
	'Bilin','Ye','Kyaikkaw','Kyaikto','Thaton','Kyaikkhami',
	'Kyaikmaraw','Zinkyaik','Thein Za Yat',
	'Hlaingbwe','Hpa-An','Myawaddy','Myaingkalay','Dawei','Kawthoung','Myeik'
	)