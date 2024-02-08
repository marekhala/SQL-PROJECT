-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

WITH previous_year_avg_payroll_CTE AS (
SELECT 
	common_year,
	industry,
	AVG(avg_payroll) AS avg_payroll,
	LAG(avg_payroll) OVER (PARTITION BY industry ORDER BY common_year) AS previous_year_avg_payroll
FROM t_marek_hala_project_sql_primary_final tmhpspf
GROUP BY common_year, industry
ORDER BY common_year, industry
)
SELECT
	common_year,
	industry,
	avg_payroll,
	previous_year_avg_payroll,
	CONCAT(ROUND(((avg_payroll-previous_year_avg_payroll)/previous_year_avg_payroll)*100,2), ' %') AS yoy_percentage_change,
	CASE
		WHEN avg_payroll-previous_year_avg_payroll > 0 THEN 'increase'
		WHEN avg_payroll-previous_year_avg_payroll < 0 THEN 'decrease'
	END AS trend
FROM previous_year_avg_payroll_CTE
WHERE previous_year_avg_payroll IS NOT NULL
ORDER BY common_year, industry;



