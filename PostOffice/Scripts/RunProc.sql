-- ������ �������� ��������

-- "��� ������������"
set noexec off
go

-- ����������� � ������ ��
use PostOffice
go

select * from SubscribesView;


-- ��������� �������� � ��
exec EachPubAmount; 

-- ������ � ���������� null � ���
exec AddressPostman N'��.���������', N'1', 11;
exec AddressPostman N'��.���������', N'12', null;

exec SubscribersNewspapers N'��������', N'������', N'�����������';
exec SubscribersNewspapers N'��������', N'������', N'���������';

exec PostmansAmount;

exec TopPubsDistrict;

exec SubscribesAverageTerms;


 

