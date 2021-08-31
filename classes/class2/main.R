## Linter
## library(lintr)

## Setting Environment
wd <- "/Users/syyun/r-tutorial/classes/class2"
setwd(wd)
getwd()

# Load Data
data(mtcars)
VDemRed <- read.csv("V-Dem-Red.csv")

## Basic Plot (flexible!)
?plot
plot(mtcars$mpg, mtcars$disp, type="p") # point-plot
plot(mtcars$mpg, mtcars$disp, type="l") # line-plot

### Time-series

plot(
  VDemRed$year[VDemRed$country_id == 37],
  VDemRed$v2x_polyarchy[VDemRed$country_id==37],
  type="l"
)

abline(v=1983, lwd=10, color="red") # lwd refer to line-width
abline(h=0.5, lty=10) # lwd refer to line-width

text(x=1976, y=0.7, labels="1983", col="red",
     cex=0.8 # controls te size of the text
)

plot(
  VDemRed$year[VDemRed$country_id == 37],
  VDemRed$v2x_polyarchy[VDemRed$country_id==37],
  type="p"
)

### Title
plot(
  x=mtcars$mpg, y = mtcars$disp, type="p",
  xlab="Consumption",
  ylab="Displacement",
  main="MTCARS", # title for the plot
  sub="Displacement by Consumption" # sub-title
)


# Limits: Set the range of X, Y axis
plot(
  x=mtcars$mpg, y = mtcars$disp, type="p",
  xlab="Consumption",
  ylab="Displacement",
  main="MTCARS", # title for the plot
  sub="Displacement by Consumption", # sub-title
  ylim = c(0,500),
  xlim = c(0,35),
  col="red", # rainbow(10) -- way more colorful~
  pch=10 # refer to website for what symbol each integer match to
)

# Legends (by Cylinder)
plot(
  x=mtcars$mpg[mtcars$cyl==4], y = mtcars$disp[mtcars$cyl==4], type="p",
  xlab="Consumption",
  ylab="Displacement",
  main="MTCARS", # title for the plot
  sub="Displacement by Consumption", # sub-title
  ylim = c(0,500),
  xlim = c(0,35),
  col="red", # rainbow(10) -- way more colorful~
  pch=10 # refer to http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r for what symbol each integer match to
)

#### add points to the current plot
points(x=mtcars$mpg[mtcars$cyl==6], y = mtcars$disp[mtcars$cyl==6], col="blue", pch=6)
points(x=mtcars$mpg[mtcars$cyl==8], y = mtcars$disp[mtcars$cyl==8], col="darkgreen", pch=8)

legend(
  "topleft", legend=c(4, 6, 8), col=c("red", "blue", "darkgreen"),
   pch=c(4, 6, 8), # no legend box lines around if "n"
   bty="n",
   inset=0.05, # indent legend box a bit into the center of the plot
   title="Cyliner"
)

# Multiple Plots
data(mtcars)
par(mfrow = c(2,2)) # first create coordinate-wise location

cyls = c(4, 6, 8, 10)
cols = c("red", "blue", "green", "black")

myenv <- new.env()
zip_df <- data.frame(cylinder=cyls, colors = cols, stringsAsFactors=F)


for (i in 1:nrow(zip_df)){

  myenv[[zip_df[i, 'cylinder']]] <- zip_df[i, 'colors']
  plot(
  x=mtcars$mpg[mtcars$cyl==item[i]], y = mtcars$disp[mtcars$cyl==item[1]], type="p",
  xlab="Consumption",
  ylab="Displacement",
  main="MTCARS", # title for the plot
  ylim = c(0,500),
  xlim = c(0,35),
  col=item[2], # rainbow(10) -- way more colorful~
  pch=16, # refer to http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r for what symbol each integer match t
)
}

graphics.off()


## Histogram

hist(mtcars$disp)
hist(mtcars$disp, breaks=15)

hist(mtcars$disp, main="Displacement", col="red")
abline(v=300)

boxplot(
  mtcars$disp~mtcars$cyl,
  main = "Displacement of Cars by Cylinders",
  xlab = "Cylinders",
  ylab = "Displacement"
)

# other stuff

abline()
lines()
segments()

# GGPLOTs
# install.packages("ggplot2")
library(ggplot2)

ggplot(data=mtcars, aes(x=mpg, y=disp)) + geom_point() # layers
?geom_point # geometric point it refers to

ggplot(data=mtcars, aes(x=mpg, y=disp, col=hp)) + geom_point()

ggplot(data=mtcars, aes(x=mpg, y=disp, col=as.factor(cyl))) + geom_point() # discrete version of color histogram
ggplot(data=mtcars, aes(x=mpg, y=disp, col=cyl)) + geom_point() # continuous version of color histogram
ggplot(data=mtcars, aes(x=mpg, y=disp, size=hp, col=as.factor(cyl))) + geom_point()


ggplot(data=mtcars, aes(x=mpg, y=disp, col=hp)) + geom_point() + geom_smooth()

ggplot(data=mtcars, aes(x=mpg, y=disp, col=hp)) + geom_point() + geom_smooth(method = lm, se=TRUE)

ggplot(data=mtcars, aes(x=mpg, y=disp, col=as.factor(cyl))) + geom_point() + geom_smooth(method = lm, se=FALSE)

ggplot(data=mtcars, aes(x=mpg, y=disp, col=as.factor(cyl))) + geom_point() + geom_smooth(method = lm, se=FALSE) + facet_wrap(~cyl)

ggplot(data=mtcars, aes(x=mpg, y=disp, col=as.factor(cyl))) + geom_point() +  ggtitle("MTCARS") + xlab("Consumption") + ylab("Displacement")

plot <- ggplot(data=mtcars, aes(x=mpg, y=disp, col=as.factor(cyl))) + geom_point() +  ggtitle("MTCARS") + xlab("Consumption") + ylab("Displacement") + xlim(0, 35) + ylim(0, 500)

plot1 <- plot + labs(col="Cyl")

plot_white <- plot + theme_minimal() # white backgorund plot

install.packages("ggthemes")

library(ggthemes)

plot1 + theme_economist() + scale_colour_economist()

ggplot(data=mtcars, aes(x=disp)) + geom_histogram(binwidth=40)

ggplot(data=mtcars, aes(x=disp)) + geom_density()

data(mtcars)
ggplot(data=mtcars, aes(x=as.factor(cyl), y=disp)) + geom_boxplot() + xlab("Cylinder") + ylab("Displacement")

