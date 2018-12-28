
alter table COMMENT 
  add constraint FK_StatuID 
      foreign key (StatuID) 
      references STATU(StatuID) 
      on delete cascade 
      on update cascade



alter table STATULIKE
	ADD CONSTRAINT FK_StatuID356810
		foreign key (StatuID) 
      references STATU(StatuID) 
      on delete cascade 
      on update cascade



alter table PROFILEALBUM
	ADD CONSTRAINT FK_AlbumID
		foreign key (AlbumID)
		references ALBUM(AlbumID)
		 on delete cascade 
      on update cascade



alter table PAGEALBUM
	ADD CONSTRAINT FK_AlbumID1
		foreign key (AlbumID)
		references ALBUM(AlbumID)
		 on delete cascade 
      on update cascade



	  
alter table GRUPALBUM
	ADD CONSTRAINT FK_AlbumID2
		foreign key (AlbumID)
		references ALBUM(AlbumID)
		 on delete cascade 
      on update cascade


