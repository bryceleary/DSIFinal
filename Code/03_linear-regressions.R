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


###outputs for reference###

#bilateral  -3.912e+0 @ .8551
#multilateral -7.911e+01 @.0146
#fdi_net -3.541e-01 @.1232
#exp_value -1.204e-03 @ .0153
#imp_value -3.682e-04 @ 0.1334
