setwd("/Users/syyun/r-tutorial/classes/class4")

###################################################
########## MATRIX ALGEBRA #########################
###################################################
# Create some matrices
A <- matrix(c(1, 4, 5, 6, 9, 12, 4, 1, 9),
            nrow = 3, ncol = 3, byrow = T)

# you can also create a matrix by binding together vectors
B <- cbind(c(1, 9, 2), c(2, 3, 2), c(8, 8, 0))
C <- rbind(c(8, 9, 10), c(4, 7, 9))

D <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3, byrow = T)
D <- matrix(1:9, nrow = 3, ncol = 3, byrow = T)

# Return the first row of A
A[1, ]

# Return the element in the 2nd row and third column of A
A[2, 3]

# Find the dimensions
dim(A)
dim(C)

# Create an identity matrix
id3 <- diag(3) # 3 x 3
id12 <- diag(12) # 12 x 12

## Matrix operations
# Addition and subtraction
A + B
B - A
A - B
C + B

# Multiplication by a scalar
Q <- 2*A
Z <- 0.5*C

## On your own: create a 10 x 10 matrix with 5 on the diagonal and zeros
## for all other elements, using one line of code
5*diag(10)

# Transpose
Q
t(Q)

### Matrix multiplication ###
A

B

A %*% B

A %*% C

# Does this work?
C %*% A

dim(C)

dim(A)

# What about this?
A %*% C

# Can we make it work with some function of C in front?
t(C) %*% A

# Create a vector of length 3
V <- c(7, 9, 10)
class(V)

# Try to multiply it by a 3x3 matrix. Does it work?
V %*% C
C %*% V 

# What does this tell you about how R stores vectors?

### Inverse ###
solve(A)

# Does this work?
solve(C)
solve(D)

## On your own
# Create a matrix Q that looks like this

###########
## 1 6 7 ##
## 4 9 8 ##
## 9 4 5 ##
###########







Q <- matrix(c(1, 6, 7, 4, 9, 8, 9, 4, 5),
            nrow = 3,
            ncol = 3,
            byrow = T)

# solve the following using matrix operations

# Q'Q
t(Q) %*% Q

# (Q'Q)^-1
solve(t(Q) %*% Q)

# ((Q'Q)^-1)Q'2C
solve(t(Q) %*% Q) %*% t(Q) %*% (2*C)

## Systems of equations

##########################
#### 3b_1 + 2b_2 = 15 ####
##### b_1 + 6b_2 = 10 ####
##########################
# Create a matrix to represent the values on the left side
X <- matrix(c(3, 2, 1, 6), nrow = 2, ncol = 2, byrow = T)

X

## On your own
# Create a matrix Y to represent the outcomes
Y <- matrix(c(15, 10), nrow = 2, ncol = 1)

# Solve for b
b <- solve(X)%*%Y

#####################################################
########## FUN WITH PLOTS ###########################
#####################################################

# Create some data
x <- rnorm(100)

# Plot it
plot(x)

# What do the axes represent?

# Let's make something more useful
plot(density(x),
     main = "Density of X",
     xlab = "x",
     ylab = "density",
     cex.main = 0.8)
# Now add some better labels
# Get rid of the ugly x label

# Create another variable
y <- 3*(x + rnorm(length(x), 0.01)) + rnorm(length(x), 2, 0.5)
plot(density(y), main = "Density of Y", xlab = "")

# Plot them together
res <- lm(y ~ x)$residuals # the residual is a measure of distance from the regression line

pdf("mycoolplot.pdf")
plot(x = x,
     y = y,
     main = "Plot of X and Y",
     pch = 20) 
# Add a line at zero
abline(h = 0, lty = 3)
# Add a regression line
abline(lm(y ~ x), col = "red")
# Get predicted values from the regression
# line for each value of x
pred.y <- predict(lm(y ~ x))
# Plot the segments
segments(x0 = x,
         x1 = x,
         y0 = pred.y,
         y1 = y)
dev.off()
getwd()

# Change the color for all observations that are more
# than one standard deviation from the regression line

# which of our observations satisfy these conditions?
as.numeric(which(abs(res) > sd(res)))

# Change the colors
col = ifelse(abs(res) > sd(res), "green", "black")

# On your own: save a pdf of our plot

### Plotting functions
# Write 2 functions
wageFun1 <- function(x){
  7*x 
}

wageFun2 <- function(x){
  x^3 + x^2  + x
}

# Plot a line to represent the first function
x <- seq(from = 0, to = 10, by = 0.01)
plot(x = x,
     y = wageFun1(x),
     type = "l",
     main = "RA Wages",
     ylab = "total earnings",
     xlab = "hours")

# Plot a line to represent the second function
lines(x = x, y = wageFun2(x), lty = 3)
# How could we make the line smoother?

# Add a legend to the plot
legend("bottomright",
       c("7", "3x^2 + 2x + 1"),
       lty = c(1, 3),
       cex = 0.5)

# Extras
segments(x0=2, x1=2, y0=-5, y1=40, col="red")
text(1.2, 30, labels = "Ideal Hours", col="red", cex = 0.7)

# On your own: save the plot as a pdf