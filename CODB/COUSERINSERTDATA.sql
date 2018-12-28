
INSERT INTO COUSER VALUES ('bllalogz','bilal','oguz','marifet','123456',1,1,GETDATE(),1)

INSERT INTO COUSER VALUES ('mustafabas','musatafa','','bas','123456',1,1,GETDATE(),1)
INSERT INTO COUSER VALUES ('fatihcan','fatih','berat','can','123456',1,1,GETDATE(),1)
UPDATE COUSER
SET IsNotification=1


SELECT * 
FROM COUSER

ALTER TABLE PROFILE ADD UserID int FOREIGN KEY REFERENCES COUSER(UserID) 
ALTER TABLE COUSER ADD IsNotification bit DEFAULT 1

INSERT INTO PROFILE VALUES ('/pictures/bllalogz.jpg','Bilgisayar muhendisi 3.sinif','yazilimla ugrasiyorum','Computer Engineer',1)

INSERT INTO PROFILE VALUES ('/pictures/mustafabas.jpg','Bilgisayar muhendisi 3.sinif','firmada calisiyorum','db managemant',2)
INSERT INTO PROFILE VALUES ('/pictures/fatihcan.jpg','Bilgisayar muhendisi 3.sinif','bir suredir yok','bilgisayar muh',3)


INSERT INTO CATEGORY VALUES ('YAZILIM')
INSERT INTO CATEGORY VALUES ('SAGLIK')
INSERT INTO CATEGORY VALUES ('GEMICILIK')


SELECT * FROM CATEGORY

INSERT INTO SAYFA VALUES('FILLSOFTWARE yazilim sirketi olarak web uzerine uygulama gelistiriyoruz','/pictures/sayfalar/company/fillsoftware.jpg','fillsoftware','/pictures/sayfalar/company/fillsoftwarecover.jpg',1,1,1)
INSERT INTO COMPANY VALUES(1)
INSERT INTO SAYFA VALUES('Saglk uzerine hizmet vermekteyiz','/pictures/sayfalar/company/ozelhastane.jpg','ozkanlar hastanesi','/pictures/sayfalar/company/ozelhastanecover.jpg',1,2,2)
INSERT INTO COMPANY VALUES(2)
INSERT INTO SAYFA VALUES('Gemi uretimi yapmaktayiz','/pictures/sayfalar/company/yildizgemiz.jpg','yildiz gemi','/pictures/sayfalar/company/yildizgemicover.jpg',1,3,3)
INSERT INTO COMPANY VALUES(3)



INSERT INTO JOB VALUES('bilgisayar muhendisi','Teknik analizler yaparak bir bilgisayarin calisma sistemi uzerine cozumler uretir')
INSERT INTO JOB VALUES('hemsire','hastalarin minimun gereksinimlerini yerine getirir')
INSERT INTO JOB VALUES('gemi kaptani','geminin yonetimi ve sorumlulugunu ustlenir')

SELECT * 
FROM JOB,CATEGORY

INSERT INTO JOBCATEGORY VALUES(1,1)
INSERT INTO JOBCATEGORY VALUES(2,2)
INSERT INTO JOBCATEGORY VALUES(3,3)


INSERT INTO COUNTRY VALUES('TURKEY')
INSERT INTO COUNTRY VALUES('POLONYA')
INSERT INTO COUNTRY VALUES('RUSYA')

SELECT * FROM COUNTRY

INSERT INTO CITY VALUES('IZMIR',2)
INSERT INTO CITY VALUES('ISTANBUL',2)
INSERT INTO CITY VALUES('ANKARA',2)

SELECT * FROM CITY

INSERT INTO LOCALITY VALUES('Bornova',1)
INSERT INTO LOCALITY VALUES('Bagcilar',2)
INSERT INTO LOCALITY VALUES('Dikmen',3)

select *  from LOCALITY

INSERT INTO ADRESS VALUES('inonu mahallesi',56,1,2,1)
INSERT INTO ADRESS VALUES('ataurk mahallesi',22,2,2,2)
INSERT INTO ADRESS VALUES('seyfi mahallesi',33,3,2,3)


INSERT INTO ADRESS VALUES('kazimdirik mahallesi',11,1,2,1)
INSERT INTO ADRESS VALUES('ozkanlar mahallesi',21,1,2,1)
INSERT INTO ADRESS VALUES('yaren mahallesi',15,3,2,3)



SELECT *  FROM  ADRESS
SELECT * FROM PROFILE

INSERT INTO PROFILEADRESS VALUES(5,1)
INSERT INTO PROFILEADRESS VALUES(6,2)
INSERT INTO PROFILEADRESS VALUES(7,3)

INSERT INTO SAYFAADRESS VALUES(2,1)
INSERT INTO SAYFAADRESS VALUES(3,2)
INSERT INTO SAYFAADRESS VALUES(4,3)



CREATE TABLE JOBCATEGORY(
JobID int FOREIGN KEY REFERENCES JOB(JobID),
CategoryID int FOREIGN KEY REFERENCES CATEGORY(CategoryID),
PRIMARY KEY (JobID,CategoryID)
)



INSERT INTO COUSER VALUES('hryavuz','yavuz','mehmet','yildirim','123456',1,1,GETDATE(),1,1)
INSERT INTO COUSER VALUES('hrali','ali',NULL,'aras','asdqweasd',1,1,GETDATE(),1,1)
INSERT INTO COUSER VALUES('hrzeki','zeki',NULL,'alaska','zxczxc',1,1,GETDATE(),1,1)

SELECT * FROM SAYFA
SELECT * FROM COMPANY
SELECT * FROM COUSER


INSERT INTO HR VALUES (5,1)
INSERT INTO HR VALUES (6,2)
INSERT INTO HR VALUES (7,3)


SELECT * FROM HR
SELECT * FROM CATEGORY


INSERT INTO ISILAN VALUES(40,2018,'9-5 SQL bilen yazilimci araniyor.',1,1)
INSERT INTO ISILAN VALUES(45,2018,'hemsire araniyor',2,2)
INSERT INTO ISILAN VALUES(60,2018,'gemi kaptani araniyor',3,3)

INSERT INTO ISILAN VALUES(40,2018,'Machine learning  bilen yazilimci araniyor.',1,1)
select * from NOTIFICATION
SELECT * FROM CITY

SELECT IlanID,IlanDescription,FIRMAADI=SAYFA.SayfaName
FROM ISILAN,COMPANY,HR,SAYFAADRESS,ADRESS,CITY as C,SAYFA
WHERE C.CityName='IZMIR' AND ADRESS.CityCode= C.CityCode AND SAYFAADRESS.AdressID=ADRESS.AdressID AND SAYFAADRESS.SayfaID=COMPANY.SayfaID AND COMPANY.SayfaID = HR.SayfaID AND HR.HRID=ISILAN.HRID AND SAYFA.SayfaID=COMPANY.SayfaID



CREATE TABLE NOTIFICATION(
NoID int IDENTITY(1,1) PRIMARY KEY,

Text text,
SayfaID int FOREIGN KEY REFERENCES SAYFA(SayfaID),
UserID int FOREIGN KEY REFERENCES COUSER(UserID)
)
ALTER TABLE NOTIFICATION ADD ReceiverUserID int FOREIGN KEY REFERENCES COUSER(UserID)




	

	
	