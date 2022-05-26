-- "нет невыполнению"
set noexec off
go

-- подключение к нужной БД
use PostOffice
go

-- ******************* Курсор 1 *******************
-- переменные для работы с данными, из курсора
declare @index int, @title nvarchar(150), @pubType nvarchar(10); 

-- объявляем курсор
declare PublicationsCursor cursor
for
select
	PublicationsView.[Index]
	, PublicationsView.Title
	, PublicationsView.PubType
from
	PublicationsView;	

-- открыть курсов
open PublicationsCursor;

-- чтение первой записи курсора
fetch next from PublicationsCursor into @index, @title, @pubType;

-- в цикле обрабатываем строку из таблицы и читаем следующую
-- @@FETCH_STATUS = 0 - все ок, -1 - ошибка при выборке данных, -2 - нет данных
while @@FETCH_STATUS = 0 begin 
	print 'Индекс издания: ' + str(@index, 5) + ', Тип: '  +  @pubType + ' | ' + @title;
	fetch next from PublicationsCursor into @index, @title, @pubType;
end;
close PublicationsCursor;      -- закрыть курсор
deallocate PublicationsCursor; -- уничтожить курсор
go
 

 -- ******************* Курсор 2 *******************
 -- переменные для работы с данными, из курсора
declare @surname nvarchar(60), @name nvarchar(60), 
		@street nvarchar(50), @regionName nvarchar(40); 

-- объявляем курсор
declare SubscribersCursor cursor
for
select
	SubscribersView.Surname
	, SubscribersView.[Name]
	, SubscribersView.Street
	, SubscribersView.RegionName
from
	SubscribersView;	

-- открыть курсов
open SubscribersCursor;

-- чтение первой записи курсора
fetch next from SubscribersCursor into @surname, @name, @street, @regionName;

-- в цикле обрабатываем строку из таблицы и читаем следующую
-- @@FETCH_STATUS = 0 - все ок, -1 - ошибка при выборке данных, -2 - нет данных
while @@FETCH_STATUS = 0 begin 
	print 'Подписчик: ' + @surname + @name + ', ' + @street + ' --> ' + @regionName;
	fetch next from SubscribersCursor into @surname, @name, @street, @regionName;
end;
close SubscribersCursor;      -- закрыть курсор
deallocate SubscribersCursor; -- уничтожить курсор
go


 -- ******************* Курсор 3 *******************
  -- переменные для работы с данными, из курсора
declare @postMan nvarchar(65), @regionName nvarchar(40), 
		@street nvarchar(50)
-- объявляем курсор
declare DistrictsCursor cursor
for
select
	DistrictsView.Postman
	, DistrictsView.RegionName
	, DistrictsView.Street
from
	DistrictsView;	

-- открыть курсов
open DistrictsCursor;

-- чтение первой записи курсора
fetch next from DistrictsCursor into @postMan, @regionName, @street;

-- в цикле обрабатываем строку из таблицы и читаем следующую
-- @@FETCH_STATUS = 0 - все ок, -1 - ошибка при выборке данных, -2 - нет данных
while @@FETCH_STATUS = 0 begin 
	print 'Почтальон: ' + @postMan + ', обслуживает ' + @regionName + ' на ' + @street;
	fetch next from DistrictsCursor into @postMan, @regionName, @street;
end;
close DistrictsCursor;      -- закрыть курсор
deallocate DistrictsCursor; -- уничтожить курсор
go