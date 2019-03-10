CREATE TABLE site.[CellXpertTraders]
(
    UserID VARCHAR(255),
    Country VARCHAR(255),
    afp VARCHAR(255),
    TrackingCode VARCHAR(255),
    [Source] VARCHAR(255),
    CreativeName VARCHAR(255),
    CreativeType VARCHAR(255),
    [Status] VARCHAR(255),
    RegistrationDate Datetime,
    QualificationDate Datetime,
    Affiliate VARCHAR(255),
    FirstDeposit money,
    FDD datetime,
    NetDeposits money,
    TotalBonus money,
    DepositCount INT,
    PositionCount INT,
    PL money,
    Commission money
)



GO

GRANT SELECT,INSERT,DELETE on site.[CellXpertTraders] to elastic