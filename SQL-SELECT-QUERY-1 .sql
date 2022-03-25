--33. Izlistati dva irganizaciona nivoa sa najvecim prosjecnim brojem dana odmora.
--U obracun uzeti samo zasposlene mladje od 50 godina i definisane organizacione nivoe.
--Iskljuciti iz prikaza one organizacione nivoe kojima prosjecan broj sati nije barem 10

--Potpuno : 
--- Izlistati prosjecne sate odmora,
--- Izlistati prosjecne sate odmora, za svaki organizacioni dio
--- Izlistati prosjecne sate odmora, za svaki organizacioni dio, koji ima definisanu vrijednost
--- Izlistati prosjecne sate odmora, za svaki organizacioni dio, koji ima definisanu vrijednost i uzeti u obzir samo zaposlene ispod 50 godina.

--- Izlistati prosjecne sta odmora (samo gdje je min. prosjek 10 sati), za svaki organizacioni dio, koji ima definisanu vrijednost i uzeti u obzir samo zaposlene ispod 50 godina.

--- Izlistati prosjecne sta odmora (samo gdje je min. prosjek 10 sati), za svaki organizacioni dio, koji ima definisanu vrijednost i uzeti u obzir samo zaposlene ispod 50 godina, sortirati po prosjeku opadajuce

--- Izlistati prosjecne sta odmora (samo gdje je min. prosjek 10 sati), za svaki organizacioni dio, koji ima definisanu vrijednost i uzeti u obzir samo zaposlene ispod 50 godina, sortirati po prosjeku opadajuce. Prikazati dva organizaciona dijela.

use AdventureWorks2019

DECLARE @TRASHHOLDDATE DATETIME
SET @TRASHHOLDDATE = DATEADD(YEAR, - 50, GetDate())

SELECT TOP 2 e.OrganizationLevel, AVG (e.VacationHours)
FROM HumanResources.Employee e
WHERE 
	e.OrganizationLevel IS NOT NULL 
	AND e.BirthDate > @TRASHHOLDDATE
GROUP BY e.OrganizationLevel
HAVING AVG (e.VacationHours) >= 10
ORDER BY AVG (e.VacationHours) DESC