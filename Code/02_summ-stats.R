
#Summary for depth
summ_depth <- group_by(country_code, year) %>% 
  summarize("mean" = mean(depth, na.rm = TRUE), 
            "range" = diff(range(depth, na.rm = TRUE), 
            "median" = median(depth, na.rm = TRUE), 
            "sd" = sd(depth, na.rm = TRUE), 
            "25th" = quantile(depth, 0.25, na.rm = TRUE), 
            "75th" = quantile(depth, 0.75, na.rm = TRUE), 
            "IQR" = IQR(depth, na.rm = TRUE)))

#Summary for adesa
summ_adesa <- group_by(country_code, year) %>% 
  summarize("mean" = mean(adesa, na.rm = TRUE), 
            "range" = diff(range(adesa, na.rm = TRUE), 
            "median" = median(adesa, na.rm = TRUE), 
            "sd" = sd(adesa, na.rm = TRUE), 
            "25th" = quantile(adesa, 0.25, na.rm = TRUE), 
            "75th" = quantile(adesa, 0.75, na.rm = TRUE), 
            "IQR" = IQR(adesa, na.rm = TRUE)))

#Summary for fdi_net
summ_fdi <- group_by(country_code, year) %>% 
  summarize("mean" = mean(fdi_net, na.rm = TRUE), 
            "range" = diff(range(fdi_net, na.rm = TRUE), 
            "median" = median(fdi_net, na.rm = TRUE), 
            "sd" = sd(fdi_net, na.rm = TRUE), 
            "25th" = quantile(fdi_net, 0.25, na.rm = TRUE), 
            "75th" = quantile(fdi_net, 0.75, na.rm = TRUE), 
            "IQR" = IQR(fdi_net, na.rm = TRUE)))

#Summary for fdi_net
summ_fdi <- group_by(country_code, year) %>% 
  summarize("mean" = mean(fdi_net, na.rm = TRUE), 
            "range" = diff(range(fdi_net, na.rm = TRUE), 
                           "median" = median(fdi_net, na.rm = TRUE), 
                           "sd" = sd(fdi_net, na.rm = TRUE), 
                           "25th" = quantile(fdi_net, 0.25, na.rm = TRUE), 
                           "75th" = quantile(fdi_net, 0.75, na.rm = TRUE), 
                           "IQR" = IQR(fdi_net, na.rm = TRUE)))
