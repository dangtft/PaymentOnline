-- ================================================
-- Select Merchant By Id
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
CREATE PROCEDURE [dbo].[sproc_MerchantSelectById]
	-- Add the parameters for the stored procedure here
	@Id nvarchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [Id]
      ,[MerchantName]
      ,[MerchantWebLink]
      ,[MerchantIpnUrl]
      ,[MerchantReturnUrl]
      ,[SecretKey]
      ,[IsActive]
      ,[CreatedBy]
      ,[LastUpdatedBy]
      ,[CreatedAt]
      ,[LastUpdatedAt]
  FROM [dbo].[Merchant](NOLOCK)
  Where Id = @Id
END
GO
