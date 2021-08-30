#### Math Camp 2020

### Pset 1

# Your name here: Suyeol Yun

# What should you do before you start working on R?
# 1. Set working directory using setwd() or check it using getwd()
# 2. Clear out previous memory variables using rm()

## Functions

# Increasing the maximum. Let's go against our wishes and increase inequeality.
# Create a function that will select the biggest value from a vector and add a number to it.

imax <- function(v, n) {
  return(tail(sort(v), 1) + n)
}

## unit-testing
imax(c(1,2,3,4), 1)

# Set the default value for that number to be equal to 2
imax_default <- function(v, n=2) {
  return(tail(sort(v), 1) + n)
}

## unit-testing
imax_default(c(1,2,3,4))


# Try it with the following vector
vector1<- c(1:11)
imax(vector1, n=1)
imax_default(vector1)


############
## Working with datasets

# Install and open the packages that you will need
## install.packages("utils") -- base package

# Get your data: load the dataset "antidumping.csv" using read.csv()
ad <- read.csv('./antidumping.csv')

# What kind of object is your dataset?
class(ad) # which prints class

# Get a sense of the data by checking the names of each of the variables,
# looking at the dimensions, and
names(ad) # for name of each variable
dim(ad) # for [row, col] nums

# What are the dimensions of the data?
# 3140   23

# Take a look at the first lines
head(ad, n=1)

# How many unique countries in this dataset
uniq_cnty_num <- length(unique(ad$Country)) # which returns 157

# Make a subset of data for all observations for Mexico
mexico <- ad[ad$Country == "Mexico", ]

# What is the max number of antidumping cases that Mexico has recorded in this data?
max_ad_num_mexico <- max(mexico$AD)

# In what year(s) did Mexico have this max value of antidumping cases? Select the rows
# of this subset of data
max_ad_years_mexico <- mexico$Year[mexico$AD == max(mexico$AD)]

# What is the average gdp per capita that Mexico recorded during this period?
mexico_gdppc_max_ad_years <- mean(mexico$gdppc[mexico$Year %in% max_ad_years_mexico])

# Order the mexican data by the value of their GDP per capita, but make it decreasing
gdppc_mexico_desc <- mexico[order(mexico$gdppc, decreasing=TRUE), ]