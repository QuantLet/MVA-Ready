
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAscapull2** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAscapull2

Published in : Applied Multivariate Statistical Analysis

Description : 'Computes a two dimensional scatterplot of assistants and sales from the pullovers data set.'

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
- MVAscabank45
- MVAscabank56
- MVAscabank456
- MVAscacar
- MVAscapull1
- MVAdraftbank4
- MVAdrafthousing
- MVAdrafthousingt

Author :
- Jorge Patron
- Vladimir Georgescu
- Song Song
- Awdesch Melzer

Submitted : Mon, September 15 2014 by Awdesch Melzer

Datafile : pullover.dat

```

![Picture1](MVAscapull2_1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("pullover.dat")

# plot
plot(x[, 4], x[, 1], xlab = "Sales Assistants (X4)", ylab = "Sales (X1)", xlim = c(70, 
    120), ylim = c(80, 240), frame = TRUE, axes = FALSE)
title("Pullovers Data")
axis(side = 2, seq(80, 240, 40), seq(80, 240, 40))
axis(side = 1, seq(70, 130, 10), seq(70, 130, 10))

```
