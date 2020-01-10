#Merge code
agriculture = merge(DevAid, FDI, by = c("year", "country", "country_code"), 
                     suffixes = c("",""))

agriculture = merge(agriculture, Nutrition, by = c("year", "country", "country_code"), 
                     suffixes = c("",""))

agriculture = merge(agriculture, Depth, by = c("year", "country"), 
                     suffixes = c("",""))

agriculture = merge(agriculture, Agexport, by = c("year", "country", "country_code"), 
                     suffixes = c(","))

agriculture = merge(agriculture, Agimport, by = c("year", "country", "country_code"), 
                     suffixes = c(","))