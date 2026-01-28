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
	[1.Jan 26].[dbo].[27 Jan OB]
WHERE
--[From City]
--	in (
--	'Mottama','Mudon','Mawlamyine','Thanbyuzayat','Chaungzone','Paung',
--	'Bilin','Ye','Kyaikkaw','Kyaikto','Thaton','Kyaikkhami',
--	'Kyaikmaraw','Zinkyaik','Thein Za Yat',
--	'Hlaingbwe','Hpa-An','Myawaddy','Myaingkalay','Dawei','Kawthoung','Myeik'
--	)

--	[From City] in (
--	-- AYA Region
--	'Pathein','Wakema','Labutta','Danubyu','Mawlamyinegyun','Nyaungtone',
--	'Einme','Kangyidaunt','Maubin','Kyaiklat','Bogale','Zalun','Dedaye',
--	'Hinthada','Myaungmya','Pantanaw','Kyangin','Myanaung','Kyaunggon',
--	'Kyonpyaw','Ngathaingchaung','Pyapon','Sar Ma Lauk','Thabaung',
--	'Ingapu','Ngapudaw','Yegyi','Atthoke','Kyonemangay','Chaung Thar',
--	'Lemyethna','Ahtaung','Htugyi','Shwelaung','Darka','Ngwesaung'
--)

[Branch Name] LIKE 'MDY-%'
   OR
  [From City] IN (
  -- MGY Region
	'Magway','Pakokku','Taungtwingyi','Yesagyo','Aunglan','Pwintbyu','Minbu',
	'Thayed','Salin','Yenanchaung','Chauk','Natmauk','Ngape','Satthwar','Kamma',
	'Saku','Salay','Myothit','Seik Phyu','Upper MinHla','SinHpyuKyun','SinBaungWe',
	--New Branch
	'ThitYarGyauk'
	-- Kayar
	,'Loikaw',
	-- SHN Region
'Aungpan','Hopong','PinLaung','Yatsauk','Ayetharyar','Nyaungshwe','Shwenyaung','Taunggyi',
'Tachileik','Kengtung','Kalaw','Lashio','Loilem','Hehoe','Pindaya','Ywangan','Ywangan'
	)