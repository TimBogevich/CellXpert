CREATE TABLE site.[CellXpertNciList](
  [NCI]            VARCHAR(255),
  [Type]           VARCHAR(MAX) NULL,
  [Language]       VARCHAR(MAX) NULL,
  [Name]           VARCHAR(MAX) NULL,
  [Size]           VARCHAR(MAX) NULL,
  [LandingPage]    VARCHAR(MAX) NULL,
  [Created]        datetime, 
    CONSTRAINT [PK_CellXpertNciList] PRIMARY KEY ([NCI]))

GO

GRANT SELECT,INSERT,DELETE on site.[CellXpertNciList] to elastic
