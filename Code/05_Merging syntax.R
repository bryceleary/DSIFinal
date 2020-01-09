#Merge code
agriculture = merge(DevAid, FDIfinal, by = c("year", "country"))
agriculture2 = merge(DevAid, FDIfinal, by = c("year", "country"), suffixes = c("",""))
#Warning message: In merge.data.frame(DevAid, FDIfinal, by = c("Year", "country"), :column names 'type', 'country_code' are duplicated in the result