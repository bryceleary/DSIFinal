library(tidyverse)

###GGPlots###

#Plot of ADESA by country over year
ggplot(agriculture, aes(x = year, y = adesa, color = country)) + geom_line()

#Plot of depth by country over year 
ggplot(agriculture, aes(x = year, y = depth, color = country)) + geom_line()


###MCMC/Bayes linear regression###
mc_depth_full <- MCMCregress(depth ~ bilateral + multilateral + exp_value + imp_value, data = agriculture)
summary(mc_depth_full)


###Basic linear regression###
summaidfdiie <- lm(cbind(depth,adesa) ~ bilateral + multilateral + fdi_net + exp_value + imp_value, data = agriculture)
summary(summaidfdiie)


###Plots of Multivariate Regression###

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


###Linear regression outputs for reference###

#bilateral  -3.912e+0 @ .8551
#multilateral -7.911e+01 @.0146
#fdi_net -3.541e-01 @.1232
#exp_value -1.204e-03 @ .0153
#imp_value -3.682e-04 @ 0.1334


