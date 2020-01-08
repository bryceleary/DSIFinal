#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Trade <- read.csv(here("data", "Cleaning_Trade_Data.csv"))

#Delete Unnecessary Variables
Trade <- select(Trade, -Domain.Code, -Domain, -Element.Code, -Item.Code, -Item, -Unit, -Flag, -Flag.Description)
Trade <- select(Trade, -year_code)

#Rename variables
Trade <- rename(Trade, country_code = Area.Code)
Trade <- rename(Trade, country = Area)
Trade <- rename(Trade, agtrade = Value)
Trade <- rename(Trade, year_code = Year.Code)

#Initial analysis by year
year_agtrade_summ <- group_by(Trade, Year) %>% summarize("mean" = mean(agtrade), 
                                                           "range" = diff(range(agtrade)), 
                                                           "median" = median(agtrade), 
                                                           "sd" = sd(agtrade), 
                                                           "25th" = quantile(agtrade, 0.25), 
                                                           "75th" = quantile(agtrade, 0.75), 
                                                           "IQR" = IQR(agtrade))