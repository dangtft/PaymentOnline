-- ================================================
-- Update Merchant Active
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
CREATE PROCEDURE [dbo].[sproc_MerchantUpdateActive]
	@Id nvarchar(50) = '',
	@IsActive bit = 0,
	@UpdateUser nvarchar(50)
AS
BEGIN
	UPDATE M
		SET 
			IsActive = @IsActive
			,LastUpdatedBy = @UpdateUser
			,LastUpdatedAt = GETDATE()
		FROM Merchant M
	Where Id = @Id
END
GO
