#Read cleaned data files
FDIfinal <- read.csv(here("data", "Final_faostat_fdi_data.csv"))
DevAid <- read.csv(here("data", "Final_faostat_devaid_data.csv"))
Nutrition <- read.csv(here("data", "Final_faostat_nutrition_data.csv"))
Trade <- read.csv(here("data", "Final_faostat_trade_data."))
Depth <- read.csv(here("data", "Final_faostat_depth_data."))
  
  
#Merge code
FDIfinal %>% 
  oin_all(list(FDIFinal,DevAid, Nutrition, Trade), type = "full")  %>% 
  replace_na(list(FDINet=0, Value=0, )) %>%
  arrange(Type)

