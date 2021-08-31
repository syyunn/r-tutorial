## Linter
library(lintr)

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

text(x=1976, y=0.7, labels="1983", col="red", cex=0.8)

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
points(x=mtcars$mpg[mtcars$cyl==6], y = mtcars$disp[mtcars$cyl==6], col="pink", pch=6)
points(x=mtcars$mpg[mtcars$cyl==8], y = mtcars$disp[mtcars$cyl==8], col="green", pch=8)

legend(
  "topleft", legend=c(4, 6, 8), col=c("red", "blue", "darkgreen"),
   pch=c(4, 6, 8), # no legend box lines around if "n"
   bty="n",
   inset=0.05 # indent legend box a bit into the center of the plot
)

