#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
nutrition <- read.csv(here("data", "Raw_Nutrition_Data.csv"))

#Delete Unnecessary Variables
nutrition <- select(nutrition, -Domain.Code, -Domain, -Element.Code, -Element, -Item, -Unit, -Flag, -Flag.Description, -Note)

#Rename variables
nutrition <- rename(nutrition, country_code = Area.Code)
nutrition <- rename(nutrition, country = Area)
nutrition <- rename(nutrition, item_code = Item.Code)
nutrition <- rename(nutrition, malnur = Value)
nutrition <- rename(nutrition, year = Year)
nutrition <- rename(nutrition, year_code = Year.Code)

#Convert malnur to integers
nutrition$malnur <- as.numeric(as.character(nutrition$malnur))

#Put malnur in terms of millions
nutrition <- mutate(nutrition, malnur = malnur * 1000000)

#Separate the two malnutrition codes
#I'm not sure how to do this
malsev <- mutate(nutrition, malsev = if_else(210071 = ))
malsevmod <- 

nutrition %>% mutate(sevmal = malnur if_else())

#Create the third malnutrition variable




#Initial Analysis
diff(range(nutrition$malnur, na.rm = TRUE))
mean(nutrition$malnur, na.rm = TRUE)
median(nutrition$malnur, na.rm = TRUE)
sd(nutrition$malnur, na.rm = TRUE)
quantile(nutrition$malnur, na.rm = TRUE, 0.25, 0.75)
IQR(nutrition$malnur, na.rm = TRUE)
