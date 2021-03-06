###Set-up
library(tidyverse)
library(here)


###Data Import
Depth <- read.csv(here("data", "Cleaning_FAO_Depth_Data.csv"))
DevAid <- read.csv(here("data", "Cleaning_OECDFAO_DevAid_Data.csv"))
FDI <- read.csv(here("data", "Cleaning_FAOSTAT_FDI_Data.csv"))
Nutrition <- read.csv(here("data", "Raw_Nutrition-Data.csv"))
Agexport <-read.csv(here("data", "Cleaning_FAOSTAT_Export_Data.csv"))
Agimport <- read.csv(here("data", "Cleaning_FAOSTAT_Import_Data.csv"))

  
##Clean Nutrition dataset
#Delete Unnecessary Variables
Nutrition <- select(Nutrition, -Domain.Code, -Domain, -Element.Code, -Element, 
                    -Item.Code, -Item, -Unit, -Flag, -Flag.Description, -Note)

#Rename variables
Nutrition <- rename(Nutrition, country_code = Area.Code)
Nutrition <- rename(Nutrition, country = Area)
Nutrition <- rename(Nutrition, adesa = Value)
Nutrition <- rename(Nutrition, year_spread = Year)
Nutrition <- rename(Nutrition, year = Year.Code)

#create year variable
Nutrition <- Nutrition %>% separate(year, into = c("year1", "year3"), sep = 4, 
                                    convert = TRUE)
Nutrition <- mutate(Nutrition, year = ((year3 + year1)/2))
Nutrition <- Nutrition %>% mutate(year1=NULL, year3=NULL)


###Clean Depth dataset
#Delete Unnecessary Variables
Depth <- select(Depth, -Country.Code, -Indicator.Name, -Indicator.Code, 
                -starts_with("X19"))

#Rename variables
Depth <- Depth %>%
  rename(country  = contains("Country.Name"),
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
         donor = Donor)
DevAid <- select(DevAid, -donor_code)

#Spread the donor types
DevAid <- DevAid %>% spread(donor, donorflow)
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
              -Unit, -Item.Code, -Flag, -Flag.Description, -Note, -Domain.Code)

#Rename Variables
FDI <- FDI %>%
  rename("flow"  = Value,
         "country" = Area,
         "country_code" = Area.Code,
         "year" = Year,
         "item" = Item)

#Separate inflows and outflows
FDI <- FDI %>% spread(key = item, value = flow)

#Clean new variable structure and create netflow variable
FDI <- rename(FDI, "t_fdi_in" = "Total FDI inflows")
FDI <- rename(FDI, "t_fdi_out" = "Total FDI outflows")
FDI <- FDI %>% mutate(fdi_net = t_fdi_in-t_fdi_out)


###Clean Export dataset

#Delete Unnecessary Variables
Agexport <- select(Agexport, -Element, -Item, -Domain.Code, -Domain, 
                   -Element.Code, -Item.Code, -Year.Code, -Unit, -Flag, 
                   -Flag.Description)

#Rename variables
Agexport<- rename(Agexport, country_code = Area.Code)
Agexport <- rename(Agexport, country = Area)
Agexport <- rename(Agexport, export_value = Value)
Agexport <- rename(Agexport, year = Year)

#Multiply the value by 1000
Agexport<- Agexport %>% mutate(exp_value =export_value)

#Delete import-value variable
Agexport<- select(Agexport, -export_value)

###Clean Import dataset
#Delete Unnecessary Variables
Agimport <- select(Agimport, -Element, -Item, -Domain.Code, -Domain, 
                   -Element.Code, -Item.Code, -Year.Code, -Unit, -Flag, 
                   -Flag.Description)

#Rename variables
Agimport <- rename(Agimport, country_code = Area.Code)
Agimport <- rename(Agimport, country = Area)
Agimport <- rename(Agimport, import_value = Value)
Agimport <- rename(Agimport, year = Year)

#Multiply the value by 1000
Agimport <- Agimport %>% mutate(imp_value =import_value)

#Delete import-value variable
Agimport <- select(Agimport, -import_value)