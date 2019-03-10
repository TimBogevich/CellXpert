CREATE TABLE site.[CellXpertAffiliateList](
  [AffiliateID]              INT,
  [UserName]                 VARCHAR(MAX) NULL,
  [ParentAffiliate]          VARCHAR(MAX) NULL,
  [FirstName]                VARCHAR(MAX) NULL,
  [LastName]                 VARCHAR(MAX) NULL,
  [Email]                    VARCHAR(MAX) NULL,
  [Phone]                    VARCHAR(MAX) NULL,
  [Country]                  VARCHAR(MAX) NULL,
  [AffiliateManager]         VARCHAR(MAX) NULL,
  [AffiliateManagerEmail]    VARCHAR(MAX) NULL)

GO  

GRANT SELECT,INSERT,DELETE on site.[CellXpertAffiliateList] to elastic
