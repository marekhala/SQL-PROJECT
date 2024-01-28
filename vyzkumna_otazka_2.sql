-- Kolik je možné si koupit litrů mléka a kilogramů chleba 
-- za první a poslední srovnatelné období v dostupných datech cen a mezd?

WITH avg_payroll_per_year_CTE AS (
SELECT 
	common_year,
	ROUND(AVG(avg_payroll),2) AS avg_payroll_per_year,
	category_code,
	product_name,
	price,
	unit
FROM t_marek_hala_project_sql_primary_final tmhpspf 
WHERE common_year IN (2006, 2018) AND
	  product_name IN ('Mléko polotučné pasterované' ,'Chléb konzumní kmínový')
GROUP BY common_year, product_name
)
SELECT common_year,
	   avg_payroll_per_year,
	   product_name,
	   price,
	   unit,
	   ROUND(avg_payroll_per_year/price, 2) AS how_much_for_avg_payroll,
	   unit
FROM avg_payroll_per_year_CTE
ORDER BY product_name, common_year
;