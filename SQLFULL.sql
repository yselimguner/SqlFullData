use NORTHWND

--LIKE KULLANIMI
--Normal Kullan�mda a�a��daki i�lemi yapmaktay�z.

select*
from Employees
where FirstName='Michael'

--Like Kullan�m�nda a�a��dakini yapar�z.

select*
from Employees
where FirstName like 'Michael'

--Ad� 'A' harfi ile ba�layanlar.

select*
from Employees
where FirstName like 'A%'

--Soyad�n�n son harfi N harfi olanlar.

select*
from Employees
where LastName like '%N'

--Ad�n�n i�erisinde 'E' harfi ge�enler oldu�unda a�a��daki gibi yap�yoruz.
select*
from Employees
where FirstName like '%E%'

--Ad�n�n ilk harfi 'A'  veya'L' olanlar� yazal�m.
select*
from Employees
where FirstName like 'A%' or FirstName like 'L%'
--Di�er Yol(Other Path)
select*
from Employees
where FirstName like '[AL]%'

--Ad�n�n i�erisinde R veya T harfi olanlar
select*
from Employees
where FirstName like '%R%' or FirstName like '%T%'
--Di�er Yol
select*
from Employees
where FirstName like '%[RT]%'

--Ad�n�n ilk Harfi 'J' ve 'R' aral���nda olanlar� alfabetik olarak s�ralayal�m
select*
from Employees
where FirstName like '[J-R]%'
order by FirstName asc

--Ad� A ile ba�layanlar�n ���nc� hafleri E harfi olanlar� s�ralay�n�z.
select*
from Employees
where FirstName like '%A_E%'

--Ad� A ile ba�layanlar�n d�rd�nc� hafleri E harfi olanlar� s�ralay�n�z.
select*
from Employees
where FirstName like '%A__E%'

--Ad�n�n ilk harfi M ile ba�lamayanlar gelsin.
select*
from Employees
where FirstName like '[^M]%'
--Di�er Yol ise
select*
from Employees
where FirstName not like 'M%'

--Ad�n�n son harfi T ile bitmeyenleri s�ralayal�m.
select*
from Employees
where FirstName like '%[^T]'
--Di�er yol ise
select*
from Employees
where FirstName not like '%T'

--Ad�n�n ilk harfi A ile I aral���nda bulunmayanlar
select*
from Employees
where FirstName like '[^A-I]%'
--Di�er yol
select*
from Employees
where FirstName not like '[A-I]%'

--Ad�n�n 2'nci Harfi A veya T olmayanlar.
select*
from Employees
where FirstName not like '_[AT]%'

--Ad�n�n ilk iki Harfi LA,NA,AA veya AN olanlar� yaz�n�z.
select*
from Employees
where FirstName like '[LA,NA,AA,AN]%'

--�RNEK:
--Customer tablosundan CustomerID'sinin 2'nci Harfi 'A',4'�nc� Harfi'T' olanlar�n %10'luk k�sm�n� getiren sorguyu bulunuz.

select top 10 percent *
from Customers
where CustomerID like '_A_T%'

--VER�TABANI ��LEMLER�
--1)INSERT: Bir veri taban�ndaki tablolar�n birine yeni kay�t eklemek i�in kullan�l�r.

select*
from Categories


insert into Categories(CategoryName,Description)
values('Baklagiller','Do�an�n bir�ok noktas�nda yeti�tirilen g�zel yiyecek t�r�.')

--Sadece Description ekleyemeyiz. ��nk� CategoryName Null ge�ilemez i�aretlendi�inden �t�r�. Table'da Design'da bakabilirsiniz.
insert into Categories(Description)
values('Bu ekleme ger�ekle�meyecek')

--Shippers tablosuna ekleme yapal�m.
select*
from Shippers
--Shippers'tan sonra e�er ekleme yapaca��m�z yeri belirtmezsek otomatik olarak ekleme yapar.
insert into Shippers
values('Speedy Gonzales Cargo','(503) 555-3229')

--�RNEK
--Customer tablosuna 'VODAFONE' �irketini ekleyelim.
select*
from Customers

insert into Customers(CustomerID,CompanyName,ContactName,ContactTitle,Address)
values('VODFN','Vodafone','James Lincoln','Product Manager','Middle of UK')

--2)UPDATE:Veritaban�nda olan bir verinin update edilmesi.

--�ncelikle Employees tablosunu Calisanlar diye yeni bir tabloya kopyalayal�m.
select*
into Calisanlar
from Employees

--Spesifik olarak belirtmezsek t�m kay�tlar� de�i�tirir. MEsela b�t�n soyadlar� 'G�NER' olarak g�ncelleyelim.

update Calisanlar
set LastName='G�ner'

select*
from Calisanlar

-- Calisanlar Tablosunda EmployeeID'si 9 olan ki�inin ad�n� 'Yavuz ' soyad�n� 'Kerimo�lu' olarak g�ncelleyelim.
update Calisanlar
set FirstName='Yavuz', LastName='Kerimo�lu'
where EmployeeID=9
--Sadece id de�eri 10 olan kayd�n bilgileri de�i�tirildi.
--Bir kay�t g�ncellenirken en g�zel yap�lmas� gereken i�lem id'si �zerinden g�ncellemek olacakt�r.
--Firstname �zerinden yap�lsayd� bu sefer ayn� ada sahip olanlar�n hepsi g�ncellenecektir.
--��lemlerde tekillik sa�lanmas� i�in id �zerinde i�lem yap�lmal�d�r.

--�RNEK:
--Product tablosundaki verileri �r�nler ad�nda bir tablo olarak yeniden olu�turunuz. Her bir �r�ne birim fiyat �zerinden %5 zam yap�n�z.
select*
into �r�nler
from Products

update �r�nler
set UnitPrice=UnitPrice*1.05

--kontrol i�in �nce Products tablosuna sonra �r�nler tablosuna bak�yoruz.
select*
from Products
select*
from �r�nler


--3)DELETE
--A�a��dakileri yazarsak b�t�n tabloyu siler.
Delete From Calisanlar

--E�er bir sat�r silersek spesifik olarak bahsetmemiz laz�m.
Delete From Calisanlar
where EmployeeID=8
--yazd���m�z zaman EmployeeID'si 8 olan sat�r� siler.


--�RNEK
--Calisanlar tablosunda ad� Steven olan sat�rlar� sil.
Delete from Calisanlar
where FirstName='Steven'

--Kontrol i�in yaz
select*
from Calisanlar

--�rnek
--Unvan� Mr. ve Dr. olanlar� 'Calisanlar' tablosundan siliniz.
Delete from Calisanlar
where TitleOfCourtesy='Dr.' or TitleOfCourtesy='Mr.'

Delete from Calisanlar

--DML KOD YAZIM FAAL�YET� BURADA SONA ERM��T�R.

--TAR�H FONKS�YONLARI
Datepart(): Bir tarih bilgisinin istenilen b�l�m�n� bize verir.

--Sadece Do�du�umuz y�l� almak istiyorsak Tarihin par�as�n� al�r�z.
select FirstName,LastName,DATEPART(YY,BirthDate)as [Do�um Y�l�]
from Employees

--Y�l�n Ka��nc� g�n� do�du Employees tablosundaki insanlar.
select  FirstName,LastName,DATEPART(DY,BirthDate) as[Do�du�u G�n]
from Employees

--Employees Tablosundaki insanlar y�l�n hangi ay�nda do�dular
select FirstName,LastName,DATEPART(M,BirthDate) as [Do�du�u Ay]
from Employees

--Employees Tablosundaki insanlar y�l�n ka��nc� haftas�nda do�dular
select FirstName,LastName, DATEPART(WK,BirthDate) as [Do�duklar� Hafta]
from Employees

--Employees Tablosundaki insanlar haftan�n ka��nc� g�n� do�dular
select FirstName,LastName,DATEPART(DW,BirthDate) as [Haftan�n Ka��nc� G�n� Do�dular]
from Employees

select DATEPART(HH,Getdate()) --�u an saat ka� onu verir.
from Employees

--DATEPART(MI,Getdate())  Dakika bilgisini verir.
--DATEPART(SS,Getdate())  Saniye bilgisini verir.
--DATEPART(MS,Getdate())  Salise bilgisini verir.

--DATEDIFF() ile iki Tarih aras�ndaki fark

select FirstName,LastName,DATEDIFF(Year,BirthDate,Getdate())as Ya��
from Employees

--�rnek
--Employees tablosundaki insanlar�n ya�lar�n� ve prim g�nlerini hesaplay�n�z.

select FirstName,LastName, DATEDIFF(Year,Birthdate,Getdate())as Ya��, DATEDIFF(Day,Hiredate,Getdate()) as [�al��t��� G�n Say�s�]
from Employees

--Birthdate bulunanlar�n do�umundan bu ana kadar ka� saat ge�ti ve ka� g�n ge�ti

select (FirstName+' '+LastName) as �sim, DATEDIFF(hour, BirthDate,GETDATE()) as [Ya�ad���n SAAT]
from Employees


select (FirstName+' '+LastName) as �sim, DATEDIFF(day, BirthDate,GETDATE()) as [Ya�ad���n G�n]
from Employees


select (FirstName+' '+LastName) as �sim, DATEDIFF(week, BirthDate,GETDATE()) as [Ya�ad���n hafta]
from Employees


select (FirstName+' '+LastName) as �sim, DATEDIFF(month, BirthDate,GETDATE()) as [Ya�ad���n ay]
from Employees


select (FirstName+' '+LastName) as �sim, DATEDIFF(second, BirthDate,GETDATE()) as [Ya�ad���n Saniye]
from Employees


--SAYISAL ��LEMLER
SELECT 5+2 as Toplama
select 5-2 as ��karma
select 5*2 as �arpma
select 10/2 as B�lme

--Pi Say�s� i�in
select pi() as Pi

--�s almak i�in
select Power(2,3) as [�s Alma]

--Mutlak De�er Almak i�in
select abs(-25) as [Mutlak De�er]

--Karek�k Almak
select SQRT(121)

--Random say�
select rand()

--Trigonometrik
select sin(45)

--Yuvarlama
select floor(rand()*100)


--STRING FONKS�YONLARI
Select 'Merhaba Buras� Kad�k�y Ho�geldiniz' as Mesaj

print 'Kad�k�y e Ho�geldiniz'

--ASCII kodunu almak
select ASCII ('A') as [ASCII kodu]
select ASCII ('a') as [ASCII kodu]

--Asc�� kodunu yaz�p de�eri ��renmek.
select char(65) as [Karakter]
select char(97) as [KARAKTER]

--Charindex
select CHARINDEX('@', 'test1@gmail.com')
select CHARINDEX('a', 'yvuzselimguner34@gmail.com') --Ka��nc� s�rada oldu�unu verir. 0'dan ba�lar.


select left ('Bilge Adam',7)  --soldan ilk 7 de�eri al�r.
select right ('Bilge Adam',6) --sa�dan ilk 6 de�eri al�r

select len('Bilge Adam') as [Karakter Say�s�]

select LOWER('B�LGE ADAM') --B�y�k harfi k���k harfe �evirir.

select UPPER('bilge adam')  --B�t�n harfleri b�y�t�r.

select LTRIM('                     Bilge Adam') as [Soldan Bo�luk Siler]

select RTRIM('Bilge Adam                    ') as [Sa�dan Bo�luk Siler]

select TRIM ('               Bilge Adam            ') as [Sa� ve Sol Bo�luklar� Siler]
--Ya da bir di�er yap�lan �ekil budur.
select RTRIM(LTRIM( '                     Bilge Adam')) as [Sa�dan ve Soldan Bo�lklar� siler]

--REPLACE 
select REPLACE('Birbirlerine','Bir','iki') as [Metinlerin Yerine Koy]

select REPLACE('kartal kalkar dal sarkar , dal sarkar kartal kalkar','kar','sonuc')

--SUBSTRING 
--�lk yaz�lan rakamdaki harften sonra ikinci yaz�lan rakam kadar harf keser.
select SUBSTRING('Gerekli E�itimine Ho�geldiniz',4,6) 

--REVERSE
--B�t�n c�mleyi tersten yazar.
select REVERSE('Gerekli E�itime Ho�geldiniz') as [TERS �EVR�L�R]


--AGGREGATE FONKS�YON

--COUNT METODU
Select count(*)
from Employees

select count(EmployeeID)
from Employees

--Product tablosundaki ProductID say�s�n� getirir.
select count(ProductID) as [ProductID say�s�]
from Products

--Farkl� �ehir i�in tekrar etmemesini istiyorsak.
select count(distinct City)
from Employees

--SUM METODU
--�al��anlar�n Ya�lar�n�n Toplam�n� Bulunuz.
select(Sum(year(getdate())-year(birthdate))) as [�al��anlar�n Ya�lar�n�n Toplam�]
from Employees

select(Sum(Datediff(year,Birthdate,GetDate()))) as [�l��anlar�n Ya�lar� Toplam�]
from Employees

--String de�erler �zerinde SUM metodu kullan�lmaz

select(Sum(FirstName))
from Employees--Mesela

--AVG METODU
select AVG(EmployeeID)
from Employees

--�rnek
--�al��anlar�n ya� ortalamas�n� hesaplamak.
select AVG(datediff(year,birthdate,getdate())) as [Ya� Ortalamas�]
from Employees
--ya da
select AVG(year(getdate())-year(Birthdate)) as [YAS ORT]
from Employees

--Max (S�tun Ad�) S�tundaki en b�y�k de�eri verir

select MAX(EmployeeID)
from Employees

--Alfabetik olarak en b�y�k olan� verir.
select MAX(FirstName)
from Employees

--Alfabetik olarak en k���k olan� verir.
select MIN(Firstname)
from Employees

select FirstName as Ad, LastName as Soyad, Title as Basl�k, Country as �lke
from Employees

--De�i�iklik yapt�rmak istedi�imizde.�lke ad� USA oldu�unda Amerika Birle�ik Devletleri yaz gibi.
select Firstname, Lastname,
			Case(country)
				when 'USA'
				THEN 'Amerika Birle�ik Devletleri'
				when 'UK'
				THEN '�ngiltere Birle�ik Krall�k'
				ELSE '�lke Belirtilmedi'
				END AS Country
from Employees

--EmployeeID>5 ise ID de�eri 5'den b�y�kt�r.
--EmployeeID<5 ise ID de�eri 5'den k���kt�r.
--Aksi taktirde 5'e e�ittir. Mesa j �eklinde kolon ad� olu�turun.7

select FirstName,LastName,EmployeeID,
		case
		when EmployeeID > 5
		THEN 'ID de�eri 5ten b�y�kt�r.'
		when EmployeeID < 5
		THeN 'ID de�eri 5ten k���kt�r.'
		else 'ID de�eri 5e e�ittir.'
		END as Mesaj
from Employees

select FirstName,LastName,EmployeeID,
		case(EmployeeID)
		when 1
		then 'bir'
		when 2
		then 'iki'
		when 3
		then '��'
		when 4
		then 'd�rt'
		when 5
		then 'be�'
		when 6
		then 'alt�'
		when 7
		then 'yedi'
		when 8
		then 'sekiz'
		when 9
		then 'dokuz'
		end as CalisanNumarasi
from Employees

select FirstName,LastName,
		case(TitleofCourtesy)
		when 'Mr.'
		then 'Bey'
		when 'Mrs.'
		then 'Hanim'
		when 'Ms.'
		then 'Hanim'
		when 'Dr.'
		then 'Dr.'
		end as Cinsiyetler
from Employees

--GROUP BY KULLANIMI

select EmployeeID,count(OrderID) as [Sipari� Miktar�]
from Orders
group by EmployeeID

--�rnek
--�al��anlar�n �lkelerine g�re grupland�r�lmas�

select Country,count(EmployeeID) as [�lke Ad�]
from Employees
group by Country

--�rnek
--�r�n�n fiyat� 35 dolardan az olanlar �r�nlerin kategorilerine g�re gruplayal�m.

select CategoryID,count(UnitPrice)
from Products
where UnitPrice<35
group by CategoryID

--�rnek
--Ba� harfi A-K aral���nda olan ve stok miktar� 5 ile 50 aras�nda olan �r�nlerin kategorilerine g�re gruplay�n�z.
select CategoryID,count(UnitsInStock) as [Stok Miktar�]
from Products
where UnitsInStock<50 and UnitsInStock>5 and ProductName like '[A-K]%'
group by CategoryID

--�rnek
--Her bir sipari�teki toplam �r�n adetini bulunuz.
select OrderID as [Sipari�],SUM(Quantity)as [�r�n Miktar�]
from [Order Details]
group by OrderID

--�rnek
--Her bir sipari�i tutar�na g�re listeleyiniz.�ndirim oran�n� g�z�n�nde bulundurunuz.
select OrderID,Sum((1-Discount)*UnitPrice*Quantity)
from [Order Details]
group by OrderID

--HAVING KULLANIMI

--�rnek
--Her bir sipari�teki toplam �r�n say�s� 200'den az olanlar istendi�inde

select OrderID as [Sipari� Numaras�],Sum(Quantity) as [Miktar�]
from [Order Details]
group by OrderID
having  Sum(Quantity)<200

--�rnek
--Toplam tutar 2500 3500tl aras�nda olan sipari� s�ralamas� 
select OrderID as [Sipari� Numaras�],SUM((1-Discount)*Quantity*UnitPrice) as [Sipari� Fiyat�]
from [Order Details]
group by OrderID
having SUM((1-Discount)*Quantity*UnitPrice)<3500 and SUM((1-Discount)*Quantity*UnitPrice)>2500


--�rnek
--Her bir sipari�teki toplam �r�n say�s� 200'den az olanlar
select OrderID,Sum(Quantity)as [Sipari� Miktar�]
from [Order Details]
group by OrderID
having Sum(Quantity)<200

--�rnek
--1000 adetten fazla sat�lan �r�nleri getirin

select ProductID,Sum(Quantity)
from [Order Details]
group by ProductID
having Sum(Quantity)>1000

--SUBQUERY(�� i�e Sorgular)

--�rnek
--Products tablosundaki en pahal� �r�n� getiriniz.

select*
from Products
where UnitPrice=(select max(UnitPrice) from Products )

--�rnek
--Fiyat� ortalama fiyat�n �st�nde olan �r�nler nelerdir?

select*
from Products
where UnitPrice>(select AVG(UnitPrice) from Products)

--�rnek
--�r�nler tablosundaki sat�lan �r�nlerin listesi

select*
from Products
where ProductID in (select ProductID from [Order Details])

--�rnek
--En ucuz ve pahal� �r�n�n ad�

select*
from Products
where UnitPrice=(select Min(UnitPrice) from Products)
select*
from Products
where UnitPrice=(select Max(UnitPrice) from Products)


--EXISTS YAPISI

select CompanyName
from Customers c
where EXISTS(select* from Orders o where c.CustomerID=o.CustomerID)

--�rnek
--Exists yap�s�na g�re sipari� alan �al��anlar� listeleyiniz dersek e�er
select *
from Employees e
where EXISTS(select EmployeeID from Orders o where e.EmployeeID=o.EmployeeID)

--JOIN
--1)Inner Join:Bir tablodaki her bir kayd�n di�er tabloda bir kar��l���n� olan kay�tlar listelenir.
--inner join ifadesini yazarken inner kelimesini yazmasakta olur.

select ProductName,CategoryName
from Products p
inner join Categories c on c.CategoryID=p.ProductID

select ProductName,CategoryName
from Products p inner join Categories c on p.CategoryID=c.CategoryID
--NOT: E�ER SE�T���M�Z S�TUNLAR HER �K� TABLODA DA BULUNUYORSA O S�TUNUN HANG� TABLODAN SE�T���M�Z� A�IK�A BEL�RTMEM�Z GEREK�R.

--�rnek
--Hangi sipari�, hangi �al��an taraf�ndan hangi m��teriye yap�lm��t�r.

select*
from Customers

select*
from [Order Details]

select e.EmployeeID,o.OrderID,c.CustomerID
from Customers c inner join Orders o on c.CustomerID=o.CustomerID
			     inner join Employees e on e.EmployeeID=o.EmployeeID

--�rnek
--Suppliers tablosundan CompanyName, ContactName
--Product tablosundan ProductName,UnitPrice
--Categories tablosundan CategoryName
--CompanyName s�tuna g�re s�ralay�n�z.

select s.CompanyName,s.ContactName,p.ProductName,p.UnitPrice,c.CategoryName
from Suppliers s inner join Products p on p.SupplierID=s.SupplierID
				 inner join Categories c on c.CategoryID=s.SupplierID
				 order by CompanyName

--�rnek
--Kategorilere g�re toplam stok miktar�n� bulunuz

select c.CategoryName,SUM(p.UnitsInStock) as [Stok Miktar�]
from Categories c inner join Products p on c.CategoryID=p.CategoryID
group by c.CategoryName

--�rnek
--Her bir �al��an toplam ne kadarl�k sat�� yapm��t�r.

select*
from Orders

select*
from [Order Details]

select Employees.EmployeeID as [Calisan Numaras�], cast(SUM(Quantity*UnitPrice*(1-Discount)) as decimal (15,2)) as [Sat�� Miktar�]
from Employees inner join Orders on Employees.EmployeeID=orders.EmployeeID
				inner join [Order Details] on [Order Details].OrderID=Orders.OrderID
				group by Employees.EmployeeID

--�rnek
--Herhangi kategori i�in ortalama fiyat� bulunuz. Ortalama Fiyat� 20'den b�y�k olan kategorileri getiriniz.

select*
from Categories

select*
from Products

select C.CategoryName,AVG(p.UnitPrice)as [Sat�� Miktar�]
from Products p inner join Categories c on p.CategoryID=c.CategoryID
group by c.CategoryName
having AVG(p.UnitPrice)>20

--2)Outer Join
--2.1) Left Outer Join
---Sorguda istenilen tabloda soldaki t�m kay�tlar� getirirken sa�daki tablodaki sadece ili�kili olan kay�tlar� getirir.

select(e1.FirstName+' '+e1.LastName) as [Calisan Ad� Soyad�], (e2.FirstName+' '+e2.LastName) as [M�d�r]
from Employees as e1 left join Employees as e2   --"Left Outer Join" yerine k�sca "left join" yazabiliriz.
on e1.ReportsTo=e2.EmployeeID

--2.2) Right Outer Join 
--Sorguda kat�lan tablolarda sa�daki t�m kay�tlar� getirirken soldaki tabloda sadece ili�kisi olan kay�tlar� getirilmesi beklenir.

select ProductName,CategoryName
from Categories right join Products on Categories.CategoryID=Products.ProductID

--Her bir �al��an� m�d�r�yle listeleyelim

select (e1.FirstName+' '+e1.LastName) as [M�d�r�],(e2.FirstName+' '+e2.LastName) as [Calisan�]
from Employees as e1 right join Employees as e2 on e2.ReportsTo=e1.EmployeeID

--2.3)Full Join:Her iki tablodaki kay�tlar getirilir.
--Left ve Right joinin birle�mesi olarak d���n�lebilir.

select CategoryName,ProductName
from Categories FULL join Products on Categories.CategoryID=Products.ProductID

--2.4) Cross Join

select COUNT(*)
from Categories

--8 Adet Kay�t D�nd�

select Count(*)
from Products
--77 Adet Kay�t D�nd�
 
select CategoryName,ProductName
from Categories cross join Products

--�rnek
--220 adetten fazla olan �r�nler
select OrderID,Sum(Quantity)
from [Order Details]
group by OrderID
having SUM(Quantity)>220

select*
from [Order Details]

--�rnek
--Hangi m��terilerim hi� sipari� vermemi�tir.

select*
from Customers
select*
from Orders

select o.OrderID,c.CompanyName
from Orders o inner join Customers c on o.CustomerID=c.CustomerID
where OrderID is null

--Sonu�:Hepsi vermi�tir.


--V�EW YAPISI-------------
--Sanal tablolard�r.T�pk� tablolar gibi davran�rlar ama i�erisinde fiziki olarak veri tutmazlar. Kar���k query'lerde kullan�r�z.
--Veriyi �ok ki�inin g�rmesini engelleyerek veri g�venli�ini sa�lam�� oluruz.

--Kullan�m Amac�---
--Genellikle karma��k sorgular�n tek bir sorgu �zerinden �al��t�r�labilmesidir. Bu ama� ile s�kl�kla raporlama i�lemlerinde kulla�n�l�rlar.
--Ayn� zamanda g�venlik ihtiyac� oldu�u durumlarda herhangi bir sorgunun 2. ve 3. �ah�slara gizlenmesi amac� ile kullan�labilir.


--View yap�lar� normal sorgulardan yava� �al���rlar.
--Herhangi bir sorgunun sonucunu tablo olarak ele al�p �zerinde sorgu �ekilebilmesine izin verir.
--Insert delete update yap�l�r. Bu i�lemler fiziksel tablolara yans�t�l�r.
--View yap�lar� fiziksel olarak olu�turulan yap�lard�r.

create view ctgprdsup as
select p.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName
from Categories c inner join Products p on c.CategoryID=p.CategoryID
				  inner join Suppliers s on s.SupplierID=p.SupplierID

select*
from ctgprdsup


--�rnek
--Sat�� yapan �al��anlar�n, sat�� numaralar� ile birlikte ad ve soyad bilgilerini getiriniz.
create view OrderonEmployees as
select e.FirstName,e.LastName,o.OrderID
from Employees e inner join Orders o on o.EmployeeID=e.EmployeeID

select*
from OrderonEmployees

--With Encryption Komutu
--E�er yazd���n�z  view kodlar�n�, object explorer penceresinden 'views' kategorisine sa� t�klayarak design modda a��p g�r�nt�lemek istemiyorsak 
--'With enyrption' komutu ile view olu�turmal�y�z.
--D�KKAT
--'With Encryprion' i�leminden sonra view olu�turan ki�ide dahil olmak �zere kimse komutlar� g�remez. Geri d�n��� olmayan bir durumdur.
--Ancak view 'i olu�turan �ah�s komutlar�n yede�ini bulundurmas� gerekir. 
--D�KAT
--Bir dikkat edilmesi gereken durum ise 'With Encryption' ifadesi 'as' keyword�nden �nce yaz�lmal�d�r.

create view OrnekViewPersonel
with encryption
as
select FirstName,LastName,Title
from Employees

select*
from OrnekViewPersonel

--Hangi �r�n�n hangi kategoride oldu�unu g�steren bir view yaz�n�z(gizleyiniz).
--categoryname,productname

create view Kat�rGiz
with encryption
as
select Categories.CategoryName,Products.ProductName
from Categories inner join Products on Categories.CategoryID=Products.ProductID

select*
from Kat�rGiz

--�rnek
--Hangi Tedarik�i Hangi �r�n� Sa�l�yor
select*
from Products

create view �rTed
with encryption
as
select s.CompanyName as [Tedarik�i �irket Ad�], p.ProductName as [Sa�lad��� �r�n]
from Products p inner join Suppliers s on p.SupplierID=s.SupplierID

select*
from �rTed

--CRUD ��LEMLER�
--Tablo i�lemlerinde -- delete update, insert --
--Database �zerindeki yap�lar i�in -- drop,alter,create -- kullan�l�r.

--GENEL �ZELL�KLER�--

--Normal sorgulardan h�zl� �al���rlar. 
--��nk� normal sorgular execute edilirken . 'Execute Plan' i�lemi ger�ekle�tirilir. Bu i�lem hangi tablodan veri �ekilecek hangi kolonlar gelecek bunlar
--nerede sorgudaki keywordlerin s�ras� vs gibi i�lemler yapar.
--Bir sorgu her �al��t���nda bu i�lemler aynen tekrar tekrar �al��t�r�l�rsa s�rekli tekrarlan�r execute. Fakat sorgu store procedure olarak �al��t�r�l�rsa
--bu i�lem sadece bir kere yap�l�r ve o da ilk �al��ma esnas�ndad�r.+
--Di�er �al��malarda bu i�lemler yap�lmaz. Bu neden ile h�z performans art���n� sa�lar.
--��erisinde select ,insert,update ve delete i�lemleri yap�labilir. Dilerseniz i� i�e kullanabilirsiniz. 
--Dilerseniz i�erisinde function tan�mlayabilirsiniz. 
--D��ar�dan de�er alabiliriz. Bunlar parametre olarak Stored Procedure 'lere ge�irildi�inden dolay�, sorgular�m�z�n 'Sql Injection' yemelerinin �n�ne
--ge�ebiliriz. Bu y�n�yle g�venlidir.
--Fiziksel olarak ilgili veri taban�n�n alt�nda 'Programmability' => Store Procedure kombinasyonunu kullan�larak eri�ilebilir.


create procedure PersonelGetir
as
select FirstName,LastName,EmployeeID
from Employees

exec PersonelGetir --�al��t�rd�k.

drop procedure PersonelGetir   --Sildik.


--Bir Stored Procedure olu�tural�m ve  ID'sini ba�layal�m.
create procedure sp_test
(
@Id int
)
as
select*
from Products
where ProductID=@Id

exec sp_test 3  
--3 yazd�k m� ProductId'si 3 olan �ahs� getirecek bize.

drop procedure sp_test --��imiz bitti�i i�in procedure'u siliyoruz.


create procedure sp_test4
(
@Id int,@parametre2 int,@parametre3 nvarchar(20)
)as
select *
from Employees
where EmployeeID=@Id

exec sp_test4 5,0,'Yazd���m�n �nemi Yok'

drop procedure sp_test4 --��imiz bitti�i i�in procedure'u siliyoruz.


--Parametrelerde sadece ID'yi tan�mlad���mdan �t�r� parametre2 ve parametre3'� tan�mlamam bir anlam ifade etmiyor.

--�rnek
--Country USA olanlar� getiriniz

create procedure sp_ulkeler
(
@country nvarchar(max)
)as

select*
from Employees
where Country=@country

exec sp_ulkeler'USA'

drop procedure sp_ulkeler  --��imiz bitti�i i�in siliyoruz.

--�R�N EKLEME YAPILMASI

create procedure [URUN EKLE]
(
@UrunAdi nvarchar(20),@BirimFiyati money,@CatID int
)
as
insert into Products(ProductName,UnitPrice,CategoryID)
values (@UrunAdi,@BirimFiyati,@CatID)

exec [URUN EKLE] 'Nutella',15,2

exec [URUN EKLE] 'Biscoff',40,3

drop procedure [URUN EKLE]  --��imiz bitince siliyoruz.

--�nemli hususlardan birisi CategoryID'si tan�mlanm�� olana ekleyebilirsiniz. 9 tane kategoriID'si oldu�undan bunlardan birisini
--se�meliyiz di�er t�rl� kay�t i�lemi ger�ekle�memektedir.

--Geriye De�er D�nd�ren Stored Procedure Yap�s�

create procedure UrunGetir
(
@Fiyat money
)
as 
select *
from Products
where UnitPrice>@Fiyat

return @@RowCount 

execute UrunGetir 100

declare @sonuc int
execute @sonuc=UrunGetir 25
print Cast (@sonuc as nvarchar(max))

drop procedure UrunGetir  --��imiz bitince procedure'� siliyoruz.

--Yukar�daki 3 sat�r� yazd���m�z zaman yeni bir sonuc parametresi tan�mlar�z. Akabinde sonuc ve UrunGetir'i birbirine e�itleriz.
--Print Cast durumundan sonra ise Messages b�l�m�ne yazd�r�r�z.

--�R�N G�NCELLEME 

--Ayn� parametreleri ve productId parametresini kullanarak �r�nleri update etmek i�in bir sp yaz�n�z.

create procedure Sp_Guncelleme1
(
@UrunAdi nvarchar(max),@BirimFiyati money,@KatId int,@UrunId int
)
as
update Products
set ProductName=@UrunAdi,UnitPrice=@BirimFiyati,CategoryID=@KatId
where ProductID=@UrunId

execute Sp_Guncelleme1 'Cokokrem',12,2,82
--Bunu yazd���m�zda Products tablosunda ID'si 82 olan Nutella'y� Cokokrem'e d�nd�r�r�z.

drop procedure Sp_Guncelleme1


select*
from Products

--OUTPUT ile De�er D�nd�rme

create procedure sp_carpim
(
@s1 int, @s2 int, @s3 int, @sonuc int output
)as
set @sonuc=@s1*@s2*@s3
print 'Sonu�: '+cast(@sonuc as nvarchar(max))

declare @a int
execute sp_carpim 2,3,4,@a output

drop procedure sp_carpim   --i�imiz bitince siliyorum.

--�rnek
--D��ar�dan ald��� isim,soyisim ve �ehir bilgilerini personel tablosundaki ilgili kolonlara ekleyen Store Procedure yaz�n�z.

create procedure sp_AdSoyadGetirme
(
@Ad� nvarchar(max),@Soyad� nvarchar(max),@sehir nvarchar(max)
)as
insert into Employees(FirstName,LastName,City)
values(@Ad�,@Soyad�,@sehir)

execute sp_AdSoyadGetirme Yavuz,Guner,Istanbul

select*
from Employees

drop procedure sp_AdSoyadGetirme


--	FUNCTION

--1)Scalar Function

--2)In Line Valued Function

--3)Multistatement Table Value Function

--Fonksiyonlar birer database objesi olduklar�ndan dolay� DDL(Create,Alter,Drop) keywordleri ile y�netilirler.
--Fonksiyonlar parametre alabilirler veya almayabilirler iste�e ba�l�d�r.
--Fonksiyonlar subquery i�erisinde kullan�labilirler. Fakat stored procedurler herhangi bir sorgu i�erisinde kullan�lamazlar.
--Scalar ve Table valued functionlarda sadece select sorgular kullan�labilirler.

---------------1.SCALAR FUNCTION--------------------------
--dbo.'suz kullan�lmazlar.Schemabinding parametresi ile olu�turulan yap�larda kullan�l�r. Tablo isimlerid de dbosuz kullan�lmaz.
--dbo=>>Database Owner
--Begin-end skoplar� mutlaka kullan�lmal�d�r.

--�rnek
--KDV'li bir fiyat hesaplay�n�z.

create function KDVliFiyatHesapla
(@Tutar money, @Oran float)
returns money
as
begin
return(@Tutar*(1+@Oran))
end

select dbo.KDVliFiyatHesapla(100,0.15)

--�rnek 
--Bug�n�n tarihini d�nd�r�n�z
create function TarihDondurme
()
returns date
as
begin
return(getdate())
end

select dbo.TarihDondurme()

--�rnek
--Kategori Id bilgisi alan, ald��� bu kategoriden kar adedini getiren bir fonksiyon yaz�n�z.

create function KategorideSat�lanUrunSayisi
(@catId int)
returns int
as
begin
return(select  SUM(od.Quantity)
from Products p inner join [Order Details] od on p.ProductID=od.ProductID
where P.CategoryID=@catId)
end

select dbo.KategorideSat�lanUrunSayisi(3)


--�rnek
--Fonksiyon ile toplama i�lemi yapmak

create function Toplama
(@sayi1 int,@sayi2 int)
returns int
as
begin
return(select @sayi1+@sayi2)
end

select dbo.Toplama(10,12)

--Topla, B�l, �arp ve ��kar i�lemlerini yap
create function ToplaBolCarpC�kar
(@sayi1 int, @sayi2 int, @sayi3 int, @sayi4 int, @sayi5 int, @sayi6 int)
returns int
as
	begin
		return
			(@sayi1+@sayi2)*(@sayi3-@sayi4)/(@sayi5+@sayi6)
	end

select dbo.ToplaBolCarpC�kar (2,3,5,1,4,2)

--�rnek
--Kendime G�re Tarih Formatlama 
create function TarihFormatlama
(@tarih date,@ayrac char(1),@format char(3))--benden bir�ey almadan bir i� yaparsa bo� kalacak
returns nchar(10)
as
		begin
			declare @yil nchar(4)=Year (@tarih)
			declare @ay nchar(2)=Month(@tarih)
			declare @gun nchar(2)=Day(@tarih)
			declare @formatlitarih nchar(10)


			if len(@gun)=1
				set @gun='0'+@gun
			if len(@ay)=1
				set @ay='0'+@gun

			
			if @format='dmy'
				set @formatlitarih=@gun+@ayrac+@ay+@ayrac+@yil
			else if @format='mdy'
				set @formatlitarih=@ay+@ayrac+@gun+@ayrac+@yil
			else if @format='ymd'
				set @formatlitarih=@yil+@ayrac+@ay+@ayrac+@gun
			else if @format='ydm'
				set @formatlitarih=@yil+@ayrac+@gun+@ayrac+@ay
			else if @format='myd'
				set @formatlitarih=@ay+@ayrac+@yil+@ayrac+@gun
			else if @format='dym'
				set @formatlitarih=@gun+@ayrac+@yil+@ayrac+@ay
			

			return @formatlitarih

		end

		select dbo.TarihFormatlama(GETDATE(),'-','ydm')

---IN LINE TABLE VALUED FUNCTION---

--Tablo sonu� fonksiyonu
--Sadece select sorgular�nda kullan�labilir. Geriye bir tablo d�nd�rece�inden dolay� returns table denir.
--Begin, end skoplar�na ve dbo part'�na ihtiyac�n�z yoktur.



create function KategoriUrunler
(@CatID int)
returns table
as
return (select ProductName,CategoryID
from Products
where CategoryId=@CatID)

select*
from KategoriUrunler(1)
where ProductName like 'C%'

--�rnek
--ProductName,CategoryName,CategotyId,SupplierId i�eren function yaz�n�z.

create function Getirme
(@CatID int)
returns table
as
return(select p.ProductName,c.CategoryName,c.CategoryID,p.SupplierID
from Products p inner join Categories c on p.CategoryID=c.CategoryID
where p.CategoryID=@CatID)

select*
from Getirme(3)

drop function Getirme   --��imiz bitti�inden siliyoruz.


--MULTISTATEMENT TABLE VALUED FUNCTION-----------
	--Bu fonksiyonlar i�erisinde insert, update ve delete statement lar� kullan�labilir. Yine geriye bir tablo d�ner. 
	--Fakat bu tabloyu tan�mlamam ve ram'e yerle�tirmem. Tan�mlad���m tablo local veya global bir de�i�ken olabilir.

create function Kisilerim
(@Tip nvarchar(max))
returns @Tablom table
(Id int,isim nvarchar(max))
as
begin 
	if @Tip='Ad'
		begin
			insert into @Tablom
						select EmployeeID,FirstName
						from Employees
	    end
	else if @Tip='Ad Soyad'
		begin 
			insert into @Tablom
						select EmployeeID,FirstName+' '+LastName
						from Employees
		end
	return
end

select*
from Kisilerim('Ad Soyad')


-----TRANSACTION KULLANIMI-----

create database BankaDB
Go
Use BankaDB
go
--
create table Hesap
(
ID int primary key identity,
AdSoyad nvarchar(max),
Bakiye money,
TcKimlikNu char(11)
)

--

insert into Hesap(TcKimlikNu,AdSoyad,Bakiye)
values(11111111111,'Yavuz Selim G�NER',1000),('ErdiTas',1100,'123456978'),('MehmetYukat',1500,'12345634'),('AlperKara',1300,'123456783')


--

begin try
	update Hesap
	set Bakiye -=200
	where TcKimlikNu=11111111111

	raiserror('Elektrik Kesildi',16,15)

	update Hesap
	set Bakiye +=200
	where  TcKimlikNu=11111111111
end try

begin catch 
print 'Beklenmedik Durum Cereyan Etti'
end catch

select*
from Hesap
--Hesab�mdan 200Tl gitti fakat sonras�ndaki eklenmesi gerekn 200 tl gelmedi.
--raiseerror'dan sonra kay�� koptu param� sistemden d��t� fakat geriye eklemedi. Bu y�zden alttaki komutalar� ekleyince sorun yok.

begin try
	begin Tran ---Transaction ba�lar
	
	Update Hesap
	set Bakiye -=200
	where TcKimlikNu='123456783'

	raiserror ('Elektrik Kesildi',16,2)

	Update Hesap
	set Bakiye +=200
	where TcKimlikNu='123456978'
	Commit tran --Transaction ba�ar�l� bir �ekilde sonu�lanacakt�r.
end try

begin catch
	print 'Beklenmedik bir hata ile kar��la��ld�.'
	Rollback tran  --Transaction ba�ar�s�z bir �ekilde sonland�r�l�r ve yap�lan ba�ar�l� i�lemler geriye al�n�r.
end catch

select*
from Hesap



---------TRIGGERS---------------
--1) dml .T (insert,update,delete)
--2) ddl .T (Create,alter,drop)
--3) Logon .T 

--1) After Trigger
--2)Instead of Trigger

--Otomatik �al��an Store Procedure'lerdir.
--C# daki Eventlara benzer.


--DML Triggers
--Bir tabloda insert update delete i�lemlerinde ger�ekle�tirildi�inde devreye giren yap�lard�r.

--Inserted Table
--E�er bir tabloda insert i�lemi yap�l�yorsa arka planda i�lemler ilk �nce ram'de olu�turulur.
--Inserted isimli bir tablo �zerinde bu i�lem yap�l�r.
--��lemde herhangi bir problem ��kmaz ise inserted tablosunda eklenen veri ba�ar�l� bir �ekilde fiziksel tabloya eklenir. 
--��lem tamamland���nda ram'de olu�turulan inserted tablosu silinir. 

--Deleted Table 
--E�er bir tabloda delete i�lemi yap�l�yorsa arka planda i�lemler ilk �nce ramde olu�turulan deleted isimli bir tablo �zerinde yap�l�r.
--E�er i�lemde herhangi bir problem olmaz ise veriler fiziksel tabloya ba�ar�l� bir �ekilde aktar�l�r.
--Ramdeki deleted tablosu silinir 

--Uptade ��lemi
--E�er bir tabloda update i�lemi yap�l�yorsa ramde updated isimli bir tablo olu�turulmaz.!!!!!!!!!!�NEML�
--SQL Serverdaki mant��a g�re �nce silme(delete) ard�ndan insert i�lemi ger�ekle�ecek �ekilde  yap�l�r.
--E�er update i�lemi yap�l�yorsa arka tarafta hem inserted hem de deleted i�in ayr� ayr� iki tablo olu�turulur. ��lemler bunun �zerinde ger�ekle�tirilir.
--Dikkat: Update yaparken g�ncellenen kayd�n orjinali deleted tablosunda g�ncellendikten sonraki hali inserted tablosun aktar�l�r.
--��nk� g�ncellemek demek kayd� �nce silmek ard�nda eklemek demektir.

--Deleted ve inserted tablolar�, ilgili sorgu sonucu olu�ur. Sorgu sonucunda olu�turduklar� tablolar�n kolonlar� ile olu�urlar.
--B�ylece delete ve inserted tablolar�na ben select atabilirim

--Trigger Tan�mlama--
--Create Trigger[Trigger Ad�]
--on [��lem Yap�lacak Tablo ad�]
--after veya delete, update, insert
--as [Kodlar]

--Dikkat: Tan�mlanan triggerlara ilgili tablonun i�erisindeki triggers sekmesinin alt�ndan eri�im sa�layabilirsiniz.


--Tablonun alt sekmesinde bulunan triggers b�l�m�nde �al��acak.

create trigger deneme
on Employees
after insert
as
begin
	select 'Yeni bir personel kayd� yap�ld�'
end

insert into Employees(FirstName,LastName) 
values('hayrettin','guner')

select*
from Products


create trigger deneme2
on Products
after insert
as
	begin
		select ProductName,UnitPrice=UnitPrice+20, UnitsInStock
		from Products
		where UnitPrice=12
	end

insert into Products(ProductName,UnitPrice,UnitsInStock)
values('armut',12,20)

--�rnek 
--Products tablosundaki bir veri silindi�inde t�m �r�nlerin fiyat� otomatik 10 arts�n.

create trigger deneme3
on Products
after delete
as
update Products
set UnitPrice=UnitPrice+10
-----
delete from Products
where ProductName='armut'
----
select*
from Products


--�rnek
--CompanyName Kolonundan bir veri g�ncellendi�inde kategoriler tablosunda dondurulmu� �r�nler ad�nda bir veri olu�sun.

create trigger trgTedarikGncl
on Suppliers
for update
as
insert into Categories(CategoryName)
values('ET')
-----

update Suppliers 
set CompanyName='Lenovo'
where SupplierID=30
-----

select*
from categories

select*from Suppliers

--�rnek

create table  LogTablosu
(
Id int identity primary key,
Rapor nvarchar(max)
)

---
create Trigger KayitOlusturma
on Employees
after delete
as
declare @Adi nvarchar(max),@Soyadi nvarchar(max)
select @Adi=FirstName,@Soyadi=LastName
from Employees

insert LogTablosu
values('Ad� ve Soyad� '+@Adi+' '+@Soyadi+' olan personel '+SUSER_SNAME()+' taraf�ndan '+cast(GETDATE() as nvarchar(max))+' tarihinde silinmi�tir.' ) 
-----

delete from Employees
where EmployeeID=11
-----

select*
from Employees


--MULTIPLE ACTIONS TRIGGER--

--Birden fazla aksiyonu tetiklemek i�in kullan�yor.
alter trigger MultiTrigger
on Employees
after delete,insert
as
print 'Trigger �al��mas�n� tamamlad�.'

insert Employees(FirstName,LastName)
values('Hasan1','Huseyin')
-----
delete from Employees
where FirstName='Hasan1'

-------INSTEAD OF TRIGGERLAR-----

--�u ana kadar insert,update,delete i�lemleri yap�l�rken �u �u i�lemleri yap mant��� ile hareket ettik.(Yan�nda �unu yap)
--Instead of triggerlar da ise insert, update,delete i�lemleri yerine �u �u i�lemleri yap mant��� ile �al��maktad�r.

--Komutlar
--Create Trigger [Trigger Ad�]
--on [Tablo Ad�]
--instead of delete, insert,update
--as

--�rnek 5
--Personeller tablosunda update i�lemi ger�ekle�ti�i anda yap�lacak g�ncelle�tirme yerine bir log tablosuna
--"ad� ..... olan personel ... yeni ad�yla de�i�tirilerek .... kullan�c�s� taraf�ndan .... tarihinde g�ncellenmek istendi"

create trigger GenelGuncelleme
on Employees
instead of update
as
		declare @EskiAdi nvarchar(max), @YeniAdi nvarchar(max)
		select @EskiAdi=FirstName from deleted
		select @YeniAdi=FirstName from inserted

insert into LogTablosu
values ('Ad� '+@EskiAdi+' olan personel '+' '+@YeniAdi+' yeni ad�yla de�i�tirilerek '+' '+SUSER_SNAME()+' kulan�c�s� taraf�ndan '+Cast(getdate()as nvarchar(max))+' tarihinde g�ncellenmek istendi. ')

--------

update Employees 
set FirstName='Selim' 
where FirstName='Yavuz'

------
select*
from logtablosu





