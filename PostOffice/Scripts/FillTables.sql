
-- "??? ????????????"
set noexec off
go

-- ??????????? ? ?????? ??
--use PostOffice
--go

-- ?????????? ??????
insert dbo.Persons
	(Surname, [Name], Patronymic)
values
    -- ??????????
    (N'??????',      N'????',	  N'??????????'),			/*  1 */
	(N'??????????',  N'????',	  N'????????????'),		/*  2 */
    (N'??????',      N'?????',    N'?????????'),			/*  3 */
	(N'???????',     N'??????',   N'?????????'),			/*  4 */
    (N'????????',    N'?????',    N'????????????'),		/*  5 */
	(N'??????',      N'?????',    N'????????'),    		/*  6 */
	-- ??????????
	(N'???????????', N'??????',		N'?????????'),     	/*  7 */
	(N'???????????', N'??????',		N'????????'),      	/*  8 */
    (N'????',        N'?????????',	N'??????????'),    	/*  9 */
	(N'?????',       N'???????',    N'?????????'),	  	/* 10 */
    (N'????????',    N'??????',     N'?????'),		  	/* 11 */
	(N'????????',    N'??????',		N'?????????'),     	/* 12 */
	(N'????????',    N'??????',		N'??????????'),    	/* 13 */
	(N'???????',     N'????',		N'?????????'),     	/* 14 */
	(N'????????',    N'??????',		N'?????????'),     	/* 15 */
	(N'?????????',   N'???????',	N'????????'),      	/* 16 */
    (N'?????????',   N'??????',		N'?????????'),     	/* 17 */
	(N'?????????',   N'?????????',	N'??????????'),    	/* 18 */
	(N'????????',    N'??????',		N'?????????'),     	/* 19 */
	(N'??????',      N'????????',	N'?????????'),     	/* 20 */
    (N'?????????',   N'?????????',	N'??????????'),    	/* 21 */
	(N'???????????', N'?????????',	N'??????????'),    	/* 22 */ 
	(N'????????',    N'??????',		N'????????'),      	/* 23 */
	(N'??????????',  N'?????',		N'????????????'),  	/* 24 */
    (N'????????',    N'?????',		N'?????????????'), 	/* 25 */
	(N'???????',     N'?????',		N'????????'),      	/* 26 */
	(N'?????????',   N'??????',		N'????????????'),  	/* 27 */
	(N'??????????',  N'?????????',	N'??????????'),		/* 28 */
	(N'???????',     N'?????????',	N'??????????'),		/* 29 */
	(N'???????',     N'??????',		N'???????'),		/* 30 */
	(N'?????',		 N'???????',    N'????????'),		/* 31 */
	(N'?????',		 N'?????',		N'??????????'),		/* 32 */
	(N'????????',    N'??????',		N'??????????'),		/* 33 */
	(N'??????',      N'?????',		N'?????????????'),	/* 34 */
	(N'????????',    N'????',		N'Ը???????'),		/* 35 */
	(N'???????',     N'??????',		N'?????????????'),	/* 36 */
	(N'????????',    N'??????',		N'???????????'),	/* 37 */
	(N'??????',      N'?????',		N'?????????????'),	/* 38 */
	(N'???????',     N'??????',		N'?????????'),		/* 39 */
	(N'???????',     N'?????',		N'?????????'),		/* 40 */
	(N'???????',     N'??????',		N'???????'),		/* 41 */
	(N'???????',     N'???????',	N'?????????'),		/* 42 */
	(N'??????????',  N'??????????',	N'?????????'),		/* 43 */
	(N'???????',     N'???????',	N'Ը???????'),		/* 44 */
	(N'??????',      N'?????????',	N'?????????');		/* 45 */
	 
go 

insert dbo.Postmans
	(IdPerson)
values
	(1),  /* (N'??????',      N'????',		N'??????????'),   */
	(2),  /* (N'??????????',  N'????',		N'????????????'), */
	(3),  /* (N'??????',      N'?????',     N'?????????'),     */
	(4),  /* (N'???????',     N'??????',    N'?????????'),     */
	(5),  /* (N'????????',    N'?????',     N'????????????'),  */
	(6);  /* (N'??????',      N'?????',      N'????????'),     */
go

insert dbo.Streets
	([Name])
values
	(N'??.?????????'),        /*  1 */
	(N'??.?????????'),		 /*  2 */
	(N'??.??????????'), 		 /*  3 */
	(N'??.????? ????????'),   /*  4 */
	(N'??.??????'),			 /*  5 */
	(N'??.???????????????'),  /*  6 */
	(N'??.??????');			 /*  7 */
go

insert dbo.Regions
	([Name], IdStreet)
values
	(N'??????? 1',  1),
	(N'??????? 2',  2),
	(N'??????? 3',  3),
	(N'??????? 4',  4),
	(N'??????? 5',  5),
	(N'??????? 6',  6),
	(N'??????? 7',  7),
	(N'??????? 8',  3),
	(N'??????? 9',  1),
	(N'??????? 10', 2);
go

insert dbo.Districts
	(IdPostman, IdRegion)
values
	(1, 1),  /*  1 */
	(2, 2),  /*  2 */
	(3, 3),  /*  3 */
	(4, 4),  /*  4 */
	(5, 5),  /*  5 */
	(6, 6),  /*  6 */
	(3, 7),  /*  7 */
	(4, 8),  /*  8 */
	(6, 9),  /*  9 */
	(2, 10); /* 10 */
go


insert dbo.Subscribers
	(IdPerson, IdDistrict, Building, SubAddress)
values
	(7,	   1,  N'1',  12),    -- 1
	(8,	   1,  N'1',  32),    -- 2
	(9,	   1,  N'1',  11),    -- 3
	(10,   1,  N'13', null),  -- 4
	(11,   2,  N'45', null),  -- 5
	(12,   2,  N'12', null),  -- 6
	(13,   2,  N'1',  43),    -- 7
	(14,   2,  N'1',  13),    -- 8
	(15,   3,  N'33', null),  -- 9
	(16,   3,  N'42', null),  -- 10
	(17,   3,  N'2',  34),    -- 11
	(18,   3,  N'2',  43),    -- 12
	(19,   4,  N'3',  14),    -- 13
	(20,   4,  N'5',  18),    -- 14
	(21,   4,  N'43', null),  -- 15
	(22,   4,  N'4',  22),    -- 16
	(23,   5,  N'3',  43),    -- 17
	(24,   5,  N'5',  45),    -- 18
	(25,   5,  N'13', null),  -- 19
	(26,   5,  N'6',  54),    -- 20
	(27,   6,  N'1',  26),    -- 21
	(28,   6,  N'34', null),  -- 22
	(29,   6,  N'3',  64),    -- 23
	(30,   6,  N'3',  46),    -- 24
	(31,   7,  N'4',  19),    -- 25
	(32,   7,  N'8',  12),    -- 26
	(33,   7,  N'19', null),  -- 27
	(34,   7,  N'3',  28),    -- 28
	(35,   8,  N'3',  23),    -- 29
	(36,   8,  N'3',  43),    -- 30
	(37,   8,  N'44',  null), -- 31
	(38,   8,  N'47',  null), -- 32
	(39,   9,  N'43',  null), -- 33
	(40,   9,  N'46',  null), -- 34
	(41,   9,  N'7',  36),    -- 35
	(42,   9,  N'4',  27),    -- 36
	(43,   10, N'4',  25),    -- 37
	(44,   10, N'48',  null), -- 38
	(45,   10, N'4',  37);    -- 39
		  	  
go


insert dbo.PublicationTypes
	([Name])
values
	(N'??????'), -- 1
	(N'??????'); -- 2
go

insert dbo.Publications
	([Index], Title, IdPublicationType,  Price)
values	
	(N'43246',	N'????????-???????????',		2,	345 ),   -- 1
	(N'34147',	N'???? ??????',					2,	555 ),	 -- 2
	(N'29723',	N'??????? ?????',				1,	3321),	 -- 3
	(N'38908',	N'?????????',					1,	356 ),	 -- 4
	(N'27818',	N'???',							1,	299 ),	 -- 5
	(N'73477',	N'????????',					1,	99  ),	 -- 6
	(N'70558',	N'???? ??????!',				2,	715 ),	 -- 7
	(N'29090',	N'??????????',					2,	356 ),	 -- 8
	(N'70002',	N'?????????',					2,	454 ),	 -- 9
	(N'38850',	N'????? ? ????',				1,	122 ),	 -- 10
	(N'99555',	N'???????',						1,	144 ),	 -- 11
	(N'43039',  N'?????? ??????',				1,	248);	 -- 12
go
	 


insert dbo.Subscribes
	(IdSubscriber, IdPublication, StartDate, Duration)
values
	( 1,  1, N'2022-1-3' , 1),
	( 2,  2, N'2022-1-8' , 6),
	( 3,  3, N'2022-1-2' , 1),
	( 4,  4, N'2022-2-19', 1),
	( 5,  5, N'2022-2-11', 3),
	( 6,  6, N'2022-1-22', 1),
	( 7,  7, N'2022-2-7' , 3),
	( 8,  8, N'2022-1-8' , 9),
	( 9,  9, N'2022-1-1' , 12),
	(10, 10, N'2022-2-12', 9),
	(11, 11, N'2022-1-27', 1),
	(12, 12, N'2022-1-4' , 1),
	(13, 12, N'2022-1-6' , 12),
	(14, 11, N'2022-2-6' , 3),
	(15, 10, N'2022-1-11', 3),
	(16,  9, N'2022-1-19', 9),
	(17,  8, N'2022-1-25', 9),
	(18,  7, N'2022-1-10', 6),
	(19,  6, N'2022-2-9' , 6),
	(20,  5, N'2022-1-2' , 1),
	(21,  4, N'2022-1-14', 12),
	(22,  3, N'2022-2-12', 1),
	(23,  2, N'2022-1-31', 1),
	(24,  1, N'2022-2-6' , 1),
	(25,  5, N'2022-2-2' , 1),
	(26,  4, N'2022-2-8' , 9),
	(27,  3, N'2022-2-11', 12),
	(28,  2, N'2022-1-27', 3),
	(29,  1, N'2022-1-13', 9),
	(30, 10, N'2022-2-1' , 6),
	(31, 11, N'2022-1-28', 12),
	(32, 12, N'2022-1-24', 9),
	(33, 12, N'2022-1-8' , 9),
	(34,  9, N'2022-2-10', 9),
	(35,  7, N'2022-2-3' , 12),
	(36,  3, N'2022-1-8' , 12),
	(37,  2, N'2022-1-20', 1),
	(38,  1, N'2022-1-17', 12),
	(39, 10, N'2022-2-19', 12),
	( 1, 11, N'2022-2-17', 3),
	( 2, 12, N'2022-2-17', 1),
	( 3, 12, N'2022-1-13', 12),
	( 4,  3, N'2022-2-10', 6),
	( 5,  4, N'2022-2-19', 9),
	( 6,  5, N'2022-1-15', 12),
	( 7,  6, N'2022-1-14', 3),
	( 8,  7, N'2022-2-17', 9),
	( 9,  8, N'2022-2-5' , 6),
	(10,  9, N'2022-1-10', 3),
	(11, 10, N'2022-2-18', 12),
	(12, 11, N'2022-1-31', 1),
	(13, 12, N'2022-1-27', 1),
	(14, 12, N'2022-2-9' , 9),
	(15, 11, N'2022-1-25', 1),
	(16, 10, N'2022-1-31', 12),
	(17,  9, N'2022-1-11', 9),
	(18,  8, N'2022-1-27', 1),
	(19,  7, N'2022-1-15', 12),
	(20,  6, N'2022-1-18', 12),
	(21,  5, N'2022-1-4' , 9),
	(22,  4, N'2022-1-31', 6),
	(23,  3, N'2022-1-12', 12),
	(24,  2, N'2022-2-14', 3),
	(25,  1, N'2022-1-20', 6),
	(26,  5, N'2022-1-15', 3),
	(27, 11, N'2022-1-3' , 3),
	(28, 12, N'2022-2-15', 9),
	(29, 12, N'2022-1-16', 6),
	(30, 11, N'2022-1-4' , 6),
	(31, 10, N'2022-1-3' , 1),
	(32,  9, N'2022-2-19', 9),
	(33,  8, N'2022-1-8' , 1),
	(34,  7, N'2022-1-10', 6),
	(35,  1, N'2022-2-11', 6),
	(36,  6, N'2022-1-5' , 6),
	(37,  9, N'2022-1-1' , 1),
	(38,  7, N'2022-1-2' , 6),
	(39,  6, N'2022-2-1' , 9),
	( 1,  3, N'2022-1-23', 1),
	( 2,  9, N'2022-1-19', 3),
	( 3,  8, N'2022-2-10', 9),
	( 4,  7, N'2022-1-6' , 9),
	( 5,  6, N'2022-1-18', 9),
	( 6,  5, N'2022-1-14', 3),
	( 7,  4, N'2022-1-1' , 9),
	( 8,  3, N'2022-1-2' , 12),
	( 9,  2, N'2022-2-3' , 12),
	(10,  1, N'2022-2-3' , 12),
	(11,  1, N'2022-1-10', 1),
	(12,  6, N'2022-1-23', 6),
	(13,  9, N'2022-2-1' , 1),
	(14,  7, N'2022-1-5' , 9),
	(15,  6, N'2022-2-19', 3),
	(16,  3, N'2022-2-16', 9),
	(17,  9, N'2022-1-18', 12),
	(18,  8, N'2022-2-6' , 6);
	go
	 