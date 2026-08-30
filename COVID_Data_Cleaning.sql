/*
	COVID-19 Data Cleaning
	Guided portfolio project (Alex the Analyst tutorial series)

	Note on scope: duplicate removal below is left as a preview - the CTE identifies
	duplicate rows, and the actual DELETE is written but commented out, so the
	source table is left intact.
*/

-- Identify duplicate records (same iso_code/location/date/population/total_cases/new_cases combination more than once)

Select iso_code, continent, location, date, population, total_cases, new_cases, Count(*) as RecordCount
From PortfolioProject..CovidDeaths
Group by iso_code, continent, location, date, population, total_cases, new_cases
Having Count(*) > 1


-- Preview which rows would be removed, using ROW_NUMBER() to keep only the first
-- occurrence of each duplicate combination

With CTE_Duplicates as (
Select *,
	ROW_NUMBER() OVER (
		PARTITION BY iso_code, location, Date, population, total_cases, new_cases
		ORDER BY iso_code
	) as DuplicateRowNum
From PortfolioProject..CovidDeaths
)
Select *
From CTE_Duplicates
Where DuplicateRowNum > 1

-- To actually remove the duplicates identified above:
-- With CTE_Duplicates as (
-- Select *,
-- 	ROW_NUMBER() OVER (
-- 		PARTITION BY iso_code, location, Date, population, total_cases, new_cases
-- 		ORDER BY iso_code
-- 	) as DuplicateRowNum
-- From PortfolioProject..CovidDeaths
-- )
-- Delete
-- From CTE_Duplicates
-- Where DuplicateRowNum > 1
