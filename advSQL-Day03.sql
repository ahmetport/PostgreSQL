-- ******************* Constant Variables/ Daimi Degisken(Degeri Sabit Degiskenler) ***************************
-- final --> OOP de bir object final olarak declare edildiginde degeri degistirilemez.

-- selling_price := net_price * 0.1;
-- vat (kdv) constant := 0.1;

-- selling_price := net_price * 0.1; --0.1 in degerini bir degiskene atarsak bu kodumuz daha dinamik olur ve dha okunabilir olur

-- selling_price := net_price + net_price * vat; 

--0.1 degerini vat degiskenine atarsak kodumuz daha dinamik ve daha korunaklı olur.
--vat degiskeninin constant oldugunu belirtirsek bu deger sabittir degismez demis oluruz.Hicbir sekilde degistirilemez.
--tekrar tekrar degistirilmesini istemedigimiz degiskenleri "constant" olarak declare ettigimızde java yada python da "final" keyword u
--gibi bu degiskenimizin degerini sabit degere set etmis oluruz.


do $$
declare 
        vat constant numeric:= 0.1; -- constant atadıgımız deger sabittir degşişmez
		gross_price numeric:= 20.5; --brut
		
begin

raise notice 'Satis fiyatı : %', gross_price * (1+vat);
    --vat :=0.55; --variable "vat" is declared CONSTANT tekrar atama yaptıgımızda sql bize bu hatayı verir zaten atama yaptın der

end $$;
--NOTICE:  Satis fiyatı : 22.55



--constant bir degiskene Run Time dan/console dan deger ataması yapabilirmiyiz?

do $$
declare 
      start_at constant time:= now(); -- bu deger degişmez sadece pc degişirse degişir constant kullandık
begin

    raise notice 'Blokun calisma saati: %', start_at; -- bi daha start_at ataması yapamayız çunkü yukarda atadık zaten
     
end $$;





-- /////////////////////// CONTROL STRUCTURES/KONTROL YAPI BLOKLARI ////////////////////////////

-- If Statements

If condition then --kosul dogru ise

     statement --calısmasını istedgimiz kodlar
	 
end if;	 
	 
--Task: 0 id li filmi bulunuz yoksa ekrana uyarı yazısı yazdırınız.

do $$
declare
      selected_film film%rowtype;
	  input_film_id film.id%type :=0;  -- bunu 1 girdigimizde ikinci blok çalışır

begin

    select * from film
	into selected_film
	where id=input_film_id;

	if found then	-- eger varsa bunu konsola bunu gönder istersek lenght ekleyebiliriz
    raise notice 'Girdiginiz % id li filmin detayları: % % ', input_film_id, selected_film.title, selected_film.type;	
	end if;
	
	if not found then	-- yoksa bunu gönder(film yoksa)
	raise notice 'Girdiginiz id ile ilgili film bulunamadı: %', input_film_id; --film bulunmazsa bu mesaj verilecek  
	end if;	    

end $$;


-- ***************************If .... then  else*************************

/*

if condition then

         statements;
else
        alternative-statements;
		
end if;

*/

--Task: id si verilen filmi var ise ekrana yazdırınız yoksa kullanıcıya gecersiz film id si diye uyarı veriniz.

do $$
declare
    input_film_id film.id%type:= 6;
	selected_movie film%rowtype;

begin
    select * from film
	into selected_movie -- embed ettigimiz kısım
	where id=input_film_id; -- declaredeki ilk satırdan geliyor bu degişken yukarda ben atadım
	
	if not found then
	    raise notice 'Girmis oldugunuz  % id li film bulunamadı.', input_film_id;
	else
	   raise notice 'Filmin ismi % ve türü %.', selected_movie.title, selected_movie.type;
    end if; 

end $$






-- ****************** If then - else if(nested if) ***************************************
--syntax :

if condition_1 then
           statement_1;
		   
    elseif condition_2 then
	       statement_2;
		   
    elseif condition_n then
	       statement_n;
		   
	else
	    else-statement;
		
   end if;
   
/* Task: id si 1 olan film varsa;
   suresi 50 dakikanın altında ise Short,
   50>length<120 ise Medium,
   length>120 ise Long uyarısı veriniz.
*/

do $$
declare
     selected_film film%rowtype;
	 len_description varchar(20);
	 input_film_id film.id%type:=1; -- eger buraya 2.05 gibi rakam verirsek round yapar 2 yuvarlar 2.55verirsek 3 yuvarlar


begin
    select * from film
	into selected_film -- embed ettik
	where id=input_film_id;
	
if not found then   --outer blok
    raise notice 'film bulunamadı.';
	
else if  -- inner blok
    selected_film.lenght >0 and selected_film.lenght <=50 then 
	--statement
	len_description = 'Short';
elseif
    selected_film.lenght >50 and selected_film.lenght <=120 then 
	len_description = 'Medium';
elseif
    selected_film.lenght >120 then 
	len_description = 'Long';
else
    raise notice 'tanımlanamadı.';
end if; -- inner bloktaki if else kapatmak için kullanadık

raise notice '% filmin süresi: %', selected_film.title, len_description;
end if; -- outer bloktaki yani en baştaki if kapatmak için kullanıyoruz

end $$;













