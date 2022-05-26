-- создание логического устройства
exec sp_addumpdevice 'disk', 'PostOffice_full_backup', 'D:\Visual(мои проекты)\Курсовая .Net\backupDatabase\PostOffice.bak';

-- удаление логического устройства
-- exec sp_dropdevice 'PostOffice_full_backup';

-- создание полной резервной копии по имени логического устройства
backup database PostOffice to PostOffice_full_backup;

-- удаление БД
-- drop database PostOffice;

-- Восстановление БД из резервной копии по имени логического устройства
restore database PostOffice from PostOffice_full_backup;
 
 -- проверка целостности резервной копии напрямую, по имени логического устройства
restore verifyonly from PostOffice_full_backup;
go