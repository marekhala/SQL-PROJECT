-- Má výška HDP vliv na změny ve mzdách a cenách potravin? 
-- Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

SELECT
	price_table.common_year,
	GDP_table.percentage_GDP_change,
	price_table.percentage_price_change,
	payroll_table.percentage_payroll_change
FROM(
WITH previous_year_price_CTE AS(
SELECT
	common_year,
	avg_price_per_year,
	LAG(avg_price_per_year) OVER (PARTITION BY 1 ORDER BY common_year) AS avg_price_previous_year
FROM(
SELECT 
	common_year, 
	ROUND(AVG(price),2) AS avg_price_per_year
FROM t_marek_hala_project_sql_primary_final tmhpspf
GROUP BY common_year
) AS prices
)
SELECT 
	common_year,
	avg_price_per_year,
	avg_price_previous_year,
	ROUND(((avg_price_per_year-avg_price_previous_year)/avg_price_previous_year)*100,2) AS percentage_price_change
FROM previous_year_price_CTE
WHERE avg_price_previous_year IS NOT NULL) AS price_table
INNER JOIN (
WITH previous_year_payroll_CTE AS(
SELECT
	common_year,
	avg_payroll,
	LAG(avg_payroll) OVER (PARTITION BY 1 ORDER BY common_year) AS avg_payroll_previous_year
FROM( 
SELECT 
	common_year, 
	ROUND(AVG(avg_payroll),2) AS avg_payroll
FROM t_marek_hala_project_sql_primary_final tmhpspf
GROUP BY common_year
) AS payroll )
SELECT 
	common_year,
	avg_payroll,
	avg_payroll_previous_year,
	ROUND(((avg_payroll-avg_payroll_previous_year)/avg_payroll_previous_year)*100,2) AS percentage_payroll_change
FROM previous_year_payroll_CTE
WHERE avg_payroll_previous_year IS NOT NULL) AS payroll_table
ON price_table.common_year=payroll_table.common_year
INNER JOIN (
WITH GDP_previous_year_CTE AS(
SELECT
	country,
	year,
	GDP,
	LAG(GDP) OVER (PARTITION BY 1 ORDER BY year) AS GDP_previous_year	
FROM t_marek_hala_project_sql_secondary_final tmhpssf
WHERE country = 'Czech Republic')
SELECT 
	country,
	year,
	ROUND(((GDP-GDP_previous_year)/GDP_previous_year)*100,2) AS percentage_GDP_change
FROM GDP_previous_year_CTE
WHERE GDP_previous_year IS NOT NULL) AS GDP_table
ON price_table.common_year=GDP_table.YEAR
;



