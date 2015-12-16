
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAscabank45** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAscabank45

Published in : Applied Multivariate Statistical Analysis

Description : 'Computes a two dimensional scatterplot of
X4 vs. X5 (upper inner frame vs. lower) of the Swiss bank
notes data.'

Keywords :
- data visualization
- graphical representation
- scatterplot
- financial
- plot

See also :
- MVAcorrnorm
- MVAregbank
- MVAregpull
- MVAscabank56
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

Submitted : Mon, September 15 2014 by Awdesch Melzer

Datafile : bank2.dat
```

![Picture1](MVAscabank45_1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("bank2.dat")

# plot
plot(x[, 4], x[, 5], ylab = "", xlab = "", ylim = c(7, 13), xlim = c(7, 13))
title("Swiss bank notes")

```
