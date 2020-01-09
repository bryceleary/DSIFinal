#Set-up
library(tidyverse)
library(dplyr)
library(here)
library(magrittr)
Depth <- read.csv(here("data", "Cleaning_FAO_Depth_Data.csv"))

#Delete Unnecessary Variables
Depth <- select(Depth, -Country.Code, -Indicator.Name, -Indicator.Code, -starts_with("X19"))

#Rename variables
Depth <- rename(Depth, country  = ï..Country.Name)
Depth <- rename(Depth, "2000" = X2000)
Depth <- rename(Depth, "2001" = X2001)
Depth <- rename(Depth, "2002" = X2002)
Depth <- rename(Depth, "2003" = X2003)
Depth <- rename(Depth, "2004" = X2004)
Depth <- rename(Depth, "2005" = X2005)
Depth <- rename(Depth, "2006" = X2006)
Depth <- rename(Depth, "2007" = X2007)
Depth <- rename(Depth, "2008" = X2008)
Depth <- rename(Depth, "2009" = X2009)
Depth <- rename(Depth, "2010" = X2010)
Depth <- rename(Depth, "2011" = X2011)
Depth <- rename(Depth, "2012" = X2012)
Depth <- rename(Depth, "2013" = X2013)
Depth <- rename(Depth, "2014" = X2014)
Depth <- rename(Depth, "2015" = X2015)
Depth <- rename(Depth, "2016" = X2016)
Depth <- rename(Depth, "2017" = X2017)
Depth <- rename(Depth, "2018" = X2018)
Depth <- rename(Depth, "2019" = X2019)

#Combine columns
Depth <- Depth %>% gather(starts_with("2"), key = "year", value = "depth")

#Initial analysis by year
year_depth_summ <- group_by(Depth, year) %>% summarize("mean" = mean(depth, na.rm = TRUE), 
                                                           "range" = diff(range(depth), na.rm = TRUE), 
                                                           "median" = median(depth, na.rm = TRUE), 
                                                           "sd" = sd(depth, na.rm = TRUE), 
                                                           "25th" = quantile(depth, 0.25, na.rm = TRUE), 
                                                           "75th" = quantile(depth, 0.75, na.rm = TRUE), 
                                                           "IQR" = IQR(depth, na.rm = TRUE))
ggplot(Depth) +geom_point(aes(year,depth))