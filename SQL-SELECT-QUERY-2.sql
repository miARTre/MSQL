USE AdventureWorks2019

--1. Izlistati sve podatke iz tabele Employee (2)
--2. Izlistati sve nazive pozicija (JobTitle) (1)

--3. Izlistati sve jedinstvene nazive pozicija (1)
SELECT DISTINCT JobTitle
FROM HumanResources.Employee

--4. Izlistati sve nazive pozicija i u rezultatu nazvati POZICIJA
SELECT DISTINCT JobTitle AS POZICIJA -- ili (Bez AS)
FROM HumanResources.Employee 

--5. Izlistati sve nazive i naziv grupe odjeljenja (Departman-a) u jednoj koloni
SELECT  
	Name + ' ' + GroupName
FROM HumanResources.Department

--5A. Prikazati podatke u formi NAZIV(GRUPA), npr Engineering (Research and Development)
SELECT  
	Name + ' (' + GroupName + ')' POZICIJA
FROM HumanResources.Department

--6. Prikazati broj zaposlenih
SELECT  COUNT (*)

FROM HumanResources.Employee

--7. Izlistati broj zaposlenih koji su Single
SELECT  COUNT (*) 

FROM HumanResources.Employee e
WHERE e.MaritalStatus = 'S'

--8. Izlistati sve zaposlene koji su vjencani
SELECT  COUNT (*) 

FROM HumanResources.Employee e
WHERE e.MaritalStatus = 'M'

--9. Izlistati sva odjeljenja koja u nazivu sadrze slovo a
SELECT d.GroupName

FROM HumanResources.Department d
WHERE d.GroupName LIKE '%a%'

--10. Izlistati odjeljenja cije je drugo slovo r
SELECT d.GroupName

FROM HumanResources.Department d
WHERE d.GroupName LIKE '_r%'

--11. Izlistati sve zaposlene ciji je organizacioni nivo 3
SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel = 3

--12. Prikazati sve zaposlene ciji je organizacioni nivo razlicit od 3
SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel !=(<>) 3           --   (!= mjenja se sa <>)

--13. Prikazati jednog zaposlenog ciji je organizacioni nivo minimum 3
SELECT TOP 1 e.BusinessEntityID, e.OrganizationLevel

FROM HumanResources.Employee e
WHERE e.OrganizationLevel >= 3

--14. Izlistati sve zaposlene ciji je organizacioni nivo 1 ili 3
SELECT e.BirthDate, e.OrganizationLevel

FROM HumanResources.Employee e
WHERE e.OrganizationLevel = 1 OR e.OrganizationLevel = 3  

--ILI 

SELECT e.BirthDate, e.OrganizationLevel
FROM HumanResources.Employee e
WHERE e.OrganizationLevel IN (1,3)

--15. Izlistati sve zaposlene ciji je organizacioni nivo razlicit 1 i 3
SELECT e.BirthDate, e.OrganizationLevel

FROM HumanResources.Employee e
WHERE e.OrganizationLevel <> 1 AND e.OrganizationLevel <> 3 

--ILI 

SELECT e.BirthDate, e.OrganizationLevel

FROM HumanResources.Employee e
WHERE e.OrganizationLevel NOT IN (1,3)

--16. Izlistati zaposlene ciji je organizacioni nivo 3 i koji su u braku
SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel = 3 AND e.MaritalStatus = 'M'

--17. Izlistati sve zaposlene ciji je organizacioni nivo izmedju 1 i 3
SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel >= 1 AND e.OrganizationLevel <= 3

--ILI

SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel BETWEEN 1 AND 3

--18. Izlistati sve zaposlene ciji je organizacioni nivo nije izmedju 1 i 3
SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel NOT BETWEEN 1 AND 3

--ILI 

SELECT *

FROM HumanResources.Employee e
WHERE e.OrganizationLevel < 1 OR e.OrganizationLevel > 3

--19. Prikazati najveci organzacioni nivo
SELECT MAX(e.OrganizationLevel) 

FROM HumanResources.Employee e 

--ILI 

SELECT DISTINCT e.OrganizationLevel 

FROM HumanResources.Employee e
	WHERE
	e.OrganizationLevel IS NOT NULL AND
		NOT EXISTS (SELECT * 
						FROM HumanResources.Employee e2
						
						WHERE e2.OrganizationLevel > e.OrganizationLevel)		

--20. Prikazati datum kada je zaposlena prva osoba muskog pola
SELECT MIN(e.HireDate)

FROM HumanResources.Employee e
WHERE e.Gender = 'M'

--21. Prikazati prosjecan broj sati na odmoru za zaposlene
SELECT AVG(e.VacationHours)

FROM HumanResources.Employee e

--22. Prikazati ukupan broj sati koje su zaposleni uzimali za bolovanje
SELECT SUM(e.SickLeaveHours)

FROM HumanResources.Employee e

--23. Prikazati broj zaposlenih zenskog pola
SELECT COUNT(*)

FROM HumanResources.Employee e
WHERE e.Gender = 'F'

--24. Prikazati ukupan broj zaposlenih koji su single, muskog pola i koji su bili vise na odmoru nego na bolovanju
SELECT COUNT(*)

FROM HumanResources.Employee e
WHERE e.MaritalStatus = 'S' AND e.Gender = 'M' AND e.VacationHours > e.SickLeaveHours

--25. Izlistati sve organizacione nive na kojima rade zaposleni poslije 2013
SELECT DISTINCT e.OrganizationLevel

FROM HumanResources.Employee e
WHERE YEAR (e.HireDate) >= 2013 

--ILI 

DECLARE @GODINA INT -- ==> PROMJENLJIVE 

SET @GODINA = 2013 -- ==> POSTAVLJANJE VRIJEDNOSTI PROMJENLJIVE

SELECT DISTINCT e.OrganizationLevel

FROM HumanResources.Employee e
WHERE YEAR (e.HireDate) >= @GODINA 

--ILI 

DECLARE @GODINA INT

SET @GODINA = 2013

SELECT @GODINA = MAX(YEAR(e.HireDate)) 
FROM HumanResources.Employee e

SELECT DISTINCT e.OrganizationLevel

FROM HumanResources.Employee e
WHERE YEAR (e.HireDate) >= @GODINA 

--26. Izlistati (opadajuce) sve godine u kojima je neko zaposlen
SELECT DISTINCT YEAR(e.HireDate) 

FROM HumanResources.Employee e
ORDER BY YEAR(e.HireDate) desc

--ILI 

SELECT DISTINCT YEAR(e.HireDate) as GodinZaposlenja

FROM HumanResources.Employee e
ORDER BY GodinZaposlenja desc

--27. Izlistati nazive pozicija, broj LK, organizacioni nivo, datum rodjenja, datum zaposlenja. Podatke sortirati po nazivu pozicije (rastuce),
--datumu rodjenja(opadajuce) i datumu zaposlenja (rastuce)

SELECT 
		e.JobTitle, 
		e.NationalIDNumber, 
		e.OrganizationLevel, 
		e.BirthDate, 
		e.HireDate

FROM HumanResources.Employee e
ORDER BY 
		e.JobTitle ASC, 
		e.HireDate ASC,
		BirthDate DESC

--28. Prikazati ukupan broj zaposlenih muskog pola i ukupan broj zasposlenih zenskog pola
SELECT e.Gender, COUNT(*)

FROM HumanResources.Employee e
GROUP BY e.Gender

--29. Na prethodni prikaz dodati i procenat ucestalosti
DECLARE @UkupnoZaposlenih INT

SELECT @UkupnoZaposlenih = COUNT(*)
FROM HumanResources.Employee e

SELECT e.Gender, COUNT(*), COUNT(*) / (@UkupnoZaposlenih * 1.0) * 100 

FROM HumanResources.Employee e
GROUP BY e.Gender

--30. Prikazati koliko se ljudi zaposlilo svake godine
SELECT YEAR(e.HireDate), COUNT(*)

FROM HumanResources.Employee e
GROUP BY YEAR(e.HireDate)

--31. Prikazati koliko se ljudi zaposlilo svake godine, uzimajuci u obzir samo godine u kojoj se zaposlilo minumum 20 radnika
SELECT YEAR(e.HireDate), COUNT(*)

FROM HumanResources.Employee e
GROUP BY YEAR(e.HireDate)
HAVING COUNT(*) >= 20

