SELECT
p.[Id],
case p.Gender 
when 1 then 'Woman' 
when 0 then 'Man'
when 2 then 'Man'
else 'Error' end as Gender,
p.HastaninYasi as Age,
case 
when p.HastaninYasi < 18  then '0-17'
when 18 <= p.HastaninYasi and  p.HastaninYasi < 25  then '18-24'
when 25 <= p.HastaninYasi and  p.HastaninYasi < 35  then '25-34'
when 35 <= p.HastaninYasi and  p.HastaninYasi < 45  then '35-44'
when 45 <= p.HastaninYasi and  p.HastaninYasi < 55  then '45-54'
when 55 <= p.HastaninYasi and  p.HastaninYasi < 65  then '55-64'
when  p.HastaninYasi >= 65  then '65+'
else 'Null'
end as Age_Group,
case  p.[status]
when 1 then 'Success'
when 2 then 'Hanging'
when 3 then 'Process'
when 0 then 'New_Datum'
when 4 then 'Failed'
else 'Error' end as Status,
case p.Reason
when 0 then '21_False_Number'
when 1 then '13_Suddenly_Closed'
when 2 then '16_Not_Answer'
when 3 then '11_Decline'
when 4 then 'Other'
when 5 then '20_Missing'
when 6 then '15_Busy'
when 7 then '17_Closed'
when 9 then '19_Wrong_Data'
when 11 then '14_Not_Authorized'
when 13 then '12_Suddenly_Offline'
when 14 then '18_Not_Available'
else  'Success'
end as Reason_Code,
p.[CallTime] as Call_Time,	
s.[Name] as Service_Type,
p.Phone as Phone_Number,
c.[Name] as Cities,
a.[Name] + ' ' + a.[Surname] as Pollster,
a.[Email] as Pollster_e_Mail      
FROM [SabimAnket].[dbo].[Patients]        p WITH (NOLOCK) 
JOIN [SabimAnket].[dbo].[Cities]          c WITH (NOLOCK)  ON c.Id =p.City_Id
JOIN [SabimAnket].[dbo].[AspNetUsers]     a WITH (NOLOCK)  ON p.[CalledBy_Id]  = a.[Id]
JOIN [SabimAnket].[dbo].[IslemTipis]  AS  s WITH (NOLOCK)  ON p.[IslemTipi_Id] = s.[Id]
WHERE	p.[CallTime] > '2020-01-05 00:00:00.000' and  p.[CallTime] < '2020-01-10 23:59:00.000'
and a.[Email] like '%@pusulacc%'
and (p.Status=1 or p.Status=4)
ORDER BY p.[CallTime] ASC
OPTION (maxdop 16)