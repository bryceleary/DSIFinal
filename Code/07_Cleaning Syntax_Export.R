#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Agexport <-read.csv(here("data", "Cleaning_FAOSTAT_Export_Data.csv"))

#Delete Unnecessary Variables
Agexport <- select(Agexport, -Element, -Item, -Domain.Code, -Domain, -Element.Code, -Item.Code, -Year.Code, -Unit, -Flag, -Flag.Description)

#Rename variables
Agexport<- rename(Agexport, country_code = Area.Code)
Agexport <- rename(Agexport, country = Area)
Agexport <- rename(Agexport, export_value = Value)
Agexport <- rename(Agexport, year = Year)

#Multiply the value by 1000
Agexport<- Agexport %>% mutate(exp_value =export_value * 1000)

#Delete import-value variable
Agexport<- select(Agexport, -export_value)

#Initial analysis by year
year_agtrade_summ <- group_by(, Year) %>% summarize("mean" = mean(agtrade, na.rm = TRUE), 
                                                           "range" = diff(range(agtrade), na.rm = TRUE), 
                                                           "median" = median(agtrade, na.rm = TRUE), 
                                                           "sd" = sd(agtrade, na.rm = TRUE), 
                                                           "25th" = quantile(agtrade, 0.25, na.rm = TRUE), 
                                                           "75th" = quantile(agtrade, 0.75, na.rm = TRUE), 
                                                           "IQR" = IQR(agtrade, na.rm = TRUE))
