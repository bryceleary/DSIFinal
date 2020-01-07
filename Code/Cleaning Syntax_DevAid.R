#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
here("DSIfinal", "data", "Cleaning.OECD.FAO.DevAidDisburse")
DevAidDisburse <- Cleaning.OECD.FAO.DevAidDisburse

#Delete Variables
DevAidDisburse <- select(DevAidDisburse, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note)

#Rename Variables - incomplete
DevAidDisburse <- rename(DevAidDisburse, flow = Value)
DevAidDisburse <- rename(DevAidDisburse, recipient = Recipient.Country)
DevAidDisburse <- rename(DevAidDisburse, donor = Donor)
DevAidDisburse <- rename(DevAidDisburse, donor_code = Donor.Code)

#Initial Analysis
diff(range(DevAidDisburse$flow, na.rm = FALSE))
mean(DevAidDisburse$flow, na.rm = FALSE)
median(DevAidDisburse$flow, na.rm = FALSE)
sd(DevAidDisburse$flow, na.rm = FALSE)
quantile(DevAidDisburse$flow, na.rm = FALSE, 0.25)
quantile(DevAidDisburse$flow, na.rm = FALSE, 0.75)
IQR(DevAidDisburse$flow, na.rm = FALSE)











