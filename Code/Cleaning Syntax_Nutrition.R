#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Nutrition <- read.csv(here("data", "Raw_Nutrition-Data.csv"))

#Delete Unnecessary Variables
Nutrition <- select(Nutrition, -Domain.Code, -Domain, -Element.Code, -Element, -Item.Code, -Item, -Unit, -Flag, -Flag.Description, -Note)

#Rename variables
Nutrition <- rename(Nutrition, country_code = Area.Code)
Nutrition <- rename(Nutrition, country = Area)
Nutrition <- rename(Nutrition, adesa = Value)
Nutrition <- rename(Nutrition, year_spread = Year)
Nutrition <- rename(Nutrition, year = Year.Code)

#create year variable
Nutrition <- Nutrition %>% separate(year, into = c("year1", "year3"), sep = 4, convert = TRUE)
Nutrition <- mutate(Nutrition, year = ((year3 + year1)/2))
Nutrition <- Nutrition %>% mutate(year1=NULL, year3=NULL)

#Initial Analysis
diff(range(Nutrition$adesa, na.rm = TRUE))
mean(Nutrition$adesa, na.rm = TRUE)
median(Nutrition$adesa, na.rm = TRUE)
sd(Nutrition$adesa, na.rm = TRUE)
quantile(Nutrition$adesa, na.rm = TRUE, 0.25)
quantile(Nutrition$adesa, na.rm = TRUE, 0.75)
IQR(Nutrition$adesa, na.rm = TRUE)