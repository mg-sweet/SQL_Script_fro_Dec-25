select  [Date],[Waybill No],[From City],[To City], Status
from
[Sep 25].[dbo].[10 Sep OB]
where [From City] in (
'Taungoo','Yedashay','Bago','Zigon','Waw','Hpayargyi','Daik-U',
'Gyobingauk','Pyay','InnTaKaw','Monyo','Nyaunglebin','Phyu',
'Okpho','Shwedaung','Lower Minhla','Okeshitpin','Letpadan',
'Tharyarwaddy','Thonese','Nattalin','Yae Ni','Paungde','Pyuntasa','Shwegyin',
'Sitkwin','Kaytumaddy','Zeyawaddy','Paukkhaung','Paungtale','Penwegon',
'Thanatpin','Innma','KyaukTaGa','Oktwin','Padaung','Oaethaekone',
'Tharkaya','Thegon','Swar','Kawa','Kanyutkwin','MyoHla'
)