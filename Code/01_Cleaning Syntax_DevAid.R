#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
DevAid <- read.csv(here("data", "Cleaning_OECDFAO_DevAid_Data.csv"))
                   
#Delete Variables
DevAid <- select(DevAid, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note, -Domain.Code, -Item.Code, -Purpose)
#Remember the flow is in 2016 USD

#Combine the different purpose
DevAid <- DevAid %>% spread(Purpose.Code, Value)
DevAid[is.na(DevAid)] <- 0
DevAid <- rename(DevAid, prgm1 = "12240")
DevAid <- rename(DevAid, prgm2 = "52010")
DevAid <- DevAid %>% mutate(donorflow = prgm1 + prgm2)
DevAid <- select(DevAid, -prgm1, -prgm2)

#Rename Variables - incomplete
DevAid <- rename(DevAid, donorflow = Value)
DevAid <- rename(DevAid, country = Recipient.Country)
DevAid <- rename(DevAid, country_code = Recipient.Country.Code)
DevAid <- rename(DevAid, type = Donor)
DevAid <- rename(DevAid, donor_code = Donor.Code)
DevAid <- rename(DevAid, year = Year)

#Initial Analysis
diff(range(DevAid$flow, na.rm = FALSE))
mean(DevAid$flow, na.rm = FALSE)
median(DevAid$flow, na.rm = FALSE)
sd(DevAid$flow, na.rm = FALSE)
quantile(DevAid$flow, na.rm = FALSE, 0.25)
quantile(DevAid$flow, na.rm = FALSE, 0.75)
IQR(DevAid$flow, na.rm = FALSE)











