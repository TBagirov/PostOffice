drop view if exists DistrictsView;
drop view if exists SubscribersView;
drop view if exists PublicationsView;
drop view if exists SubscribesView;
go

-- "нет невыполнению"
set noexec off
go

-- подклучение к нужной БД
--use PostOffice
--go

-- Представление списка адресов
create view DistrictsView as
select
	Districts.Id
	, Regions.[Name] as RegionName
	, Streets.[Name] as Street
	, Persons.Surname + N' ' + Substring([Persons].[Name], 1, 1) 
				  + N'.' + Substring(Persons.Patronymic, 1, 1) 
				  + N'.' as Postman
from
	Districts join (Regions join Streets on Regions.IdStreet = Streets.Id )	 
					on  Districts.IdRegion = Regions.Id 
			  join ( Postmans join Persons on Postmans.IdPerson = Persons.Id) 
					on Districts.IdPostman = Postmans.Id 

go


-- Представление списка подписчиков
create view SubscribersView as
select
	Subscribers.Id
	, Persons.Surname
	, Persons.[Name]
	, Persons.Patronymic
	, DistrictsView.Id as IdDistrict
	, DistrictsView.Street
	, DistrictsView.RegionName
	, DistrictsView.Postman	
	, Building
	, SubAddress as Apartment

from
	Subscribers join Persons on Persons.Id = Subscribers.IdPerson
				join DistrictsView on Subscribers.IdDistrict = DistrictsView.Id;
go



-- Представление списка изданий
create view PublicationsView as
select
	Publications.Id
	, Publications.[Index]
	, Publications.Title
	, PublicationTypes.[Name] as PubType 
	, Price
from
	Publications join PublicationTypes on Publications.IdPublicationType = PublicationTypes.Id ;
go


-- Представление списка подписок
create view SubscribesView as
select 
	Subscribes.Id
	, SubscribersView.Id as IdSubscriber
	, SubscribersView.Surname
	, SubscribersView.[Name]
	, SubscribersView.Patronymic
	, SubscribersView.IdDistrict
	, SubscribersView.Street
	, SubscribersView.Building
	, SubscribersView.Apartment
	, SubscribersView.RegionName
	, SubscribersView.Postman
	, PublicationsView.Id as IdPublications
	, PublicationsView.[Index] as PubIndex
	, PublicationsView.Title
	, PublicationsView.PubType 
	, PublicationsView.Price
	, StartDate
	, Duration
	, PublicationsView.Price * Duration as TotalPrice
from
	Subscribes join SubscribersView on Subscribes.IdSubscriber = SubscribersView.Id
				join PublicationsView on Subscribes.IdPublication = PublicationsView.Id;
go


