select *, DATEDIFF(day, [Waybill Date],CAST(getdate() as date)) as LeadTime
from [AugestData].[dbo].[Before 21 Approved]
where  [To City/City name(English)] not in
('Yangon','Taikkyi','Twantay','Hmawbi','Kawhmu','Hlegu','Thongwa','Kyauktan','Kungyangone','Ahpyauk',
'Mandalay','Patheingyi','Amarapura','Myintnge','Ohn Chaw',
'Naypyidaw','Tharwutti')