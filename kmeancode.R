
library(ggplot2)

set.seed(10000)
x <- runif(100, 0, 100)
y <- rnorm(100, 50, 50)
mean <- (data$x + data$y)/2
data <- data.frame(cbind(x, y, mean))
head(data)

getrecord <- function(k){
  if (k>100) {
    stop("Value of k can only be whole integers between 1 and 100.")
  } else if (k<1) {
    stop("Value of k can only be whole integers between 1 and 100.")
  } else if (is.numeric(k) == FALSE) {
    stop("Value of k can only be whole integers between 1 and 100.")
  } else { 
  data[k, ]
  }
}

figure <- ggplot(data = data, aes(x = x, y = y, color = mean)) + geom_point(data = data, na.rm = TRUE)
figure <- figure + ggtitle("                                              Random Numbers Scatter Plot")