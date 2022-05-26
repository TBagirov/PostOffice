					--- Хранимые процедуры ---


-- "нет невыполнению"
set noexec off
go

-- подклучение к нужной БД
--use PostOffice
--go

---------------- Запросы к БД, предложенные по заданию ---------------- 

drop procedure if exists EachPubAmount;
drop procedure if exists AddressPostman;
drop procedure if exists SubscribersNewspapers;
drop procedure if exists PostmansAmount;
drop procedure if exists SubscribesAverageTerms;
go

-- Запрос 1.
--	Определить наименование и количество экземпляров всех изданий, получаемых отделением связи.
create or alter proc EachPubAmount
as begin
    select
		Title
		,Count(Title) as Amount
	from 
		SubscribesView
	group by 
		Title
	order by Amount desc 
end
go


--  Запрос 2.
--	По заданному адресу определить фамилию почтальона, обслуживающего подписчика.
create or alter proc AddressPostman 
		@street nvarchar(50),
		@building nvarchar(5),
		@apartment int
as begin
	select
		Surname + N' ' + N' ' + Substring(Name, 1, 1) 
				  + N'.' + Substring(Patronymic, 1, 1) 
				  + N'.' as Subscriber
		,Street
		,Building
		,Apartment
		,Postman
	from
		SubscribersView
	where
		Street = @street and Building = @building and IsNull(Apartment,0) = IsNull(@apartment,0);
end
go

--  Запрос 3.
--	Какие газеты выписывает гражданин с указанной фамилией, именем, отчеством?	
create or alter proc SubscribersNewspapers
		@surname     nvarchar(60),
		@name        nvarchar(60),
		@patronymic  nvarchar(60)
as begin
	select
		Surname
		,[Name]
		,Patronymic
		,Title
	from
		SubscribesView
	where 
		[Name] = @name and Surname = @surname and Patronymic = @patronymic and PubType = N'Газета'
end
go

--  Запрос 4.
--	Сколько почтальонов работает в почтовом отделении?
create or alter proc PostmansAmount
as begin
	select
		COUNT(Id) as TotalPostmans
	from
		Postmans;
end
go

--  Запрос 5.
--	На каком участке количество экземпляров подписных изданий максимально?
create or alter proc TopPubsDistrict
as begin
	select top(1)
		SubscribesView.IdDistrict
		,SubscribesView.RegionName
		,COUNT(IdDistrict) as Amount
	from
		SubscribesView
	group by 
		IdDistrict, RegionName
	order by Amount desc;
end
go

--  Запрос 6.
--	Каков средний срок подписки по каждому изданию?
create or alter proc SubscribesAverageTerms
as begin
	select
		SubscribesView.PubIndex
		,SubscribesView.PubType
		,SubscribesView.Title 
		,AVG(Duration) as AvgDuration
	from
		SubscribesView
	group by
		PubType, Title, PubIndex
	order by AvgDuration desc;
end
go
