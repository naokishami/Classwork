library(tidyverse)

# Read the datasets
covid <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
bed <- read_csv("/Users/naoki_atkins/Desktop/data.csv")
demo <- read_csv("/Users/naoki_atkins/Desktop/demographics.csv")

# Tidying the data
covid.tidy <- covid %>% 
  pivot_longer(cols = 5:442, names_to = "Date", values_to = "cases")

bed.tidy <- bed %>% 
  group_by(Country) %>%
  filter(Year == max(Year))

demo.tidy <- demo %>% 
  group_by(`Country Code`) %>% 
  select(-`Series Name`) %>% 
  pivot_wider(names_from = `Series Code`, values_from = `YR2015`)

demo.tidy <- demo.tidy %>%
  mutate(SP.POP.80UP.TOTL = SP.POP.80UP.FE + SP.POP.80UP.MA)

demo.tidy <- demo.tidy %>%
  mutate(SP.POP.1564.TOTL = SP.POP.1564.FE.IN + SP.POP.1564.MA.IN)
  
demo.tidy <- demo.tidy %>%
  mutate(SP.POP.0014.TOTL = SP.POP.0014.FE.IN + SP.POP.0014.MA.IN)
  
demo.tidy <- demo.tidy %>%
  mutate(SP.DYN.AMRT.TOTL = SP.DYN.AMRT.FE + SP.DYN.AMRT.MA)

demo.tidy <- demo.tidy %>%
  mutate(SP.POP.65UP.TOTL = SP.POP.65UP.FE.IN + SP.POP.65UP.MA.IN)

# Putting countries into its own variable. 
# Use later to find which countries have different names in different datasets
bed.countries <- bed.tidy %>% distinct(Country) %>% ungroup()
covid.countries <- covid.tidy %>% distinct(`Country/Region`)
demo.countries <- demo.tidy %>% distinct(`Country Name`) %>% ungroup() %>% select(`Country Name`)

bed.tidy <- bed.tidy %>% mutate(Country = replace(Country, Country == "Republic of Korea", "South Korea"))

