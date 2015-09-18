# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVACARTTwoingTree1
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Performs classification analysis for the 
# US bankruptcy data (CF SEC 2004; bankruptcy.dat) 
# with 84 companies employing the Twoing rule. 
# It plots a decision tree.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : plot, multivariate, classification, analysis,
# financial, decision tree
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAppsib, ppsib, ppsibexample
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Awdesch Melzer
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Wed, April 25 2012 by Dedy Dwi Prastyo
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : bankruptcy.dat
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Example : Shows the classification tree resulting from
# the classification analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load library
install.packages("rpart")
library(rpart)
install.packages("rpartScore")
library(rpartScore)

# load data
x   = read.table("bankruptcy.dat")
xx  = data.frame(x)

# set the controls
my.control = rpart.control(minsplit = 1, usesurrogate = 2, minbucket = 1, 
  maxdepth = 30, surrogatestyle = 1, cp = 0)

# create classification tree with twoing rule
t2 = rpartScore(V3 ~ V1 + V2, xx, split = "abs", prune = "mr", control = my.control)

# plot classification tree
plot(t2)
text(t2, cex = 0.5) 
