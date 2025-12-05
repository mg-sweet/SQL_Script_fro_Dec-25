select OB.Date, C.[Waybill No], C.[FromBranch], C.[ToBranch], OB.Status,
CASE
	WHEN C.[Waybill No] = OB.[Waybill No] THEN 'TRUE'
	WHEN C.[Waybill No] != OB.[Waybill No] THEN 'FALSE'
	END AS CargoCheck
from
[Aug_Data].[dbo].[24 BGO Cargo] C
RIGHT JOIN
Aug_Data.[dbo].[24 OB Data] OB
on C.[Waybill No] = OB.[Waybill No]
where OB.[From City] in (
'Taungoo','Yedashay','Bago','Zigon','Waw','Hpayargyi','Daik-U',
'Gyobingauk','Pyay','InnTaKaw','Monyo','Nyaunglebin','Phyu',
'Okpho','Shwedaung','Lower Minhla','Okeshitpin','Letpadan',
'Tharyawaddy','Nattalin','Yae Ni','Paungde','Pyuntasa','Shwegyin',
'Sitkwin','Kaytumaddy','Zeyawaddy','Paukkhaung','Paungtale','Penwegon',
'Thanatpin','Innma','KyaukTaGa','Oktwin','Padaung','Oaethaekone',
'Tharkaya','Thegon','Swar','Kawa','Kanyutkwin','MyoHla'
)