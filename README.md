# ⚡️🇳🇱 Analysis of Energy Consumption and EV Growth in the Netherlands

## Summary

Utilizing a dataset on [Energy Consumption in the Netherlands](https://www.kaggle.com/datasets/lucabasa/dutch-energy/data), together with Government data on [Electric Vehicle Statistics in the Netherlands](https://www.rvo.nl/sites/default/files/2022-07/Statistics-electric-vehicles-and-charging-in-the-%20Netherlands-up-to-and-including-June-2022.pdf), I have developed this project to analyze whether there is a correlation regarding EV sales over a three-year period (2018-2020), with changes in the energy that is delivered back to the grid during that same timeframe. This project also serves as a showcase of my Python, SQL, Tableau, and Excel skills.

## Tools and Technologies

Data Source: **[Energy Consumption in the Netherlands](https://www.kaggle.com/datasets/lucabasa/dutch-energy/data)** & **[Electric Vehicle Statistics in the Netherlands](https://www.rvo.nl/sites/default/files/2022-07/Statistics-electric-vehicles-and-charging-in-the-%20Netherlands-up-to-and-including-June-2022.pdf)**

Database: **MySQL**

Data Querying and Cleansing: **SQL**

Statistical Analysis: **Python (numpy & matplotlib)**

Visualizations: **Tableau**

## Background

Through time, studies have indicated a correlation between owning an EV and installing Solar Photovoltaics [PV's] at one's home [(Hajhashemi et al. 2024,](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11043074/)[ Lyu 2023)](https://ideas.repec.org/a/ucp/jaerec/doi10.1086-723494.html). A survey conducted in 2018 in the SF Bay Area suggested EV owners have a higher likelihood of adopting PV's, and conversely, home owners with PV's are also more likely to purchase an Electric Vehicle, although this correlation is less strong that the former [(Sharda et al. 2024)](https://doi.org/10.1016/j.rser.2023.114172). As the worldwide share of EV's surges, causing additional electricity demand, so does high charging power demand in households [(Jochem et al. 2014)](https://www.researchgate.net/publication/285748828_How_to_Integrate_Electric_Vehicles_in_the_Future_Energy_System).

23% of all electric car charging points across the EU are located in the Netherlands, who has a 30.8% market share of all EV's sold in the continent. [(Acea.auto)](https://www.acea.auto/figure/interactive-map-correlation-between-electric-car-sales-and-charging-point-availability-2023-data/#:~:text=Key%20findings,of%20the%20region's%20surface%20area.), highlighting the Dutch market's global dominance in terms of EV adoption.

Surplus power that is fed back to the grid is often generated due to the intermittent nature of renewable energy resources. Among renewable energy sources, solar energy has the greatest impact on increasing the amount of surplus electricity. [(Rad et al. 2023,](https://www.sciencedirect.com/science/article/abs/pii/S0960148123006961)[ Kaschub et al. 2016)](https://www.sciencedirect.com/science/article/abs/pii/S0301421516304815?via%3Dihub)

## Objective

Given the information provided in the previous section, I will analyze a dataset on energy consumption in the Netherlands, comparing it to governmental data on EV statistics also in the Netherlands, in order to provide a visualization for relevant information on these topics, as well as pointing out if there is a significant trend in terms of the energy that is fed back to the grid, and the vehicle sales over time.

This project consists of the following stages:

  1. Obtaining relevant data for the project (one dataset + data from rvo.nl)
  2. Cleansing and querying the data (15 .csv files)
  3. Extracting queried data into Tableau for data visualization (1 .csv file)
  4. Developing a dashboard on Tableau
  5. Gathering additional background information for this project 

## Data Description

The dataset for this project was obtained from Kaggle.com [(Link)](https://www.kaggle.com/datasets/lucabasa/dutch-energy/data) whose author is @lucabasa. Titled "Energy Consumption in the Netherlands", this dataset contains information released by the individual energy providers in the Netherlands. Originally comprised of data on electricity and gas usage, only the former was used for this project, for a total of 150 .csv files who were then filtered down to 75 files.

From these 75 files, an additional filtering process took place to get to a final total of 15 files. This additional process sought to filter data outside the timeframe scope of this project (2018 to 2020), as well as removing files who had missing data, as to not affect the consistency of the results.

Regarding the provided columns in each data file, only the following were selected for the consequent analysis:
  - `city`: Name of the city
  - `num_connections`: Number of connections in the range of zipcodes (e.g. between zipcode X and Y, electricity is provided to 20 households)
  - `delivery_perc`:  percentage of the net consumption of electricity. The lower, the more energy was given back to the grid. (e.g. a value of 87 represents 13% electricity is returned to grid)
  - `perc_of_active_connections`: percentage of active connections in the zipcode range
  - `annual_consume`: Annual consumption in Kwh

Finally, data was collected from [Rijksdienst voor Ondernemend's website](https://www.rvo.nl/sites/default/files/2022-07/Statistics-electric-vehicles-and-charging-in-the-%20Netherlands-up-to-and-including-June-2022.pdf) regarding statistics on EV's.

The table below shows the amount of registered electric passenger cars (M1) and buses (M2+M3) in the Netherlands over time. For this project, only data on Passenger cars (EV + BEV + FCEV + PHEV) was used, between the years of 2018 and 2020, as to be consistent with the dataset.

<img width="1029" alt="Screenshot 2024-06-10 at 16 13 09" src="https://github.com/dzrela/Analysis-of-Energy-Consumption-and-EV-Growth-in-the-Netherlands/assets/169355564/d6b42061-cad5-4968-9f6a-d99f40e3f85c">


## Data Transformation

In summary, the following transformations were performed on the dataset:

  * All rows who previously were divided by zipcodes were merged to represent individual cities, greatly reducing the number of rows
  * Standardized columns representing name of energy provider
  * `num connections` were summed to create column `total_num_connections`
  * `delivery_perc` were summed and averaged to create column `avg_delivery_percent`, rounded to 2 decimals
  * `perc_of_active_connections` were summed and averaged to create column `avg_active_connections`, rounded to 2 decimals
  * `annual_consume` was summed and divided by 1.000.000 to create column `annual_kwh_millions`, rounded to 3 decimals
  * The `city` column was cleansed to remove inconsistencies, redundancies, and duplicates (e.g. Amsterdam N00rd was merged to Amsterdam Noord)
  * All 15 files were merged into a single one, creating a column `year`
  * Cities who didn't have data on all years (2018, 2019, 2020) were removed for consistency purposes and to not skew data when comparing to EV sales
  * `avg_delivery_perc` was subjected to the arithmetic expression of "100 - x" for simpler data interpretation and visualization

Finally, this data was exported to Tableau for its visualization.

## Data Visualization & Analysis

Before delving into the main analysis, I'll provide some additional visualizations on our data:

<img width="764" alt="Screenshot 2024-06-10 at 18 13 06" src="https://github.com/dzrela/Analysis-of-Energy-Consumption-and-EV-Growth-in-the-Netherlands/assets/169355564/04dc3309-cc1f-4ea0-b5ee-9380127d8521">

> [!NOTE]
> Large cities such as The Hague and Rotterdam are missing given data filtering done previously


<img width="689" alt="Screenshot 2024-06-10 at 18 49 00" src="https://github.com/dzrela/Analysis-of-Energy-Consumption-and-EV-Growth-in-the-Netherlands/assets/169355564/2dedb302-53f4-4557-a15f-4c2043b0f134">

> [!NOTE]
> This data shows the percentage of electricity that is supplied back to the grid, whose source are primarily solar panels.

<img width="688" alt="Screenshot 2024-06-10 at 16 50 40" src="https://github.com/dzrela/Analysis-of-Energy-Consumption-and-EV-Growth-in-the-Netherlands/assets/169355564/11242849-6d71-4bcc-8e86-567418717e71">

> [!NOTE]
> A simple correlation analysis on Python provides us with the following values:
> 
>```
>import numpy as np
> from scipy.stats import pearsonr, t
> import matplotlib.pyplot as plt
>
> evs_sold = np.array([276410, 393634, 541336])
> energy_supplied = np.array([8.13, 10.72, 15.84])
>
> r, p_value = pearsonr(evs_sold, energy_supplied)
>
> n = len(evs_sold)
> t_statistic = r * np.sqrt((n - 2) / (1 - r**2))
> degrees_of_freedom = n - 2
>
> critical_value = t.ppf(1 - 0.025, degrees_of_freedom)
>
> print(f"Pearson Correlation Coefficient (r): {r}")
> print(f"t-Statistic: {t_statistic}")
> print(f"p-Value: {p_value}")
>
> #withholded plot visualization
> plt.scatter(evs_sold, energy_supplied, color='blue', label='Data points')
> plt.plot(evs_sold, np.poly1d(np.polyfit(evs_sold, energy_supplied, 1))(evs_sold), color='red', label='Regression line')
> plt.xlabel('EVs Sold')
> plt.ylabel('% Energy Supplied Back to Grid')
> plt.title('Correlation between % Energy Supplied Back to Grid and Electric Vehicle Sales')
> plt.legend()
> plt.grid(True)
> plt.show()
>```
> * Pearson Correlation Coefficient (r): **0.993**
> * t-statistic: **8.23**
> * p-value: **0.077**
>
> In conclusion, The correlation analysis shows a very strong positive correlation between the number of vehicles sold and the percentage of energy returned back to the grid (r = 0.993). However, the p-value is > slightly above the 0.05 threshold, suggesting that while the observed correlation is very high, it is not statistically significant at the 5% level. This might be explained given the small sample size (only 3 years of data).

## Data Sources

[Dataset: Energy Consumption in the Netherlands](https://www.kaggle.com/datasets/lucabasa/dutch-energy/data)

[Electric Vehicle Statistics in the Netherlands](https://www.rvo.nl/sites/default/files/2022-07/Statistics-electric-vehicles-and-charging-in-the-%20Netherlands-up-to-and-including-June-2022.pdf)
