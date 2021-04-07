library(tidyverse)
library(lubridate) # used to order by date

# Read the datasets
covid <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
covidDeath <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
bed <- read_csv("/Users/naoki_atkins/Desktop/data.csv")
demo <- read_csv("/Users/naoki_atkins/Desktop/demographics.csv")

##################
# Data Wrangling #
##################

# Tidying the data
covid.tidy <- covid %>% 
  pivot_longer(cols = 5:ncol(covid), names_to = "Date", values_to = "confirmed")

# Tidying the data
covidDeath.tidy <- covidDeath %>% 
  pivot_longer(cols = 5:ncol(covidDeath), names_to = "Date", values_to = "deaths")

# Tidying the data
demo.tidy <- demo %>% 
  group_by(`Country Code`) %>% 
  select(-`Series Name`) %>% 
  pivot_wider(names_from = `Series Code`, values_from = `YR2015`) %>%
  ungroup()

# Extract the most recent year for every country - all other years are not necessary to keep
bed.tidy <- bed %>% 
  group_by(Country) %>%
  filter(Year == max(Year)) %>%
  ungroup()

# Add male and female populations together - not examining sex-related differences
demo.tidy <- demo.tidy %>%
  mutate(SP.POP.80UP.TOTL = SP.POP.80UP.FE + SP.POP.80UP.MA) %>%
  mutate(SP.POP.1564.TOTL = SP.POP.1564.FE.IN + SP.POP.1564.MA.IN) %>%
  mutate(SP.POP.0014.TOTL = SP.POP.0014.FE.IN + SP.POP.0014.MA.IN) %>%
  mutate(SP.DYN.AMRT.TOTL = SP.DYN.AMRT.FE + SP.DYN.AMRT.MA) %>%
  mutate(SP.POP.65UP.TOTL = SP.POP.65UP.FE.IN + SP.POP.65UP.MA.IN)

# Rename header
bed.tidy <- bed.tidy %>% 
  rename(HospitalBeds = `Hospital beds (per 10 000 population)`) 

# Rename header
covid.tidy <- covid.tidy %>% 
  rename(ProvinceState = `Province/State`) %>%
  rename(Country = `Country/Region`)

# Rename header
covidDeath.tidy <- covidDeath.tidy %>% 
  rename(ProvinceState = `Province/State`) %>%
  rename(Country = `Country/Region`)

# Rename header
demo.tidy <- demo.tidy %>% 
  rename(Country = `Country Name`) %>%
  rename(CountryCode = `Country Code`)

# Rename countries in a standard format so we can join tables later
bed.tidy <- bed.tidy %>% 
  mutate(Country = replace(Country, Country == "Republic of Korea", "South Korea")) %>%
  mutate(Country = replace(Country, Country == "Democratic People's Republic of Korea", "North Korea")) %>%
  mutate(Country = replace(Country, Country == "Iran (Islamic Republic of)", "Iran")) %>%
  mutate(Country = replace(Country, Country == "United Kingdom of Great Britain and Northern Ireland", "United Kingdom"))

# Renaming countries
covid.tidy <- covid.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, South", "South Korea"))

# Renaming countries
covidDeath.tidy <- covidDeath.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, South", "South Korea"))

# Renaming countries
demo.tidy <- demo.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, Rep.", "South Korea")) %>%
  mutate(Country = replace(Country, Country == "Korea, Dem. People’s Rep.", "North Korea")) %>%
  mutate(Country = replace(Country, Country == "Iran, Islamic Rep.", "Iran"))

# Summing up all the provinces/state into country
covid.tidy <- covid.tidy %>% 
  group_by(Country, Date) %>% 
  summarise(confirmed = sum(confirmed)) %>%
  arrange(mdy(Date)) %>%
  ungroup()

# Summing up all the provinces/state into country
covidDeath.tidy <- covidDeath.tidy %>% 
  group_by(Country, Date) %>% 
  summarise(deaths = sum(deaths)) %>%
  arrange(mdy(Date)) %>%
  ungroup()

covid.table <- covid.tidy %>% 
  full_join(covidDeath.tidy) %>% 
  full_join(bed.tidy) %>% 
  full_join(demo.tidy) 

headers <- covid.table %>% colnames()
index <- c(1:8, 10:12)

covid.table <- covid.table %>% 
  select(headers[index])

# Reordering columns so that it is easier to manage
covid.table <- covid.table[, c(1, 2, 3, 4, 5, 12, 6, 7, 8, 9, 10, 11, 13)]

###################
# Linear Modeling #
###################

# Helper function to help us make proportions
convert_population_to_decimal <- function(value, total) {
  return(value/total)
}

# Transforming population counts to proportion of total population
covid.table <- covid.table %>% 
  mutate(across(SP.POP.80UP.TOTL:SP.POP.65UP.TOTL, ~convert_to_decimal(value = .x, total = SP.POP.TOTL))) %>% 
  mutate(SP.URB.TOTL = convert_to_decimal(value = SP.URB.TOTL, total = SP.POP.TOTL))


  






