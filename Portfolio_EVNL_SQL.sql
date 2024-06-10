# Adding year column
ALTER TABLE Portfolio_ONE.coteq_electricity_2018 ADD year INT;
UPDATE Portfolio_ONE.coteq_electricity_2018 SET year = 2018;

# Updated net_manager name to standardize with name found in 2019 & 2020 (they're all from same company group)
UPDATE Portfolio_ONE.coteq_electricity_2018 SET net_manager = 'Cogas Infra & Beheeer BV';
    
# Repeat same process for 2019 & 2020
ALTER TABLE Portfolio_ONE.coteq_electricity_2019 ADD year INT;
UPDATE Portfolio_ONE.coteq_electricity_2019 SET year = 2019;

ALTER TABLE Portfolio_ONE.coteq_electricity_2020 ADD year INT;
UPDATE Portfolio_ONE.coteq_electricity_2020 SET year = 2020;

# Doing same process for remaining companies & respective years

# Enexis
ALTER TABLE Portfolio_ONE.enexis_electricity_01012018 ADD year INT;
UPDATE Portfolio_ONE.enexis_electricity_01012018 SET year = 2018;

ALTER TABLE Portfolio_ONE.enexis_electricity_01012019 ADD year INT;
UPDATE Portfolio_ONE.enexis_electricity_01012019 SET year = 2019;
    
ALTER TABLE Portfolio_ONE.enexis_electricity_01012020 ADD year INT;
UPDATE Portfolio_ONE.enexis_electricity_01012020 SET year = 2020;

# Liander
ALTER TABLE Portfolio_ONE.liander_electricity_01012018 ADD year INT;
UPDATE Portfolio_ONE.liander_electricity_01012018 SET year = 2018;

# Updated net_manager name to standardize with name found in 2019 & 2020
UPDATE Portfolio_ONE.liander_electricity_01012018 SET net_manager = 'Liander NB';

ALTER TABLE Portfolio_ONE.liander_electricity_01012019 ADD year INT;
UPDATE Portfolio_ONE.liander_electricity_01012019 SET year = 2019;
    
ALTER TABLE Portfolio_ONE.liander_electricity_01012020 ADD year INT;
UPDATE Portfolio_ONE.liander_electricity_01012020 SET year = 2020;
    
# Rendo
ALTER TABLE Portfolio_ONE.rendo_electricity_2018 ADD year INT;
UPDATE Portfolio_ONE.rendo_electricity_2018 SET year = 2018;

# Changed net_manager from a string of numbers to a standard name, including var type
ALTER TABLE Portfolio_ONE.rendo_electricity_2018 MODIFY COLUMN net_manager char(255);
UPDATE Portfolio_ONE.rendo_electricity_2018 SET net_manager = 'N.V. Rendo';

ALTER TABLE Portfolio_ONE.rendo_electricity_2019 ADD year INT;
UPDATE Portfolio_ONE.rendo_electricity_2019 SET year = 2019;
ALTER TABLE Portfolio_ONE.rendo_electricity_2019 MODIFY COLUMN net_manager char(255);
UPDATE Portfolio_ONE.rendo_electricity_2019 SET net_manager = 'N.V. Rendo';

# Stedin
ALTER TABLE Portfolio_ONE.stedin_electricity_2018 ADD year INT;
UPDATE Portfolio_ONE.stedin_electricity_2018 SET year = 2018;

# Changed net_manager from a string of numbers to a standard name, including var type
ALTER TABLE Portfolio_ONE.stedin_electricity_2018 MODIFY COLUMN net_manager char(255);
UPDATE Portfolio_ONE.stedin_electricity_2018 SET net_manager = 'Stedin Holding N.V.';

ALTER TABLE Portfolio_ONE.stedin_electricity_2019 ADD year INT;
UPDATE Portfolio_ONE.stedin_electricity_2019 SET year = 2019;
ALTER TABLE Portfolio_ONE.stedin_electricity_2019 MODIFY COLUMN net_manager char(255);
UPDATE Portfolio_ONE.stedin_electricity_2019 SET net_manager = 'Stedin Holding N.V.';

ALTER TABLE Portfolio_ONE.stedin_electricity_2020 ADD year INT;
UPDATE Portfolio_ONE.stedin_electricity_2020 SET year = 2020;
ALTER TABLE Portfolio_ONE.stedin_electricity_2020 MODIFY COLUMN net_manager char(255);
UPDATE Portfolio_ONE.stedin_electricity_2020 SET net_manager = 'Stedin Holding N.V.';

# Westland
ALTER TABLE Portfolio_ONE.`westland-infra_electricity_2018` ADD year INT;
UPDATE Portfolio_ONE.`westland-infra_electricity_2018` SET year = 2018;

ALTER TABLE Portfolio_ONE.`westland-infra_electricity_2019` ADD year INT;
UPDATE Portfolio_ONE.`westland-infra_electricity_2019` SET year = 2019;

ALTER TABLE Portfolio_ONE.`westland-infra_electricity_2020` ADD year INT;
UPDATE Portfolio_ONE.`westland-infra_electricity_2020` SET year = 2020;


# Selecting relevant columns to export:
# Selected electricity provider
# Selected city
# Summed number of connections
# Selected average of delivery %, rounding to 2 decimals
# Selected average of active connections, rounding to 2 decimals
# Summed annual electricity consumption, showing the data in millions, rounding up to 3 decimals
# Selected year


#coteq_electricity_2018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 	1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.coteq_electricity_2018
GROUP BY 
    net_manager,
    city,
    year;
    
#coteq_electricity_2019
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.coteq_electricity_2019
GROUP BY 
    net_manager,
    city,
    year;
    
#coteq_electricity_2020
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.coteq_electricity_2020
GROUP BY 
    net_manager,
    city,
    year;
    
#enexis_electricity_01012018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.enexis_electricity_01012018
GROUP BY 
    net_manager,
    city,
    year;
    
#enexis_electricity_01012019
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.enexis_electricity_01012019
GROUP BY 
    net_manager,
    city,
    year;
    
#enexis_electricity_01012020
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.enexis_electricity_01012020
GROUP BY 
    net_manager,
    city,
    year;

#liander_electricity_01012018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.liander_electricity_01012018
GROUP BY 
    net_manager,
    city,
    year;
    
#liander_electricity_01012019
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.liander_electricity_01012019
GROUP BY 
    net_manager,
    city,
    year;
    
#liander_electricity_01012020
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.liander_electricity_01012020
GROUP BY 
    net_manager,
    city,
    year;
    
#rendo_electricity_2018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.rendo_electricity_2018
GROUP BY 
    net_manager,
    city,
    year;
    
#stedin_electricity_2018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.stedin_electricity_2018
GROUP BY 
    net_manager,
    city,
    year;
    
#stedin_electricity_2019
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.stedin_electricity_2019
GROUP BY 
    net_manager,
    city,
    year;
    
#stedin_electricity_2020
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.stedin_electricity_2020
GROUP BY 
    net_manager,
    city,
    year;

#westland-infra_electricity_2018
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.`westland-infra_electricity_2018`
GROUP BY 
    net_manager,
    city,
    year;
    
#westland-infra_electricity_2019
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.`westland-infra_electricity_2019`
GROUP BY 
    net_manager,
    city,
    year;
    
#westland-infra_electricity_2020
SELECT 
    net_manager, 
    city, 
    SUM(num_connections) as total_num_connections, 
    ROUND(AVG(delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(perc_of_active_connections), 2) AS avg_active_connections,
    ROUND(SUM(annual_consume) / 1000000, 3) AS annual_Kwh_millions,
    year
FROM 
    Portfolio_ONE.`westland-infra_electricity_2020`
GROUP BY 
    net_manager,
    city,
    year;
    
# Joining all providers correspondent to the year 2018
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM coteq_2018
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM enexis_2018
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM liander_2018
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM stedin_2018
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM westland_infra_2018;

# Exporting results into "providers_2018"
# Cleaning data on duplicate and redundant cities, as well as cleaning merged data

SELECT
    CASE
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END AS city,
    SUM(total_num_connections) AS total_num_connections, 
    ROUND(AVG(avg_delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(avg_active_connections), 2) AS avg_active_connections, 
    ROUND(SUM(annual_Kwh_millions), 3) AS annual_Kwh_millions, 
    year
FROM providers_2018
GROUP BY 
    CASE
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END,
    year;
    
# Repeating process with 2019 and 2020 data
#2019

SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM coteq_2019
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM enexis_2019
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM liander_2019
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM stedin_2019
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM westland_infra_2019;

SELECT
    CASE
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
        WHEN city = 'BAVEL AC' THEN 'BAVEL'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
        WHEN city = 'HEDIKHUIZEN GEM HEUSDEN' THEN 'HEDIKHUIZEN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END AS city,
    SUM(total_num_connections) AS total_num_connections, 
    ROUND(AVG(avg_delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(avg_active_connections), 2) AS avg_active_connections, 
    ROUND(SUM(annual_Kwh_millions), 3) AS annual_Kwh_millions, 
    year
FROM providers_2019
GROUP BY 
    CASE
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
		WHEN city = 'BAVEL AC' THEN 'BAVEL'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
		WHEN city = 'HEDIKHUIZEN GEM HEUSDEN' THEN 'HEDIKHUIZEN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END,
    year;
    
#2020

SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM coteq_2020
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM enexis_2020
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM liander_2020
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM stedin_2020
UNION
SELECT city, total_num_connections, avg_delivery_perc, avg_active_connections, annual_Kwh_millions, year FROM westland_infra_2020;

SELECT
    CASE
		WHEN city = "'S-GRAVENHAGE" THEN "'S-GRAVENHAGE"
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
        WHEN city = 'BAVEL AC' THEN 'BAVEL'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
        WHEN city = 'HEDIKHUIZEN GEM HEUSDEN' THEN 'HEDIKHUIZEN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END AS city,
    SUM(total_num_connections) AS total_num_connections, 
    ROUND(AVG(avg_delivery_perc), 2) AS avg_delivery_perc, 
    ROUND(AVG(avg_active_connections), 2) AS avg_active_connections, 
    ROUND(SUM(annual_Kwh_millions), 3) AS annual_Kwh_millions, 
    year
FROM providers_2020
GROUP BY 
    CASE
		WHEN city = "'S-GRAVENHAGE" THEN "'S-GRAVENHAGE"
        WHEN city = 'AMSTERDAM ZUID00ST' THEN 'AMSTERDAM ZUIDOOST'
		WHEN city = 'BAVEL AC' THEN 'BAVEL'
        WHEN city = 'DELFT' THEN 'DELFT'
        WHEN city = 'DEN HOORN ZH' THEN 'DEN HOORN'
		WHEN city = 'HEDIKHUIZEN GEM HEUSDEN' THEN 'HEDIKHUIZEN'
        WHEN city = 'HEUKELOM NB' THEN 'HEUKELOM'
        WHEN city = 'RIJKEVOORT-DE WALSERT' THEN 'RIJKEVOORT'
        WHEN city = 'RIJSWIJK NB' THEN 'RIJSWIJK ZH'
        WHEN city = 'ULVENHOUT AC' THEN 'ULVENHOUT'
        WHEN city = 'ZEVENBERGEN HOEK' THEN 'ZEVENBERGEN'
        ELSE city
    END,
    year;
    
# Removing rows where each city doesn't have a match for each year, as to not skew results

DELETE FROM netherlands_power_table
WHERE city NOT IN (
    SELECT city
    FROM (
        SELECT city
        FROM netherlands_power_table
        WHERE year = 2018
        INTERSECT
        SELECT city
        FROM netherlands_power_table
        WHERE year = 2019
        INTERSECT
        SELECT city
        FROM netherlands_power_table
        WHERE year = 2020
    ) AS valid_cities
);
    
# Finally loaded up all data for Tableau, making sure avg_delivery_perc is subjected to the arithmetic expression "100 - x" so data visualization becomes simpler
SELECT
    city, total_num_connections, ROUND((100 - avg_delivery_perc), 2) AS avg_delivery_percent, avg_active_connections, annual_Kwh_millions, year
FROM 
    netherlands_final