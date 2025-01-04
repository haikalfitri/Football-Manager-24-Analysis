--Count Column
Select Count(*) as ColumnCount
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'fm' and TABLE_SCHEMA = 'dbo';

--Count Row
Select Count(*) AS TotalRows
From ProjectFM.dbo.fm;

--Understand the dataset
Select Top 10 *
From ProjectFM.dbo.fm;

--Column name and data types
Select COLUMN_NAME, DATA_TYPE
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'fm' and TABLE_SCHEMA = 'dbo';

--Summary statistics for player
Select AVG([Current Ability]) as AvgCA,
			MIN([Current Ability]) as MinCA,
			MAX([Current Ability]) as MaxCA,
			STDEV([Current Ability]) as StdevCA,
			AVG([Potential Ability]) as AvgPA,
			MIN([Potential Ability]) as MinPA,
			MAX([Potential Ability]) as MaxPA,
			STDEV([Potential Ability]) as STDEVPA
From ProjectFM.dbo.fm;

--Outliers for current ability
Select Name, [Current Ability]
From ProjectFM.dbo.fm
Where [Current Ability] <53 OR [Current Ability] >180;

--Outliers for potential ability
Select Name, [Potential Ability]
From ProjectFM.dbo.fm
Where [Potential Ability] < 53 OR [Potential Ability] >183;

--Check missing values
Select Count(Nullif([Current Ability],[Current Ability])) as NullCA,
			Count(Nullif([Potential Ability],[Potential Ability])) as NullPA,
			Count(Nullif([Age],[Age])) as NullAge
From ProjectFM.dbo.fm;

--Attribute distribution by Pos
Select Position,
Count(*) as CountPos
From ProjectFM.dbo.fm
Group By Position;

--Attribute distribution by nationallity
Select Nationality,
Count(*) as CountNat
From ProjectFM.dbo.fm
Group By Nationality

--Attribute distribution by division
Select Division,
Count(*) as CountDiv
From ProjectFM.dbo.fm
Group By Division

--Attribute distribution by Position
Select Position,
Count(*) as CountPos
From ProjectFM.dbo.fm
Group By Position

--Attribute distribution by Age
Select Age,
Count(*) as CountAge
From ProjectFM.dbo.fm
Group By Age

--Check for duplicates
Select Name,
Count(*) as CountName
From ProjectFM.dbo.fm
Group By Name
Having Count(*) > 1;

--Top 10 player based on current ability
Select Top 5 Name, Position, [Current Ability], [Potential Ability]
From ProjectFM.dbo.fm
Order by [Current Ability] Desc;

--Top 10 player based on potential ability
Select Top 5 Name, Position, [Current Ability], [Potential Ability]
From ProjectFM.dbo.fm
Order by [Potential Ability] Desc;







