#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
FDI <- read.csv(here("data", "Cleaning_FAOSTAT_FDI_Data.csv"))

#Delete Variables
FDI <- select(FDI, -Domain, -Element, -Element.Code, -Year.Code, -Unit, -Item.Code, -Flag, -Flag.Description, -Note)

#Rename Variables
FDI <- rename(FDI, "flow" = Value)
FDI <- rename(FDI, "country" = Area)
FDI <- rename(FDI, "country_code" = Area.Code)
FDI <- rename(FDI, "year" = Year)
FDI <- rename(FDI, "type" = Domain.Code)
FDI <- rename(FDI, "item" = Item)

#Adjust USD from 2010 values to 2016 values
FDI <- FDI %>% mutate(adj_flow = flow*(353.4/320.4))

#Separate inflows and outflows
FDIfinal <- FDI %>% spread(key = item, value = adj_flow)

#Clean new variable structure and create netflow variable
FDIfinal <- rename(FDIfinal, "t_fdi_in" = "Total FDI inflows")
FDIfinal <- rename(FDIfinal, "t_fdi_out" = "Total FDI outflows")
FDIfinal <- FDIfinal %>% mutate(fdi_net = t_fdi_in-t_fdi_out)
