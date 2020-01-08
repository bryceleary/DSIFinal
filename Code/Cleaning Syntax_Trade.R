#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Trade <- read.csv(here("data", "Raw_FAOSTAT_WestAfrica_Trade Data.csv"))

#Delete Unnecessary Variables
Trade <- select(Trade, -Domain.Code, -Domain, -Element.Code, -Item.Code, -Year.Code, -Unit, -Flag, -Flag.Description)


#Rename variables
Trade <- rename(Trade, country_code = Area.Code)
Trade <- rename(Trade, country = Area)
Trade <- rename(Trade, agtrade = Value)
Trade <- rename(Trade, impexp = Element)

#Initial analysis by year
year_agtrade_summ <- group_by(Trade, Year) %>% summarize("mean" = mean(agtrade, na.rm = TRUE), 
                                                           "range" = diff(range(agtrade), na.rm = TRUE), 
                                                           "median" = median(agtrade, na.rm = TRUE), 
                                                           "sd" = sd(agtrade, na.rm = TRUE), 
                                                           "25th" = quantile(agtrade, 0.25, na.rm = TRUE), 
                                                           "75th" = quantile(agtrade, 0.75, na.rm = TRUE), 
                                                           "IQR" = IQR(agtrade, na.rm = TRUE))
