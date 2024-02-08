CREATE TEMPORARY TABLE czechia_price_temp AS
SELECT
	YEAR(cp.date_from) AS common_year,
	cpc.code AS category_code,
	cpc.name AS product_name,
	ROUND(AVG(cp.value),2) AS price,
	cpc.price_unit AS unit
FROM czechia_price cp
JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code
GROUP BY YEAR(cp.date_from), cpc.name
ORDER BY YEAR(cp.date_from), cpc.name;

CREATE TEMPORARY TABLE czechia_payroll_temp AS
SELECT 
	cp.payroll_year,
	cpib.code,
	cpib.name AS industry,
	ROUND(AVG(cp.value),2) AS avg_payroll
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE 
	cp.value_type_code = '5958' AND
	cp.calculation_code = '200' AND
	cp.payroll_year BETWEEN 2006 AND 2018
GROUP BY cp.payroll_year, cpib.name
ORDER BY cp.payroll_year, cpib.name;

CREATE TABLE t_marek_hala_project_sql_primary_final AS
SELECT
	czechia_price_temp.common_year,
	czechia_payroll_temp.code AS industry_branch_code,
	czechia_payroll_temp.industry,
	czechia_payroll_temp.avg_payroll,
	czechia_price_temp.category_code,
	czechia_price_temp.product_name,
	czechia_price_temp.price,
	czechia_price_temp.unit
FROM czechia_price_temp
JOIN czechia_payroll_temp
	ON czechia_price_temp.common_year = czechia_payroll_temp.payroll_year
ORDER BY czechia_price_temp.common_year, czechia_payroll_temp.industry;

SELECT *
FROM t_marek_hala_project_sql_primary_final tmhpspf;



