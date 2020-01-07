#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
here("data", "Raw_FAOSTAT_FDI_Data")
FDI <- Raw_FAOSTAT_FDI_Data

#Delete Variables
FDI <- select(FDI, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note)
#Remember, the value is in 2010 USD

#Rename Variables
FDI <- rename(FDI, "flow" = Value)
FDI <- rename(FDI, country = Area)
FDI <- rename(FDI, country_code = Area.Code)
r
#Initial Analysis
diff(range(FDI$flow, na.rm = FALSE))
mean(FDI$flow, na.rm = FALSE)
median(FDI$flow, na.rm = FALSE)
sd(FDI$flow, na.rm = FALSE)
quantile(FDI$flow, na.rm = FALSE, 0.25)
quantile(FDI$flow, na.rm = FALSE, 0.75)
IQR(FDI$flow, na.rm = FALSE)











