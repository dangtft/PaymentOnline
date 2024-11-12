-- ================================================
-- Select Merchant paging
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
CREATE PROCEDURE [dbo].[sproc_MerchantSelectByCriteriaPaging] 
	-- Add the parameters for the stored procedure here
	@PageIndex INT = 0,
	@PageSize Int = 0,
	@Criteria nvarchar(500)='',
	@TotalPage INT OUTPUT,
	@TotalCount INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Offset INT = (@PageIndex - 1)*@PageSize;

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
  Where
	@Criteria = '' OR @Criteria IS NULL
	OR MerchantName LIKE '%' +@Criteria + '%'
  Order By
	Id
	OFFSET @Offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

	SELECT @TotalCount = COUNT(Id)
  FROM [dbo].[Merchant](NOLOCK)
  Where
	@Criteria = '' OR @Criteria IS NULL
	OR MerchantName LIKE '%' +@Criteria + '%'

	SET @TotalPage = CEILING(@TotalCount/ CONVERT(FLOAT,@PageSize))
END
GO
