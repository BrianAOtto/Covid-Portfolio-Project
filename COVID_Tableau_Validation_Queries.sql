/*
	COVID-19 Tableau Validation Queries
	Guided portfolio project (Alex the Analyst tutorial series)

	Queries used to spot-check the numbers shown on the Tableau dashboard against the source data.
*/

-- 1. Global death percentage

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2


-- 2. Total death count by location (continent/region-level rows excluded)
-- World, European Union, and International are excluded to stay consistent with the
-- queries above - European Union is already covered as part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3. Highest infection rate by location, compared to population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- 4. Same as above, broken out by date (for the animated map view in Tableau)

Select Location, Population, date, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc
