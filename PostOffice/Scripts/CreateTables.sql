drop table if exists dbo.Subscribes;
drop table if exists dbo.Publications;
drop table if exists dbo.PublicationTypes;
drop table if exists dbo.Subscribers; 
drop table if exists dbo.Districts;
drop table if exists dbo.Regions;
drop table if exists dbo.Streets;
drop table if exists dbo.Postmans;
drop table if exists dbo.Persons;

-- "нет невыполнению"
set noexec off
go

-- подклучение к нужной БД
--use PostOffice
--go

-- таблица персон(личных данных)
create table dbo.Persons (
	Id          int          not null primary key identity (1, 1),
	[Name]      nvarchar(60) not null,    -- Имя персоны
	Surname     nvarchar(60) not null,    -- Фамилия персоны
	Patronymic  nvarchar(60) not null,    -- Отчество персоны
);
go

-- таблица данных почтальонов
create table dbo.Postmans (
	Id          int		not null primary key identity (1, 1),
	IdPerson	int		not null,		  -- данные почтальона

	constraint FK_Postmans_Persons foreign key (IdPerson) references dbo.Persons(Id)
);
go

-- таблица названий улиц
create table dbo.Streets (
	Id          int				not null primary key identity (1, 1),
	[Name]		nvarchar(50)	not null,
);
go

-- таблица участков, которая хранит в себе адрес проживания и название участка закрепленным за ним
create table dbo.Regions(
	Id		 int          not null primary key identity(1, 1),
	[Name]   nvarchar(40) not null,  -- название участка
	IdStreet int          not null,  -- id, внешний ключ к таблицам улиц

	constraint FK_Regions_Streets foreign key (IdStreet) references dbo.Streets(Id)
);
go

-- таблица отношений почтальонов к участкам (у нескольких участков может быть один почтальон)
create table dbo.Districts (
	Id          int				not null primary key identity (1, 1), 
	IdPostman	int				not null,	-- id, внешний ключ к таблице почтальонов
	IdRegion    int				not null,	-- id, внешний ключ к таблице участков

	constraint FK_Disctricts_Postmans foreign key (IdPostman) references dbo.Postmans(Id),
	constraint FK_Disctricts_Regions foreign key (IdRegion) references dbo.Regions(Id)
);
go

-- таблица данных подписчиков
create table dbo.Subscribers (
	Id          int			not null primary key identity (1, 1),
	IdPerson	int			not null, -- id, ключ к таблице персон 
	IdDistrict	int			not null, -- id, внешний ключ к таблице участков
	Building	nvarchar(5)	not null, -- номер дома
	SubAddress	int				null, -- дополнительный столбец, номер квартиры, может быть null

	constraint FK_Subscribers_Persons	foreign key (IdPerson)  references dbo.Persons(Id), 
	constraint FK_Subscribers_Districts	foreign key (IdDistrict) references dbo.Districts(Id)
);
go

-- таблица типов изданий
create table dbo.PublicationTypes (
	Id          int				not null primary key identity (1, 1),
	[Name]		nvarchar(10)	not null -- вид издания газета/журнал
);
go

-- таблица изданий
create table dbo.Publications (
	Id					int				not null primary key identity (1, 1),
	[Index]				nvarchar(15)	not null,  -- индекс издания
	Title				nvarchar(150)	not null,  -- название издания,
	IdPublicationType	int				not null,  -- id, внешний ключ к таблицы типов изданий
	Price				int				not null   -- подписная цена, стоимость подписки

	constraint FK_Publications_PublicationTypes	foreign key (IdPublicationType) references dbo.PublicationTypes(Id)
);
go

-- таблица подписок на издания
create table dbo.Subscribes (
	Id				int		not null primary key identity (1, 1),
	IdSubscriber	int		not null,	-- id, внешний ключ к таблицам подписчиков
	IdPublication	int		not null,	-- id, внешний ключ к таблице изданий
	StartDate		Date	not null,	-- дата начала подписки
	Duration		int		not null	-- длительность подписки

	constraint FK_Subscribes_Subscribers	foreign key (IdSubscriber) references dbo.Subscribers(Id),
	constraint FK_Subscribes_Publications	foreign key (IdPublication) references dbo.Publications(Id)
);
go