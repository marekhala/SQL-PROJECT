# SQL-PROJECT

## ZADÁNÍ
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

Datové sady, které je možné použít pro získání vhodného datového podkladu

**Primární tabulky:**

    1. czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
    2. czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
    3. czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
    4. czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
    5. czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
    6. czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
    7. czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

**Číselníky sdílených informací o ČR:**

    1. czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
    2. czechia_district – Číselník okresů České republiky dle normy LAU.

**Dodatečné tabulky:**

    1. countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
    2. economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.



## DATOVÉ SADY
Data pochází z Portálu otevřených dat ČR.

[Primární tabulka](t_marek_hala_project_sql_primary_final.sql) - data mezd a cen potravin za Českou republiku mezi roky 2006 - 2018

[Sekundární tabulka](t_marek_hala_project_sql_secondary_final.sql) - HDP, Gini koeficient a populace evropských států mezi roky 2006 - 2018



## VÝZKUMNÉ OTÁZKY
**1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
* [Datový podklad](vyzkumna_otazka_1.sql)

**2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**  
V roce 2006 bylo možné si za průměrnou mzdu koupit 1312,99 kg chleba, nebo 1465,74 litrů mléka. V roce 2018 se dalo za průměrnou mzdu koupit 1365,17 kg chleba, nebo 1669,61 litrů mléka.

| common_year | avg_payroll_per_year | product_name                | price | unit | units_per_payroll | unit |
|:------------|:---------------------|:----------------------------|:------|:-----|:------------------|:-----|
| 2006        | 21165.18             | Chléb konzumní kmínový      | 16.12 | kg   | 1312.98           | kg   |
| 2018        | 33091.45             | Chléb konzumní kmínový      | 24.24 | kg   | 1365.16           | kg   |
| 2006        | 21165.18             | Mléko polotučné pasterované | 14.44 | l    | 1465.73           | l    |
| 2018        | 33091.45             | Mléko polotučné pasterované | 19.82 | l    | 1669.6            | l    |


* [Datový podklad](vyzkumna_otazka_2.sql)

**3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
* [Datový podklad](vyzkumna_otazka_3.sql)

**4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
* [Datový podklad](vyzkumna_otazka_4.sql)

**5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?**

![graph_q5](https://github.com/marekhala/SQL-PROJECT/assets/153138933/c96e18b6-8ea0-4bd6-95df-4575c21c5221)

* [Datový podklad](vyzkumna_otazka_5.sql)

