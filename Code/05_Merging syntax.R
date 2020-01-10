#Merge code
agriculture = merge(DevAid, FDI, by = c("year", "country"))

agriculture2 = merge(DevAid, FDI, by = c("year", "country", "country_code"), 
                     suffixes = c("",""))

agriculture3 = merge(agriculture2, Nutrition, by = c("year", "country", "country_code"), 
                     suffixes = c("",""))

agriculture4 = merge(agriculture3, Depth, by = c("year", "country"), 
                     suffixes = c("",""))

agriculture5 = merge(agriculture4, Agimport, by = c("year", "country", "country_code"), 
                     suffixes = c(","))

agriculture6 = merge(agriculture5, , by = , 
                     suffixes = c(","))