# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVApcp6
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Computes boxplots for variables 
# headroom, rear seat clearance and trunk space of the car data set.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : pcp, parallel-coordinates-plot, boxplot, financial, 
# data visualization, plot, graphical representation
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVApcphousing, MVApcp1, MVApcp2, MVApcp3, 
# MVApcp4, MVApcp5, MVApcp7, MVApcp8
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Ji Cao, Song Song, Vladimir Georgescu, Awdesch Melzer
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Tue, September 09 2014 by Awdesch Melze
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : carc.txt
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("carc.txt")
frame = data.frame(x[, 5:7])
colnames(frame) = c("headroom", "rear seat", "trunk space")

m1 = mean(frame[, 1])
m2 = mean(frame[, 2])
m3 = mean(frame[, 3])

# Plot
boxplot(frame, lwd = 1)
title("Boxplot (Car Data)")
lines(c(0.6, 1.4), c(m1, m1), lty = "dotted", lwd = 1.5, col = "red3")
lines(c(1.6, 2.4), c(m2, m2), lty = "dotted", lwd = 1.5, col = "red3")
lines(c(2.6, 3.4), c(m3, m3), lty = "dotted", lwd = 1.5, col = "red3") 
