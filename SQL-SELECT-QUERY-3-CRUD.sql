-- ZADATAK 1 
-- Napraviti novu tabelu Radnik i u nju upisati sve vrijednosti iz tabele Employee (Baza AdventureWorks2019)
-- INSERT

--CREATE TABLE Radnik (
--	[BusinessEntityID] [int] NOT NULL,
--	[NationalIDNumber] [nvarchar](15) NOT NULL,
--	[LoginID] [nvarchar](256) NOT NULL,
--	[OrganizationNode] [hierarchyid] NULL,
--	[OrganizationLevel]  AS ([OrganizationNode].[GetLevel]()),
--	[JobTitle] [nvarchar](50) NOT NULL,
--	[BirthDate] [date] NOT NULL,
--	[MaritalStatus] [nchar](1) NOT NULL,
--	[Gender] [nchar](1) NOT NULL,
--	[HireDate] [date] NOT NULL,
--	[SalariedFlag] [dbo].[Flag] NOT NULL,
--	[VacationHours] [smallint] NOT NULL,
--	[SickLeaveHours] [smallint] NOT NULL,
--	[CurrentFlag] [dbo].[Flag] NOT NULL,
--	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
--	[ModifiedDate] [datetime] NOT NULL,
--)

--INSERT INTO Radnik ()
--SELECT *
--FROM HumanResources.Employee e                 -- PRVI NACIN 

use AdventureWorks2019

SELECT *
INTO Radnik
FROM HumanResources.Employee                     -- DRUGI NACIN 
-- WHERE 1=0                                     -- PRAZNA TABELA

SELECT * FROM Radnik 

-- ZADATAK 2
-- Azurirati sve slogove u tabeli Randnik tako da se broj sati odmora poveca za 10%
-- UPDATE 

UPDATE Radnik 
SET VacationHours = VacationHours * 1.1

-- ZADATAK 3
-- Azurirati sve slogove u tabeli Randnik tako da se broj sati odmora poveca za 10%, ako je radnik na nivou 1 ili 2; 
-- 5% za nivo 3 i 3% za sve druge nivoe
-- UPDATE 

--UPDATE Radnik
--SET VacationHours = VacationHours * 1.1
--WHERE OrganizationLevel IN (1,2)

--UPDATE Radnik
--SET VacationHours = VacationHours * 1.05                 ==> PRVI NACIN
--WHERE OrganizationLevel IN (3)

--UPDATE Radnik
--SET VacationHours = VacationHours * 1.03
--WHERE OrganizationLevel NOT IN (1, 2, 3)

-- CASE SLUCAJ 
-- CASE NAREDBA
-- CASE 
--		WHEN USLOV1 THEN VRIJEDNOST1
--		WHEN USLOV2 THEN VR2
--		ELSE VR3
-- END... Ako smo u select upitu dajemo naziv kolone pomocu as naziv_kolone

UPDATE RADNIK
SET VacationHours = CASE
						WHEN OrganizationLevel IN (1,2) THEN VacationHours* 1.1            -- ==> DRUGI SLUCAJ U JEDNOM PROLAZU
						WHEN OrganizationLevel IN (3) THEN VacationHours* 1.05
						ELSE VacationHours * 1.03
					END
-- ZADATAK 4
-- OBRISATI SLOGOVE IZ TABELE RADNIK ZA SVE ZAPOSLENE KOJIMA JE BROJ SATI ODMORA ZA BAREM 50% VECI OD SATI BOLOVANJA
-- DELETE

DELETE FROM Radnik
WHERE VacationHours > SickLeaveHours * 1.5

-- ZADATAK 5
-- OBRISATI SVE SLOGOVE IZ TABELE RADNIK
-- DELETE 

DELETE FROM Radnik



