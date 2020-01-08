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

#Separate inflows and outflows
FDIfinal <- FDI %>% spread(key = item, value = flow)
View(FDI)
View(FDIfinal)

#Clean new variable structure and create netflow variable
ls(FDIfinal)
FDIfinal <- rename(FDI2, "t_fdi_in" = "Total FDI inflows")
FDIfinal <- rename(FDI2, "t_fdi_out" = "Total FDI outflows")
FDIfinal <- FDIfinal %>% mutate(fdi_net = t_fdi_in-t_fdi_out)
