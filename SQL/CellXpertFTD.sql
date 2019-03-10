CREATE TABLE site.[CellXpertFTD]
(
	[TraderId] VARCHAR(255) NULL, 
    [TransactionID] VARCHAR(255) NULL, 
    [TransactionDate] DATETIME NULL, 
    [TransactionAmount] MONEY NULL
)

GO  

GRANT SELECT,INSERT,DELETE on site.[CellXpertFTD] to elastic

GO

CREATE INDEX [IX_CellXpertFTD_Column] ON [site].[CellXpertFTD] ([TransactionDate])
