
library(ggplot2)

set.seed(10000)
x <- runif(100, 0, 100)
y <- rnorm(100, 50, 50)
mean <- (data$x + data$y)/2
data <- data.frame(cbind(x, y, mean))
head(data)

getrecord <- function(n){
  if (n>100) {
    stop("Value of n can only be whole integers between 1 and 100.")
  } else if (n<1) {
    stop("Value of n can only be whole integers between 1 and 100.")
  } else {
  data[n, ]
  }
}

figure <- ggplot(data = data, aes(x = x, y = y, color = mean)) + geom_point(data = data, na.rm = TRUE)
figure <- figure + ggtitle("                                              Random Numbers Scatter Plot")