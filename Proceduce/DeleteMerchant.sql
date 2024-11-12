-- ================================================
-- Delete Merchant
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
CREATE PROCEDURE [dbo].[sproc_MerchantDeleteById] 
	-- Add the parameters for the stored procedure here
	@Id nvarchar(50) = ''
AS
BEGIN
	delete 
	From Merchant
	Where @Id = Id
END
GO
