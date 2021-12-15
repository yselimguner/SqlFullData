use NORTHWND

--LIKE KULLANIMI
--Normal Kullanýmda aþaðýdaki iþlemi yapmaktayýz.

select*
from Employees
where FirstName='Michael'

--Like Kullanýmýnda aþaðýdakini yaparýz.

select*
from Employees
where FirstName like 'Michael'

--Adý 'A' harfi ile baþlayanlar.

select*
from Employees
where FirstName like 'A%'

--Soyadýnýn son harfi N harfi olanlar.

select*
from Employees
where LastName like '%N'

--Adýnýn içerisinde 'E' harfi geçenler olduðunda aþaðýdaki gibi yapýyoruz.
select*
from Employees
where FirstName like '%E%'

--Adýnýn ilk harfi 'A'  veya'L' olanlarý yazalým.
select*
from Employees
where FirstName like 'A%' or FirstName like 'L%'
--Diðer Yol(Other Path)
select*
from Employees
where FirstName like '[AL]%'

--Adýnýn içerisinde R veya T harfi olanlar
select*
from Employees
where FirstName like '%R%' or FirstName like '%T%'
--Diðer Yol
select*
from Employees
where FirstName like '%[RT]%'

--Adýnýn ilk Harfi 'J' ve 'R' aralýðýnda olanlarý alfabetik olarak sýralayalým
select*
from Employees
where FirstName like '[J-R]%'
order by FirstName asc

--Adý A ile baþlayanlarýn üçüncü hafleri E harfi olanlarý sýralayýnýz.
select*
from Employees
where FirstName like '%A_E%'

--Adý A ile baþlayanlarýn dördüncü hafleri E harfi olanlarý sýralayýnýz.
select*
from Employees
where FirstName like '%A__E%'

--Adýnýn ilk harfi M ile baþlamayanlar gelsin.
select*
from Employees
where FirstName like '[^M]%'
--Diðer Yol ise
select*
from Employees
where FirstName not like 'M%'

--Adýnýn son harfi T ile bitmeyenleri sýralayalým.
select*
from Employees
where FirstName like '%[^T]'
--Diðer yol ise
select*
from Employees
where FirstName not like '%T'

--Adýnýn ilk harfi A ile I aralýðýnda bulunmayanlar
select*
from Employees
where FirstName like '[^A-I]%'
--Diðer yol
select*
from Employees
where FirstName not like '[A-I]%'

--Adýnýn 2'nci Harfi A veya T olmayanlar.
select*
from Employees
where FirstName not like '_[AT]%'

--Adýnýn ilk iki Harfi LA,NA,AA veya AN olanlarý yazýnýz.
select*
from Employees
where FirstName like '[LA,NA,AA,AN]%'

--ÖRNEK:
--Customer tablosundan CustomerID'sinin 2'nci Harfi 'A',4'üncü Harfi'T' olanlarýn %10'luk kýsmýný getiren sorguyu bulunuz.

select top 10 percent *
from Customers
where CustomerID like '_A_T%'

--VERÝTABANI ÝÞLEMLERÝ
--1)INSERT: Bir veri tabanýndaki tablolarýn birine yeni kayýt eklemek için kullanýlýr.

select*
from Categories


insert into Categories(CategoryName,Description)
values('Baklagiller','Doðanýn birçok noktasýnda yetiþtirilen güzel yiyecek türü.')

--Sadece Description ekleyemeyiz. Çünkü CategoryName Null geçilemez iþaretlendiðinden ötürü. Table'da Design'da bakabilirsiniz.
insert into Categories(Description)
values('Bu ekleme gerçekleþmeyecek')

--Shippers tablosuna ekleme yapalým.
select*
from Shippers
--Shippers'tan sonra eðer ekleme yapacaðýmýz yeri belirtmezsek otomatik olarak ekleme yapar.
insert into Shippers
values('Speedy Gonzales Cargo','(503) 555-3229')

--ÖRNEK
--Customer tablosuna 'VODAFONE' þirketini ekleyelim.
select*
from Customers

insert into Customers(CustomerID,CompanyName,ContactName,ContactTitle,Address)
values('VODFN','Vodafone','James Lincoln','Product Manager','Middle of UK')

--2)UPDATE:Veritabanýnda olan bir verinin update edilmesi.

--Öncelikle Employees tablosunu Calisanlar diye yeni bir tabloya kopyalayalým.
select*
into Calisanlar
from Employees

--Spesifik olarak belirtmezsek tüm kayýtlarý deðiþtirir. MEsela bütün soyadlarý 'GÜNER' olarak güncelleyelim.

update Calisanlar
set LastName='Güner'

select*
from Calisanlar

-- Calisanlar Tablosunda EmployeeID'si 9 olan kiþinin adýný 'Yavuz ' soyadýný 'Kerimoðlu' olarak güncelleyelim.
update Calisanlar
set FirstName='Yavuz', LastName='Kerimoðlu'
where EmployeeID=9
--Sadece id deðeri 10 olan kaydýn bilgileri deðiþtirildi.
--Bir kayýt güncellenirken en güzel yapýlmasý gereken iþlem id'si üzerinden güncellemek olacaktýr.
--Firstname üzerinden yapýlsaydý bu sefer ayný ada sahip olanlarýn hepsi güncellenecektir.
--Ýþlemlerde tekillik saðlanmasý için id üzerinde iþlem yapýlmalýdýr.

--ÖRNEK:
--Product tablosundaki verileri Ürünler adýnda bir tablo olarak yeniden oluþturunuz. Her bir ürüne birim fiyat üzerinden %5 zam yapýnýz.
select*
into Ürünler
from Products

update Ürünler
set UnitPrice=UnitPrice*1.05

--kontrol için önce Products tablosuna sonra ürünler tablosuna bakýyoruz.
select*
from Products
select*
from Ürünler


--3)DELETE
--Aþaðýdakileri yazarsak bütün tabloyu siler.
Delete From Calisanlar

--Eðer bir satýr silersek spesifik olarak bahsetmemiz lazým.
Delete From Calisanlar
where EmployeeID=8
--yazdýðýmýz zaman EmployeeID'si 8 olan satýrý siler.


--ÖRNEK
--Calisanlar tablosunda adý Steven olan satýrlarý sil.
Delete from Calisanlar
where FirstName='Steven'

--Kontrol için yaz
select*
from Calisanlar

--Örnek
--Unvaný Mr. ve Dr. olanlarý 'Calisanlar' tablosundan siliniz.
Delete from Calisanlar
where TitleOfCourtesy='Dr.' or TitleOfCourtesy='Mr.'

Delete from Calisanlar

--DML KOD YAZIM FAALÝYETÝ BURADA SONA ERMÝÞTÝR.

--TARÝH FONKSÝYONLARI
Datepart(): Bir tarih bilgisinin istenilen bölümünü bize verir.

--Sadece Doðduðumuz yýlý almak istiyorsak Tarihin parçasýný alýrýz.
select FirstName,LastName,DATEPART(YY,BirthDate)as [Doðum Yýlý]
from Employees

--Yýlýn Kaçýncý günü doðdu Employees tablosundaki insanlar.
select  FirstName,LastName,DATEPART(DY,BirthDate) as[Doðduðu Gün]
from Employees

--Employees Tablosundaki insanlar yýlýn hangi ayýnda doðdular
select FirstName,LastName,DATEPART(M,BirthDate) as [Doðduðu Ay]
from Employees

--Employees Tablosundaki insanlar yýlýn kaçýncý haftasýnda doðdular
select FirstName,LastName, DATEPART(WK,BirthDate) as [Doðduklarý Hafta]
from Employees

--Employees Tablosundaki insanlar haftanýn kaçýncý günü doðdular
select FirstName,LastName,DATEPART(DW,BirthDate) as [Haftanýn Kaçýncý Günü Doðdular]
from Employees

select DATEPART(HH,Getdate()) --Þu an saat kaç onu verir.
from Employees

--DATEPART(MI,Getdate())  Dakika bilgisini verir.
--DATEPART(SS,Getdate())  Saniye bilgisini verir.
--DATEPART(MS,Getdate())  Salise bilgisini verir.

--DATEDIFF() ile iki Tarih arasýndaki fark

select FirstName,LastName,DATEDIFF(Year,BirthDate,Getdate())as Yaþý
from Employees

--Örnek
--Employees tablosundaki insanlarýn yaþlarýný ve prim günlerini hesaplayýnýz.

select FirstName,LastName, DATEDIFF(Year,Birthdate,Getdate())as Yaþý, DATEDIFF(Day,Hiredate,Getdate()) as [Çalýþtýðý Gün Sayýsý]
from Employees

--Birthdate bulunanlarýn doðumundan bu ana kadar kaç saat geçti ve kaç gün geçti

select (FirstName+' '+LastName) as Ýsim, DATEDIFF(hour, BirthDate,GETDATE()) as [Yaþadýðýn SAAT]
from Employees


select (FirstName+' '+LastName) as Ýsim, DATEDIFF(day, BirthDate,GETDATE()) as [Yaþadýðýn Gün]
from Employees


select (FirstName+' '+LastName) as Ýsim, DATEDIFF(week, BirthDate,GETDATE()) as [Yaþadýðýn hafta]
from Employees


select (FirstName+' '+LastName) as Ýsim, DATEDIFF(month, BirthDate,GETDATE()) as [Yaþadýðýn ay]
from Employees


select (FirstName+' '+LastName) as Ýsim, DATEDIFF(second, BirthDate,GETDATE()) as [Yaþadýðýn Saniye]
from Employees


--SAYISAL ÝÞLEMLER
SELECT 5+2 as Toplama
select 5-2 as Çýkarma
select 5*2 as Çarpma
select 10/2 as Bölme

--Pi Sayýsý için
select pi() as Pi

--Üs almak için
select Power(2,3) as [Üs Alma]

--Mutlak Deðer Almak için
select abs(-25) as [Mutlak Deðer]

--Karekök Almak
select SQRT(121)

--Random sayý
select rand()

--Trigonometrik
select sin(45)

--Yuvarlama
select floor(rand()*100)


--STRING FONKSÝYONLARI
Select 'Merhaba Burasý Kadýköy Hoþgeldiniz' as Mesaj

print 'Kadýköy e Hoþgeldiniz'

--ASCII kodunu almak
select ASCII ('A') as [ASCII kodu]
select ASCII ('a') as [ASCII kodu]

--Ascýý kodunu yazýp deðeri öðrenmek.
select char(65) as [Karakter]
select char(97) as [KARAKTER]

--Charindex
select CHARINDEX('@', 'test1@gmail.com')
select CHARINDEX('a', 'yvuzselimguner34@gmail.com') --Kaçýncý sýrada olduðunu verir. 0'dan baþlar.


select left ('Bilge Adam',7)  --soldan ilk 7 deðeri alýr.
select right ('Bilge Adam',6) --saðdan ilk 6 deðeri alýr

select len('Bilge Adam') as [Karakter Sayýsý]

select LOWER('BÝLGE ADAM') --Büyük harfi küçük harfe çevirir.

select UPPER('bilge adam')  --Bütün harfleri büyütür.

select LTRIM('                     Bilge Adam') as [Soldan Boþluk Siler]

select RTRIM('Bilge Adam                    ') as [Saðdan Boþluk Siler]

select TRIM ('               Bilge Adam            ') as [Sað ve Sol Boþluklarý Siler]
--Ya da bir diðer yapýlan þekil budur.
select RTRIM(LTRIM( '                     Bilge Adam')) as [Saðdan ve Soldan Boþlklarý siler]

--REPLACE 
select REPLACE('Birbirlerine','Bir','iki') as [Metinlerin Yerine Koy]

select REPLACE('kartal kalkar dal sarkar , dal sarkar kartal kalkar','kar','sonuc')

--SUBSTRING 
--Ýlk yazýlan rakamdaki harften sonra ikinci yazýlan rakam kadar harf keser.
select SUBSTRING('Gerekli Eðitimine Hoþgeldiniz',4,6) 

--REVERSE
--Bütün cümleyi tersten yazar.
select REVERSE('Gerekli Eðitime Hoþgeldiniz') as [TERS ÇEVRÝLÝR]


--AGGREGATE FONKSÝYON

--COUNT METODU
Select count(*)
from Employees

select count(EmployeeID)
from Employees

--Product tablosundaki ProductID sayýsýný getirir.
select count(ProductID) as [ProductID sayýsý]
from Products

--Farklý þehir için tekrar etmemesini istiyorsak.
select count(distinct City)
from Employees

--SUM METODU
--Çalýþanlarýn Yaþlarýnýn Toplamýný Bulunuz.
select(Sum(year(getdate())-year(birthdate))) as [Çalýþanlarýn Yaþlarýnýn Toplamý]
from Employees

select(Sum(Datediff(year,Birthdate,GetDate()))) as [Çlýþanlarýn Yaþlarý Toplamý]
from Employees

--String deðerler üzerinde SUM metodu kullanýlmaz

select(Sum(FirstName))
from Employees--Mesela

--AVG METODU
select AVG(EmployeeID)
from Employees

--Örnek
--Çalýþanlarýn yaþ ortalamasýný hesaplamak.
select AVG(datediff(year,birthdate,getdate())) as [Yaþ Ortalamasý]
from Employees
--ya da
select AVG(year(getdate())-year(Birthdate)) as [YAS ORT]
from Employees

--Max (Sütun Adý) Sütundaki en büyük deðeri verir

select MAX(EmployeeID)
from Employees

--Alfabetik olarak en büyük olaný verir.
select MAX(FirstName)
from Employees

--Alfabetik olarak en küçük olaný verir.
select MIN(Firstname)
from Employees

select FirstName as Ad, LastName as Soyad, Title as Baslýk, Country as Ülke
from Employees

--Deðiþiklik yaptýrmak istediðimizde.Ülke adý USA olduðunda Amerika Birleþik Devletleri yaz gibi.
select Firstname, Lastname,
			Case(country)
				when 'USA'
				THEN 'Amerika Birleþik Devletleri'
				when 'UK'
				THEN 'Ýngiltere Birleþik Krallýk'
				ELSE 'Ülke Belirtilmedi'
				END AS Country
from Employees

--EmployeeID>5 ise ID deðeri 5'den büyüktür.
--EmployeeID<5 ise ID deðeri 5'den küçüktür.
--Aksi taktirde 5'e eþittir. Mesa j þeklinde kolon adý oluþturun.7

select FirstName,LastName,EmployeeID,
		case
		when EmployeeID > 5
		THEN 'ID deðeri 5ten büyüktür.'
		when EmployeeID < 5
		THeN 'ID deðeri 5ten küçüktür.'
		else 'ID deðeri 5e eþittir.'
		END as Mesaj
from Employees

select FirstName,LastName,EmployeeID,
		case(EmployeeID)
		when 1
		then 'bir'
		when 2
		then 'iki'
		when 3
		then 'üç'
		when 4
		then 'dört'
		when 5
		then 'beþ'
		when 6
		then 'altý'
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

select EmployeeID,count(OrderID) as [Sipariþ Miktarý]
from Orders
group by EmployeeID

--Örnek
--Çalýþanlarýn ülkelerine göre gruplandýrýlmasý

select Country,count(EmployeeID) as [Ülke Adý]
from Employees
group by Country

--Örnek
--Ürünün fiyatý 35 dolardan az olanlar ürünlerin kategorilerine göre gruplayalým.

select CategoryID,count(UnitPrice)
from Products
where UnitPrice<35
group by CategoryID

--Örnek
--Baþ harfi A-K aralýðýnda olan ve stok miktarý 5 ile 50 arasýnda olan ürünlerin kategorilerine göre gruplayýnýz.
select CategoryID,count(UnitsInStock) as [Stok Miktarý]
from Products
where UnitsInStock<50 and UnitsInStock>5 and ProductName like '[A-K]%'
group by CategoryID

--Örnek
--Her bir sipariþteki toplam ürün adetini bulunuz.
select OrderID as [Sipariþ],SUM(Quantity)as [Ürün Miktarý]
from [Order Details]
group by OrderID

--Örnek
--Her bir sipariþi tutarýna göre listeleyiniz.Ýndirim oranýný gözönünde bulundurunuz.
select OrderID,Sum((1-Discount)*UnitPrice*Quantity)
from [Order Details]
group by OrderID

--HAVING KULLANIMI

--Örnek
--Her bir sipariþteki toplam ürün sayýsý 200'den az olanlar istendiðinde

select OrderID as [Sipariþ Numarasý],Sum(Quantity) as [Miktarý]
from [Order Details]
group by OrderID
having  Sum(Quantity)<200

--Örnek
--Toplam tutar 2500 3500tl arasýnda olan sipariþ sýralamasý 
select OrderID as [Sipariþ Numarasý],SUM((1-Discount)*Quantity*UnitPrice) as [Sipariþ Fiyatý]
from [Order Details]
group by OrderID
having SUM((1-Discount)*Quantity*UnitPrice)<3500 and SUM((1-Discount)*Quantity*UnitPrice)>2500


--Örnek
--Her bir sipariþteki toplam ürün sayýsý 200'den az olanlar
select OrderID,Sum(Quantity)as [Sipariþ Miktarý]
from [Order Details]
group by OrderID
having Sum(Quantity)<200

--Örnek
--1000 adetten fazla satýlan ürünleri getirin

select ProductID,Sum(Quantity)
from [Order Details]
group by ProductID
having Sum(Quantity)>1000

--SUBQUERY(Ýç içe Sorgular)

--Örnek
--Products tablosundaki en pahalý ürünü getiriniz.

select*
from Products
where UnitPrice=(select max(UnitPrice) from Products )

--Örnek
--Fiyatý ortalama fiyatýn üstünde olan ürünler nelerdir?

select*
from Products
where UnitPrice>(select AVG(UnitPrice) from Products)

--Örnek
--Ürünler tablosundaki satýlan ürünlerin listesi

select*
from Products
where ProductID in (select ProductID from [Order Details])

--Örnek
--En ucuz ve pahalý ürünün adý

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

--Örnek
--Exists yapýsýna göre sipariþ alan çalýþanlarý listeleyiniz dersek eðer
select *
from Employees e
where EXISTS(select EmployeeID from Orders o where e.EmployeeID=o.EmployeeID)

--JOIN
--1)Inner Join:Bir tablodaki her bir kaydýn diðer tabloda bir karþýlýðýný olan kayýtlar listelenir.
--inner join ifadesini yazarken inner kelimesini yazmasakta olur.

select ProductName,CategoryName
from Products p
inner join Categories c on c.CategoryID=p.ProductID

select ProductName,CategoryName
from Products p inner join Categories c on p.CategoryID=c.CategoryID
--NOT: EÐER SEÇTÝÐÝMÝZ SÜTUNLAR HER ÝKÝ TABLODA DA BULUNUYORSA O SÜTUNUN HANGÝ TABLODAN SEÇTÝÐÝMÝZÝ AÇIKÇA BELÝRTMEMÝZ GEREKÝR.

--Örnek
--Hangi sipariþ, hangi çalýþan tarafýndan hangi müþteriye yapýlmýþtýr.

select*
from Customers

select*
from [Order Details]

select e.EmployeeID,o.OrderID,c.CustomerID
from Customers c inner join Orders o on c.CustomerID=o.CustomerID
			     inner join Employees e on e.EmployeeID=o.EmployeeID

--Örnek
--Suppliers tablosundan CompanyName, ContactName
--Product tablosundan ProductName,UnitPrice
--Categories tablosundan CategoryName
--CompanyName sütuna göre sýralayýnýz.

select s.CompanyName,s.ContactName,p.ProductName,p.UnitPrice,c.CategoryName
from Suppliers s inner join Products p on p.SupplierID=s.SupplierID
				 inner join Categories c on c.CategoryID=s.SupplierID
				 order by CompanyName

--Örnek
--Kategorilere göre toplam stok miktarýný bulunuz

select c.CategoryName,SUM(p.UnitsInStock) as [Stok Miktarý]
from Categories c inner join Products p on c.CategoryID=p.CategoryID
group by c.CategoryName

--Örnek
--Her bir çalýþan toplam ne kadarlýk satýþ yapmýþtýr.

select*
from Orders

select*
from [Order Details]

select Employees.EmployeeID as [Calisan Numarasý], cast(SUM(Quantity*UnitPrice*(1-Discount)) as decimal (15,2)) as [Satýþ Miktarý]
from Employees inner join Orders on Employees.EmployeeID=orders.EmployeeID
				inner join [Order Details] on [Order Details].OrderID=Orders.OrderID
				group by Employees.EmployeeID

--Örnek
--Herhangi kategori için ortalama fiyatý bulunuz. Ortalama Fiyatý 20'den büyük olan kategorileri getiriniz.

select*
from Categories

select*
from Products

select C.CategoryName,AVG(p.UnitPrice)as [Satýþ Miktarý]
from Products p inner join Categories c on p.CategoryID=c.CategoryID
group by c.CategoryName
having AVG(p.UnitPrice)>20

--2)Outer Join
--2.1) Left Outer Join
---Sorguda istenilen tabloda soldaki tüm kayýtlarý getirirken saðdaki tablodaki sadece iliþkili olan kayýtlarý getirir.

select(e1.FirstName+' '+e1.LastName) as [Calisan Adý Soyadý], (e2.FirstName+' '+e2.LastName) as [Müdür]
from Employees as e1 left join Employees as e2   --"Left Outer Join" yerine kýsca "left join" yazabiliriz.
on e1.ReportsTo=e2.EmployeeID

--2.2) Right Outer Join 
--Sorguda katýlan tablolarda saðdaki tüm kayýtlarý getirirken soldaki tabloda sadece iliþkisi olan kayýtlarý getirilmesi beklenir.

select ProductName,CategoryName
from Categories right join Products on Categories.CategoryID=Products.ProductID

--Her bir çalýþaný müdürüyle listeleyelim

select (e1.FirstName+' '+e1.LastName) as [Müdürü],(e2.FirstName+' '+e2.LastName) as [Calisaný]
from Employees as e1 right join Employees as e2 on e2.ReportsTo=e1.EmployeeID

--2.3)Full Join:Her iki tablodaki kayýtlar getirilir.
--Left ve Right joinin birleþmesi olarak düþünülebilir.

select CategoryName,ProductName
from Categories FULL join Products on Categories.CategoryID=Products.ProductID

--2.4) Cross Join

select COUNT(*)
from Categories

--8 Adet Kayýt Döndü

select Count(*)
from Products
--77 Adet Kayýt Döndü
 
select CategoryName,ProductName
from Categories cross join Products

--Örnek
--220 adetten fazla olan ürünler
select OrderID,Sum(Quantity)
from [Order Details]
group by OrderID
having SUM(Quantity)>220

select*
from [Order Details]

--Örnek
--Hangi müþterilerim hiç sipariþ vermemiþtir.

select*
from Customers
select*
from Orders

select o.OrderID,c.CompanyName
from Orders o inner join Customers c on o.CustomerID=c.CustomerID
where OrderID is null

--Sonuç:Hepsi vermiþtir.


--VÝEW YAPISI-------------
--Sanal tablolardýr.Týpký tablolar gibi davranýrlar ama içerisinde fiziki olarak veri tutmazlar. Karýþýk query'lerde kullanýrýz.
--Veriyi çok kiþinin görmesini engelleyerek veri güvenliðini saðlamýþ oluruz.

--Kullaným Amacý---
--Genellikle karmaþýk sorgularýn tek bir sorgu üzerinden çalýþtýrýlabilmesidir. Bu amaç ile sýklýkla raporlama iþlemlerinde kullaýnýlýrlar.
--Ayný zamanda güvenlik ihtiyacý olduðu durumlarda herhangi bir sorgunun 2. ve 3. þahýslara gizlenmesi amacý ile kullanýlabilir.


--View yapýlarý normal sorgulardan yavaþ çalýþýrlar.
--Herhangi bir sorgunun sonucunu tablo olarak ele alýp üzerinde sorgu çekilebilmesine izin verir.
--Insert delete update yapýlýr. Bu iþlemler fiziksel tablolara yansýtýlýr.
--View yapýlarý fiziksel olarak oluþturulan yapýlardýr.

create view ctgprdsup as
select p.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName
from Categories c inner join Products p on c.CategoryID=p.CategoryID
				  inner join Suppliers s on s.SupplierID=p.SupplierID

select*
from ctgprdsup


--Örnek
--Satýþ yapan çalýþanlarýn, satýþ numaralarý ile birlikte ad ve soyad bilgilerini getiriniz.
create view OrderonEmployees as
select e.FirstName,e.LastName,o.OrderID
from Employees e inner join Orders o on o.EmployeeID=e.EmployeeID

select*
from OrderonEmployees

--With Encryption Komutu
--Eðer yazdýðýnýz  view kodlarýný, object explorer penceresinden 'views' kategorisine sað týklayarak design modda açýp görüntülemek istemiyorsak 
--'With enyrption' komutu ile view oluþturmalýyýz.
--DÝKKAT
--'With Encryprion' iþleminden sonra view oluþturan kiþide dahil olmak üzere kimse komutlarý göremez. Geri dönüþü olmayan bir durumdur.
--Ancak view 'i oluþturan þahýs komutlarýn yedeðini bulundurmasý gerekir. 
--DÝKAT
--Bir dikkat edilmesi gereken durum ise 'With Encryption' ifadesi 'as' keywordünden önce yazýlmalýdýr.

create view OrnekViewPersonel
with encryption
as
select FirstName,LastName,Title
from Employees

select*
from OrnekViewPersonel

--Hangi ürünün hangi kategoride olduðunu gösteren bir view yazýnýz(gizleyiniz).
--categoryname,productname

create view KatÜrGiz
with encryption
as
select Categories.CategoryName,Products.ProductName
from Categories inner join Products on Categories.CategoryID=Products.ProductID

select*
from KatÜrGiz

--Örnek
--Hangi Tedarikçi Hangi Ürünü Saðlýyor
select*
from Products

create view ÜrTed
with encryption
as
select s.CompanyName as [Tedarikçi Þirket Adý], p.ProductName as [Saðladýðý Ürün]
from Products p inner join Suppliers s on p.SupplierID=s.SupplierID

select*
from ÜrTed

--CRUD ÝÞLEMLERÝ
--Tablo iþlemlerinde -- delete update, insert --
--Database üzerindeki yapýlar için -- drop,alter,create -- kullanýlýr.

--GENEL ÖZELLÝKLERÝ--

--Normal sorgulardan hýzlý çalýþýrlar. 
--Çünkü normal sorgular execute edilirken . 'Execute Plan' iþlemi gerçekleþtirilir. Bu iþlem hangi tablodan veri çekilecek hangi kolonlar gelecek bunlar
--nerede sorgudaki keywordlerin sýrasý vs gibi iþlemler yapar.
--Bir sorgu her çalýþtýðýnda bu iþlemler aynen tekrar tekrar çalýþtýrýlýrsa sürekli tekrarlanýr execute. Fakat sorgu store procedure olarak çalýþtýrýlýrsa
--bu iþlem sadece bir kere yapýlýr ve o da ilk çalýþma esnasýndadýr.+
--Diðer çalýþmalarda bu iþlemler yapýlmaz. Bu neden ile hýz performans artýþýný saðlar.
--Ýçerisinde select ,insert,update ve delete iþlemleri yapýlabilir. Dilerseniz iç içe kullanabilirsiniz. 
--Dilerseniz içerisinde function tanýmlayabilirsiniz. 
--Dýþarýdan deðer alabiliriz. Bunlar parametre olarak Stored Procedure 'lere geçirildiðinden dolayý, sorgularýmýzýn 'Sql Injection' yemelerinin önüne
--geçebiliriz. Bu yönüyle güvenlidir.
--Fiziksel olarak ilgili veri tabanýnýn altýnda 'Programmability' => Store Procedure kombinasyonunu kullanýlarak eriþilebilir.


create procedure PersonelGetir
as
select FirstName,LastName,EmployeeID
from Employees

exec PersonelGetir --Çalýþtýrdýk.

drop procedure PersonelGetir   --Sildik.


--Bir Stored Procedure oluþturalým ve  ID'sini baðlayalým.
create procedure sp_test
(
@Id int
)
as
select*
from Products
where ProductID=@Id

exec sp_test 3  
--3 yazdýk mý ProductId'si 3 olan þahsý getirecek bize.

drop procedure sp_test --Ýþimiz bittiði için procedure'u siliyoruz.


create procedure sp_test4
(
@Id int,@parametre2 int,@parametre3 nvarchar(20)
)as
select *
from Employees
where EmployeeID=@Id

exec sp_test4 5,0,'Yazdýðýmýn Önemi Yok'

drop procedure sp_test4 --Ýþimiz bittiði için procedure'u siliyoruz.


--Parametrelerde sadece ID'yi tanýmladýðýmdan ötürü parametre2 ve parametre3'ü tanýmlamam bir anlam ifade etmiyor.

--Örnek
--Country USA olanlarý getiriniz

create procedure sp_ulkeler
(
@country nvarchar(max)
)as

select*
from Employees
where Country=@country

exec sp_ulkeler'USA'

drop procedure sp_ulkeler  --Ýþimiz bittiði için siliyoruz.

--ÜRÜN EKLEME YAPILMASI

create procedure [URUN EKLE]
(
@UrunAdi nvarchar(20),@BirimFiyati money,@CatID int
)
as
insert into Products(ProductName,UnitPrice,CategoryID)
values (@UrunAdi,@BirimFiyati,@CatID)

exec [URUN EKLE] 'Nutella',15,2

exec [URUN EKLE] 'Biscoff',40,3

drop procedure [URUN EKLE]  --Ýþimiz bitince siliyoruz.

--Önemli hususlardan birisi CategoryID'si tanýmlanmýþ olana ekleyebilirsiniz. 9 tane kategoriID'si olduðundan bunlardan birisini
--seçmeliyiz diðer türlü kayýt iþlemi gerçekleþmemektedir.

--Geriye Deðer Döndüren Stored Procedure Yapýsý

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

drop procedure UrunGetir  --Ýþimiz bitince procedure'ü siliyoruz.

--Yukarýdaki 3 satýrý yazdýðýmýz zaman yeni bir sonuc parametresi tanýmlarýz. Akabinde sonuc ve UrunGetir'i birbirine eþitleriz.
--Print Cast durumundan sonra ise Messages bölümüne yazdýrýrýz.

--ÜRÜN GÜNCELLEME 

--Ayný parametreleri ve productId parametresini kullanarak ürünleri update etmek için bir sp yazýnýz.

create procedure Sp_Guncelleme1
(
@UrunAdi nvarchar(max),@BirimFiyati money,@KatId int,@UrunId int
)
as
update Products
set ProductName=@UrunAdi,UnitPrice=@BirimFiyati,CategoryID=@KatId
where ProductID=@UrunId

execute Sp_Guncelleme1 'Cokokrem',12,2,82
--Bunu yazdýðýmýzda Products tablosunda ID'si 82 olan Nutella'yý Cokokrem'e döndürürüz.

drop procedure Sp_Guncelleme1


select*
from Products

--OUTPUT ile Deðer Döndürme

create procedure sp_carpim
(
@s1 int, @s2 int, @s3 int, @sonuc int output
)as
set @sonuc=@s1*@s2*@s3
print 'Sonuç: '+cast(@sonuc as nvarchar(max))

declare @a int
execute sp_carpim 2,3,4,@a output

drop procedure sp_carpim   --iþimiz bitince siliyorum.

--Örnek
--Dýþarýdan aldýðý isim,soyisim ve þehir bilgilerini personel tablosundaki ilgili kolonlara ekleyen Store Procedure yazýnýz.

create procedure sp_AdSoyadGetirme
(
@Adý nvarchar(max),@Soyadý nvarchar(max),@sehir nvarchar(max)
)as
insert into Employees(FirstName,LastName,City)
values(@Adý,@Soyadý,@sehir)

execute sp_AdSoyadGetirme Yavuz,Guner,Istanbul

select*
from Employees

drop procedure sp_AdSoyadGetirme


--	FUNCTION

--1)Scalar Function

--2)In Line Valued Function

--3)Multistatement Table Value Function

--Fonksiyonlar birer database objesi olduklarýndan dolayý DDL(Create,Alter,Drop) keywordleri ile yönetilirler.
--Fonksiyonlar parametre alabilirler veya almayabilirler isteðe baðlýdýr.
--Fonksiyonlar subquery içerisinde kullanýlabilirler. Fakat stored procedurler herhangi bir sorgu içerisinde kullanýlamazlar.
--Scalar ve Table valued functionlarda sadece select sorgular kullanýlabilirler.

---------------1.SCALAR FUNCTION--------------------------
--dbo.'suz kullanýlmazlar.Schemabinding parametresi ile oluþturulan yapýlarda kullanýlýr. Tablo isimlerid de dbosuz kullanýlmaz.
--dbo=>>Database Owner
--Begin-end skoplarý mutlaka kullanýlmalýdýr.

--Örnek
--KDV'li bir fiyat hesaplayýnýz.

create function KDVliFiyatHesapla
(@Tutar money, @Oran float)
returns money
as
begin
return(@Tutar*(1+@Oran))
end

select dbo.KDVliFiyatHesapla(100,0.15)

--Örnek 
--Bugünün tarihini döndürünüz
create function TarihDondurme
()
returns date
as
begin
return(getdate())
end

select dbo.TarihDondurme()

--Örnek
--Kategori Id bilgisi alan, aldýðý bu kategoriden kar adedini getiren bir fonksiyon yazýnýz.

create function KategorideSatýlanUrunSayisi
(@catId int)
returns int
as
begin
return(select  SUM(od.Quantity)
from Products p inner join [Order Details] od on p.ProductID=od.ProductID
where P.CategoryID=@catId)
end

select dbo.KategorideSatýlanUrunSayisi(3)


--Örnek
--Fonksiyon ile toplama iþlemi yapmak

create function Toplama
(@sayi1 int,@sayi2 int)
returns int
as
begin
return(select @sayi1+@sayi2)
end

select dbo.Toplama(10,12)

--Topla, Böl, Çarp ve Çýkar iþlemlerini yap
create function ToplaBolCarpCýkar
(@sayi1 int, @sayi2 int, @sayi3 int, @sayi4 int, @sayi5 int, @sayi6 int)
returns int
as
	begin
		return
			(@sayi1+@sayi2)*(@sayi3-@sayi4)/(@sayi5+@sayi6)
	end

select dbo.ToplaBolCarpCýkar (2,3,5,1,4,2)

--Örnek
--Kendime Göre Tarih Formatlama 
create function TarihFormatlama
(@tarih date,@ayrac char(1),@format char(3))--benden birþey almadan bir iþ yaparsa boþ kalacak
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

--Tablo sonuç fonksiyonu
--Sadece select sorgularýnda kullanýlabilir. Geriye bir tablo döndüreceðinden dolayý returns table denir.
--Begin, end skoplarýna ve dbo part'ýna ihtiyacýnýz yoktur.



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

--Örnek
--ProductName,CategoryName,CategotyId,SupplierId içeren function yazýnýz.

create function Getirme
(@CatID int)
returns table
as
return(select p.ProductName,c.CategoryName,c.CategoryID,p.SupplierID
from Products p inner join Categories c on p.CategoryID=c.CategoryID
where p.CategoryID=@CatID)

select*
from Getirme(3)

drop function Getirme   --Ýþimiz bittiðinden siliyoruz.


--MULTISTATEMENT TABLE VALUED FUNCTION-----------
	--Bu fonksiyonlar içerisinde insert, update ve delete statement larý kullanýlabilir. Yine geriye bir tablo döner. 
	--Fakat bu tabloyu tanýmlamam ve ram'e yerleþtirmem. Tanýmladýðým tablo local veya global bir deðiþken olabilir.

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
values(11111111111,'Yavuz Selim GÜNER',1000),('ErdiTas',1100,'123456978'),('MehmetYukat',1500,'12345634'),('AlperKara',1300,'123456783')


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
--Hesabýmdan 200Tl gitti fakat sonrasýndaki eklenmesi gerekn 200 tl gelmedi.
--raiseerror'dan sonra kayýþ koptu paramý sistemden düþtü fakat geriye eklemedi. Bu yüzden alttaki komutalarý ekleyince sorun yok.

begin try
	begin Tran ---Transaction baþlar
	
	Update Hesap
	set Bakiye -=200
	where TcKimlikNu='123456783'

	raiserror ('Elektrik Kesildi',16,2)

	Update Hesap
	set Bakiye +=200
	where TcKimlikNu='123456978'
	Commit tran --Transaction baþarýlý bir þekilde sonuçlanacaktýr.
end try

begin catch
	print 'Beklenmedik bir hata ile karþýlaþýldý.'
	Rollback tran  --Transaction baþarýsýz bir þekilde sonlandýrýlýr ve yapýlan baþarýlý iþlemler geriye alýnýr.
end catch

select*
from Hesap



---------TRIGGERS---------------
--1) dml .T (insert,update,delete)
--2) ddl .T (Create,alter,drop)
--3) Logon .T 

--1) After Trigger
--2)Instead of Trigger

--Otomatik çalýþan Store Procedure'lerdir.
--C# daki Eventlara benzer.


--DML Triggers
--Bir tabloda insert update delete iþlemlerinde gerçekleþtirildiðinde devreye giren yapýlardýr.

--Inserted Table
--Eðer bir tabloda insert iþlemi yapýlýyorsa arka planda iþlemler ilk önce ram'de oluþturulur.
--Inserted isimli bir tablo üzerinde bu iþlem yapýlýr.
--Ýþlemde herhangi bir problem çýkmaz ise inserted tablosunda eklenen veri baþarýlý bir þekilde fiziksel tabloya eklenir. 
--Ýþlem tamamlandýðýnda ram'de oluþturulan inserted tablosu silinir. 

--Deleted Table 
--Eðer bir tabloda delete iþlemi yapýlýyorsa arka planda iþlemler ilk önce ramde oluþturulan deleted isimli bir tablo üzerinde yapýlýr.
--Eðer iþlemde herhangi bir problem olmaz ise veriler fiziksel tabloya baþarýlý bir þekilde aktarýlýr.
--Ramdeki deleted tablosu silinir 

--Uptade Ýþlemi
--Eðer bir tabloda update iþlemi yapýlýyorsa ramde updated isimli bir tablo oluþturulmaz.!!!!!!!!!!ÖNEMLÝ
--SQL Serverdaki mantýða göre önce silme(delete) ardýndan insert iþlemi gerçekleþecek þekilde  yapýlýr.
--Eðer update iþlemi yapýlýyorsa arka tarafta hem inserted hem de deleted için ayrý ayrý iki tablo oluþturulur. Ýþlemler bunun üzerinde gerçekleþtirilir.
--Dikkat: Update yaparken güncellenen kaydýn orjinali deleted tablosunda güncellendikten sonraki hali inserted tablosun aktarýlýr.
--Çünkü güncellemek demek kaydý önce silmek ardýnda eklemek demektir.

--Deleted ve inserted tablolarý, ilgili sorgu sonucu oluþur. Sorgu sonucunda oluþturduklarý tablolarýn kolonlarý ile oluþurlar.
--Böylece delete ve inserted tablolarýna ben select atabilirim

--Trigger Tanýmlama--
--Create Trigger[Trigger Adý]
--on [Ýþlem Yapýlacak Tablo adý]
--after veya delete, update, insert
--as [Kodlar]

--Dikkat: Tanýmlanan triggerlara ilgili tablonun içerisindeki triggers sekmesinin altýndan eriþim saðlayabilirsiniz.


--Tablonun alt sekmesinde bulunan triggers bölümünde çalýþacak.

create trigger deneme
on Employees
after insert
as
begin
	select 'Yeni bir personel kaydý yapýldý'
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

--Örnek 
--Products tablosundaki bir veri silindiðinde tüm ürünlerin fiyatý otomatik 10 artsýn.

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


--Örnek
--CompanyName Kolonundan bir veri güncellendiðinde kategoriler tablosunda dondurulmuþ ürünler adýnda bir veri oluþsun.

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

--Örnek

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
values('Adý ve Soyadý '+@Adi+' '+@Soyadi+' olan personel '+SUSER_SNAME()+' tarafýndan '+cast(GETDATE() as nvarchar(max))+' tarihinde silinmiþtir.' ) 
-----

delete from Employees
where EmployeeID=11
-----

select*
from Employees


--MULTIPLE ACTIONS TRIGGER--

--Birden fazla aksiyonu tetiklemek için kullanýyor.
alter trigger MultiTrigger
on Employees
after delete,insert
as
print 'Trigger çalýþmasýný tamamladý.'

insert Employees(FirstName,LastName)
values('Hasan1','Huseyin')
-----
delete from Employees
where FirstName='Hasan1'

-------INSTEAD OF TRIGGERLAR-----

--Þu ana kadar insert,update,delete iþlemleri yapýlýrken þu þu iþlemleri yap mantýðý ile hareket ettik.(Yanýnda þunu yap)
--Instead of triggerlar da ise insert, update,delete iþlemleri yerine þu þu iþlemleri yap mantýðý ile çalýþmaktadýr.

--Komutlar
--Create Trigger [Trigger Adý]
--on [Tablo Adý]
--instead of delete, insert,update
--as

--Örnek 5
--Personeller tablosunda update iþlemi gerçekleþtiði anda yapýlacak güncelleþtirme yerine bir log tablosuna
--"adý ..... olan personel ... yeni adýyla deðiþtirilerek .... kullanýcýsý tarafýndan .... tarihinde güncellenmek istendi"

create trigger GenelGuncelleme
on Employees
instead of update
as
		declare @EskiAdi nvarchar(max), @YeniAdi nvarchar(max)
		select @EskiAdi=FirstName from deleted
		select @YeniAdi=FirstName from inserted

insert into LogTablosu
values ('Adý '+@EskiAdi+' olan personel '+' '+@YeniAdi+' yeni adýyla deðiþtirilerek '+' '+SUSER_SNAME()+' kulanýcýsý tarafýndan '+Cast(getdate()as nvarchar(max))+' tarihinde güncellenmek istendi. ')

--------

update Employees 
set FirstName='Selim' 
where FirstName='Yavuz'

------
select*
from logtablosu





