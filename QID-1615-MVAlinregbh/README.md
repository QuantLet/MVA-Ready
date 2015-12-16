
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAlinregbh** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of QuantLet : MVAlinregbh
Published in : Applied Multivariate Statistical Analysis
Description : 'Builds a linear regression model for the
complete transformed Boston housing data.'
Keywords :
- linear
- regression
- linear-regression
- financial
- estimation
See also :
- MVAlinreg2bh
- MMSTATlinreg
- MVAregbank
- MVAregpull
- MVAregzoom
- MVAsimcibh
- MVAdiscbh
- MVAdescbh
- MVAclusbh
- MVAboxbhd
- MVAaerbh
Author :
- Till Grossmass
- Jorge Patron
- Vladimir Georgescu
- Song Song
- Awdesch Melzer
Submitted : Wed, February 29 2012 by Dedy Dwi Prastyo
Datafile : bostonh.dat
```


```r
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAlinregbh
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Builds a linear regression model for the
# complete transformed Boston housing data.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : linear, regression, linear-regression, 
# financial, estimation 
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAlinreg2bh, MMSTATlinreg, MVAregbank, MVAregpull, MVAregzoom, 
# MVAsimcibh, MVAdiscbh, MVAdescbh
# MVAclusbh, MVAboxbhd, MVAaerbh
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Till Grossmass, Jorge Patron, Vladimir Georgescu, 
# Song Song, Awdesch Melzer
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Wed, February 29 2012 by Dedy Dwi Prastyo
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : bostonh.dat
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x   = read.table("bostonh.dat")
xt  = x

# Transformations
xt[, 1]   = log(x[, 1])
xt[, 2]   = x[, 2]/10
xt[, 3]   = log(x[, 3])
xt[, 5]   = log(x[, 5])
xt[, 6]   = log(x[, 6])
xt[, 7]   = ((x[, 7]^2.5))/10000
xt[, 8]   = log(x[, 8])
xt[, 9]   = log(x[, 9])
xt[, 10]  = log(x[, 10])
xt[, 11]  = exp(0.4 * x[, 11])/1000
xt[, 12]  = x[, 12]/100
xt[, 13]  = sqrt(x[, 13])
xt[, 14]  = log(x[, 14])

Z = cbind(rep(1, length(xt[, 1])), xt[, 1], xt[, 2], xt[, 3], xt[, 4], xt[, 5], +xt[, 
    6], xt[, 7], xt[, 8], xt[, 9], xt[, 10], xt[, 11], xt[, 12], xt[, 13])

y       = xt[, 14]
mn      = dim(Z)
df      = mn[1] - mn[2]
b       = solve(t(Z) %*% Z) %*% t(Z) %*% y
yhat    = Z %*% b
r       = y - yhat
mse     = t(r) %*% r/df
covar   = solve(t(Z) %*% Z) %*% diag(rep(mse, 14))
se      = sqrt(diag(covar))
t       = b/se
t2      = abs(t)
k       = t2^2/(df + t2^2)
p       = 0.5 * (1 + sign(t2) * pbeta(k, 0.5, 0.5 * df))
Pvalues = 2 * (1 - p)

tablex = cbind(round(b, 4), round(se, 4), round(t, 3), round(Pvalues, 4))
print("Table with coefficient estimates, Standard error, value of the +\nt-statistic and p-value (for the intercept (first line) and the 13    +\nvariables (lines 2 to 14))")
tablex 

```
