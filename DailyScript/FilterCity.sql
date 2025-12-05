select *
from
[AugestData].[dbo].[20 Aug Deli]
where [Receiver City/City name(English)] not in
('Yangon','Taikkyi','Twantay','Hmawbi','Kawhmu','Hlegu','Thongwa','Kyauktan','Kungyangone','Ahpyauk',
'Mandalay','Patheingyi','Amarapura','Myintnge','Ohn Chaw',
'Naypyidaw','Tharwutti') and Status = 'Completed'