#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
DevAid <- read.csv(here("DSIfinal", "data", "Cleaning_OEC_FAO_DevAid.csv"))
                   
#Delete Variables
DevAid <- select(DevAidDisburse, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note)

#Rename Variables - incomplete
DevAid <- rename(DevAid, flow = Value)
DevAid <- rename(DevAid, recipient = Recipient.Country)
DevAid <- rename(DevAid, donor = Donor)
DevAid <- rename(DevAid, donor_code = Donor.Code)

#Initial Analysis
diff(range(DevAid$flow, na.rm = FALSE))
mean(DevAid$flow, na.rm = FALSE)
median(DevAid$flow, na.rm = FALSE)
sd(DevAid$flow, na.rm = FALSE)
quantile(DevAid$flow, na.rm = FALSE, 0.25)
quantile(DevAid$flow, na.rm = FALSE, 0.75)
IQR(DevAid$flow, na.rm = FALSE)











