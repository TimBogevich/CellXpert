CREATE TABLE site.[CellXpertReport]
(
    [Day] Datetime,
    AffiliateID INT,
    Affiliate VARCHAR(255),
    Brand VARCHAR(255),
    Impressions INT,
    UniqueImpressions INT,
    Visitors INT,
    UniqueVisitors INT,
    Leads INT,
    Registrations INT,
    FTD INT,
    Deposits INT,
    WithDrawals INT,
    NetDeposits INT,
    Comission MONEY,

)

GO

GRANT SELECT,INSERT,DELETE on site.[CellXpertReport] to elastic
GO

CREATE INDEX [IX_CellXpertReport_Column] ON [site].[CellXpertReport] ([Day])
