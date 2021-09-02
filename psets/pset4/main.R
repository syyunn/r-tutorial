# pset4: Linear Algebra

# 1. Using R's matrix operators, solve the following system of equations:

## I will represent the given system as AX = b, then solve as X = A'b
rm(list=ls())
A <- rbind(c(3, 5, 2, 1), c(5, 5, 3, 3), c(9, -1, 0, 2), c(2, 2, -5, -4))
b <- rbind(1, -1, 3, 4)

X <- solve(A) %*% b # X will be the answer for a, b, c, d for each element in order.

# 2. Now let's practice using matrix algera to calculate OLS coefficients. Suppose that we have a dependent varialbe y and two indepdendent variables X1 and X2.
# For simplicity we assume that the true conditional expectation function has no intercept and can be written as y_i = \beta_1*X1_i + \beta_2*X_2_i + u_i or as y = X\beta + u where beta = [\beta1, \beta2]
# ...
rm(list=ls())
X <- cbind(c(4, 6, 9), c(-3, -2, -15))
y <- rbind(0, -5.5, 8)

beta_estimate <- solve(t(X)%*%X)%*%t(X)%*%y

df <- data.frame(y = y, x1 = c(4, 6, 9), x2 = c(-3, -2, -15))
lm_result <- lm(y ~ x1 + x2 + 0, data = df) # add +0 to exclude intercept.

#3.
rm(list=ls())
set.seed(02139)
x1is <- runif(1000, min = 0, max = 1)
x2is <- runif(1000, min = 0, max = 1)
intercept <- rep(1, 1000) # add repetitive 1 term for intercept being also estimated. it's like contant"s scaler.
es <- rnorm(1000, mean = 0, sd = 1)

X <- cbind(x1is, x2is, intercept)
y <- 3 + 2*matrix(x1is) - 4*matrix(x2is) + es # this is true value

beta_estimate <- solve(t(X)%*%X)%*%t(X)%*%y #result: x1is   2.06584     x2i  -3.94824    intercept	2.97004

df <- data.frame(y = y, x1 = x1is, x2 = x2is)
lm_result <- lm(y ~ x1 + x2, data = df) #result: intercept  2.970039    x1   2.065839    x2  -3.948238

