library(dendextend)

#Set up dataset for clustering
agcluster <- select(agriculture, -private, -t_fdi_in, -t_fdi_out, -fdi_net, -exp_value, -imp_value, -trade_net, -country_code, -year_spread)
agcluster <- na.omit(agcluster)
agcluster$adesa <- as.numeric(as.character(agcluster$adesa))
agcluster <- agcluster %>% mutate_at(c(3,4,5,6), funs(c(scale(.))))

#Create yearly interval cluster datasets
agcluster2000 <- agcluster %>% filter(year==2000)
agcluster2005 <- agcluster %>% filter(year==2005)
agcluster2010 <- agcluster %>% filter(year==2010)
agcluster2015 <- agcluster %>% filter(year==2015)

#Plot dendrograms
clust2000 <- dist(agcluster2000, method = "euclidian")
den2000 <- hclust(clust2000, method = "complete")
plot(den2000, labels = c("Burkina Faso", "Ghana", "Guinea", "Mali", "Mauritania", 
                         "Niger",  "Senegal", "Sierra Leone"), main = "Clusters in 2000")

clust2005 <- dist(agcluster2005, method = "euclidian")
den2005 <- hclust(clust2005, method = "complete")
plot(den2005, labels = c("Burkina Faso", "CÃ´te d'Ivoire", "Ghana", "Guinea-Bissau", 
                         "Guinea", "Liberia", "Mali", "Mauritania", 
                         "Niger",  "Nigeria",  "Senegal", "Sierra Leone", "Togo"), main = "Clusters in 2005")

clust2010 <- dist(agcluster2010, method = "euclidian")
den2010 <- hclust(clust2010, method = "complete")
plot(den2010, labels = c("Benin", "Burkina Faso", "CÃ´te d'Ivoire", "Ghana", "Guinea-Bissau", 
                         "Guinea", "Liberia", "Mali", "Mauritania", 
                         "Niger",  "Nigeria",  "Senegal", "Sierra Leone", "Togo"), main = "Clusters in 2010")

clust2015 <- dist(agcluster2015, method = "euclidian")
den2015 <- hclust(clust2015, method = "complete")
plot(den2015, labels = c("Benin", "Burkina Faso", "CÃ´te d'Ivoire", "Ghana", "Guinea-Bissau", 
                         "Guinea", "Liberia", "Mali", "Mauritania", 
                         "Niger",  "Nigeria",  "Senegal", "Sierra Leone", "Togo"), "Clusters in 2015")
