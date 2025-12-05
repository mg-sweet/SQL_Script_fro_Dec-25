select 
	--[Waybill Date]
	--,[Waybill No]
	--,[Customer Type]
	--,[Sender (ပေးပို့)/Internal Reference]
 --   ,[From City/City name(English)]
 --   ,[From City/Short Code]
 --   ,[To City/City name(English)]
 --   ,[To City/Short Code]
 --   ,[Service Type]
 --   ,[Status]
	[Date]
	,[Waybill No]
	--,[Sender/Internal Reference]
    ,[From City]
    ,[Branch]
    ,[To City]
    ,[To City/Short Code]
    ,[Service Type]
    ,[Status]
from 
	[12.Dec 25].[dbo].[3 Dec OB]
where
	[From City]
	in (
	'Mottama','Mudon','Mawlamyine','Thanbyuzayat','Chaungzone','Paung',
	'Bilin','Ye','Kyaikkaw','Kyaikto','Thaton','Kyaikkhami',
	'Kyaikmaraw','Zinkyaik','Thein Za Yat',
	'Hlaingbwe','Hpa-An','Myawaddy','Myaingkalay','Dawei','Kawthoung','Myeik'
	)