-- �������� ����������� ����������
exec sp_addumpdevice 'disk', 'PostOffice_full_backup', 'D:\Visual(��� �������)\�������� .Net\backupDatabase\PostOffice.bak';

-- �������� ����������� ����������
-- exec sp_dropdevice 'PostOffice_full_backup';

-- �������� ������ ��������� ����� �� ����� ����������� ����������
backup database PostOffice to PostOffice_full_backup;

-- �������� ��
-- drop database PostOffice;

-- �������������� �� �� ��������� ����� �� ����� ����������� ����������
restore database PostOffice from PostOffice_full_backup;
 
 -- �������� ����������� ��������� ����� ��������, �� ����� ����������� ����������
restore verifyonly from PostOffice_full_backup;
go