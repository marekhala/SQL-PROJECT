CREATE TABLE t_marek_hala_project_sql_secondary_final (
SELECT
	c.country,
	e.year,
	e.GDP,
	e.gini,
	e.population
FROM countries c
INNER JOIN economies e 
ON c.country = e.country
WHERE e.year BETWEEN 2006 AND 2018
  AND c.continent = 'Europe'
ORDER BY c.country, e.year ASC
);