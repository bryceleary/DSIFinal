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
FDI.Benin %>% dim()
FDI.Benin$flow[FDI.Benin$item == "Total FDI inflows"] %>% min()
FDI.Benin$flow[FDI.Benin$item == "Total FDI inflows"] %>% max()
FDI.Benin$flow[FDI.Benin$item == "Total FDI outflows"] %>% min()
FDI.Benin$flow[FDI.Benin$item == "Total FDI outflows"] %>% max()

#Burkina Faso subset stats
FDI.BurkinaFaso %>% dim()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI inflows"] %>% min()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI inflows"] %>% max()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI outflows"] %>% min()
FDI.BurkinaFaso$flow[FDI.BurkinaFaso$item == "Total FDI outflows"] %>% max()

#Cabo Verde subset stats
FDI.CaboVerde %>% dim()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI inflows"] %>% min()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI inflows"] %>% max()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI outflows"] %>% min()
FDI.CaboVerde$flow[FDI.CaboVerde$item == "Total FDI outflows"] %>% max()

#Côte d'Ivoire subset stats
FDI.CotedIvoire %>% dim()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI inflows"] %>% min()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI inflows"] %>% max()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI outflows"] %>% min()
FDI.CotedIvoire$flow[FDI.CotedIvoire$item == "Total FDI outflows"] %>% max()

#Gambia subset stats
FDI.Gambia %>% dim()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI inflows"] %>% min()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI inflows"] %>% max()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI outflows"] %>% min()
FDI.Gambia$flow[FDI.Gambia$item == "Total FDI outflows"] %>% max()

#Ghana subset stats
FDI.Ghana %>% dim()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI inflows"] %>% min()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI inflows"] %>% max()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI outflows"] %>% min()
FDI.Ghana$flow[FDI.Ghana$item == "Total FDI outflows"] %>% max()

#Guinea subset stats
FDI.Guinea %>% dim()
FDI.Guinea$flow[FDI.Guinea$item == "Total FDI inflows"] %>% min()
FDI.Guinea$flow[FDI.Guinea$item == "Total FDI inflows"] %>% max()
FDI.Guinea$flow[FDI.Guinea$item == "Total FDI outflows"] %>% min()
FDI.Guinea$flow[FDI.Guinea$item == "Total FDI outflows"] %>% max()

#Guinea-Bissau subset stats
FDI.GuineaBissau %>% dim()
FDI.GuineaBissau$flow[FDI.GuineaBissau$item == "Total FDI inflows"] %>% min()
FDI.GuineaBissau$flow[FDI.GuineaBissau$item == "Total FDI inflows"] %>% max()
FDI.GuineaBissau$flow[FDI.GuineaBissau$item == "Total FDI outflows"] %>% min()
FDI.GuineaBissau$flow[FDI.GuineaBissau$item == "Total FDI outflows"] %>% max()

#Liberia
FDI.Liberia %>% dim()
FDI.Liberia$flow[FDI.Liberia$item == "Total FDI inflows"] %>% min()
FDI.Liberia$flow[FDI.Liberia$item == "Total FDI inflows"] %>% max()
FDI.Liberia$flow[FDI.Liberia$item == "Total FDI outflows"] %>% min()
FDI.Liberia$flow[FDI.Liberia$item == "Total FDI outflows"] %>% max()

#Mali subset stats
FDI.Mali %>% dim()
FDI.Mali$flow[FDI.Mali$item == "Total FDI inflows"] %>% min()
FDI.Mali$flow[FDI.Mali$item == "Total FDI inflows"] %>% max()
FDI.Mali$flow[FDI.Mali$item == "Total FDI outflows"] %>% min()
FDI.Mali$flow[FDI.Mali$item == "Total FDI outflows"] %>% max()

#Mauritania subset stats
FDI.Mauritania %>% dim()
FDI.Mauritania$flow[FDI.Mauritania$item == "Total FDI inflows"] %>% min()
FDI.Mauritania$flow[FDI.Mauritania$item == "Total FDI inflows"] %>% max()
FDI.Mauritania$flow[FDI.Mauritania$item == "Total FDI outflows"] %>% min()
FDI.Mauritania$flow[FDI.Mauritania$item == "Total FDI outflows"] %>% max()

#Niger subset stats
FDI.Niger %>% dim()
FDI.Niger$flow[FDI.Niger$item == "Total FDI inflows"] %>% min()
FDI.Niger$flow[FDI.Niger$item == "Total FDI inflows"] %>% max()
FDI.Niger$flow[FDI.Niger$item == "Total FDI outflows"] %>% min()
FDI.Niger$flow[FDI.Niger$item == "Total FDI outflows"] %>% max()

#Nigeria subset stats
FDI.Nigeria %>% dim()
FDI.Nigeria$flow[FDI.Nigeria$item == "Total FDI inflows"] %>% min()
FDI.Nigeria$flow[FDI.Nigeria$item == "Total FDI inflows"] %>% max()
FDI.Nigeria$flow[FDI.Nigeria$item == "Total FDI outflows"] %>% min()
FDI.Nigeria$flow[FDI.Nigeria$item == "Total FDI outflows"] %>% max()

#Senegal subset stats
FDI.Senegal %>% dim()
FDI.Senegal$flow[FDI.Senegal$item == "Total FDI inflows"] %>% min()
FDI.Senegal$flow[FDI.Senegal$item == "Total FDI inflows"] %>% max()
FDI.Senegal$flow[FDI.Senegal$item == "Total FDI outflows"] %>% min()
FDI.Senegal$flow[FDI.Senegal$item == "Total FDI outflows"] %>% max()

#Sierra Leone subset stats
FDI.SierraLeone %>% dim()
FDI.SierraLeone$flow[FDI.SierraLeone$item == "Total FDI inflows"] %>% min()
FDI.SierraLeone$flow[FDI.SierraLeone$item == "Total FDI inflows"] %>% max()
FDI.SierraLeone$flow[FDI.SierraLeone$item == "Total FDI outflows"] %>% min()
FDI.SierraLeone$flow[FDI.SierraLeone$item == "Total FDI outflows"] %>% max()

#Togo subset stat
FDI.Togo %>% dim()
FDI.Togo$flow[FDI.Togo$item == "Total FDI inflows"] %>% min()
FDI.Togo$flow[FDI.Togo$item == "Total FDI inflows"] %>% max()
FDI.Togo$flow[FDI.Togo$item == "Total FDI outflows"] %>% min()
FDI.Togo$flow[FDI.Togo$item == "Total FDI outflows"] %>% max()







