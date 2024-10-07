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

