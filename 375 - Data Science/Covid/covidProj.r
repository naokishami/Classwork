library(tidyverse)

# Read the datasets
covid <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
bed <- read_csv("/Users/naoki_atkins/Desktop/data.csv")
demo <- read_csv("/Users/naoki_atkins/Desktop/demographics.csv")

# Tidying the data
covid.tidy <- covid %>% 
  pivot_longer(cols = 5:ncol(covid), names_to = "Date", values_to = "cases")

# Tidying the data
demo.tidy <- demo %>% 
  group_by(`Country Code`) %>% 
  select(-`Series Name`) %>% 
  pivot_wider(names_from = `Series Code`, values_from = `YR2015`) %>%
  ungroup()

# Extract the most recent year for every country
bed.tidy <- bed %>% 
  group_by(Country) %>%
  filter(Year == max(Year)) %>%
  ungroup()

# Add male and female populations together
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
  rename(CountryRegion = `Country/Region`)

# Rename header
demo.tidy <- demo.tidy %>% 
  rename(CountryName = `Country Name`) %>%
  rename(CountryCode = `Country Code`)

# Rename countries in a standard format so we can join tables later
bed.tidy <- bed.tidy %>% 
  mutate(Country = replace(Country, Country == "Republic of Korea", "South Korea")) %>%
  mutate(Country = replace(Country, Country == "Democratic People's Republic of Korea", "North Korea")) %>%
  mutate(Country = replace(Country, Country == "Iran (Islamic Republic of)", "Iran")) %>%
  mutate(Country = replace(Country, Country == "United Kingdom of Great Britain and Northern Ireland", "United Kingdom"))

# Renaming countries
covid.tidy <- covid.tidy %>% 
  mutate(CountryRegion = replace(CountryRegion, CountryRegion == "Korea, South", "South Korea"))

# Renaming countries
demo.tidy <- demo.tidy %>% 
  mutate(CountryName = replace(CountryName, CountryName == "Korea, Rep.", "South Korea")) %>%
  mutate(CountryName = replace(CountryName, CountryName == "Korea, Dem. People’s Rep.", "North Korea")) %>%
  mutate(CountryName = replace(CountryName, CountryName == "Iran, Islamic Rep.", "Iran"))
  
  








