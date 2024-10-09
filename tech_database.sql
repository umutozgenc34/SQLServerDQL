-- UMut

/*

WDNQWJN,
QDWQDW
*/

-- database seçmek
-- SQL Case sensitive deðildir
-- SELECT * FROM TabloAdi as cat WHERE cat.CategoryId >=5
-- dbo database owner kýsaltmasý (veritabaný sahibi)



use nortwind;

------------------------	DQL

select * from Categories;

--- baþka bir data baseden eriþmek için

select * from [nortwind].[dbo].[Categories];

-- Kolon seçmek 

select CategoryID,CategoryName from Categories;

--As Alias() Takma Ad
-- As yazmak zorunda deðiliz
select cat.CategoryName from Categories as cat;

-- Aggreage Function
-- Toplama (sum)
-- Nortwind databaseinden category tablosundaki CategoryID lerin toplamý
select sum(cat.CategoryID) as 'CategoryID Toplamý' from [nortwind].[dbo].[Categories] as cat;
-- Nortwind databaseinden category tablosundaki CategoryID si >5 olan CategoryIDlerin toplamý
select sum(cat.CategoryID) as 'CategoryID > 5 Olanlarýn Toplamý' from Categories as cat where cat.CategoryID >5;
-- Minimum  (min)
-- Nortwind databaseinden category tablosundaki CategoryID si en küçük olan veriyi gösterin
select min(cat.CategoryID) as 'CategoryID Minimum' from [nortwind].[dbo].[Categories] as cat;
-- Nortwind databaseinden category tablosundaki CategoryID si >5 olan en küçük olan veriyi gösterin
select min(cat.CategoryID) as 'CategoryID>5 Minimum' from Categories as cat where cat.CategoryID >5;
-- Maksimum (max)
-- Nortwind databaseinden category tablosundaki CategoryID si en büyük olan veriyi gösterin
select max(cat.CategoryID) as 'CategoryID Maksimum' from [nortwind].[dbo].[Categories] as cat;
-- orTalama (avg)
-- Nortwind databaseinden category tablosundaki CategorID lerin ortalamasýný gösterin
select avg(cat.CategoryID) as 'CategoryID Ortalama' from Categories as cat;
-- Sayýsý (Count)
-- Nortwind databaseinden category tablosundaki verilerin sayýsýný gösterin
select COUNT(cat.CategoryID) as 'CategoryID Sayýsý' from Categories as cat;


-- Where koþulu (B-I-L) BETWEEN IN LIKE

select * from Categories as cat where cat.CategoryID>=5;
select * from Categories as cat where cat.CategoryID <5;
select * from Categories as cat where cat.CategoryID <8;
select * from Categories as cat where cat.CategoryID >=5;

-- between : arasýnda

select * from Categories as cat where cat.CategoryID between 3 and 7;

-- like : benzer
-- % sonu herþey olabilir

-- c ile baþlayanlarý listele
select * from Categories as cat where cat.CategoryName like 'C%';

-- s ile bitenleri listele 
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- içinde on bulunan datalarý göster

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

-- içinde on bulunan datlaarýn categoryIdsini  büyükten küçüðe göster

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%' order by cat.CategoryID desc;

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Con_______s' order by cat.CategoryID desc;

select count(*) as 'on Geçen Kategori Sayisi' from Categories as cat where cat.CategoryName like '%on%';

-- in : subQuery

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID = (select  max(subCat.CategoryId) from Categories as subCat);

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID = (select min(subCat.CategoryID) from Categories as subCat);

-- OrderBy : sýralma
--asc küçükten büyüðe doðru
-- desc büyükten küçüðe doðru

select * from Categories as cat where cat.CategoryID <=6 order by cat.CategoryID asc;
select * from Categories as cat where cat.CategoryID <=7 order by cat.CategoryID desc;

-- TOP : Seçmek
-- Nortwind databaseinde Categories tablosundaki ilk 4 tanesini listele

select top(4)* from Categories as cat ;

select top (4)* from Categories as cat order by cat.CategoryID desc;

-- Distinct : Tekrarsýz veri 

select distinct cat.CategoryName from Categories as cat;

select COUNT( distinct cat.CategoryName) as 'Tekrar etmeyenlerin sayisi' from Categories as cat;

-- IS NULL : Deðeri olmayan
-- Nortwind databaseinde Categories tablosundaki Picture sütunu(columns) null olanlarý listele
select * from Categories as cat where cat.Picture is null;
-- Nortwind databaseinde Categories tablosundaki Picture sütunu(columns) null olan kaç tane veri vardýr
select COUNT(*) as 'Null olan veri sayýsý' from Categories as cat where cat.Picture is null;

-- IS NOT NULL : Deðeri olan
-- Nortwind databaseinde Categories tablosundaki Picture sütunu(columns) null olmayanlarý listele
select * from Categories as cat where cat.Picture is not null;
-- -- Nortwind databaseinde Categories tablosundaki Picture sütunu(columns) null olmayan kaç tane veri vardýr
select COUNT(*) as 'Null olmayan veri sayýsý' from Categories as cat where cat.Picture is not null;


-- categoryname alaný Se ile baþlayan firstname,lastname,username alanlarýný cagýr

select cat.CategoryName,cat.CategoryID from Categories as cat where cat.CategoryName like 'Se%' order by cat.CategoryName;


select * from Customers;

select * from Customers as cus where cus.CompanyName like '%un%' order by cus.ContactName desc;
select * from Customers as cus where cus.CompanyName like 'a%' order by cus.CustomerID asc;
select * from Customers as cus where cus.City like '%m' order by cus.CustomerID desc;

--select * from Customers as cus where cus.CompanyName ilike 'a%' order by cus.CustomerID asc; MS de calýsmýyo 
--select * from Customers as cus where cus.City ilike '%m' order by cus.CustomerID desc;

select * from Categories;
select cat.CategoryName as 'Filtrelenmiþ Kategori isimleri' from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 3 and 7;
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID >3 and cat.CategoryID < 7;
select * from [nortwind].[dbo].[Categories] as cat where cat.Picture is not null and cat.CategoryName like 'Co%';
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%me%' and cat.CategoryID >= 3;

select cat.CategoryID as 'or ile filtrelenmiþ veriler' from Categories as cat where cat.CategoryID > 5 or cat.CategoryName like '%d%';
select CategoryID as 'Id büyükten kücüðe' from Categories as cat where cat.CategoryID >3 and cat.CategoryID <8 order by cat.CategoryID desc;


-- Group By
-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda toplam unitPrice (birim miktarlarý) nelerdir?

select pro.SupplierID, Sum(pro.UnitPrice) as 'Toplam birim miktarý'
from [nortwind].[dbo].[Products] as pro
Group by SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda minimum unitPrice (birim miktarlarý) nelerdir?

select pro.SupplierID, MIN (pro.UnitPrice) as 'Minimum UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda maksimum unitPrice (birim miktarlarý) nelerdir?

select pro.SupplierID, MAX (pro.UnitPrice) as 'Maksimum UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda average unitPrice (birim miktarlarý) nelerdir?
select pro.SupplierID, AVG (pro.UnitPrice) as 'Ortalama UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda Count unitPrice (birim miktarlarý) nelerdir?

select pro.SupplierID, COUNT (pro.UnitPrice) as 'UnitPrice Sayýsý'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

--Having

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarikçi) sütununda toplam unitPrice (birim miktarlarý) 80 Ve yukarýsýnda olanlarý büyükten küçüðe listele

select pro.SupplierID, Sum(pro.UnitPrice) as 'Toplam birim miktarý'
from [nortwind].[dbo].[Products] as pro
Group by SupplierID
Having Sum(pro.UnitPrice) >= 80
Order by Sum(pro.UnitPrice) desc;



-- Aritmetic , Math
-- Aritmetik iþlemler
select 11 + 3 as 'Toplama';
select 11-3 as 'Çýkarma';
select 11 * 3 as 'Çarpma';
select 11 / 3 as 'Bölme';
select 11 % 3 as 'Mod';

select (stu.vize_notes + stu.final_notes) as 'vize + final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes - stu.final_notes) as 'vize - final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes * stu.final_notes) as 'vize * final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes / stu.final_notes) as 'vize / final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes % stu.final_notes) as 'vize % final sonucu' from [nortwind].[dbo].[Student] as stu;

-- Math 

-- Pi
select PI() as 'pi sayýsý';

--Abs

select ABS(-10) AS 'Mutlak deðer';

--SQRT

select SQRT(25) as 'Karekökü';

-- POWER

select POWER (3,2) as 'Üslü Sayý';

-- SIGN

select SIGN(+10) as 'Ýþaret 1 = Pozitif , -1 = Negatif ,  0 = 0' ;
select SIGN(-10) as 'Ýþaret 1 = Pozitif , -1 = Negatif ,  0 = 0';
select SIGN(0) as 'Ýþaret 1 = Pozitif , -1 = Negatif ,  0 = 0';

-- ROUND

select ROUND(1.24563,2) as 'Yuvarlama';

-- CEILING

select CEILING (4.3) as 'Yukarý yuvarlama';

-- FLOOR 

select FLOOR (4.5) as 'Aþaðý Yuvarlama';

-- RANDOM

select RAND() 'Rastgele';

-- SIN,COS,TAN,ATAN,COT => TRIGONOMETRIK FONKSIYONLAR

select SIN(PI()/2) as 'Sinüs';
select COS(PI()/2) as 'Cosinüs';
select TAN(PI()/2) as 'Tan';
select COT(PI()/2) as 'Cot';
select ATAN(PI()/2) as 'Atan';

-- LOG

select LOG(10) as 'Doðal logaritma';
select LOG10(100) as 'Taban logaritma';

-- UNION , UNION ALL
-- !! VERÝ SAYISI VE VE TÜRLERÝ AYNI OLMALIDIR !!
-- TABLOLARI BÝRLEÞTÝRME

select * from Categories;
select * from Suppliers;

--UNION
select sup.SupplierID,sup.CompanyName from Suppliers as sup
union
select cat.CategoryID,cat.CategoryName from Categories as cat

--UNION ALL
select sup.SupplierID,sup.CompanyName from Suppliers as sup
union all
select cat.CategoryID,cat.CategoryName from Categories as cat
-- DATE YYYY-MM-DD

select * from Employees as emp
-- GET DATE()
select GETDATE () as 'Þu an ki zaman'

select YEAR(GETDATE()) AS 'Þu an ki yýl';

-- DATEADD()

select DATEADD(DAY,15,'2024-10-8') as 'Yeni gün'
select DATEADD(DAY,15,GETDATE()) as 'Yeni gün'
select DATEADD(MONTH,1,'2024-10-8') as 'Yeni AY'
select DATEADD(YEAR,15,'2024-10-8') as 'Yeni YIL'

-- DATE DIFF

select DATEDIFF(YEAR, '2021-10-8', GETDATE()) AS 'Fark yýlý';
select DATEDIFF(MONTH, '2021-10-8', GETDATE()) AS 'Fark AYI';
select DATEDIFF(DAY, '2021-10-8', GETDATE()) AS 'Fark GÜNÜ';

-- SPECIAL DATE

select emp.EmployeeID,emp.FirstName,emp.LastName,emp.BirthDate from Employees as emp where emp.BirthDate = '1948-12-08 00:00:00.000';

-- SADECE BELÝRTÝLEN YIL

select emp.EmployeeID,emp.FirstName,emp.LastName,emp.BirthDate from Employees as emp where YEAR(emp.BirthDate) =YEAR('1963');


--STRING 

select * from Categories as cat;

-- LEN (ELEMAN SAYISI)

--Categories tablosundaki CategoryName sütununun harf sayýsý veriniz? 

select cat.CategoryID,cat.CategoryName, LEN(cat.CategoryName) as 'CategoryName sayýsý' from Categories as cat;

--UPPER

-- Categories tablosundaki CategoryName sütununun Büyük harflerle veriniz? 

select cat.CategoryID,cat.CategoryName, UPPER(cat.CategoryName) AS 'Büyük harflerle' from Categories as cat;

-- LOWER 

-- Categories tablosundaki CategoryName sütununun KÜÇÜK harflerle veriniz? 

select cat.CategoryID,cat.CategoryName, LOWER(cat.CategoryName) AS 'Küçük harflerle' from Categories as cat;

--TRIM Saðdan ve soldan boþluklarý al 

-- Categories tablosundaki CategoryName sütununda saðda ve solda boþuklar varsa alýnýz veriniz? 

select cat.CategoryID,cat.CategoryName, TRIM(cat.CategoryName) AS 'Boþuklarý alma ' from Categories as cat;

-- CONCAT

--Categories tablosundaki CategoryName ve Description birleþtirin? 

select CONCAT(cat.CategoryName,',',cat.Description) as 'Birlestir' from Categories as cat;

--REPLACE 

select REPLACE('Sol Göz','Sol', 'Sað');

-- SUBSTRING

select SUBSTRING('Versatil',2,3)


-- DML (Data Manipulation Language) --

--INSERT
--INSERT INTO TabloAdi () Values()
-- ! INTO Yazmak zorunlu deðil.
select * from Categories;

INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar','Her türlü bilgisayar');
INSERT [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar2','Her türlü bilgisayar2');

-- UPDATE
-- UPDATE TabloAdi SET kolonAdi = '' where ID = 1;

UPDATE Categories SET CategoryName = 'Tablet', Description = 'Tablet açýklama' where CategoryID = 10;

-- DELETE
-- DELETE FROM TabloAdi where ID = 1;

DELETE FROM Categories where CategoryID = 9;

--TRANSACTION
-- Insert,Delete,Update kullaniyoruz,
-- Select için kullanmamýza gerek yok

-- 1.YOL
BEGIN TRANSACTION;
	INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar','Her türlü bilgisayar');
	COMMIT; -- BAÞARILIYSA
	--ROLLBACK; -- BAÞARISIZSA

-- 2. YOL
-- EÐER BAÞARILIYSA GÜNCELLEME YAPSIN DEÐÝLSE BÜTÜN ÝÞLEMLERÝ GERÝ ALSIN
BEGIN TRANSACTION;
BEGIN TRY
	UPDATE Categories SET CategoryName = 'Tablet', Description = 'Tablet açýklama' where CategoryID = 10;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH


-- TRIGGER 
-- Trigger (Tetikleyici)
-- Bir iþlem olduktan sonra veya öncesinde gerçekleþecek iþlemlerdir.

-- Nortwind databaseinden bir veri eklendiðinde Log tablosuna otomatik olarak veri eklensin (Trigger).
select * from Categories;
INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar4','Her türlü bilgisayar4');

-- Trigger oluþturma
CREATE TRIGGER categoriesTableAfterInsertAndLogInsert
ON Categories -- Tetiklenecek tablo adý
AFTER INSERT
AS
BEGIN
	INSERT INTO Log (logID,log_name,log_description) values (2,'log_Categories2','Taným log_categories2');
END;

select * from Log;


-- INDEX
-- Veri tabaný sorgularýnýn performansýný arttýrmak istiyorsak
-- Bir tablodaki verilere eriþimi hýzlandýrmak için kullanýlan veritabaný nesnesidir

select * from Log;
-- Log tablosundaki log name sütununa hýzlý bir eriþim saðlamak istiyorsak
CREATE INDEX idx_logname ON Log(log_name);


-- CAST
-- Bir veriyi baþka bir veriye dönüþtürme iþlemidir.
--Bir sayýyý stringe çevir

select CAST(12345 as nvarchar(12)) 'Sayýyý stringe çevir' 

--Bir stringi sayýya çevir

select CAST('12345' as int) 'Stringi sayýya çevir' 

-- Tarih ve zaman farklý formatlarda çevir

select CAST('2024-05-11' as datetime) as 'Datetime'
select CAST('2024-05-11' as date) as 'Date'

-- DDL (DATA DEFINITION LANGUAGE) -- 

-- *****DATABASE***********
-- DATABASE (CREATE)
CREATE DATABASE denemeDb;

-- DATABASE (DROP)
DROP DATABASE denemeDb;

USE master;
GO
DROP DATABASE denemeDb
GO

-- DATABASE (RENAME)

EXEC sp_renamedb 'denemeDb' , 'yeniDatabaseDb'

-- ***** TABLE********

use nortwind;
/*
INT : TAM SAYI
PRIMARY KEY : BÝRÝNCÝL ANAHTAR
IDENTITY : OTOMATÝK ARTIRMAK
NOT NULL : BOÞ GEÇÝLEMEZ
UNIQUE : BENZERSÝZ
DEFAULT : EÐER BÝR ÞEY GÝRÝLMEZSE BENÝM ÝSTEDÝÐÝMÝ GÝREBÝLÝRSÝNÝZ.
*/
-- BLOG CATEGORIES(1)
-- Eðer benim verdiðim tablo adý varsa ekleme yoksa ekle
if not exists(select * from sysobjects where name='notes'and xtype='U')
	CREATE TABLE BlogCategories(
	BlogCategoriesID INT PRIMARY KEY IDENTITY NOT NULL,
	BlogCategoriesName NVARCHAR(100) UNIQUE,
	BlogNumber DECIMAL(10,2),
	CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- INSERT TABLE
select * from BlogCategories;
INSERT INTO BlogCategories(BlogCategoriesName,BlogNumber) values('Java',1);

-- BLOG PAGE(N)
if not exists(select * from sysobjects where name='notes'and xtype='U')
	CREATE TABLE Blog(
	BlogID INT PRIMARY KEY IDENTITY NOT NULL, -- PK
	BlogCategoriesID INT, -- FOREIGN KEY FK
	Title NVARCHAR(100) UNIQUE,
	Description NVARCHAR(MAX),
	CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT FK_Blog_Categories FOREIGN KEY(BlogCategoriesID) REFERENCES BlogCategories(BlogCategoriesID)
);

select * from Blog;
INSERT INTO Blog(BlogCategoriesID,Title,Description) values(1,'title-1','description-1');

-- TRUNCATE

TRUNCATE table Blog;

--JOIN : FK + PK SELECT

-- JOIN(INNER JOIN) **

SELECT
*
FROM Blog as blog
INNER JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID;

-- JOIN(LEFT JOIN) **

SELECT
*
FROM Blog as blog
LEFT JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID;

-- JOIN(RIGHT JOIN) **

SELECT
*
FROM Blog as blog
RIGHT JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID;

-- VIEW 
-- Sanal bir tablo oluþturmak istediðimizde kullanýrýz

Select * from Blog as blog
Select * from BlogCategories as cat

SELECT
blog.BlogID,blog.Title,blog.Description,cat.BlogCategoriesID,cat.BlogCategoriesName
FROM Blog as blog
INNER JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID
where blog.BlogCategoriesID = 1;


-- VIEW ILE SUREKLI KULLANILACAK BIR SORGU HALINE GETÝR

CREATE VIEW BlogAndCategories AS
SELECT
blog.BlogID,blog.Title,blog.Description,cat.BlogCategoriesID,cat.BlogCategoriesName
FROM Blog as blog
INNER JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID
where blog.BlogCategoriesID = 1;

-- VIEW SELECT

select * from BlogAndCategories;