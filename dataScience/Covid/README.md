Took data from 3 different sources: <br>
- [John Hopkins University](https://github.com/CSSEGISandData/COVID-19)
- [World Health Organization](https://apps.who.int/gho/data/view.main.HS07v)
- [World Bank](https://databank.worldbank.org/source/population-estimates-and-projections/Type/TABLE/preview/on#)

***

#### Data Cleaning
Many countries had mismatching names so I labelled all the countries so that they were matching. Some countries were divided into states/provinces, so I summed up all the number of covid cases in these state/provinces into a country level. 

#### Data Wrangling
Data from John Hopkins came in a wide format where all of the dates were in a single row with the number of covid cases in corresponding columns. To get this in a tidy format, I used pivot_longer() so all dates would fall underneath in a single column (Date) with their corresponding number of covid cases to the column right next to it.

#### Merging the data
Data was merged by country

#### Linear Modeling
Used the lm() function supported by R to find a model that would predict the number of deaths (dependent variable) based on the number of cases, hospital infrastructure, and the country's age demographics (independent variables). This model had a R2 value of 0.804.

***

In the plots folder, you'll find all the plots that I have created with my linear model.
![Japan linear model plot](https://github.com/naokishami/Classwork/blob/dc745033fcc43577f4d082bfd2687c3e459f5d69/375%20-%20Data%20Science/Covid/plots/Japan.png)
