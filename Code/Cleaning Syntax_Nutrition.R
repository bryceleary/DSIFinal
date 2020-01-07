#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
nutrition <- read.csv(here("data", "Raw_Nutrition_Data.csv"))

#Delete Unnecessary Variables
Nutrition <- select(Nutrition, -Domain.Code, -Domain, -Element.Code, -Element, -Item.Code, -Item, -Unit, -Flag, -Flag.Description, -Note)

#Rename variables
nutrition <- rename(Nutrition, country_code = Area.Code)
nutrition <- rename(Nutrition, country = Area)
nutrition <- rename(Nutrition, adesa = Value)
nutrition <- rename(Nutrition, year = Year)
nutrition <- rename(Nutrition, year_code = Year.Code)

#Initial Analysis
diff(range(Nutrition$adesa, na.rm = TRUE))
mean(Nutrition$adesa, na.rm = TRUE)
median(Nutrition$adesa, na.rm = TRUE)
sd(Nutrition$adesa, na.rm = TRUE)
quantile(Nutrition$adesa, na.rm = TRUE, 0.25)
quantile(Nutrition$adesa, na.rm = TRUE, 0.75)
IQR(Nutrition$adesa, na.rm = TRUE)