# Functions

# Module function
module <- function(x){
  sqrt(x^2)
}

# Or also:
module2 <- function(x){
  if(x < 0){-x}
  else{x}
}

# remainder operation
5 %% 3

# Function to check if number is odd
even_or_odd <- function(x){
  ifelse(x %% 2 == 0, "Even", "Odd")
}

even_or_odd(5.5)

# Function to take factorial
factorial <- function(x){
  result <- c()
  fact <- 1
  for(i in 1:x){
    fact <- fact * i
    result[i] <- fact
  }
  result[x]
}

factorial(5)

# Weird looking function
# Note that I am loading it here but the stylish way to do this in R is to load
# the packages you will use first, it's easier for replicability 

require(ggplot2)
sin_exp <- function(x){
  sin(exp(x))
}

ggplot(data.frame(x = c(-10, 10)), aes(x)) + 
  stat_function(fun = sin_exp)+
  theme_classic()

# Let's write a function for the circle
circle <- function(R){
  x <- seq(-R, R, by = 0.001)
  y1 <- sqrt(R^2 - x^2)
  y2 <- -y1
  par(mar = c(5, 13, 4, 13))
  plot(x, y1, ylim = c(-R, R), xlim = c(-R, R), type = "l")
  lines(x, y2)
}

circle(10)

# Fibonacci Loop
#### Let's build the Fibonacci Sequence in two different ways
##set number of iterations
n <- 6

##initialize a and b 
a <- 1
b <- 1

##create the loop:
##first say we want to iterate from 1 to n 
for (i in 1:n){
  if (a <= b) {## set if condition 
  print(a <- a + b) ##command for if the condition above holds
  }
  else {print(b <- a + b) ## if the condition above doesn't hold, do this command 
  }
}

#### But there are lots of ways to do the exact same R 
#### First, let's try to add the one line if else statement 
a <- 1
b <- 1 
for (i in 1:n){
  ifelse(a <= b, print(a <- a + b), print(b <- a + b))
}

#### The loop above is just more elegant - we did all that in only a couple of lines! 
#### but you might have a classmate who does this loop completely differently 
#### recalling that the Fibonacci Sequence is just adding the previous two terms...
#### we could write a loop that gets closer to this actual algorithm 

#### first, lets sketch out the loop we need to make 
############ LOOP SKETCH! 

#### Start with the concept
## first, start with a and b equal to one
## to get element i, add the two previous elements (element_i-1 and element_i-2)

#### Now translate that idea into R language
## we want to create a vector where we add two elements to get the next one...
## since we need to be able to refer to the previous elements, we want to use a vector
## as opposed to the last loop, where we started with two elements and updated their value

## create an empty vector 
## we will fill this empty vector one element at a time in our loop
## the number of times we go through the loop will end up being the length of the vector 

fibonacci <- c()

## set number of iterations; we will end up with a vector called fibonacci that is 
n <- 6

for (i in 1:n){
  ifelse(i <= 2,fibonacci[i] <- 1, fibonacci[i] <- fibonacci[i - 1] + fibonacci[i - 2])
}
print(fibonacci)


########### Now that we know how to do loops, we can try to simulate a probability problem
########### simualtions are useful when problems are hard analytically! 

########### First, we'll do a very easy coin flip problem
sims <- 10000
heads <- c()

set.seed(124)

for (i in 1:sims){
  heads[i]<- sample(c("Head", "Tails"), 1)
}
sum(heads == "Head")/length(heads)

########### Lets play the roulette 1000 times, always betting for the number 7

results <- c()

roulette <- c(1:36)

for(i in 1:1000){
  result <- sample(roulette, 1)
  ifelse(result == 7, results[i] <- "win", results[i] <- "loose")
}

sum(results == "win")/1000

# Different ways to loop: sometimes we want iterations to keep running until
# some condition is met

# For example, stop the loop if the iteration number is 15, we can use the "break"
# command, or keep printing otherwhise
x <- 1 : 100
for (i in x) {
  if (i == 15){
    break
  }
  print(i)
}


## And we could achieve something similar using the while command
x <- c(0)
while(x < 100){
  x <- x + 1
  print(x)
}

## We can use while to solve an optimization problem. 

## Suppose we have found that the derivative of a function f'(x) = 5x^3 - 2 and we want to
## find the value of x that gives us the critical point for that function

## Analytically this is dumb but we will have harder problems in the quant sequence

## We can make while search for the value we want
x <- 0
y <- 1

while(module(y) > 0.01){
  x <- runif(1, min = -10, max = 10)
  y <- 5*(x)^3 - 2
  if(module(y) <= 0.01){
    print(x)}
}
(2/5)^(1/3)


## Nested loop

## Suppose we have a vector of 100 elements and another vector of 10 elements
## and we want to multiply each of the 100 elements by the 10 elements

# 100 random values:
x_i <- runif(100, 0, 1)
y_j <- 1:10

# Fill a matrix with that dimensions (we will replace the values)
product <- matrix(NA, nrow = 100, ncol = 10)

# Loop through i first and j second
for(i in 1:length(x_i)){
  for(j in 1:length(y_j))
  {
    product[i,j] <- x_i[i]*y_j[j]
  }
}
head(product)

########## Next, we'll try the monster game from our friends at 538 
########## link to problem: http://fivethirtyeight.com/features/can-you-slay-the-puzzle-of-the-monsters-gems/

#### basic idea: slay a monster, it lays a gem. 
###### gem is either common, uncommon, or rare, with ratio 3:2:1
###### how many common gems will you have by the time you have one of each type?

gems <- c("common", "uncommon", "rare") ##create a vector of gems 
gem_probabilities <- c(1/2, 1/3, 1/6)

##set number of iterations/trials
R <- 100

commons = numeric(R)
uncommons = numeric(R)
rares = numeric(R)
ttl = numeric(R)
pct_common = numeric(R)

for (j in 1:R) {
  common_cnt <- 0
  uncommon_cnt <- 0
  rare_cnt <- 0
  while (common_cnt < 1 || uncommon_cnt < 1 || rare_cnt < 1) {
    a <- sample(gems,1, prob = gem_probabilities)
    if (a == "common") {
      common_cnt = common_cnt + 1
    } else if (a == "uncommon") {
      uncommon_cnt = uncommon_cnt + 1
    } else if (a == "rare") {
      rare_cnt = rare_cnt + 1
    }
  }
  commons[j] <- common_cnt
  uncommons[j] <- uncommon_cnt
  rares[j] <- rare_cnt
  ttl[j] <- common_cnt + uncommon_cnt + rare_cnt
  pct_common[j] <- common_cnt / (common_cnt + uncommon_cnt + rare_cnt)
}
hist(commons)
hist(ttl)
