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

