
# COVID-19 Data Analysis

Completed as a guided learning exercise following Alex the Analyst's tutorial series — built to practice SQL data exploration, cleaning, and validation ahead of visualizing results in Tableau.

This project analyzes global COVID-19 case, death, and vaccination data (Our World in Data dataset).

## Files in this repo
1. **COVID_Data_Exploration.sql** — the main analysis: infection rates, death rates and counts by location/continent, and rolling vaccination totals (via join, CTE, and temp table approaches), plus a view for later visualization.
2. **COVID_Data_Cleaning.sql** — identifies duplicate records and previews how they'd be removed using `ROW_NUMBER()`, without altering the source table.
3. **COVID_Tableau_Validation_Queries.sql** — spot-check queries used to confirm the numbers behind the Tableau dashboard match the underlying data.

## Skills used
Joins, CTEs, temp tables, window functions, aggregate functions, views, data type conversion.

## Tools Used
SQL Server (T-SQL), Tableau.

## Dashboard
[View the interactive dashboard on Tableau Public](https://public.tableau.com/views/Covid-19_Global_Data_Analysis/Dashboard)

## About Me
I'm Brian Otto, a data analyst and project manager with 20+ years of experience in banking and technology, including 15 years at JPMorgan Chase. I'm building on that foundation with hands-on SQL, Tableau, and Python projects like this one — pursuing certifications (Google Data Analytics, and currently the Salesforce Tableau Data Analyst cert) to formalize and extend those skills.
