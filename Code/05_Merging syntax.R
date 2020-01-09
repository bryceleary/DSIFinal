#Merge code
agriculture = merge(DevAid, FDIfinal, by = c("year", "country"))

agriculture2 = merge(DevAid, FDIfinal, by = c("year", "country", "country_code"), suffixes = c("",""))
#Warning message: In merge.data.frame(DevAid, FDIfinal, by = c("Year", "country"), :column names 'type' are duplicated in the result

agriculture3 = merge(agriculture2, Nutrition, by = c("year", "country", "country_code"), suffixes = c("",""))
#Warning message: In merge.data.frame(agriculture 2, Nutrition, by = c("year", "country", : column name 'type' is duplicated in the result

agriculture4 = merge(agriculture3, Depth, by = c("year", "country"), suffixes = c("",""))
#Warning message: In merge.data.frame(agriculture3, Depth, by = c("year", "country"), : column name 'type' is duplicated in the result

agriculture5 = merge(agriculture4, Trade, by = )