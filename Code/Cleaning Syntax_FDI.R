#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
FDI <- read.csv(here("DSIfinal", "data", "Cleaning_FAOSTAT_FDI_Data.csv"))

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

#Initial Analysis for entire dataset
diff(range(FDI$flow, na.rm = FALSE)),
mean(FDI$flow, na.rm = FALSE),
median(FDI$flow, na.rm = FALSE),
sd(FDI$flow, na.rm = FALSE),
quantile(FDI$flow, na.rm = FALSE, 0.25),
quantile(FDI$flow, na.rm = FALSE, 0.75),
IQR(FDI$flow, na.rm = FALSE)

#Removing those with negative inflow
FDI <- mutate(FDI, )

#Creating subsets by country
FDI.Benin <- subset(FDI, subset = (country == "Benin"))
FDI.BurkinaFaso <- subset(FDI, subset = (country == "Burkina Faso"))
FDI.CaboVerde <- subset(FDI, subset = (country == "Cabo Verde"))
FDI.CotedIvoire <- subset(FDI, subset = (country == "Côte d'Ivoire"))
FDI.Gambia <- subset(FDI, subset = (country == "Gambia"))
FDI.Ghana <- subset(FDI, subset = (country == "Ghana"))
FDI.Guinea <- subset(FDI, subset = (country == "Guinea"))
FDI.GuineaBissau <- subset(FDI, subset = (country == "Guinea-Bissau"))
FDI.Liberia <- subset(FDI, subset = (country == "Liberia"))
FDI.Mali <- subset(FDI, subset = (country == "Mali"))
FDI.Mauritania <- subset(FDI, subset = (country == "Mauritania"))
FDI.Niger <- subset(FDI, subset = (country == "Niger"))
FDI.Nigeria <- subset(FDI, subset = (country == "Nigeria"))
FDI.Senegal<- subset(FDI, subset = (country == "Senegal"))
FDI.SierraLeone <- subset(FDI, subset = (country == "Sierra Leone"))
FDI.Togo<- subset(FDI, subset = (country == "Togo"))

#Subset stats by each country

#Benin subset stats
FDI.Benin$flow[FDI.Benin$item == "Total FDI inflows"] %>% min()
FDI.Benin$flow[FDI.Benin$item == "Total FDI inflows"] %>% max()
FDI.Benin$flow[FDI.Benin$item == "Total FDI outflows"] %>% min()
FDI.Benin$flow[FDI.Benin$item == "Total FDI outflows"] %>% max()

#Burkina Faso subset stats
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI inflows"] %>% min()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI inflows"] %>% max()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI outflows"] %>% min()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI outflows"] %>% max()

#Cabo Verde subset stats
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI inflows"] %>% min()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI inflows"] %>% max()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI outflows"] %>% min()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI outflows"] %>% max()

#Côte d'Ivoire subset stats
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI inflows"] %>% min()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI inflows"] %>% max()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI outflows"] %>% min()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI outflows"] %>% max()

#Gambia subset stats
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI inflows"] %>% min()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI inflows"] %>% max()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI outflows"] %>% min()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI outflows"] %>% max()

#Ghana subset stats
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI inflows"] %>% min()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI inflows"] %>% max()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI outflows"] %>% min()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI outflows"] %>% max()

#Guinea subset stats -> MR to pick up code from here throughout the day











