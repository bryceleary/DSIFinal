library(tidyverse)

###GGPlots###
ggplot(data=agriculture) + geom_point(mapping = aes(x=year, y=depth, color = country))
ggplot(data=agriculture) + geom_point(mapping = aes(x=year, y=adesa, color = country))


###MCMC/Bayes linear regression
mc_depth_full <- MCMCregress(depth ~ bilateral + multilateral + exp_value + imp_value, data = agriculture)
summary(mc_depth_full)
#https://www.rdocumentation.org/packages/MCMCpack/versions/1.4-5/topics/MCMCregress


###Linear Regressions###
#lm for development aid
summaid <- lm(depth ~ bilateral + multilateral, data = agriculture)
summary(summaid)
#bilateral -17.77 @ .4478
#multilateral -71.83 @ .0491


#lm for development aid and fdi
summaidfdi <- lm(depth ~ bilateral + multilateral + fdi_net, data = agriculture)
summary(summaidfdi)
#bilateral -20.3307 @ .3369
#multilateral -63.4383 @ .0512
#fdi_net -0.8427 @ 1.47e-08

#lm for development aid, fdi, net trade
summaidfditr <- lm(depth ~ bilateral + multilateral + fdi_net +trade_net, data = agriculture)
summary(summaidfditr)
#bilateral -2.051e+1 @ .3341
#multilateral -6.3213+01 @0.0527
#fdi_net -8.009e-01 @1.14e-05
#trade_net 9.147e-05 @ .6930

#lm for development aid, fdi, imports, exports
summaidfdiie <- lm(cbind(depth,adesa) ~ bilateral + multilateral + fdi_net + exp_value + imp_value, data = agriculture)
summary(summaidfdiie)

#Results of Multivariate Regression
#bilateral  -3.912e+0 @ .8551
#multilateral -7.911e+01 @.0146
#fdi_net -3.541e-01 @.1232
#exp_value -1.204e-03 @ .0153
#imp_value -3.682e-04 @ 0.1334

##Plot of Multivariate Regression

#Multilateral on ADESA
ma <- ggplot(agriculture, aes(x = multilateral, y = adesa)) + geom_smooth(method = "lm")
ma + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Multilateral Flow Value on ADESA", 
       subtitle = "Average Dietary Energy Supply Adequacy (Percentage)",
       x = "Multilateral Flow (Millions in USD)", y = "Average Dietary Energy Supply")

#Multilateral on Depth
md <- ggplot(agriculture, aes(x = multilateral, y = depth)) + geom_smooth(method = "lm")
md + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Multilateral Donor Flow on Depth", 
       x = "Multilateral Flow (Millions in USD)", y = "Food Deficit (kCal/person/day)")

#Export Value on ADESA
ea <- ggplot(agriculture, aes(x = exp_value, y = adesa)) + geom_smooth(method = "lm")
ea + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Export Value on ADESA", 
  subtitle = "Average Dietary Energy Supply Adequacy (Percentage)",
  x = "Export Value (Millions in USD)", y = "Average Dietary Energy Supply")

#Export Value on Depth
ed <- ggplot(agriculture, aes(x = exp_value, y = depth)) + geom_smooth(method = "lm")
ed + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Export Value on Depth", 
       x = "Export Value (Millions in USD)", y = "Food Deficit (kCal/person/day)")


#adesa x year by country
ggplot(agriculture, aes(x = year, y = adesa, color = country)) + geom_line()
#ggplot(agriculture, aes(x = year, y = multilateral, color = country)) + geom_line()

# adesa mean by year - S curve
agriculture <- agriculture %>% mutate(adesa_mean = adesa)
ggplot(agriculture, aes(x = year, y = adesa_mean)) + geom_smooth()

#ggplot(agriculture, aes(x = year, y = summaidfdiie)) + geom_smooth()

#old GG plot
ggplot(data=agriculture) + geom_point(mapping = aes(x = depth, y = multilateral, color = country))

###IGNORE###
library(MCMCpack)
library(coda)
library(glmnet)

mc_adesa <- MCMClogit(depth ~ bilateral, data = agriculture)

glm(depth ~ bilateral, data = agriculture)
glm(depth ~ bilateral + multilateral + fdi_net, data = agriculture)

glm(depth ~ bilateral, data = agriculture)
ggplot(data=agriculture) + geom_point(mapping = aes(x=bilateral, y=depth))
ggplot(data=agriculture) + geom_point(mapping = aes(x=year, y=bilateral))
lm(depth ~ year, country_code==197, data=agriculture)
###IGNORE###
