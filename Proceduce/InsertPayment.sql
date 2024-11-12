-- ================================================
--PaymentInsert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sproc_PaymentInsert] 
	-- Add the parameters for the stored procedure here
	@Id nvarchar(50)='',
	@PaymentContent nvarchar(250) = null,
	@PaymentCurrency nvarchar(10) = null,
	@PaymentRefId nvarchar(50)= null,
	@RequiredAmount decimal(19,2) = null,
	@PaymentDate datetime = null,
	@ExpireDate datetime = null,
	@PaymentLanguage nvarchar(10) = null,
	@MerchantId nvarchar(50) = null,
	@PaymentDestinationId nvarchar(50) = null,
	@Signature nvarchar(100) = '',
	@InsertUser nvarchar(50) = '',
	@InsertedId nvarchar(50) OUTPUT
AS
BEGIN
	IF @PaymentDate IS NULL
		BEGIN
			SET @PaymentDate = GETDATE()
		END

	IF @ExpireDate IS NULL
		BEGIN
			SET @ExpireDate = DATEADD(MINUTE,15,GETDATE())
		END

	IF @Id IS NULL
		BEGIN
			SET @Id = 'PAY' + + SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5',CAST(NEWID() AS nvarchar(50)))),3,32)
		END

	INSERT INTO [dbo].[Payment]
           ([Id]
           ,[PaymentContent]
           ,[PaymentCurrency]
           ,[PaymentRefId]
           ,[RequiredAmount]
           ,[PaymentDate]
           ,[ExpireDate]
           ,[PaymentLanguage]
           ,[MerchantId]
           ,[PaymentDestinationId]
           ,[CreatedBy]
           ,[CreatedAt])
     VALUES
           (@Id
           ,@PaymentContent
           ,@PaymentCurrency
           ,@PaymentRefId
           ,@RequiredAmount
           ,@PaymentDate
           ,@ExpireDate
           ,@PaymentLanguage
           ,@MerchantId
           ,@PaymentDestinationId
           ,@InsertUser
		   ,GETDATE())
	Set @InsertedId = @Id

	INSERT INTO [dbo].[PaymentSignature]
           ([Id]
           ,[SignValue]
           ,[SignDate]
           ,[SignOwn]
           ,[PaymentId]
           ,[IsValid])
     VALUES
           (NEWID()
           ,@Signature
           ,GETDATE()
           ,@MerchantId
           ,@Id
           ,1)
END
GO
