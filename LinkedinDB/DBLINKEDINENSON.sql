CREATE TABLE USERLINKEDIN (
UserID int IDENTITY(1,1) PRIMARY KEY,
username varchar(255),
RecordDate datetime,
Fname varchar(50) NOT NULL,
Mname varchar(50),
Lname varchar(50) NOT NULL,
Aktif bit,
Online bit,
MailCheckCode bit,
Bio text , Photo nvarchar(255), JobTitle nvarchar(255),	
)

CREATE TABLE EMAIL (
EmailID int IDENTITY PRIMARY KEY,
EmailAdress varchar(255),
RecorDate datetime,
Aktif bit,

UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
)

CREATE TABLE COMPANY(
CompanyID int IDENTITY PRIMARY KEY,
CompanyName varchar(255),
Photo nvarchar(255),
CreateDate datetime,
Description nvarchar(255),
UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
)



CREATE TABLE JOB(
JobID int IDENTITY(1,1) PRIMARY KEY,
JobName nvarchar(255),
Description nvarchar(255) 
)


CREATE TABLE CATEGORY(
CategoryID int IDENTITY(1,1) PRIMARY KEY,
CategoryName varchar(255),
)


CREATE TABLE COUNTRY (
CountryID int IDENTITY(1,1) PRIMARY KEY,
countryName nvarchar(255),
)

CREATE TABLE CITY (
CityID int IDENTITY(1,1) PRIMARY KEY,
CityName Nvarchar(255),
CountryID int FOREIGN KEY REFERENCES COUNTRY(CountryID),
)
CREATE TABLE LOCALITY (
LocalityID int PRIMARY KEY IDENTITY(1,1),
LocalityName nvarchar(255),
CityID int FOREIGN KEY  REFERENCES CITY (CityID),

)
CREATE TABLE LOCATION(
AdressID int PRIMARY KEY IDENTITY(1,1),
street Nvarchar(255),
No Nvarchar(50),
LocalityID int FOREIGN KEY REFERENCES LOCALITY(LocalityID) ,
CityID int FOREIGN KEY  REFERENCES CITY (CityID),
CountryID int FOREIGN KEY REFERENCES COUNTRY(CountryID),
)



CREATE TABLE UNIVERSITY (
UniversityID int PRIMARY KEY IDENTITY(1,1),
universityName varchar(255),
)

CREATE TABLE ISEALIMILAN (
IlanID int PRIMARY KEY IDENTITY(1,1),
Description Nvarchar(255),
WorkYear smallint,
workHour nvarchar (255),
)

CREATE TABLE HR (
HRID int IDENTITY(1,1) PRIMARY KEY,
UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
CompanyID int FOREIGN KEY REFERENCES COMPANY(CompanyID),
)



CREATE TABLE USERJOB(

GDate datetime,
CDate datetime,
UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
JobID int FOREIGN KEY REFERENCES JOB(JobID),
CompanyID INT FOREIGN KEY REFERENCES COMPANY(CompanyID),
PRIMARY KEY(UserID,JobID,CompanyID)
)

CREATE TABLE MESAJ (
MesajID int PRIMARY KEY,
Icerik nvarchar(255),
RecordDate datetime,
GUserName INT FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
AUserName INT FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
)

CREATE TABLE UNIVERSITYSTATU (
UniverstiyStatuID int IDENTITY(1,1) PRIMARY KEY,
GDate datetime,
MDate datetime,
UniversityID int FOREIGN KEY REFERENCES UNIVERSITY(UniversityID),
UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),

)

CREATE TABLE JOBCATEGORY (
JobID int FOREIGN KEY REFERENCES JOB(JobID),
CategoryID int FOREIGN KEY REFERENCES CATEGORY(CategoryID)
PRIMARY KEY (JobID,CategoryID)
)

CREATE TABLE ISEALIMJOB(
IlanID int FOREIGN KEY REFERENCES ISEALIMILAN(IlanID),
JobID int FOREIGN KEY REFERENCES JOB(JobID),
PRIMARY KEY (JobID,IlanID)
)

CREATE TABLE COMPANYCATEGORY (
CompanyID int FOREIGN KEY REFERENCES COMPANY(CompanyID),
CategoryID int FOREIGN KEY REFERENCES CATEGORY(CategoryID),
PRIMARY KEY (CompanyID,CategoryID)
)

CREATE TABLE ILANCATEGORY(
CategoryID int  FOREIGN KEY REFERENCES CATEGORY(CategoryID),
IlanID int FOREIGN KEY REFERENCES ISEALIMILAN(IlanID),
PRIMARY KEY (CategoryID,IlanID)
)
-----calismiyor 
CREATE TABLE ILANVEREN(
HRID int FOREIGN KEY REFERENCES HR(HRID),
IlanID int FOREIGN KEY REFERENCES ISEALIMILAN(IlanID),
PRIMARY KEY (HRID,IlanID)
)

CREATE TABLE BASVURANKISI (
UserID int  FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
IlanID int FOREIGN KEY REFERENCES ISEALIMILAN(IlanID),
PRIMARY KEY(UserID,IlanID)
)

CREATE TABLE ADMIN (
UserID int FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
CompanyID int FOREIGN KEY REFERENCES COMPANY(CompanyID),
PRIMARY KEY (UserID,CompanyID)
)

CREATE TABLE UNIVERSITYADRESS(
UniversityID int FOREIGN KEY REFERENCES UNIVERSITY(UniversityID),
AdressID int FOREIGN KEY REFERENCES LOCATION(AdressID),
PRIMARY KEY (AdressID)
)

CREATE TABLE PROFILEADRESS(
UserID int  FOREIGN KEY REFERENCES USERLINKEDIN(UserID),
AdressID int FOREIGN KEY REFERENCES LOCATION(AdressID),
PRIMARY KEY (AdressID)
)

CREATE TABLE COMPANYADRESS (
CompanyID int FOREIGN KEY REFERENCES COMPANY(CompanyID),
AdressID int FOREIGN KEY REFERENCES LOCATION(AdressID),
PRIMARY KEY (AdressID)
)