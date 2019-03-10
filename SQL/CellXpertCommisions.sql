CREATE TABLE site.[CellXpertCommisions](
  id INT,
  Affiliateid INT,
  TraderId VARCHAR(255),
  afp VARCHAR(255),
  TrackingCode VARCHAR(255),
  CommissionType VARCHAR(255),
  Commission MONEY,
  created DATETIME,
  [timestamp] DATETIME
)

GO
GRANT SELECT,INSERT,DELETE on site.[CellXpertCommisions] to elastic

GO

CREATE INDEX [IX_CellXpertCommisions_Column] ON [site].[CellXpertCommisions] ([timestamp])
