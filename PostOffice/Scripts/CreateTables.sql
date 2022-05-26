drop table if exists dbo.Subscribes;
drop table if exists dbo.Publications;
drop table if exists dbo.PublicationTypes;
drop table if exists dbo.Subscribers; 
drop table if exists dbo.Districts;
drop table if exists dbo.Regions;
drop table if exists dbo.Streets;
drop table if exists dbo.Postmans;
drop table if exists dbo.Persons;

-- "��� ������������"
set noexec off
go

-- ����������� � ������ ��
--use PostOffice
--go

-- ������� ������(������ ������)
create table dbo.Persons (
	Id          int          not null primary key identity (1, 1),
	[Name]      nvarchar(60) not null,    -- ��� �������
	Surname     nvarchar(60) not null,    -- ������� �������
	Patronymic  nvarchar(60) not null,    -- �������� �������
);
go

-- ������� ������ �����������
create table dbo.Postmans (
	Id          int		not null primary key identity (1, 1),
	IdPerson	int		not null,		  -- ������ ����������

	constraint FK_Postmans_Persons foreign key (IdPerson) references dbo.Persons(Id)
);
go

-- ������� �������� ����
create table dbo.Streets (
	Id          int				not null primary key identity (1, 1),
	[Name]		nvarchar(50)	not null,
);
go

-- ������� ��������, ������� ������ � ���� ����� ���������� � �������� ������� ������������ �� ���
create table dbo.Regions(
	Id		 int          not null primary key identity(1, 1),
	[Name]   nvarchar(40) not null,  -- �������� �������
	IdStreet int          not null,  -- id, ������� ���� � �������� ����

	constraint FK_Regions_Streets foreign key (IdStreet) references dbo.Streets(Id)
);
go

-- ������� ��������� ����������� � �������� (� ���������� �������� ����� ���� ���� ���������)
create table dbo.Districts (
	Id          int				not null primary key identity (1, 1), 
	IdPostman	int				not null,	-- id, ������� ���� � ������� �����������
	IdRegion    int				not null,	-- id, ������� ���� � ������� ��������

	constraint FK_Disctricts_Postmans foreign key (IdPostman) references dbo.Postmans(Id),
	constraint FK_Disctricts_Regions foreign key (IdRegion) references dbo.Regions(Id)
);
go

-- ������� ������ �����������
create table dbo.Subscribers (
	Id          int			not null primary key identity (1, 1),
	IdPerson	int			not null, -- id, ���� � ������� ������ 
	IdDistrict	int			not null, -- id, ������� ���� � ������� ��������
	Building	nvarchar(5)	not null, -- ����� ����
	SubAddress	int				null, -- �������������� �������, ����� ��������, ����� ���� null

	constraint FK_Subscribers_Persons	foreign key (IdPerson)  references dbo.Persons(Id), 
	constraint FK_Subscribers_Districts	foreign key (IdDistrict) references dbo.Districts(Id)
);
go

-- ������� ����� �������
create table dbo.PublicationTypes (
	Id          int				not null primary key identity (1, 1),
	[Name]		nvarchar(10)	not null -- ��� ������� ������/������
);
go

-- ������� �������
create table dbo.Publications (
	Id					int				not null primary key identity (1, 1),
	[Index]				nvarchar(15)	not null,  -- ������ �������
	Title				nvarchar(150)	not null,  -- �������� �������,
	IdPublicationType	int				not null,  -- id, ������� ���� � ������� ����� �������
	Price				int				not null   -- ��������� ����, ��������� ��������

	constraint FK_Publications_PublicationTypes	foreign key (IdPublicationType) references dbo.PublicationTypes(Id)
);
go

-- ������� �������� �� �������
create table dbo.Subscribes (
	Id				int		not null primary key identity (1, 1),
	IdSubscriber	int		not null,	-- id, ������� ���� � �������� �����������
	IdPublication	int		not null,	-- id, ������� ���� � ������� �������
	StartDate		Date	not null,	-- ���� ������ ��������
	Duration		int		not null	-- ������������ ��������

	constraint FK_Subscribes_Subscribers	foreign key (IdSubscriber) references dbo.Subscribers(Id),
	constraint FK_Subscribes_Publications	foreign key (IdPublication) references dbo.Publications(Id)
);
go