
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAscabank56** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAscabank56

Published in : Applied Multivariate Statistical Analysis

Description : 'Computes a two dimensional scatterplot of
X5 vs. X6 (upper inner frame vs. diagonal) of the Swiss
bank notes.'

Keywords :
- data visualization
- graphical representation
- scatterplot
- plot
- financial

See also :
- MVAcorrnorm
- MVAregbank
- MVAregpull
- MVAscabank45
- MVAscabank456
- MVAscacar
- MVAscapull1
- MVAscapull2
- MVAdraftbank4
- MVAdrafthousing
- MVAdrafthousingt

Author :
- Vladimir Georgescu
- Jorge Patron
- Song Song

Submitted : Tue, September 09 2014 by Awdesch Melzer

Datafile : bank2.dat
```

![Picture1](MVAscabank56_1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x   = read.table("bank2.dat")
x56 = x[, 5:6]
x1  = rep(1, 100)
x2  = rep(2, 100)
xx  = cbind(x56, c(x1, x2))

# plot
plot(xx[, 1], xx[, 2], pch = c(xx[, 3]), col = c(xx[, 3]), frame = TRUE, axes = FALSE, 
    ylab = "", xlab = "", ylim = c(137.5, 142.5), xlim = c(7, 13))
axis(side = 1, at = seq(7, 13, 1), labels = seq(7, 13, 1))
axis(side = 2, at = seq(138, 142, 1), labels = seq(138, 142, 1))
title("Swiss bank notes")

```
