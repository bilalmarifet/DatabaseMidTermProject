SELECT * FROM PAGE 
SELECT BirthDate FROM USERFACEBOOK WHERE Username='mustafabas'
SELECT top 1 EmailAdress from EMAIL where UserID=2 order by RecordDate desc
select TotalFriend=Count(*) from ADDFRIEND where AddUserID=4 or ReceiverUserID=4;

select COUNT(Username),u.Username from USERFACEBOOK AS U INNER JOIN  ADDFRIEND AS A ON U.UserID=A.AddUserID OR U.UserID=A.ReceiverUserID where AddedOrNot=1 group by U.Username


<!--sayfalarin moderatorleri--!>
select  pd.UserID,p.Name
from Page as p, PAGEMOD as pd 
where p.PageID=pd.PageID

<!-- profili olan kullanicilarin bilgileri
select p.* from USERFACEBOOK as u inner join PROFILE as p on u.UserID=p.UserID
<-- turkiye ulkesinin sehir sayisi
select IlSayi=count(ci.CityID) from COUNTRY as c inner join CITY as ci on c.CountryID=ci.CountryID  where  c.Name='Türkiye' group by ci.CountryID 

select ad.*, u.Username from ADDFRIEND as ad inner join USERFACEBOOK as u on u.UserID=ad.AddUserID where u.Username='mustafabas'


select ad.*, u.Username,EklenenName=rec.Username from ADDFRIEND as ad 
inner join USERFACEBOOK as u on u.UserID=ad.AddUserID
inner join USERFACEBOOK as rec on ad.ReceiverUserID=rec.UserID
 where u.Username='mustafabas'

 select p.Name, ModName=u.Username from PAGE as p inner join PAGEMOD as pd on p.PageID=pd.PageID 
 inner join USERFACEBOOK as u on pd.UserID=u.UserID

 select p.Name,ad.* from PAGE as p inner join CATEGORY as c on p.CategoryID=c.CategoryID 
 inner join  ADRESSPAGE as adp on p.PageID=adp.PageID 
 inner join ADRESS as ad on adp.AdressID=ad.AdressID
 where c.CategoryNam='Bilisim'


 update USERFACEBOOK SET Password='yenipasword' where Username='mustafabas'
 update PAGE SET Name='GUZEL SAYFA' WHERE PageID=2
 UPDATE ADDFRIEND set AddedOrNot=1 



 delete from ADDFRIEND where AddUserID=2 and ReceiverUserID=3
 delete from PAGE where Name = 'Twitter'
 delete from STATU where StatuID=1


 select  * from PAGE