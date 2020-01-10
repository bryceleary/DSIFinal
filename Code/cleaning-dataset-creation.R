#Set-up
library(tidyverse)
library(here)

#Data Import
Depth <- read.csv(here("data", "Cleaning_FAO_Depth_Data.csv"))
DevAid <- read.csv(here("data", "Cleaning_OECDFAO_DevAid_Data.csv"))
FDI <- read.csv(here("data", "Cleaning_FAOSTAT_FDI_Data.csv"))
Nutrition <- read.csv(here("data", "Raw_Nutrition-Data.csv"))
Trade <- read.csv(here("data", "Raw_FAOSTAT_WestAfrica_Trade Data.csv"))

###Clean Depth dataset
#Delete Unnecessary Variables
Depth <- select(Depth, -Country.Code, -Indicator.Name, -Indicator.Code, -starts_with("X19"))

#Rename variables
Depth <- Depth %>%
  rename(country  = ï..Country.Name,
         "2000" = X2000,
         "2001" = X2001,
         "2002" = X2002,
         "2003" = X2003,
         "2004" = X2004,
         "2005" = X2005,
         "2006" = X2006,
         "2007" = X2007,
         "2008" = X2008,
         "2009" = X2009,
         "2010" = X2010,
         "2011" = X2011,
         "2012" = X2012,
         "2013" = X2013,
         "2014" = X2014,
         "2015" = X2015,
         "2016" = X2016,
         "2017" = X2017,
         "2018" = X2018,
         "2019" = X2019)

#Combine columns
Depth <- Depth %>% gather(starts_with("2"), key = "year", value = "depth")

###Clean DevAid dataset
#Delete Variables
DevAid <- select(DevAid, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note, -Domain.Code, -Item.Code, -Purpose)
#Remember the flow is in 2016 USD

#Combine the different purposes
DevAid <- DevAid %>% spread(Purpose.Code, Value)
DevAid[is.na(DevAid)] <- 0
DevAid <- rename(DevAid, prgm1 = "12240")
DevAid <- rename(DevAid, prgm2 = "52010")
DevAid <- DevAid %>% mutate(donorflow = prgm1 + prgm2)
DevAid <- select(DevAid, -prgm1, -prgm2)

#Rename Variables
DevAid <- rename(DevAid, country = Recipient.Country)
DevAid <- rename(DevAid, country_code = Recipient.Country.Code)
DevAid <- rename(DevAid, donor_code = Donor.Code)
DevAid <- rename(DevAid, year = Year)
DevAid <- rename(DevAid, type = Donor)

#Spread the donor types
DevAid <- DevAid %>% spread(type, donorflow)
DevAid <- DevAid %>% spread(type, donorflow)
DevAid <- rename(DevAid, bilateral = "Bilateral Donors")
DevAid <- rename(DevAid, multilateral = "Multilateral Donors")
DevAid <- rename(DevAid, private = "Private Donors")

coalesce_by_column <- function(df) {
  return(coalesce(df[1], df[2]))
}
DevAid <- DevAid %>% group_by(country, year) %>% summarise_all(coalesce_by_column)


###Clean FDI dataset
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

#Clean new variable structure and create netflow variable
FDIfinal <- rename(FDIfinal, "t_fdi_in" = "Total FDI inflows")
FDIfinal <- rename(FDIfinal, "t_fdi_out" = "Total FDI outflows")
FDIfinal <- FDIfinal %>% mutate(fdi_net = t_fdi_in-t_fdi_out)


###Clean Trade dataset