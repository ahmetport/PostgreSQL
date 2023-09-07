
CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler3;

--ismi mustafa bak ve nesibe yılmaz olan kayıtları silelim

DELETE FROM ogrenciler3 WHERE isim= 'Mustafa Bak' OR isim= 'Nesibe Yilmaz';

-- ismi mustafa bak olan ogrenci ve veli ismi ali olan kayıtları siliniz
DELETE FROM ogrenciler3 WHERE isim= 'Mustafa Bak' AND veli_isim= 'Ali';

-- Veli ismi Hasan olan detayı silelim

DELETE FROM ogrenciler3 WHERE Veli_isim='Hasan';

--TRUNCATE KOMUTU 
--BİR TABLODAKİ tüm verileri geri alamıyacagımız şekilde siler
TRUNCATE ogrenciler3;
DROP TABLE ogrenciler3; -- tüm adresler table yok olur data + tablo yapısı 
DROP TABLE if exists ogrenciler3; -- eger ki varsa yok et hata vermez sadece uyarı verir
--NOTICE:  table "ogrenciler3" does not exist, skipping


CREATE TABLE talebeler1
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler1 VALUES(127, 'Mustafa Bak', 'Can',99);



CREATE TABLE notlar1( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar1_fk FOREIGN KEY (talebe_id) REFERENCES talebeler1(id) -- talebeler child notlar1 parent
on delete cascade --bana verilen delete komutunu her türlü yaparım
);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

SELECT * FROM talebeler1;-- parent
SELECT * FROM notlar1;--child 123 child olanı sildi parent aldırmadan on delete cascade oldugundan dolayı

--notlar1 tablosundan talebe_id si123 olan datayı silelim

DELETE FROM notlar1 WHERE talebe_id= '123'; -- tırnaga dikkat string

DELETE FROM talebeler1 WHERE id='124'; --DELETE 1 parent sildi child da sildi çünkü köprünün başlangiç noktası gitti
--hem parent hem child dan sildi 

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE 
	silme özelliği ile parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE 
	komutu kullanımında parent tablodan sildiğimiz data child tablo dan da silinir
*/


CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
 
SELECT * FROM musteriler

-- Musteriler tablosundan urun ismi orange, apple veya apricot olan tüm verileri listeleyiniz

 
SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';-- BU KOD İÇİN İYİ DEGİL

--SQL DE CONDİTİONS LAR YANİ KOŞUL CÜMLELERİ

--2 YOL
--IN CONDİTİON

SELECT * FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot')

-- Musteriler tablosundan urun ismi orange, apple veya apricot olmayan tüm verileri listeleyiniz
-- NOT IN Condıtıon
SELECT * FROM musteriler WHERE urun_isim NOT IN('Orange','Apple','Apricot')

--AND conitional keyword
--Id si 30 ve musteri_isim Amy olan butun datayi musteriler tablosundan aliniz

SELECT * FROM musteriler WHERE urun_id=20 AND musteri_isim='Amy';

--BETWEEN CONDITION

-- Musteriler tablosundan urun_id'si 20 ile 40 arasında olan tüm verileri listeleyiniz
 SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40;
 
 -- Musteriler tablosundan urun_id'si 20 ile 40 arasında olMAYAN tüm verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

select * from calisanlar2
select * from markalar

-- marka_id'si 101’den büyük olan marka çalişanlarinin 
-- isim, maaş ve şehirlerini listeleyiniz

SELECT isim, maas, sehir FROM calisanlar2 WHERE isyeri IN 

(SELECT marka_isim FROM markalar WHERE marka_id>101);





















