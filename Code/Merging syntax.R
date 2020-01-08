#Merge code
FDIfinal %>% 
  full_join(list(FDIFinal,DevAid, Nutrition, Trade, Depth), type = "full")  %>% 
  replace_na(list(FDINet="0", Value="0", Depth="0", Nut)) %>%
  arrange(Type)

