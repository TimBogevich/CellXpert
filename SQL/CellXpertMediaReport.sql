CREATE TABLE site.[CellXpertMediaReport]
(
    Day datetime ,
    MediaChecksum VARCHAR(255),
    Language VARCHAR(255),
    Type VARCHAR(255),
    Size VARCHAR(255),
    Name VARCHAR(255),
    LandingPage VARCHAR(255),
    Clicks INT,
    Leads INT,
    Registrations INT,
    FirstDepositors INT,
    Deposits MONEY,
    WithDrawals INT,
    NetDeposits MONEY
)




GO

GRANT SELECT,INSERT,DELETE on site.[CellXpertMediaReport] to elastic
GO

CREATE INDEX [IX_CellXpertMediaReport_Column] ON [site].[CellXpertMediaReport] ([Day])
