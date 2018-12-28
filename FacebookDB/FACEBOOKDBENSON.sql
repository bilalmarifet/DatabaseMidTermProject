CREATE TABLE USERFACEBOOK (
	UserID int IDENTITY(1,1) PRIMARY KEY,
	Username nvarchar(50) NOT NULL,
	Fname nvarchar(50) NOT NULL,
	Mname nvarchar(50),
	Lname nvarchar(50) NOT NULL,
	Validation nvarchar(25),
	RecordDate datetime,
	Active bit,
	online bit,
	BirthDate datetime )
CREATE TABLE PROFILE (
	ProfileID int IDENTITY(1,1) PRIMARY KEY,
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	Photo nvarchar (255) ,
	Bio text )

CREATE TABLE EMAIL (
	
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	EmailAdress nvarchar (65) ,
	RecordDate datetime,
	aktive bit,
	PRIMARY KEY (UserID, EmailAdress))
	
	CREATE TABLE PROFILPRIVACY (
	
	AttrID int IDENTITY(1,1) PRIMARY KEY,
	AttrName nvarchar(50) ,
	ProfileID int FOREIGN KEY REFERENCES PROFILE(ProfileID),
	)

	Create table COUNTRY(
	CountryID int IDENTITY(1,1) Primary key,
	Name nvarchar(50),

	)

	Create table CITY(
	CityID INT PRIMARY KEY IDENTITY(1,1),
	CountryID int Foreign Key References Country(CountryID),
	Name nvarchar(50)
	)
	Create table LOCALITY(
	LocalityID int IDENTITY(1,1) Primary key,
	Name nvarchar(50),
	CityID int foreign key references CITY(CityID),
		
	)

	CREATE TABLE ADRESS(
	AdressID int IDENTITY(1,1) primary key,
	CounrtyID int Foreign key references COUNTRY(CountryID),
	CityID int foreign key references CITY(CityID),
	LocalityID int foreign key references LOCALITY(LocalityID),
	Info nvarchar(250)
	)
	create table CATEGORY(
	CategoryID int IDENTITY(1,1) primary key,
	CategoryNam nvarchar(150)
	)
	create table PAGE (
	PageID int IDENTITY(1,1) Primary key,
	CategoryID int foreign key references CATEGORY(CategoryID),
	CreatedUserID int foreign key references USERFACEBOOK(UserID),
	Photo nvarchar(250),
	CoverPhoto nvarchar(250),
	Name nvarchar(100),
	Active bit,
	AboutText text,

	
	)
	##calistirmadik daha
	CREATE TABLE ALBUM(
	AlbumID int IDENTITY(1,1) PRIMARY KEY,
	AlbumName nvarchar(255),

	
	)
	CREATE TABLE MESSAGEBOX (
	BoxID int IDENTITY(1,1) PRIMARY KEY,
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	)
	CREATE TABLE MESSAGEITEM (
	MessageID int IDENTITY(1,1)  PRIMARY KEY,
	MessageText text,
	MessagePhoto nvarchar(255),
	BoxID int FOREIGN KEY REFERENCES MESSAGEBOX(BoxID),
	)
	CREATE TABLE STATU(
	StatuID int IDENTITY(1,1) PRIMARY KEY,
	StatuText text,
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	)
	CREATE TABLE COMMENT(
	CommID int IDENTITY(1,1) PRIMARY KEY,
	CommText text,
	Photo nvarchar(255),
	StatuID int FOREIGN KEY REFERENCES STATU(StatuID)
	)
	###like tipi nasil calistirilmadi
	CREATE TABLE STATULIKE (
	LikeID int IDENTITY(1,1),
	LikeType type,
	StatuID int FOREIGN KEY REFERENCES STATU(StatuID) ,
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	)
	# type calistirilmadi
	CREATE TABLE STATUPRIVACY(
	PrivacyID int IDENTITY (1,1) PRIMARY KEY,
	PrivacyType smallint,
	StatuID int FOREIGN KEY REFERENCES STATU(StatuID),
	)

	CREATE TABLE GRUP(
	GrupID INT IDENTITY(1,1) PRIMARY KEY,
	Photo nvarchar(255),
	Cover nvarchar(255),
	About text,
	GrupName nvarchar(255),
	Aktif bit,
	CategoryID INT FOREIGN KEY REFERENCES CATEGORY(CategoryID),

	)
	#gizlilik sikinti tablolar
	CREATE TABLE PRIVACYFRIEND(
	PrivacyFriendID int IDENTITY(1,1) PRIMARY KEY,
	Show bit,
	)


	CREATE TABLE PHOTO(
	AlbumID int FOREIGN KEY REFERENCES ALBUM(AlbumID),
	PhotoPath nvarchar(255),
	PRIMARY KEY(AlbumID,PhotoPath)
	)

	CREATE TABLE VIDEO(
	AlbumID int FOREIGN KEY REFERENCES ALBUM(AlbumID),
	VideoPath nvarchar(255),
	PRIMARY KEY(AlbumID,VideoPath)
	)
	## SIKINTILI
	CREATE TABLE STATUPRIVACYFRIEND(
	PrivacyID int FOREIGN KEY REFERENCES STATUPRIVACY(PrivacyID),
	Show bit,
	PRIMARY KEY(PrivacyID),
	)

	CREATE TABLE ADRESSPRIVACY(
	AdressID int FOREIGN KEY REFERENCES ADRESS(AdressID) ,
	AttrID INT FOREIGN KEY REFERENCES PROFILPRIVACY(AttrID),
	PRIMARY KEY(AdressID,AttrID)
	)
	### YAPILMADI M-N
CREATE TABLE	PRIVACYFRIENDPROFILE(
	AttrID INT FOREIGN KEY REFERENCES PROFILPRIVACY(AttrID),

)

	CREATE TABLE ADDFRIEND (
	AddUserID int foreign KEY REFERENCES USERFACEBOOK(UserID),
	ReceiverUserID int foreign KEY REFERENCES USERFACEBOOK(UserID),
	AddingDate datetime ,
	AddedOrNot bit,
	)

	CREATE TABLE PAGEADMIN(
		UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
		PageID int FOREIGN KEY REFERENCES PAGE(PageID),
		PRIMARY KEY (UserID,PageID)
	)

	CREATE TABLE PAGEMOD(
		UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
			PageID int FOREIGN KEY REFERENCES PAGE(PageID),
					PRIMARY KEY (UserID,PageID)
	)

	CREATE TABLE PAGELIKE (
	PageID INT FOREIGN KEY REFERENCES PAGE(PageID),
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	PRIMARY KEY(PageID,UserID)
	)
	

	CREATE TABLE GRUPADMIN(
		UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
		GrupID int FOREIGN KEY REFERENCES GRUP(GrupID),
		PRIMARY KEY (UserID,GrupID)
	)

	CREATE TABLE GRUPMOD(
		UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
		GrupID int FOREIGN KEY REFERENCES GRUP(GrupID),
					PRIMARY KEY (UserID,GrupID)
	)
	CREATE TABLE GRUPUYE(
		UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
		GrupID int FOREIGN KEY REFERENCES GRUP(GrupID),
					PRIMARY KEY (UserID,GrupID)
	)

	CREATE TABLE ADRESSPROFILE (
	AdressID int FOREIGN KEY REFERENCES ADRESS(AdressID),
	ProfileID int FOREIGN KEY REFERENCES PROFILE(ProfileID),
	PRIMARY KEY(AdressID)
	)

		CREATE TABLE ADRESSPAGE (
	AdressID int FOREIGN KEY REFERENCES ADRESS(AdressID),
	PageID int FOREIGN KEY REFERENCES PAGE(PageID),
	PRIMARY KEY(AdressID)
	)

	CREATE TABLE UNIVERSITY(
	PageID int FOREIGN KEY REFERENCES PAGE(PageID),
	OgretimUyeSayisi nvarchar(255),
	CreateDate datetime,
	PostCode nvarchar(50)
	PRIMARY KEY(PageID)
	)

	Create table CORPORATE (
		PageID int FOREIGN KEY REFERENCES PAGE(PageID),
		CreateDate datetime,
		WorkerCount nvarchar(255),
			PRIMARY KEY(PageID)
	)
	CREATE TABLE COMMUNITY (
			PageID int FOREIGN KEY REFERENCES PAGE(PageID),
				PRIMARY KEY(PageID)
	)

	CREATE TABLE PROFILEALBUM(
	AlbumID int FOREIGN KEY REFERENCES ALBUM(AlbumID),
	ProfileID int FOREIGN KEY REFERENCES PROFILE(ProfileID),
	PRIMARY KEY(AlbumID,ProfileID)
	)

		CREATE TABLE PAGEALBUM(
	AlbumID int FOREIGN KEY REFERENCES ALBUM(AlbumID),
	PageID int FOREIGN KEY REFERENCES PAGE(PageID),
	PRIMARY KEY(AlbumID,PageID)
	)

		CREATE TABLE GRUPALBUM(
	AlbumID int FOREIGN KEY REFERENCES ALBUM(AlbumID),
	GrupID int FOREIGN KEY REFERENCES GRUP(GrupID),
	PRIMARY KEY(AlbumID,GrupID)
	)
	
	CREATE TABLE USERMESSAGEBOX(
	BoxID int FOREIGN KEY REFERENCES MESSAGEBOX(BoxID),
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	PRIMARY KEY(BoxID)
	)

		CREATE TABLE PAGEMESSAGEBOX(
	BoxID int FOREIGN KEY REFERENCES MESSAGEBOX(BoxID),
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	PRIMARY KEY(BoxID)
	)

	CREATE TABLE USERMESSAGEBOXRECEIVER(
		BoxID int FOREIGN KEY REFERENCES MESSAGEBOX(BoxID),
	UserID int FOREIGN KEY REFERENCES USERFACEBOOK(UserID),
	PRIMARY KEY(BoxID,UserID)
	)