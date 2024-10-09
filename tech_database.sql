-- UMut

/*

WDNQWJN,
QDWQDW
*/

-- database se�mek
-- SQL Case sensitive de�ildir
-- SELECT * FROM TabloAdi as cat WHERE cat.CategoryId >=5
-- dbo database owner k�saltmas� (veritaban� sahibi)



use nortwind;

------------------------	DQL

select * from Categories;

--- ba�ka bir data baseden eri�mek i�in

select * from [nortwind].[dbo].[Categories];

-- Kolon se�mek 

select CategoryID,CategoryName from Categories;

--As Alias() Takma Ad
-- As yazmak zorunda de�iliz
select cat.CategoryName from Categories as cat;

-- Aggreage Function
-- Toplama (sum)
-- Nortwind databaseinden category tablosundaki CategoryID lerin toplam�
select sum(cat.CategoryID) as 'CategoryID Toplam�' from [nortwind].[dbo].[Categories] as cat;
-- Nortwind databaseinden category tablosundaki CategoryID si >5 olan CategoryIDlerin toplam�
select sum(cat.CategoryID) as 'CategoryID > 5 Olanlar�n Toplam�' from Categories as cat where cat.CategoryID >5;
-- Minimum  (min)
-- Nortwind databaseinden category tablosundaki CategoryID si en k���k olan veriyi g�sterin
select min(cat.CategoryID) as 'CategoryID Minimum' from [nortwind].[dbo].[Categories] as cat;
-- Nortwind databaseinden category tablosundaki CategoryID si >5 olan en k���k olan veriyi g�sterin
select min(cat.CategoryID) as 'CategoryID>5 Minimum' from Categories as cat where cat.CategoryID >5;
-- Maksimum (max)
-- Nortwind databaseinden category tablosundaki CategoryID si en b�y�k olan veriyi g�sterin
select max(cat.CategoryID) as 'CategoryID Maksimum' from [nortwind].[dbo].[Categories] as cat;
-- orTalama (avg)
-- Nortwind databaseinden category tablosundaki CategorID lerin ortalamas�n� g�sterin
select avg(cat.CategoryID) as 'CategoryID Ortalama' from Categories as cat;
-- Say�s� (Count)
-- Nortwind databaseinden category tablosundaki verilerin say�s�n� g�sterin
select COUNT(cat.CategoryID) as 'CategoryID Say�s�' from Categories as cat;


-- Where ko�ulu (B-I-L) BETWEEN IN LIKE

select * from Categories as cat where cat.CategoryID>=5;
select * from Categories as cat where cat.CategoryID <5;
select * from Categories as cat where cat.CategoryID <8;
select * from Categories as cat where cat.CategoryID >=5;

-- between : aras�nda

select * from Categories as cat where cat.CategoryID between 3 and 7;

-- like : benzer
-- % sonu her�ey olabilir

-- c ile ba�layanlar� listele
select * from Categories as cat where cat.CategoryName like 'C%';

-- s ile bitenleri listele 
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- i�inde on bulunan datalar� g�ster

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

-- i�inde on bulunan datlaar�n categoryIdsini  b�y�kten k����e g�ster

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%' order by cat.CategoryID desc;

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Con_______s' order by cat.CategoryID desc;

select count(*) as 'on Ge�en Kategori Sayisi' from Categories as cat where cat.CategoryName like '%on%';

-- in : subQuery

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID = (select  max(subCat.CategoryId) from Categories as subCat);

select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID = (select min(subCat.CategoryID) from Categories as subCat);

-- OrderBy : s�ralma
--asc k���kten b�y��e do�ru
-- desc b�y�kten k����e do�ru

select * from Categories as cat where cat.CategoryID <=6 order by cat.CategoryID asc;
select * from Categories as cat where cat.CategoryID <=7 order by cat.CategoryID desc;

-- TOP : Se�mek
-- Nortwind databaseinde Categories tablosundaki ilk 4 tanesini listele

select top(4)* from Categories as cat ;

select top (4)* from Categories as cat order by cat.CategoryID desc;

-- Distinct : Tekrars�z veri 

select distinct cat.CategoryName from Categories as cat;

select COUNT( distinct cat.CategoryName) as 'Tekrar etmeyenlerin sayisi' from Categories as cat;

-- IS NULL : De�eri olmayan
-- Nortwind databaseinde Categories tablosundaki Picture s�tunu(columns) null olanlar� listele
select * from Categories as cat where cat.Picture is null;
-- Nortwind databaseinde Categories tablosundaki Picture s�tunu(columns) null olan ka� tane veri vard�r
select COUNT(*) as 'Null olan veri say�s�' from Categories as cat where cat.Picture is null;

-- IS NOT NULL : De�eri olan
-- Nortwind databaseinde Categories tablosundaki Picture s�tunu(columns) null olmayanlar� listele
select * from Categories as cat where cat.Picture is not null;
-- -- Nortwind databaseinde Categories tablosundaki Picture s�tunu(columns) null olmayan ka� tane veri vard�r
select COUNT(*) as 'Null olmayan veri say�s�' from Categories as cat where cat.Picture is not null;


-- categoryname alan� Se ile ba�layan firstname,lastname,username alanlar�n� cag�r

select cat.CategoryName,cat.CategoryID from Categories as cat where cat.CategoryName like 'Se%' order by cat.CategoryName;


select * from Customers;

select * from Customers as cus where cus.CompanyName like '%un%' order by cus.ContactName desc;
select * from Customers as cus where cus.CompanyName like 'a%' order by cus.CustomerID asc;
select * from Customers as cus where cus.City like '%m' order by cus.CustomerID desc;

--select * from Customers as cus where cus.CompanyName ilike 'a%' order by cus.CustomerID asc; MS de cal�sm�yo 
--select * from Customers as cus where cus.City ilike '%m' order by cus.CustomerID desc;

select * from Categories;
select cat.CategoryName as 'Filtrelenmi� Kategori isimleri' from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 3 and 7;
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID >3 and cat.CategoryID < 7;
select * from [nortwind].[dbo].[Categories] as cat where cat.Picture is not null and cat.CategoryName like 'Co%';
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%me%' and cat.CategoryID >= 3;

select cat.CategoryID as 'or ile filtrelenmi� veriler' from Categories as cat where cat.CategoryID > 5 or cat.CategoryName like '%d%';
select CategoryID as 'Id b�y�kten k�c��e' from Categories as cat where cat.CategoryID >3 and cat.CategoryID <8 order by cat.CategoryID desc;


-- Group By
-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda toplam unitPrice (birim miktarlar�) nelerdir?

select pro.SupplierID, Sum(pro.UnitPrice) as 'Toplam birim miktar�'
from [nortwind].[dbo].[Products] as pro
Group by SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda minimum unitPrice (birim miktarlar�) nelerdir?

select pro.SupplierID, MIN (pro.UnitPrice) as 'Minimum UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda maksimum unitPrice (birim miktarlar�) nelerdir?

select pro.SupplierID, MAX (pro.UnitPrice) as 'Maksimum UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda average unitPrice (birim miktarlar�) nelerdir?
select pro.SupplierID, AVG (pro.UnitPrice) as 'Ortalama UnitPrice'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda Count unitPrice (birim miktarlar�) nelerdir?

select pro.SupplierID, COUNT (pro.UnitPrice) as 'UnitPrice Say�s�'
from [nortwind].[dbo].[Products] as pro
Group by pro.SupplierID;

--Having

-- Nortwind Databaseinden [Products] tablosunda ki supplier(tedarik�i) s�tununda toplam unitPrice (birim miktarlar�) 80 Ve yukar�s�nda olanlar� b�y�kten k����e listele

select pro.SupplierID, Sum(pro.UnitPrice) as 'Toplam birim miktar�'
from [nortwind].[dbo].[Products] as pro
Group by SupplierID
Having Sum(pro.UnitPrice) >= 80
Order by Sum(pro.UnitPrice) desc;



-- Aritmetic , Math
-- Aritmetik i�lemler
select 11 + 3 as 'Toplama';
select 11-3 as '��karma';
select 11 * 3 as '�arpma';
select 11 / 3 as 'B�lme';
select 11 % 3 as 'Mod';

select (stu.vize_notes + stu.final_notes) as 'vize + final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes - stu.final_notes) as 'vize - final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes * stu.final_notes) as 'vize * final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes / stu.final_notes) as 'vize / final sonucu' from [nortwind].[dbo].[Student] as stu;
select (stu.vize_notes % stu.final_notes) as 'vize % final sonucu' from [nortwind].[dbo].[Student] as stu;

-- Math 

-- Pi
select PI() as 'pi say�s�';

--Abs

select ABS(-10) AS 'Mutlak de�er';

--SQRT

select SQRT(25) as 'Karek�k�';

-- POWER

select POWER (3,2) as '�sl� Say�';

-- SIGN

select SIGN(+10) as '��aret 1 = Pozitif , -1 = Negatif ,  0 = 0' ;
select SIGN(-10) as '��aret 1 = Pozitif , -1 = Negatif ,  0 = 0';
select SIGN(0) as '��aret 1 = Pozitif , -1 = Negatif ,  0 = 0';

-- ROUND

select ROUND(1.24563,2) as 'Yuvarlama';

-- CEILING

select CEILING (4.3) as 'Yukar� yuvarlama';

-- FLOOR 

select FLOOR (4.5) as 'A�a�� Yuvarlama';

-- RANDOM

select RAND() 'Rastgele';

-- SIN,COS,TAN,ATAN,COT => TRIGONOMETRIK FONKSIYONLAR

select SIN(PI()/2) as 'Sin�s';
select COS(PI()/2) as 'Cosin�s';
select TAN(PI()/2) as 'Tan';
select COT(PI()/2) as 'Cot';
select ATAN(PI()/2) as 'Atan';

-- LOG

select LOG(10) as 'Do�al logaritma';
select LOG10(100) as 'Taban logaritma';

-- UNION , UNION ALL
-- !! VER� SAYISI VE VE T�RLER� AYNI OLMALIDIR !!
-- TABLOLARI B�RLE�T�RME

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
select GETDATE () as '�u an ki zaman'

select YEAR(GETDATE()) AS '�u an ki y�l';

-- DATEADD()

select DATEADD(DAY,15,'2024-10-8') as 'Yeni g�n'
select DATEADD(DAY,15,GETDATE()) as 'Yeni g�n'
select DATEADD(MONTH,1,'2024-10-8') as 'Yeni AY'
select DATEADD(YEAR,15,'2024-10-8') as 'Yeni YIL'

-- DATE DIFF

select DATEDIFF(YEAR, '2021-10-8', GETDATE()) AS 'Fark y�l�';
select DATEDIFF(MONTH, '2021-10-8', GETDATE()) AS 'Fark AYI';
select DATEDIFF(DAY, '2021-10-8', GETDATE()) AS 'Fark G�N�';

-- SPECIAL DATE

select emp.EmployeeID,emp.FirstName,emp.LastName,emp.BirthDate from Employees as emp where emp.BirthDate = '1948-12-08 00:00:00.000';

-- SADECE BEL�RT�LEN YIL

select emp.EmployeeID,emp.FirstName,emp.LastName,emp.BirthDate from Employees as emp where YEAR(emp.BirthDate) =YEAR('1963');


--STRING 

select * from Categories as cat;

-- LEN (ELEMAN SAYISI)

--Categories tablosundaki CategoryName s�tununun harf say�s� veriniz? 

select cat.CategoryID,cat.CategoryName, LEN(cat.CategoryName) as 'CategoryName say�s�' from Categories as cat;

--UPPER

-- Categories tablosundaki CategoryName s�tununun B�y�k harflerle veriniz? 

select cat.CategoryID,cat.CategoryName, UPPER(cat.CategoryName) AS 'B�y�k harflerle' from Categories as cat;

-- LOWER 

-- Categories tablosundaki CategoryName s�tununun K���K harflerle veriniz? 

select cat.CategoryID,cat.CategoryName, LOWER(cat.CategoryName) AS 'K���k harflerle' from Categories as cat;

--TRIM Sa�dan ve soldan bo�luklar� al 

-- Categories tablosundaki CategoryName s�tununda sa�da ve solda bo�uklar varsa al�n�z veriniz? 

select cat.CategoryID,cat.CategoryName, TRIM(cat.CategoryName) AS 'Bo�uklar� alma ' from Categories as cat;

-- CONCAT

--Categories tablosundaki CategoryName ve Description birle�tirin? 

select CONCAT(cat.CategoryName,',',cat.Description) as 'Birlestir' from Categories as cat;

--REPLACE 

select REPLACE('Sol G�z','Sol', 'Sa�');

-- SUBSTRING

select SUBSTRING('Versatil',2,3)


-- DML (Data Manipulation Language) --

--INSERT
--INSERT INTO TabloAdi () Values()
-- ! INTO Yazmak zorunlu de�il.
select * from Categories;

INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar','Her t�rl� bilgisayar');
INSERT [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar2','Her t�rl� bilgisayar2');

-- UPDATE
-- UPDATE TabloAdi SET kolonAdi = '' where ID = 1;

UPDATE Categories SET CategoryName = 'Tablet', Description = 'Tablet a��klama' where CategoryID = 10;

-- DELETE
-- DELETE FROM TabloAdi where ID = 1;

DELETE FROM Categories where CategoryID = 9;

--TRANSACTION
-- Insert,Delete,Update kullaniyoruz,
-- Select i�in kullanmam�za gerek yok

-- 1.YOL
BEGIN TRANSACTION;
	INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar','Her t�rl� bilgisayar');
	COMMIT; -- BA�ARILIYSA
	--ROLLBACK; -- BA�ARISIZSA

-- 2. YOL
-- E�ER BA�ARILIYSA G�NCELLEME YAPSIN DE��LSE B�T�N ��LEMLER� GER� ALSIN
BEGIN TRANSACTION;
BEGIN TRY
	UPDATE Categories SET CategoryName = 'Tablet', Description = 'Tablet a��klama' where CategoryID = 10;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH


-- TRIGGER 
-- Trigger (Tetikleyici)
-- Bir i�lem olduktan sonra veya �ncesinde ger�ekle�ecek i�lemlerdir.

-- Nortwind databaseinden bir veri eklendi�inde Log tablosuna otomatik olarak veri eklensin (Trigger).
select * from Categories;
INSERT INTO [nortwind].[dbo].[Categories] (CategoryName,Description) values ('Bilgisayarlar4','Her t�rl� bilgisayar4');

-- Trigger olu�turma
CREATE TRIGGER categoriesTableAfterInsertAndLogInsert
ON Categories -- Tetiklenecek tablo ad�
AFTER INSERT
AS
BEGIN
	INSERT INTO Log (logID,log_name,log_description) values (2,'log_Categories2','Tan�m log_categories2');
END;

select * from Log;


-- INDEX
-- Veri taban� sorgular�n�n performans�n� artt�rmak istiyorsak
-- Bir tablodaki verilere eri�imi h�zland�rmak i�in kullan�lan veritaban� nesnesidir

select * from Log;
-- Log tablosundaki log name s�tununa h�zl� bir eri�im sa�lamak istiyorsak
CREATE INDEX idx_logname ON Log(log_name);


-- CAST
-- Bir veriyi ba�ka bir veriye d�n��t�rme i�lemidir.
--Bir say�y� stringe �evir

select CAST(12345 as nvarchar(12)) 'Say�y� stringe �evir' 

--Bir stringi say�ya �evir

select CAST('12345' as int) 'Stringi say�ya �evir' 

-- Tarih ve zaman farkl� formatlarda �evir

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
PRIMARY KEY : B�R�NC�L ANAHTAR
IDENTITY : OTOMAT�K ARTIRMAK
NOT NULL : BO� GE��LEMEZ
UNIQUE : BENZERS�Z
DEFAULT : E�ER B�R �EY G�R�LMEZSE BEN�M �STED���M� G�REB�L�RS�N�Z.
*/
-- BLOG CATEGORIES(1)
-- E�er benim verdi�im tablo ad� varsa ekleme yoksa ekle
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
-- Sanal bir tablo olu�turmak istedi�imizde kullan�r�z

Select * from Blog as blog
Select * from BlogCategories as cat

SELECT
blog.BlogID,blog.Title,blog.Description,cat.BlogCategoriesID,cat.BlogCategoriesName
FROM Blog as blog
INNER JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID
where blog.BlogCategoriesID = 1;


-- VIEW ILE SUREKLI KULLANILACAK BIR SORGU HALINE GET�R

CREATE VIEW BlogAndCategories AS
SELECT
blog.BlogID,blog.Title,blog.Description,cat.BlogCategoriesID,cat.BlogCategoriesName
FROM Blog as blog
INNER JOIN BlogCategories as cat 
ON cat.BlogCategoriesID = blog.BlogCategoriesID
where blog.BlogCategoriesID = 1;

-- VIEW SELECT

select * from BlogAndCategories;