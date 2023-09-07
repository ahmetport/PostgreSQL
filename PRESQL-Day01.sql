--Database oluşturma
CREATE database B168;

--Tablo oluşturma
CREATE TABLE ogrenciler(

	ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(30),
	not_ort real,  -- ondalıklı sayıları belirtmek için kullanılır float da olur
	kayit_tarihi date
);
-- DML(dATA Manipulation Language)
SELECT * FROM ogrenciler;

--sql de bir tablo oluşturmanın iki yolu vardır ilki sıfırdan tablo oluşturmak,ikincisi baska bir tablonun belirlenmiş
--field leri yani sutunları kopyalayarak yeni bir tablo oluştırmak

-- var olan tablodan yeni tablo oluşturma
CREATE TABLE ogrenci_notlari
AS
SELECT isim,soyisim,not_ort FROM ogrenciler;

SELECT * FROM ogrenci_notlari;


INSERT INTO ogrenciler VALUES('1234567','Tom', 'Hanks', 85.5, '2020-12-11');-- 6 KARAKTER gireresek hata alırız
INSERT INTO ogrenciler VALUES('2345678','Ali','Can',90.2,  now());-- default format --> yyyy/ay/gun

SELECT * FROM ogrenciler;--datayı terminalde göstermesi için

-- bir tabloya parçalı veri ekleme yerleştirme
INSERT INTO ogrenciler (isim,soyisim) VALUES('Ahmet','Kaya');

--DQL(Data Query Language --> data okuması yapabiliriz)
SELECT * FROM ogrenciler;

--CONSTRAINTS/kısıtlamalar/belirleyiciler

--UNIQUE 
--NOT NULL
CREATE TABLE ogrenciler2(
	
	ogrenci_no char(7) UNIQUE,
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL,
	not_ort real,
	kayit_tarihi date
	
);

SELECT * FROM ogrenciler2;
INSERT INTO ogrenciler2 VALUES('9874563','Fatih','Bugra', 99.5, '2011-03-22');
INSERT INTO ogrenciler2 VALUES('9874560','umit','Enes', 89.5, now());
INSERT INTO ogrenciler2(ogrenci_no, isim, soyisim) VALUES('2589632','GÜLŞAH','CAN');
INSERT INTO ogrenciler2(isim, soyisim) VALUES('MUSTAFA','CAN');
INSERT INTO ogrenciler2(isim, soyisim) VALUES('GÜL','CAN');--İKİ TANE NULL ALABİLİR OGRENCİ NO UNI



















































