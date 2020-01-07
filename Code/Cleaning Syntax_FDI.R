#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
here("data", "Cleaning.OECD.FAO.DevAidDisburse")
FDI <- Cleaning.OECD.FAO.DevAidDisburse

#Delete Variables
FDI <- select(DevAidDisburse, -Domain, -Element, -Element.Code, -Item, -Year.Code, -Unit, -Flag, -Flag.Description, -Note)

#Rename Variables - incomplete
FDI <- rename(DevAidDisburse, flow = Value)
FDI <- rename(DevAidDisburse, recipient = Recipient.Country)
FDI <- rename(DevAidDisburse, donor = Donor)
FDI <- rename(DevAidDisburse, donor_code = Donor.Code)

#Initial Analysis
diff(range(FDI$flow, na.rm = FALSE))
mean(FDI$flow, na.rm = FALSE)
median(FDI$flow, na.rm = FALSE)
sd(FDI$flow, na.rm = FALSE)
quantile(FDI$flow, na.rm = FALSE, 0.25)
quantile(FDI$flow, na.rm = FALSE, 0.75)
IQR(FDI$flow, na.rm = FALSE)











