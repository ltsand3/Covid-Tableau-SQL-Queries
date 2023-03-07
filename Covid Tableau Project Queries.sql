--Query 1 for Tableau Covid Project Worlwide sum of Covid cases since the beginning of the pandemic

Select SUM(new_cases) as TotalCasesCovid, SUM(cast(new_deaths as int)) as TotalCovidDeaths,
SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as WorldwideMortality 
FROM [Portfolio Project Covid]..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 1, 2

--Query 2 For covid Includes European Union Population in Europe

SELECT Location, Max(cast(total_deaths as int)) as DeathCount
FROM [Portfolio Project Covid]..[CovidDeaths]
WHERE Continent is null
AND location not in('World', 'European Union', 'International', 'High Income', 'Upper middle income', 'lower middle income', 'low income')
Group by location
Order by DeathCount desc

--Query 3 Determining what percentage of the population has contracted covid-19 since the pandemic start

SELECT location, population, Max(total_cases) as RunningInfectionsTotal , MAX((total_cases/population)) * 100 as RunningInfectionRate
FROM [Portfolio Project Covid]..CovidDeaths
Group By  location,population
Order by RunningInfectionrate desc


--Query 4 Determining what percentage of the population has contracted covid-19 since the pandemic start

SELECT location, population, date, Max(total_cases) as RunningInfectionsTotal , MAX((total_cases/population)) * 100 as RunningInfectionRate
FROM [Portfolio Project Covid]..CovidDeaths
Group By  location,population,date
Order by RunningInfectionrate desc