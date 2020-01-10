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
Depth <- select(Depth, -Country.Code, -Indicator.Name, -Indicator.Code, 
                -starts_with("X19"))

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
DevAid <- select(DevAid, -Domain, -Element, -Element.Code, -Item, 
                 -Year.Code, -Unit, -Flag, -Flag.Description, -Note, 
                 -Domain.Code, -Item.Code, -Purpose)

#Combine the different purposes
DevAid <- DevAid %>% spread(Purpose.Code, Value)
DevAid[is.na(DevAid)] <- 0
DevAid <- DevAid %>%
  rename(prgm1  = "12240",
         prgm2 = "52010")
DevAid <- DevAid %>% mutate(donorflow = prgm1 + prgm2)
DevAid <- select(DevAid, -prgm1, -prgm2)

#Rename Variables
DevAid <- DevAid %>%
  rename(country = Recipient.Country,
         country_code = Recipient.Country.Code,
         donor_code = Donor.Code,
         year  = Year,
         type = Donor)

#Spread the donor types
DevAid <- DevAid %>% spread(type, donorflow)
DevAid <- DevAid %>%
  rename(bilateral = "Bilateral Donors",
         multilateral  = "Multilateral Donors",
         private = "Private Donors")

coalesce_by_column <- function(df) {
  return(coalesce(df[1], df[2]))
}
DevAid <- DevAid %>% group_by(country, year) %>% summarise_all(coalesce_by_column)


###Clean FDI dataset
#Delete Variables
FDI <- select(FDI, -Domain, -Element, -Element.Code, -Year.Code, 
              -Unit, -Item.Code, -Flag, -Flag.Description, -Note)

#Rename Variables
FDI <- FDI %>%
  rename("flow"  = Value,
         "country" = Area,
         "country_code" = Area.Code,
         "year" = Year,
         "type" = Domain.Code,
         "item" = Item)

#Separate inflows and outflows
FDI <- FDI %>% spread(key = item, value = flow)

#Clean new variable structure and create netflow variable
FDI <- rename(FDI, "t_fdi_in" = "Total FDI inflows")
FDI <- rename(FDI, "t_fdi_out" = "Total FDI outflows")
FDI <- FDI %>% mutate(fdi_net = t_fdi_in-t_fdi_out)


###Clean Export dataset



###Clean Import dataset


