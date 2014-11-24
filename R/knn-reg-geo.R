# Import sources
source("knn.dist.R")
source("knn.predict.R")
source("classprob.R")
source("knn.probability.R")
source("majority.R")

# Geosphere distance package
install.packages("geosphere")
library(geosphere)

# Coordinates of both training and testing data
A <- c(0, 0)
B <- c(3, 1)
C <- c(2, 4)
D <- c(0, 4)
E <- c(3, 0)
data <- rbind(A, B, C, D, E)

colnames(data) <- c("lon", "lat")

# Training and testing indexes
train <- c(1, 2, 3)
test <- c(4, 5)

# Values
y <- c(7, 8, 11, 0, 0)

# Geo distance matrix
kdist <- apply(data, MARGIN=1, FUN= function(x) apply(data, MARGIN=1, FUN= function(y) distHaversine(x, y)))

# Predict (agg.meth="mean" for knn regression)
pred <- knn.predict(train, test, y, dist.matrix=kdist, k=2, agg.meth="mean")
pred
