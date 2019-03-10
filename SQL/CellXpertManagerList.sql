CREATE TABLE [site].[CellXpertManagerList](
  [id]            INT,
  [username]      VARCHAR(MAX) NULL,
  [created]       DATE NULL,
  [servertime]    DATETIME NULL,
  [FirstName]     VARCHAR(MAX) NULL,
  [LastName]      VARCHAR(MAX) NULL,
  [Email]         VARCHAR(MAX) NULL,
  [Phone]         VARCHAR(MAX) NULL,
  [Skype]         VARCHAR(MAX) NULL,
  [isAdmin]       VARCHAR(MAX) NULL,
  [IsActive]      VARCHAR(MAX) NULL, 
    CONSTRAINT [PK_CellXpertManagerList] PRIMARY KEY ([id]));
GO

GRANT DELETE ON [site].[CellXpertManagerList] TO [elastic]
GO
GRANT INSERT ON [site].[CellXpertManagerList] TO [elastic]
GO
GRANT SELECT ON [site].[CellXpertManagerList] TO [elastic]
GO
GRANT UPDATE ON [site].[CellXpertManagerList] TO [elastic]