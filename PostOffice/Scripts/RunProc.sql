-- Запуск процедур процедур

-- "нет невыполнению"
set noexec off
go

-- подклучение к нужной БД
use PostOffice
go

select * from SubscribesView;


-- Процедуры запросов к БД
exec EachPubAmount; 

-- Пример с параметром null и без
exec AddressPostman N'пр.Ленинский', N'1', 11;
exec AddressPostman N'ул.Куйбышева', N'12', null;

exec SubscribersNewspapers N'Дроздова', N'Марина', N'Григорьевна';
exec SubscribersNewspapers N'Тарапата', N'Михаил', N'Исаакович';

exec PostmansAmount;

exec TopPubsDistrict;

exec SubscribesAverageTerms;


 

