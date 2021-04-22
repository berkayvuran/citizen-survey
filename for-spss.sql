/*
As Gender;
0: Man
1: Woman

As Service Type;
1: ASM
2: ACIL
3: POLIKLINIK
4: CERRAHI
5: DOGUM

As Age Group;
1: 18-24
2: 25-34
3: 35-44
4: 45-54
5: 55-64
6: 65+
*/

SELECT
p.Phone as "ASM_Phone_Number",
a.[Id],
case p.Gender
	when 2 then '0'
	else '1'
	end as "Gender",
p.HastaninYasi as "Age",
case 
	when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '1'
	when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '2'
	when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '3'
	when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '4'
	when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '5'
	when  p.HastaninYasi >= 65  then '6'
	else 'null'
	end as Age_Group,
c.Name as "Cities",
CONVERT(varchar,a.DateCreated,103) as Call_Time,
case a.DoktorSure
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorSure",
case a.DoktorBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorBilgiAktarim",
case a.Temizlik
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Temizlik",
case a.Mahremiyet
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Mahremiyet",
case a.HizmetKalite
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
		else 'Undecided'
	end as "HizmetKalite",
case a.TahlilSonuc
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "TahlilSonuc"
FROM [SabimAnket].[dbo].[SurveyAyaktaHastaASMs] a
JOIN Patients p on p.Id=a.Patient_Id
JOIN AspNetUsers anu on anu.Id=a.CreatedBy_Id
JOIN Cities c on c.Id=p.City_Id
where
anu.Email like '%pusulacc.com.tr'
and a.DateCreated > '2020-03-01 00:00:00.000'
and a.DateCreated < '2020-03-31 23:59:59.999'
and p.HastaninYasi > 17
AND p.Status=1
AND	p.Reason IS NULL
AND p.City_Id IS NOT NULL

order by a.DateCreated desc

OPTION (maxdop 16)

GO

SELECT
p.Phone as "Acil_Phone_Number",
a.[Id],
case p.Gender
	when 2 then '0'
	else '1'
	end as "Gender",
p.HastaninYasi as "Age",
case 
	when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '1'
	when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '2'
	when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '3'
	when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '4'
	when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '5'
	when  p.HastaninYasi >= 65  then '6'
	else 'null'
	end as Age_Group,
c.Name as "Cities",
CONVERT(varchar,a.DateCreated,103) as Call_Time,
case a.KayitIslem
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "KayitIslem",
case a.DanismaYonlendirme
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DanismaYonlendirme",
case a.DoktorBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorBilgiAktarim",
case a.PersoneleUlasim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "PersoneleUlasim",
case a.AcilServisTemizlik
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "AcilServisTemizlik",
case a.Mahremiyet
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Mahremiyet",
case a.AcilTaburcu
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "AcilTaburcu",
case a.AcilHizmetKalite
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "AcilHizmetKalite",
case a.TahlilSonuc
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "TahlilSonuc"
FROM [SabimAnket].[dbo].SurveyAcilServisHastas a
JOIN Patients p on p.Id=a.Patient_Id
JOIN AspNetUsers anu on anu.Id=a.CreatedBy_Id
JOIN Cities c on c.Id=p.City_Id
where
anu.Email like '%pusulacc.com.tr'
and a.DateCreated > '2020-03-01 00:00:00.000'
and a.DateCreated < '2020-03-31 23:59:59.999'
and p.HastaninYasi > 17
AND p.Status=1
AND	p.Reason IS NULL
AND p.City_Id IS NOT NULL
order by a.DateCreated desc
OPTION (maxdop 16)

GO

SELECT
p.Phone as "Pol_Phone_Number",
a.[Id],
case p.Gender
	when 2 then '0'
	else '1'
	end as "Gender",
p.HastaninYasi as "Age",
case 
	when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '1'
	when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '2'
	when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '3'
	when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '4'
	when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '5'
	when  p.HastaninYasi >= 65  then '6'
	else 'null'
	end as Age_Group,
c.Name as "Cities",
CONVERT(varchar,a.DateCreated,103) as Call_Time,
case a.KayitIslem
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "KayitIslem",
case a.DanismaYonlendirme
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DanismaYonlendirme",
case a.DoktorSure
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorSure",
case a.DoktorBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorBilgiAktarim",
case a.HastaneTemizlik
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTemizlik",
case a.Mahremiyet
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Mahremiyet",
case a.HastaneTahlilSonuc
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTahlilSonuc",
case a.HastaneHizmetKalite
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneHizmetKalite"
FROM [SabimAnket].[dbo].SurveyAyaktaHastas a
JOIN Patients p on p.Id=a.Patient_Id
JOIN AspNetUsers anu on anu.Id=a.CreatedBy_Id
JOIN Cities c on c.Id=p.City_Id
where
anu.Email like '%pusulacc.com.tr'
and a.DateCreated > '2020-03-01 00:00:00.000'
and a.DateCreated < '2020-03-31 23:59:59.999'
and p.HastaninYasi > 17
AND p.Status=1
AND	p.Reason IS NULL
AND p.City_Id IS NOT NULL
order by a.DateCreated desc
OPTION (maxdop 16)

GO

SELECT
p.Phone as "Cer_Phone_Number",
a.[Id],
case p.Gender
	when 2 then '0'
	else '1'
	end as "Gender",
p.HastaninYasi as "Age",
case 
	when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '1'
	when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '2'
	when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '3'
	when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '4'
	when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '5'
	when  p.HastaninYasi >= 65  then '6'
	else 'null'
	end as Age_Group,
c.Name as "Cities",
CONVERT(varchar,a.DateCreated,103) as Call_Time,
case a.KayitIslem
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "KayitIslem",
case a.DanismaYonlendirme
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DanismaYonlendirme",
case a.HastaOdaEsya
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaOdaEsya",
case a.YemekPersonelHijyen
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "YemekPersonelHijyen",
case a.DoktorBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorBilgiAktarim",
case a.HemþireBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HemþireBilgiAktarim",
case a.HastaneTemizlik
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTemizlik",
case a.Mahremiyet
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Mahremiyet",
case a.HastaneTaburcuBilgi
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTaburcuBilgi",
case a.HastaneHizmetKalite
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneHizmetKalite"
FROM [SabimAnket].[dbo].SurveyYatanHastaCerrahis a
JOIN Patients p on p.Id=a.Patient_Id
JOIN AspNetUsers anu on anu.Id=a.CreatedBy_Id
JOIN Cities c on c.Id=p.City_Id
where
anu.Email like '%pusulacc.com.tr'
and a.DateCreated > '2020-03-01 00:00:00.000'
and a.DateCreated < '2020-03-31 23:59:59.999'
and p.HastaninYasi > 17
AND p.Status=1
AND	p.Reason IS NULL
AND p.City_Id IS NOT NULL
order by a.DateCreated desc
OPTION (maxdop 16)

GO

SELECT
p.Phone as "Dog_Phone_Number",
a.[Id],
case p.Gender
	when 2 then '0'
	else '1'
	end as "Gender",
p.HastaninYasi as "Age",
case 
	when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '1'
	when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '2'
	when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '3'
	when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '4'
	when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '5'
	when  p.HastaninYasi >= 65  then '6'
	else 'null'
	end as Age_Group,
c.Name as "Cities",
CONVERT(varchar,a.DateCreated,103) as Call_Time,
case a.KayitIslem
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "KayitIslem",
case a.DanismaYonlendirme
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DanismaYonlendirme",
case a.HastaOdaEsya
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaOdaEsya",
case a.YemekPersonelHijyen
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "YemekPersonelHijyen",
case a.DoktorBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "DoktorBilgiAktarim",
case a.HemþireBilgiAktarim
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HemþireBilgiAktarim",
case a.HastaneTemizlik
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTemizlik",
case a.Mahremiyet
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "Mahremiyet",
case a.HastaneTaburcuBilgi
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneTaburcuBilgi",
case a.HastaneHizmetKalite
	when 4 then '0'
	when 5 then '25'
	when 6 then '50'
	when 7 then '75'
	when 8 then '100'
	else 'Undecided'
	end as "HastaneHizmetKalite"
FROM [SabimAnket].[dbo].SurveyYatanHastaNormalDogums a
JOIN Patients p on p.Id=a.Patient_Id
JOIN AspNetUsers anu on anu.Id=a.CreatedBy_Id
JOIN Cities c on c.Id=p.City_Id
where
anu.Email like '%pusulacc.com.tr'
and a.DateCreated > '2020-03-01 00:00:00.000'
and a.DateCreated < '2020-03-31 23:59:59.999'
and p.HastaninYasi > 17
AND p.Status=1
AND	p.Reason IS NULL
AND p.City_Id IS NOT NULL
order by a.DateCreated desc
OPTION (maxdop 16)

----GLOBAL----
SELECT * FROM
(
  SELECT ID,
  case ISLEM_TURU
  WHEN 'ASM' THEN 1
  WHEN 'Acil' THEN 2
  WHEN 'Poliklinik' THEN 3
  WHEN 'Cerrahi Hizmet' THEN 4
  ELSE 5
  END AS Service_Type,
  case Gender
  WHEN 'KADIN' THEN 1
  ELSE 0
  END AS Gender,
  HastaninYasi AS Age,
  CASE YAS_GRUBU
  WHEN '18-24' THEN 1
  WHEN '25-34' THEN 2
  WHEN '35-44' THEN 3
  WHEN '45-54' THEN 4
  WHEN '55-64' THEN 5
  ELSE 6
  END AS Age_Group,
  KURUM_ILI AS Cities,
  CONVERT(varchar,CallTime,103) as Call_Time,
  SORU AS Factors,
  PUAN FROM f_TUM_ANKET_VERILERI a
  WHERE
  YEAR(a.CallTime)=2020 AND MONTH(a.CallTime)=3
  AND a.PUAN!=-1 AND a.Status=1 AND a.Reason is null
  AND a.KURUM_ILI is not NULL
  AND a.Email like '%@pusulacc.com.tr' AND a.Email
  AND Soru NOT LIKE 'Soru_Yok'
  GROUP BY ID, ISLEM_TURU, Gender, HastaninYasi, YAS_GRUBU, KURUM_ILI, CallTime, SORU, PUAN
) Tablo
PIVOT
(
  SUM(PUAN) FOR Boyut IN([Daniþma Yönlendirme],[Doktor Bilgi Aktarým],[Hasta Oda Eþya],[Tahlil Sonuç],[Hemþire Bilgi Aktarým],[Hastane Temizlik],
[Acil Hizmet Kalite],[Mahremiyet],[Hizmet Kalite],[Acil Taburcu],[Temizlik],[Yemek Personel Hijyen],[Doktor Süre],
[Personele Ulaþým],[Hastane Hizmet Kalite],[Hastane Tahlil Sonuç],[Kayýt Ýþlem],[Acil Servis Temizlik],[Soru_Yok],[Hastane Taburcu Bilgi])
) Ozet_Tablo
OPTION (maxdop 16)


