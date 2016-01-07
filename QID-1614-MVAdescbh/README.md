
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAdescbh** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAdescbh

Published in : Applied Multivariate Statistical Analysis

Description : 'Calculates descriptive statistics for the Boston housing data and their
transformations.'

Keywords : 'correlation, correlation-matrix, covariance, covariance-matrix, descriptive,
descriptive-statistics, five number summary, mean, statistics, transformation'

See also : MVAlinregbh, MVAlinreg2bh, MVAsimcibh, MVAdiscbh, MVAclusbh, MVAboxbhd, MVAaerbh

Author : Vladimir Georgescu, Jorge Patron, Song Song, Awdesch Melzer

Submitted : Mon, September 15 2014 by Awdesch Melzer

Datafiles : bostonh.dat

```


```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("bostonh.dat")
xt = x

# Transformation
xt[, 1] = log(x[, 1])
xt[, 2] = x[, 2]/10
xt[, 3] = log(x[, 3])
xt[, 5] = log(x[, 5])
xt[, 6] = log(x[, 6])
xt[, 7] = ((x[, 7]^2.5))/10000
xt[, 8] = log(x[, 8])
xt[, 9] = log(x[, 9])
xt[, 10] = log(x[, 10])
xt[, 11] = exp(0.4 * x[, 11])/1000
xt[, 12] = x[, 12]/100
xt[, 13] = sqrt(x[, 13])
xt[, 14] = log(x[, 14])

tablex = rbind(t(apply(x, 2, mean)), t(apply(x, 2, median)), t((apply(x, 2, sd))^2), 
    t(apply(x, 2, sd)))
print("Table with Mean, Median, Variance, Sqrt(Variance) for Original Data")
print("  Mean   Median  Variance   SE")
t(round(tablex, 4))

print("Covariance Matrix Original Data")
print(cov(x))

print("Correlation Matrix Original Data")
print(cor(x))

tablext = cbind(apply(xt, 2, mean), apply(xt, 2, median), (apply(xt, 2, sd))^2, 
    apply(xt, 2, sd))

print("Table with Mean, Median, Variance, Sqrt(Variance) for Transformed Data")
print("     Mean     Median    Variance    SE")
round(tablext, 4)
print("Covariance Matrix Transformed Data")
print(cov(xt))
print("Correlation Matrix Transformed Data")
print(cor(xt))


```
