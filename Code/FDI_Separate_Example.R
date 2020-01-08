#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
FDI <- read.csv(here("data", "Cleaning_FAOSTAT_FDI_Data.csv"))

#Delete Variables
FDI <- select(FDI, -Domain, -Element, -Element.Code, -Year.Code, -Unit, -Item.Code, -Flag, -Flag.Description, -Note)
#Remember, the value is in 2010 USD

#Rename Variables
FDI <- rename(FDI, "flow" = Value)
FDI <- rename(FDI, "country" = Area)
FDI <- rename(FDI, "country_code" = Area.Code)
FDI <- rename(FDI, "year" = Year)
FDI <- rename(FDI, "type" = Domain.Code)
FDI <- rename(FDI, "item" = Item)

#Separate command
FDI2 <- FDI %>% spread(key = item, value = flow)
View(FDI)
View(FDI2)
