-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--Insert Merchant
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE [dbo].[sproc_MerchantInsert] 
	-- Add the parameters for the stored procedure here
	@Id nvarchar(50) = '',
	@MerchantName nvarchar(50)='',
	@MerchantWebLink nvarchar(250)='',
	@MerchantIpnUrl nvarchar(250)='',
	@MerchantReturnUrl nvarchar(250)='',
	@MerchantSecretKey nvarchar(50)='',
	@IsActive bit = 0,
	@InsertUser nvarchar(50),
	@InsertedId nvarchar(50)
AS
BEGIN
	if(@Id is null or trim(@Id)='')
		begin
			set @Id = 'MER' + SUBSTRING(master.dbo.fn_varbintohexstr(HASHBYTES('MD5',@MerchantName)),3,32)
		end

	if(@MerchantSecretKey is null or trim(@MerchantSecretKey)='')
		begin
			set @MerchantSecretKey = NEWID()
		end
	Set @InsertedId = @Id

	INSERT INTO [dbo].[Merchant]
           ([Id]
           ,[MerchantName]
           ,[MerchantWebLink]
           ,[MerchantIpnUrl]
           ,[MerchantReturnUrl]
           ,[SecretKey]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedAt])
     VALUES
           (@Id
           ,@MerchantName
           ,@MerchantWebLink
           ,@MerchantIpnUrl
           ,@MerchantReturnUrl
		   ,@MerchantSecretKey
           ,@IsActive
           ,@InsertUser
           ,GETDATE())
END
GO
