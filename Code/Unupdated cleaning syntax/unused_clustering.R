

ggplot(agcluster2000) + geom_point(mapping = aes(x=bilateral, y=depth))
ggplot(agcluster2000) + geom_point(mapping = aes(x=bilateral, y=adesa))
ggplot(agcluster2005) + geom_point(mapping = aes(x=multilateral, y=depth))
ggplot(agcluster2005) + geom_point(mapping = aes(x=multilateral, y=adesa))



kcluster <- select(agriculture, -private, -t_fdi_in, -t_fdi_out, -fdi_net, -exp_value, -imp_value, -trade_net, -country_code, -year_spread)
kcluster <- na.omit(agcluster)
kcluster$adesa <- as.numeric(as.character(kcluster$adesa))
kcluster <- agcluster %>% mutate_at(c(3,4,5,6), funs(c(scale(.))))
kcluster2000 <- kcluster %>% filter(year==2000)
kcluster2005 <- kcluster %>% filter(year==2005)
kcluster2010 <- kcluster %>% filter(year==2010)
kcluster2015 <- kcluster %>% filter(year==2015)


ggplot(kcluster2000) + geom_point(mapping = aes(x=bilateral, y=depth, color = kcluster2000$country, size=adesa))
ggplot(kcluster2000) + geom_point(mapping = aes(x=multilateral, y=depth, color = kcluster2000$country, size=adesa))
ggplot(kcluster2000) + geom_point(mapping = aes(x=bilateral, y=adesa, color = kcluster2000$country))
ggplot(kcluster2000) + geom_point(mapping = aes(x=multilateral, y=adesa, color = kcluster2000$country))

ggplot(kcluster2005) + geom_point(mapping = aes(x=bilateral, y=depth, color = kcluster2005$country))
ggplot(kcluster2005) + geom_point(mapping = aes(x=multilateral, y=depth, color = kcluster2005$country))
ggplot(kcluster2005) + geom_point(mapping = aes(x=bilateral, y=adesa, color = kcluster2005$country))
ggplot(kcluster2005) + geom_point(mapping = aes(x=multilateral, y=adesa, color = kcluster2005$country))
