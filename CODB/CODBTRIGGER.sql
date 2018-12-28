ALTER TRIGGER ilanSameCity on ISILAN
FOR INSERT 
AS
begin
	declare @empid int;
	declare @empName nvarchar(255);
	declare @CompName nvarchar(255);
	declare @IsAlani nvarchar(255);
	declare @CityCode int;
	declare @SayfaID int;

	select @SayfaID= HR.SayfaID from inserted as i
	inner join HR  on  i.HRID=HR.HRID

	insert into NOTIFICATION 
	  	SELECT  Text=SAYFA.SayfaName+' firmasina ait ilan eklenmistir',SAYFA.SayfaID,null, COUSER.UserID 
	FROM COUSER,PROFILE,PROFILEADRESS,ADRESS AS CO,ADRESS AS US,HR,SAYFA,SAYFAADRESS
	WHERE  HR.SayfaID=SAYFA.SayfaID AND SAYFA.SayfaID=SAYFAADRESS.SayfaID AND SAYFAADRESS.AdressID= CO.AdressID AND 
	COUSER.UserID = PROFILE.UserID AND PROFILE.ProfileID = PROFILEADRESS.ProfileID AND PROFILEADRESS.AdressID = US.AdressID AND
	CO.CityCode= US.CityCode AND SAYFA.SayfaID=@SayfaID AND COUSER.IsNotification=1

	end
