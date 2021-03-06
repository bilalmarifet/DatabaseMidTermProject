/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4224)
    Source Database Engine Edition : Microsoft SQL Server Standard Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [NEWFACEBOOKDB]
GO
/****** Object:  UserDefinedFunction [dbo].[IsThereFriendRequest]    Script Date: 27.12.2018 19:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[IsThereFriendRequest] (
    @AddUserId int,
	@ReceiverUserId int
)
RETURNS VARCHAR(5)
AS
BEGIN
    IF EXISTS (SELECT* FROM ADDFRIEND WHERE ReceiverUserId = @AddUserId and AddUserId=@ReceiverUserId)
        return 'True'
    return 'False'
END


CREATE FUNCTION IsThereAnyAdmin (
 @PageID int,
	@UserID int
)
RETURNS BIT
AS
BEGIN
    IF EXISTS (SELECT* FROM PAGEADMIN WHERE PageID = @PageID and UserID=@UserID)
        return 1
    return 0
END





