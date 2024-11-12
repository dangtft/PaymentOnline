-- ================================================
-- Update Merchant
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
CREATE PROCEDURE [dbo].[sproc_MerchantUpdate]
	-- Add the parameters for the stored procedure here
	@Id nvarchar(50) = '',
	@MerchantName nvarchar(50)='',
	@MerchantWebLink nvarchar(250)='',
	@MerchantIpnUrl nvarchar(250)='',
	@MerchantReturnUrl nvarchar(250)='',
	@MerchantSecretKey nvarchar(50)='',
	@IsActive bit = 0,
	@UpdateUser nvarchar(50)
AS
BEGIN
	UPDATE M
		SET MerChantName = @MerchantName
			,MerchantIpnUrl = @MerchantIpnUrl
			,MerchantWebLink = @MerchantWebLink
			,MerchantReturnUrl = @MerchantReturnUrl
			,SecretKey = @MerchantSecretKey
			,IsActive = @IsActive
			,LastUpdatedBy = @UpdateUser
			,LastUpdatedAt = GETDATE()
		FROM Merchant M
	Where Id = @Id
END
GO
