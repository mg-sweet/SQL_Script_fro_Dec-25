BULK INSERT [12.Dec 25].[dbo].[Customer Behavior for Nov]
FROM 'D:\2025\11.Nov 25\Monthly Data\CustomerBehaviorForNov.csv'
WITH (
    FIRSTROW = 2,          -- skip header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'     -- UTF-8 (important!)
);

CREATE TABLE [Customer Behavior for Nov] (
    [Date] Date,
    [Customer Reference No#] NVARCHAR(255),
    [Customer] NVARCHAR(255),
    [From City] NVARCHAR(255),
    [To City] NVARCHAR(255),
    [Waybill No#] NVARCHAR(255),
    [Service Type] NVARCHAR(255),
    [Consignment Status] NVARCHAR(255)
    -- add columns based on CSV
);