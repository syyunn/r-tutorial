#### Math Camp 2020

### Pset 1

# Your name here: Suyeol Yun

# What should you do before you start working on R?
## Step 1. Set/Check working directory using setwd()/getwd() resp.
## Step 2. Clear out previous in-memory variables using rm(list=ls())
rm(list=ls())
## Step 3. Install all packages you need
library(testthat)


## Functions

# Increasing the maximum. Let's go against our wishes and increase inequeality.
# Create a function that will select the biggest value from a vector and add a number to it.

imax <- function(v, n) {
  return(tail(sort(v), 1) + n)
}

## unit-testing with n=1 case: expects 5
expect_equal(imax(c(2,1,4,3), 1), 5)

# Set the default value for that number to be equal to 2
imax_default_num <- function(v, n=2) {
  return(tail(sort(v), 1) + n)
}

## unit-testing for default n=2 case: expects 6
expect_equal(imax_default_num(c(2,1,4,3)), 6)


# Try it with the following vector
vector1<- c(1:11) # c can be omitted, i.e., vector1 <- 1:11
expect_equal(imax(vector1, n=2), 13)


############
## Working with datasets

# Install and open the packages that you will need
## install.packages("utils") is base package -- so don't need to install ;>
## there's no other packages I will use in the pset

# Get your data: load the dataset "antidumping.csv" using read.csv()
ad <- read.csv('antidumping.csv', row.names=1) # row.names=1 uses the first column as index column

# What kind of object is your dataset?
class(ad) # which prints "data.frame"

# Get a sense of the data by checking the names of each of the variables,
# looking at the dimensions, and
names(ad) # for name of each variable, "X", "Country",
dim(ad) # for [row, col] nums, which returns 3140 22

# What are the dimensions of the data?
# 3140   23

# Take a look at the first lines
head(ad, n=5) # let's see first 5 lines

# How many unique countries in this dataset
uniq_cnty_num <- length(unique(ad$Country)) # which returns 157

# Make a subset of data for all observations for Mexico
mexico <- ad[ad$Country == "Mexico", ]

# What is the max number of antidumping cases that Mexico has recorded in this data?
max_ad_num_mexico <- max(mexico$AD) # which returns 14

# In what year(s) did Mexico have this max value of antidumping cases? Select the rows
# of this subset of data
max_ad_years_mexico <- mexico$Year[mexico$AD == max_ad_num_mexico]

# What is the average gdp per capita that Mexico recorded during this period?
mexico_gdppc_max_ad_years <- mean(mexico$gdppc[mexico$Year %in% max_ad_years_mexico])

# Order the mexican data by the value of their GDP per capita, but make it decreasing
gdppc_mexico_desc <- mexico[order(mexico$gdppc, decreasing=TRUE), ]