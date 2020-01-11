
library(tidyverse)

agcluster <- select(agriculture, -private, -t_fdi_in, -t_fdi_out, -fdi_net, -exp_value, -imp_value, -trade_net, -country_code, -year_spread)
agcluster <- na.omit(agcluster)
agcluster$adesa <- as.numeric(as.character(agcluster$adesa))
agcluster <- agcluster %>% mutate_at(c(2,3,4,5), funs(c(scale(.))))
agcluster2000 <- agcluster %>% filter(year==2000)

d <- dist(agcluster2000, method = "euclidian")
hc1 <- hclust(d, method = "complete")
plot(hc1)

agcluster2005 <- agcluster %>% filter(year==2005)

d <- dist(agcluster2005, method = "euclidian")
hc1 <- hclust(d, method = "complete")
plot(hc1)
