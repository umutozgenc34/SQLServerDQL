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