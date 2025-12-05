select [Date]
	,[Waybill No]
	--,[Sender/Internal Reference]
    ,[From City]
    ,[Branch]
    ,[To City]
    ,[To City/Short Code]
    ,[Service Type]
    ,[Status]
from
[12.Dec 25].[dbo].[4 Dec OB]
WHERE
[From City] in (
	-- AYA Region
	'Pathein','Wakema','Labutta','Danubyu','Mawlamyinegyun','Nyaungtone',
	'Einme','Kangyidaunt','Maubin','Kyaiklat','Bogale','Zalun','Dedaye',
	'Hinthada','Myaungmya','Pantanaw','Kyangin','Myanaung','Kyaunggon',
	'Kyonpyaw','Ngathaingchaung','Pyapon','Sar Ma Lauk','Thabaung',
	'Ingapu','Ngapudaw','Yegyi','Atthoke','Kyonemangay','Chaung Thar',
	'Lemyethna','Ahtaung','Htugyi','Shwelaung','Darka','Ngwesaung'
)