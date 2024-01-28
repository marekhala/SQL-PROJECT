-- Která kategorie potravin zdražuje nejpomaleji 
-- (je u ní nejnižší percentuální meziroční nárůst)?

WITH previous_year_price_CTE AS (
SELECT
      common_year,
      product_name,
      price,
      LAG(price) OVER (PARTITION BY product_name ORDER BY common_year) AS previous_year_price
FROM t_marek_hala_project_sql_primary_final tmhpspf
GROUP BY common_year, product_name
ORDER BY product_name, common_year
)
SELECT
	  common_year,
	  product_name,
	  MIN(percentage_growth) AS min_percentage_growth
FROM(
	SELECT
	 	common_year,
	  	product_name,
	  	ROUND(((price-previous_year_price)/previous_year_price)*100,2) AS percentage_growth
	FROM previous_year_price_CTE
	WHERE previous_year_price IS NOT NULL
	) AS PercentageGrowth
WHERE percentage_growth > 0
GROUP BY product_name, common_year
ORDER BY min_percentage_growth
LIMIT 1;



