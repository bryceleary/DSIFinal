#Read cleaned data files
FDIfinal <- read.csv(here("data", "Final_faostat_fdi_data.csv"))
DevAid <- read.csv(here("data", "Final_faostat_devaid_data.csv"))
Nutrition <- read.csv(here("data", "Final_faostat_nutrition_data.csv"))

#Merge code
FDIfinal %>% 
  oin_all(list(FDIFinal,DevAid, Nutrition), type = "full")  %>% 
  replace_na(list(Value=0, FDINet=0)) %>%
  arrange(Type)

