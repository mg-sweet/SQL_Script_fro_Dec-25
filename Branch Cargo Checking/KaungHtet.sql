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
	[1.Jan 26].[dbo].[12 Jan OB]
WHERE
	[From City] IN (
	--BGO
	'Taungoo','Yedashay','Bago','Zigon','Waw','Hpayargyi','Daik-U',
	'Gyobingauk','Pyay','InnTaKaw','Monyo','Nyaunglebin','Phyu',
	'Okpho','Shwedaung','Lower Minhla','Okeshitpin','Letpadan',
	'Tharyarwaddy','Thonese','Nattalin','Yae Ni','Paungde','Pyuntasa','Shwegyin',
	'Sitkwin','Kaytumaddy','Zeyawaddy','Paukkhaung','Paungtale','Penwegon',
	'Thanatpin','Innma','KyaukTaGa','Oktwin','Padaung','Oaethaekone',
	'Tharkaya','Thegon','Swar','Kawa','Kanyutkwin','MyoHla',

	-- SGG Region
	'Monywa','Sagaing','Shwebo','Myinmu','Kalay',

	-- MKN
	'Myitkyina'
	)