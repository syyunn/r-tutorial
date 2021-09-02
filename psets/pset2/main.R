# Pset2: R Problems
rm(list=ls())
setwd("/Users/syyun/r-tutorial/psets/pset2")
library(ggplot2)

# 1. Using any of the datsets we used in class and in Pset 1 and either basic plot or ggplot
## 1-1. Make one graph with a single variable.
ad <- read.csv('./antidumping.csv')
ad_kr <- ad[ad$Country == "Korea, Rep.", ]
ggplot(data=ad_kr, aes(AD)) + ggtitle("Per-Year Count of Korea's Antidumping Measures") + geom_bar(fill = "#0073C2FF") + xlab("Korea's Count of Antidumping Measures") + ylab("Frequency (Number of Years)") + theme(plot.title = element_text(hjust = 0.5))
# This plot shows shows the distribution of frequency of per-year count of Korea's antidumping measures. For example, there're 2 years of 0 antidumping cases for Korea.

## 1-2. Make one graph with two variables. What does this graph show you?
ad_2014 <- ad[ad$Year == 2014, ]
ggplot(data=ad_2014, aes(x=gdp, y=AD)) + geom_smooth() + ylab("Count of Antidumping Measures") + ggtitle("GDP & Antidumping Measures") + theme(plot.title = element_text(hjust = 0.5))
# This plot shows the correlation between gdp and antidumping measures of all countries in 2014.

## 1-3. Extra Credit: Make a graph in which you show three variables.
ad_trio <- ad[ad$Country %in% c("Korea, Rep." , "Mexico" , "United States"), ]
ggplot(data=ad_trio, aes(x=gdp, y=AD, col=as.factor(Country))) + geom_smooth() + ylab("Count of Antidumping Measures") + labs(col="Country")
# this plot shows the correlation between gdp and antidumping measures for three selected countries - Korea, Mexico, and United States.

# 2. Reproduce the following graphs. Please submit both your code and resulting graphs.
# 2-1. Motor Cars
data(mtcars)
ggplot(data=mtcars, aes(x=as.factor(cyl), y=disp)) + geom_boxplot(linetype = "dashed", outlier.fill=1) + xlab("Number of Cylinders") + ylab("Displacement") + ylim(0, 400) +
  stat_boxplot(aes(ymin = ..lower.., ymax = ..upper..), outlier.shape = 1) +
  stat_boxplot(geom = "errorbar", aes(ymin = ..ymax..)) +
  stat_boxplot(geom = "errorbar", aes(ymax = ..ymin..))

# 2-2. Democracy Level
VDemRed <- read.csv("./V-Dem-Red.csv")
VDemRed_Argen <-VDemRed[VDemRed$country_name == "Argentina",]
VDemRed_Brazil <-VDemRed[VDemRed$country_name == "Brazil",]
plot(
  VDemRed_Argen$year,
  VDemRed_Argen$v2x_polyarchy,
  type="l",
  xlab="Year",
  ylab="Polyarchy",
  ylim = c(0,1),
  main="Democracy Level",
  col='red'
  # xlim = c(0,2000),
)
par(new=TRUE)
plot(
  VDemRed_Brazil$year,
  VDemRed_Brazil$v2x_polyarchy,
  type="l",
  xlab="Year",
  ylab="Polyarchy",
  ylim = c(0,1),
  main="Democracy Level",
  col='blue'
  # xlim = c(0,2000),
)
legend(
  "topleft", legend=c("Argentina", "Brazil"), col=c("red", "blue"),
   pch=16, # no legend box lines around if "n"
   bty="n",
   inset=0.05, # indent legend box a bit into the center of the plot
)
