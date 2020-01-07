#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
FDI <- read.csv(here("DSIfinal", "data", "Cleaning_FAOSTAT_FDI_Data.csv"))

#Delete Variables
FDI <- select(FDI, -Domain, -Element, -Element.Code, -Year.Code, -Unit, -Flag, -Flag.Description, -Note)
#Remember, the value is in 2010 USD

#Rename Variables
FDI <- rename(FDI, "flow" = Value)
FDI <- rename(FDI, "country" = Area)
FDI <- rename(FDI, "country_code" = Area.Code)
FDI <- rename(FDI, "item_code" = Item.Code)
FDI <- rename(FDI, "type" = Domain.Code)
FDI <- rename(FDI, "item" = Item)

#Create net flow variable
FDI <- mutate(FDI, netflow = ifelse(item == "Total FDI inflows", 1,0))
#Help- need to add lines that recognize the same year for each country, if it says in or out in each row, and subtracts based on that information.

#Initial Analysis
diff(range(FDI$flow, na.rm = FALSE)),
mean(FDI$flow, na.rm = FALSE),
median(FDI$flow, na.rm = FALSE),
sd(FDI$flow, na.rm = FALSE),
quantile(FDI$flow, na.rm = FALSE, 0.25),
quantile(FDI$flow, na.rm = FALSE, 0.75),
IQR(FDI$flow, na.rm = FALSE)











