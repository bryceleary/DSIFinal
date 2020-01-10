#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Import <- read.csv(here("data", "Cleaning_FAOSTAT_Import_Data.csv"))

#Delete Unnecessary Variables
Import <- select(Import, -Element, -Item, -Domain.Code, -Domain, -Element.Code, -Item.Code, -Year.Code, -Unit, -Flag, -Flag.Description)

#Rename variables
Import <- rename(Import, country_code = Area.Code)
Import <- rename(Import, country = Area)
Import <- rename(Import, import_value = Value)
Import <- rename(Import, year = Year)

#Multiply the value by 1000
Import <- Import %>% mutate(imp_value =import_value * 1000)

#Delete import-value variable
Import <- select(Import, -import_value)

#Initial analysis by year
year_agtrade_summ <- group_by(Trade, Year) %>% summarize("mean" = mean(agtrade, na.rm = TRUE), 
                                                           "range" = diff(range(agtrade), na.rm = TRUE), 
                                                           "median" = median(agtrade, na.rm = TRUE), 
                                                           "sd" = sd(agtrade, na.rm = TRUE), 
                                                           "25th" = quantile(agtrade, 0.25, na.rm = TRUE), 
                                                           "75th" = quantile(agtrade, 0.75, na.rm = TRUE), 
                                                           "IQR" = IQR(agtrade, na.rm = TRUE))
