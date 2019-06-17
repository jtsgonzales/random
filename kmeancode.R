library(dplyr)
library(tidyr)
library(ggplot2)

set.seed(1000)

x <- rnorm(100)
y <- rnorm(100)

data <- data.frame(cbind(x, y))

getcluster <- function(k) {
  
  fit01 <- kmeans(data, 10, 100)
  cid <- fit01$cluster
  desc <- rep("coordinates", 100)
  data <- cbind(cid, data, desc)
  
  centroid <- data.frame(fit01$centers[k, ])
  colnames(centroid) <- "centroid"
  centroid <- cbind(name = rownames(centroid), centroid)
  centroid <- spread(centroid, key = name, value = centroid)
  centroid <- cbind(k, centroid, desc = "centroid")
  colnames(centroid) <- c("cid", "x", "y", "desc")

  kset <- rbind(centroid, filter(data, data$cid == k))
  print(kset)
  
  scplot <- ggplot(data = kset) + geom_point(data = kset, aes(x = x, y = y, color = as.factor(desc)), na.rm=TRUE)
  scplot  
}

#test
getcluster(5)