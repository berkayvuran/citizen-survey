/*
As a result of this query, 17 tables are returned.
*/
--Number of Calls
SELECT COUNT (distinct(a.ID)) AS Number_of_Calls FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND (a.STATUS = 1 or a.STATUS = 4)
OPTION (maxdop 16)
--Number of Surveys, General Score and STDEV
SELECT COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
OPTION (maxdop 16)
--Avg. Age and STDEV
SELECT replace (AVG(convert(decimal(16,2), a.HastaninYasi)), '.', ',') AS Age_X,
replace (STDEV(convert(decimal(16,2), a.HastaninYasi)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Gender
SELECT a.Cinsiyet AS Gender,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.Cinsiyet
OPTION (maxdop 16)
--Number of Calls by Cities
SELECT a.KURUM_ILI AS Cities,
COUNT (distinct(a.ID)) AS Number_of_Calls FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS != 2
AND a.STATUS != 3
GROUP BY a.KURUM_ILI
ORDER BY a.KURUM_ILI
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Cities
SELECT a.KURUM_ILI AS Cities,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a LEFT JOIN [SabimAnket].[dbo].[Cities] c ON a.KURUM_ILI = c.Name
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.KURUM_ILI
ORDER BY a.KURUM_ILI
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Age Group
SELECT a.YAS_GRUBU as Age_Group,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.YAS_GRUBU
ORDER BY a.YAS_GRUBU
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Service Type
SELECT a.ISLEM_TURU AS Service_Type,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.ISLEM_TURU
ORDER BY a.ISLEM_TURU
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Gender and Age Group
SELECT a.Cinsiyet AS Gender, a.YAS_GRUBU AS Age_Group,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.Cinsiyet, a.YAS_GRUBU
ORDER BY a.Cinsiyet, a.YAS_GRUBU
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Gender and Service Type
SELECT a.Cinsiyet AS Gender, a.ISLEM_TURU AS Service_Type,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.Cinsiyet, a.ISLEM_TURU
ORDER BY a.Cinsiyet, a.ISLEM_TURU
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Age Group and Service Type
SELECT a.YAS_GRUBU as Age_Group, a.ISLEM_TURU AS Service_Type,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.YAS_GRUBU, a.ISLEM_TURU
ORDER BY a.YAS_GRUBU, a.ISLEM_TURU
OPTION (maxdop 16)
--Score and STDEV by the Factors of ASM
SELECT a.Soru AS Factors,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
AND a.ISLEM_TURU = 'ASM'
GROUP BY a.Soru
ORDER BY a.Soru
OPTION (maxdop 16)
--Score and STDEV by the Factors of ACIL
SELECT a.Soru AS Factors,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
AND a.ISLEM_TURU = 'Acil'
GROUP BY a.Soru
ORDER BY a.Soru
OPTION (maxdop 16)
--Score and STDEV by the Factors of POLIKLINIK
SELECT a.Soru AS Factors,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
AND a.ISLEM_TURU = 'Poliklinik'
GROUP BY a.Soru
ORDER BY a.Soru
OPTION (maxdop 16)
--Score and STDEV by the Factors of CERRAHI HIZMET
SELECT a.Soru AS Factors,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
AND a.ISLEM_TURU = 'Cerrahi Hizmet'
GROUP BY a.Soru
ORDER BY a.Soru
OPTION (maxdop 16)
--Score and STDEV by the Factors of DOGUM
SELECT a.Soru AS Factors,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
AND a.ISLEM_TURU = 'Doðum'
GROUP BY a.Soru
ORDER BY a.Soru
OPTION (maxdop 16)
--Number of Surveys, Score and STDEV by Cities and Service Type
SELECT a.KURUM_ILI AS Cities, a.ISLEM_TURU AS Service_Type,
COUNT (distinct(a.ID)) AS Number_of_Surveys,
replace (AVG(convert(decimal(16,2), a.puan)), '.' , ',') as Score,
replace (STDEV(convert(decimal(16,2), a.puan)), '.', ',') AS STDEV FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a 
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND a.KURUM_ILI is not NULL
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1
GROUP BY a.KURUM_ILI, a.ISLEM_TURU
ORDER BY a.KURUM_ILI, a.ISLEM_TURU
OPTION (maxdop 16)
----Number of Surveys, Score and STDEV by Cities from Serdar Selvasli
SELECT 
ci.NAME,
COUNT (s.ID) AS Number_of_Surveys,
replace (COALESCE(AVG(convert(decimal(16,2), s.puan)),0), '.' , ',') as Score,
replace (COALESCE(STDEV(convert(decimal(16,2), s.puan)),0), '.', ',') AS STDEV  
 FROM
(SELECT 
distinct   (a.ID) ID,
a.puan puan,
a.KURUM_ILI KURUM_ILI
FROM [SabimAnket].[dbo].[TUM_ANKET_VERILERI] a
WHERE a.CallTime > '2019-04-01 00:00' AND a.CallTime < '2020-03-11 23:59'
AND	a.anketor_kim = 'Pusula'
AND a.STATUS = 1) as s
RIGHT JOIN (SELECT TOP 81 C.NAME FROM  [SabimAnket].[dbo].[Cities] c ) ci ON ci.NAME=s.KURUM_ILI
GROUP BY ci.Name
ORDER BY ci.Name
OPTION (maxdop 16)