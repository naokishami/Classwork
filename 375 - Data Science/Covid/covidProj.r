library(tidyverse)
library(lubridate) # used to order by date
library(ggplot2)

# Read the datasets
cases <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
death <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
uscases <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv")
usdeath <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv")
bed <- read_csv("/Users/naoki_atkins/Desktop/data.csv")
demo <- read_csv("/Users/naoki_atkins/Desktop/demographics.csv")
usdemo <- read_csv("/Users/naoki_atkins/Desktop/usdemo/4781d818-9392-462a-b22b-0c425d61815c_Data.csv")

##################
# Data Wrangling #
##################

# Pull out just one country from the dataset so that we can perform validation
#cases %>%
#  filter(`Country/Region` == "Japan") %>%
  

# Tidying the data
cases.tidy <- cases %>% 
  pivot_longer(cols = 5:ncol(cases), names_to = "Date", values_to = "confirmed")

# Tidying the data
death.tidy <- death %>% 
  pivot_longer(cols = 5:ncol(death), names_to = "Date", values_to = "deaths")

# Tidying the data
uscases.tidy <- uscases %>% 
  pivot_longer(cols = 12:ncol(uscases), names_to = "Date", values_to = "confirmed")

# Tidying the data
usdeath.tidy <- usdeath %>% 
  pivot_longer(cols = 13:ncol(usdeath), names_to = "Date", values_to = "deaths")

# Tidying the data
demo.tidy <- demo %>% 
  group_by(`Country Code`) %>% 
  select(-`Series Name`) %>% 
  pivot_wider(names_from = `Series Code`, values_from = `YR2015`) %>%
  ungroup()

usdemo.tidy <- usdemo %>%
  select(-`Series Name`,
         -`Country Code`,
         -`2010 [YR2010]`,
         -`2011 [YR2011]`,
         -`2012 [YR2012]`,
         -`2013 [YR2013]`,
         -`2014 [YR2014]`,
         -`2015 [YR2015]`,
         -`2016 [YR2016]`,
         -`2017 [YR2017]`,
         -`2018 [YR2018]`) %>% 
  drop_na() %>%
  pivot_wider(names_from = `Series Code`, values_from = `2019 [YR2019]`)

usdemo.tidy <- usdemo.tidy %>%
  mutate(SP.POP.80UP.TOTL = SP.POP.80UP.FE + SP.POP.80UP.MA)

usdemo.tidy <- usdemo.tidy %>%
  rename(SP.POP.0014.TOTL = SP.POP.0014.TO) %>%
  rename(SP.POP.1564.TOTL = SP.POP.1564.TO) %>%
  rename(SP.POP.65UP.TOTL = SP.POP.65UP.TO) %>%
  select(-SP.POP.80UP.FE, -SP.POP.80UP.MA)

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
cases.tidy <- cases.tidy %>% 
  rename(ProvinceState = `Province/State`) %>%
  rename(Country = `Country/Region`)

# Rename header
death.tidy <- death.tidy %>% 
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
  mutate(Country = replace(Country, Country == "United Kingdom of Great Britain and Northern Ireland", "United Kingdom")) %>%
  mutate(Country = replace(Country, Country == "United States of America", "US"))


# Renaming countries
cases.tidy <- cases.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, South", "South Korea"))

# Renaming countries
death.tidy <- death.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, South", "South Korea"))

# Renaming countries
demo.tidy <- demo.tidy %>% 
  mutate(Country = replace(Country, Country == "Korea, Rep.", "South Korea")) %>%
  mutate(Country = replace(Country, Country == "Korea, Dem. People’s Rep.", "North Korea")) %>%
  mutate(Country = replace(Country, Country == "Iran, Islamic Rep.", "Iran"))

# Rename header
usdemo.tidy <- usdemo.tidy %>% 
  rename(Country = `Country Name`)

usdemo.tidy <- usdemo.tidy %>%
  mutate(Country = replace(Country, Country == "United States", "US"))

# Summing up all the provinces/state into country
cases.tidy <- cases.tidy %>% 
  group_by(Country, Date) %>% 
  summarise(confirmed = sum(confirmed)) %>%
  arrange(mdy(Date)) %>%
  ungroup()

uscases.tidy <- uscases.tidy %>%
  group_by(Country_Region, Date) %>%
  summarise(confirmed = sum(confirmed)) %>%
  arrange(mdy(Date)) %>%
  ungroup

# Summing up all the provinces/state into country
death.tidy <- death.tidy %>% 
  group_by(Country, Date) %>% 
  summarise(deaths = sum(deaths)) %>%
  arrange(mdy(Date)) %>%
  ungroup()

usdeath.tidy <- usdeath.tidy %>%
  group_by(Country_Region, Date) %>%
  summarise(deaths = sum(deaths)) %>%
  arrange(mdy(Date)) %>%
  ungroup

# Rename header
uscases.tidy <- uscases.tidy %>% 
  rename(Country = Country_Region)

# Rename header
usdeath.tidy <- usdeath.tidy %>% 
  rename(Country = Country_Region)

covid <- cases.tidy %>% 
  full_join(uscases.tidy) %>%
  full_join(death.tidy) %>% 
  full_join(usdeath.tidy) %>%
  full_join(bed.tidy) %>% 
  full_join(demo.tidy) %>%
  full_join(usdemo.tidy)

covid <- covid %>%
  select(-SP.POP.80UP.FE, 
         -SP.POP.80UP.MA,
         -SP.DYN.AMRT.FE,
         -SP.DYN.AMRT.MA,
         -SP.DYN.LE00.IN,
         -SP.POP.1564.MA.IN,
         -SP.POP.1564.FE.IN,
         -SP.POP.0014.MA.IN,
         -SP.POP.0014.FE.IN,
         -SP.POP.TOTL.FE.IN,
         -SP.POP.TOTL.MA.IN,
         -SP.POP.65UP.FE.IN,
         -SP.POP.65UP.MA.IN,
         -SP.DYN.AMRT.TOTL,
         -SP.URB.TOTL,
         -CountryCode,
         -Year)

###########################
# Standardizing Variables #
###########################

# Helper function to help us make proportions
convert_population_to_decimal <- function(value, total) {
  return(value/total)
}

# Transforming population counts to proportion of total population
covid <- covid %>% 
  mutate(across(SP.POP.80UP.TOTL:SP.POP.65UP.TOTL, ~convert_population_to_decimal(value = .x, total = SP.POP.TOTL))) %>%
  drop_na()

##############


covid$Date <- as.Date(covid$Date, format = "%m/%d/%y")

countries <- covid$Country %>% unique()


##############


# Plotting the Residuals
##############
library(modelr)

covidCopy <- covid %>% 
  add_residuals(model)

ggplot(aes(Date, resid), data = covidCopy) +
  geom_point()

# Visualize the model
##############

### Model Multiplication 
model2 <- covid %>%
  lm(formula = deaths ~ confirmed * HospitalBeds * SP.POP.TOTL * SP.POP.80UP.TOTL * SP.POP.1564.TOTL * SP.POP.65UP.TOTL * SP.POP.0014.TOTL)

pred <- covid %>%
  add_predictions(model = model2)

# R2 of .9941
summary(model2)

### Model Addition
model3 <- covid %>%
  lm(formula = deaths ~ confirmed + HospitalBeds + SP.POP.TOTL + SP.POP.80UP.TOTL + SP.POP.1564.TOTL + SP.POP.65UP.TOTL + SP.POP.0014.TOTL)

pred <- covid %>%
  add_predictions(model = model3)

# R2 of .8071
summary(model3)

### Model Mix of Multiplication and Addition
model4 <- covid %>%
  lm(formula = deaths ~ Date * confirmed * HospitalBeds * SP.POP.TOTL * SP.POP.80UP.TOTL * SP.POP.1564.TOTL + SP.POP.65UP.TOTL + SP.POP.0014.TOTL)

pred <- covid %>%
  add_predictions(model = model4)

# R2 of .8071
summary(model4)



#setwd("/Users/naoki_atkins/Desktop/plots")
 setwd("/Users/naoki_atkins/Desktop/plotsForAddition")

### NOTE FOR MYSELF
### The reason I think this is not working is because I split the data into a training set and testing set
### Instead, I want to train everything, the entire dataset
for (elem in countries){
  country <- toString(elem, width = 30)
  
  print(  pred %>% 
    filter(Country == country) %>%
    ggplot() +
    geom_point(mapping = aes(x=Date, y=deaths)) + 
    geom_line(mapping = aes(x=Date, y = pred), color = "blue") +
    labs(title = country))
  
  countryName <- gsub(" ", "_", toString(elem, width = 30))
  
# print(paste(countryName, sep = "", ".png")) 
  
  dev.copy(png, paste(countryName, sep = "", ".png"))
  dev.off()
}












##############

library(caret)

set.seed(1996)
inTrain <- createDataPartition(y = covid$deaths, p = .8, list = FALSE)
str(inTrain)

training <- covid[ inTrain,]
testing  <- covid[-inTrain,]

nrow(training)
nrow(testing)

model <- training %>%
  lm(formula = deaths ~ Date * confirmed * HospitalBeds * SP.POP.TOTL * SP.POP.80UP.TOTL * SP.POP.1564.TOTL * SP.POP.65UP.TOTL * SP.POP.0014.TOTL)

prediction <- predict(model, testing, interval = "prediction", level = 0.95)

table(training$deaths, prediction)
##############

# WORKED!
covid %>%
  keep(is.numeric) %>%                     # Keep only numeric columns
  gather() %>%                             # Convert to key-value pairs
  ggplot(aes(value)) +                     # Plot the values
  facet_wrap(~ key, scales = "free") +   # In separate panels
  geom_density()    


# doesn't work
covid %>%
  lm(formula = deaths ~ SP.POP.80UP.TOTL) %>%
  summary() %>%
  coef() %>%
  fortify() %>%
  ggplot()


# R2 value of .8045
reg <- covid %>%
  lm(formula = deaths ~ confirmed + HospitalBeds + SP.POP.80UP.TOTL + SP.POP.65UP.TOTL + SP.POP.1564.TOTL + SP.POP.0014.TOTL)

summary(reg)

# R2 value of .8031
## Most of the variability in deaths is explained by the 1. # of confirmed cases
##                                                       2. proportion of population over the age of 80
##                                                       3. # of hospital beds
ageAsACauseOfDeath <- covid %>%
  lm(formula = deaths ~ confirmed + SP.POP.80UP.TOTL + HospitalBeds)

summary(ageAsACauseOfDeath)

