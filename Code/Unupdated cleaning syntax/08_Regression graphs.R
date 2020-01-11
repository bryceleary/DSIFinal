#Multilateral on ADESA
ma <- ggplot(agriculture, aes(x = multilateral, y = adesa)) + geom_point( aes(color = country)) + geom_smooth(method = "lm")
ma + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Multilateral Flow Value on ADESA", 
       subtitle = "Average Dietary Energy Supply Adequacy (Percentage)",
       x = "Multilateral Flow (Millions in USD)", y = "Average Dietary Energy Supply")

#Multilateral on Depth
md <- ggplot(agriculture, aes(x = multilateral, y = depth)) + geom_point (aes(color = country)) + geom_smooth(method = "lm")
md + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Multilateral Donor Flow on Depth", 
       x = "Multilateral Flow (Millions in USD)", y = "Food Deficit (kCal/person/day)")

#Export Value on ADESA
ea <- ggplot(agriculture, aes(x = exp_value, y = adesa)) + geom_point (aes(color = country)) + geom_smooth(method = "lm")
ea + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Export Value on ADESA", 
       subtitle = "Average Dietary Energy Supply Adequacy (Percentage)",
       x = "Export Value (Millions in USD)", y = "Average Dietary Energy Supply")

#Export Value on Depth
ed <- ggplot(agriculture, aes(x = exp_value, y = depth)) + geom_point (aes(color = country)) + geom_smooth(method = "lm")
ed + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Regression of Export Value on Depth", 
       x = "Export Value (Millions in USD)", y = "Food Deficit (kCal/person/day)")