#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
DevAid <- read.csv(here("data", "Cleaning_OECDFAO_DevAid_Data.csv"))
                   
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

#Initial Analysis
diff(range(DevAid$flow, na.rm = FALSE))
mean(DevAid$flow, na.rm = FALSE)
median(DevAid$flow, na.rm = FALSE)
sd(DevAid$flow, na.rm = FALSE)
quantile(DevAid$flow, na.rm = FALSE, 0.25)
quantile(DevAid$flow, na.rm = FALSE, 0.75)
IQR(DevAid$flow, na.rm = FALSE)











