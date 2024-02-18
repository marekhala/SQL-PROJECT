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

| common_year | industry                                                     | avg_payroll | previous_year_avg_payroll | yoy_percentage_change | trend    |
|-------------|--------------------------------------------------------------|-------------|---------------------------|-----------------------|----------|
| 2009        | Činnosti v oblasti nemovitostí                               | 20706.00    | 20790.25                  | -0.41 %               | decrease |
| 2009        | Těžba a dobývání                                             | 28360.50    | 29272.50                  | -3.12 %               | decrease |
| 2009        | Ubytování, stravování a pohostinství                         | 12333.50    | 12471.50                  | -1.11 %               | decrease |
| 2009        | Zemědělství, lesnictví, rybářství                            | 17644.50    | 17763.75                  | -0.67 %               | decrease |
| 2010        | Profesní, vědecké a technické činnosti                       | 31601.75    | 31791.25                  | -0.60 %               | decrease |
| 2010        | Veřejná správa a obrana; povinné sociální zabezpečení        | 26943.50    | 27034.50                  | -0.34 %               | decrease |
| 2010        | Vzdělávání                                                   | 23023.00    | 23416.00                  | -1.68 %               | decrease |
| 2011        | Doprava a skladování                                         | 23062.00    | 23062.50                  | 0.00 %                | decrease |
| 2011        | Ubytování, stravování a pohostinství                         | 13131.25    | 13205.25                  | -0.56 %               | decrease |
| 2011        | Veřejná správa a obrana; povinné sociální zabezpečení        | 26330.75    | 26943.50                  | -2.27 %               | decrease |
| 2011        | Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu  | 40201.50    | 40295.75                  | -0.23 %               | decrease |
| 2013        | Administrativní a podpůrné činnosti                          | 16829.25    | 17040.50                  | -1.24 %               | decrease |
| 2013        | Činnosti v oblasti nemovitostí                               | 22151.50    | 22552.50                  | -1.78 %               | decrease |
| 2013        | Informační a komunikační činnosti                            | 46155.00    | 46641.00                  | -1.04 %               | decrease |
| 2013        | Kulturní, zábavní a rekreační činnosti                       | 20510.50    | 20808.25                  | -1.43 %               | decrease |
| 2013        | Peněžnictví a pojišťovnictví                                 | 46316.50    | 50800.50                  | -8.83 %               | decrease |
| 2013        | Profesní, vědecké a technické činnosti                       | 31824.75    | 32816.75                  | -3.02 %               | decrease |
| 2013        | Stavebnictví                                                 | 22379.25    | 22849.75                  | -2.06 %               | decrease |
| 2013        | Těžba a dobývání                                             | 31486.50    | 32540.25                  | -3.24 %               | decrease |
| 2013        | Velkoobchod a maloobchod; opravy a údržba motorových vozidel | 23129.75    | 23323.75                  | -0.83 %               | decrease |
| 2013        | Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu  | 40761.75    | 42657.25                  | -4.44 %               | decrease |
| 2013        | Zásobování vodou; činnosti související s odpady a sanacemi   | 23615.75    | 23717.50                  | -0.43 %               | decrease |
| 2014        | Těžba a dobývání                                             | 31301.75    | 31486.50                  | -0.59 %               | decrease |
| 2015        | Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu  | 40452.50    | 41093.75                  | -1.56 %               | decrease |
| 2016        | Těžba a dobývání                                             | 31626.25    | 31808.50                  | -0.57 %               | decrease |

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

| product_name                     | percentage_growth |
|:---------------------------------|:------------------|
| Cukr krystalový                  | -1.92             |
| Rajská jablka červená kulatá     | -0.74             |
| Banány žluté                     | 0.81              |
| Vepřová pečeně s kostí           | 0.99              |
| Přírodní minerální voda uhličitá | 1.02              |
| Šunkový salám                    | 1.85              |
| Jablka konzumní                  | 2.01              |
| Pečivo pšeničné bílé             | 2.2               |
| Hovězí maso zadní bez kosti      | 2.53              |
| Kapr živý                        | 2.6               |
| Jakostní víno bílé               | 2.7               |
| Pivo výčepní, světlé, lahvové    | 2.85              |
| Eidamská cihla                   | 2.92              |
| Mléko polotučné pasterované      | 2.98              |
| Rostlinný roztíratelný tuk       | 3.23              |
| Kuřata kuchaná celá              | 3.38              |
| Pomeranče                        | 3.6               |
| Jogurt bílý netučný              | 3.95              |
| Chléb konzumní kmínový           | 3.97              |
| Konzumní brambory                | 4.18              |
| Rýže loupaná dlouhozrnná         | 5.0               |
| Mrkev                            | 5.23              |
| Pšeničná mouka hladká            | 5.24              |
| Těstoviny vaječné                | 5.26              |
| Vejce slepičí čerstvá            | 5.56              |
| Máslo                            | 6.68              |
| Papriky                          | 7.29              |

* [Datový podklad](vyzkumna_otazka_3.sql)

**4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**

| common_year | price_change | payroll_change | difference |
|-------------|--------------|----------------|------------|
| 2013        | 5.1          | -1.56          | 6.66       |
| 2012        | 6.72         | 2.93           | 3.79       |
| 2017        | 9.63         | 6.17           | 3.46       |
| 2011        | 3.35         | 2.33           | 1.02       |
| 2010        | 1.95         | 1.91           | 0.04       |
| 2007        | 6.74         | 6.88           | -0.14      |
| 2008        | 6.19         | 7.69           | -1.5       |
| 2014        | 0.74         | 2.57           | -1.83      |
| 2015        | -0.54        | 2.60           | -3.14      |
| 2016        | -1.21        | 3.64           | -4.85      |
| 2018        | 2.16         | 7.70           | -5.54      |
| 2009        | -6.41        | 3.07           | -9.48      |

* [Datový podklad](vyzkumna_otazka_4.sql)

**5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?**

![graph_q5](https://github.com/marekhala/SQL-PROJECT/assets/153138933/c96e18b6-8ea0-4bd6-95df-4575c21c5221)

| common_year | percentage_GDP_change | percentage_price_change | percentage_payroll_change |
|-------------|-----------------------|-------------------------|---------------------------|
| 2007        | 5.57                  | 6.74                    | 6.88                      |
| 2008        | 2.69                  | 6.19                    | 7.69                      |
| 2009        | -4.66                 | -6.41                   | 3.07                      |
| 2010        | 2.43                  | 1.95                    | 1.91                      |
| 2011        | 1.76                  | 3.35                    | 2.33                      |
| 2012        | -0.79                 | 6.72                    | 2.93                      |
| 2013        | -0.05                 | 5.1                     | -1.56                     |
| 2014        | 2.26                  | 0.74                    | 2.57                      |
| 2015        | 5.39                  | -0.54                   | 2.60                      |
| 2016        | 2.54                  | -1.21                   | 3.64                      |
| 2017        | 5.17                  | 9.63                    | 6.17                      |
| 2018        | 3.2                   | 2.16                    | 7.70                      |

* [Datový podklad](vyzkumna_otazka_5.sql)

