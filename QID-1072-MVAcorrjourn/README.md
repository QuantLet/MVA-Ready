
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAcorrjourn** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAcorrjourn

Published in : Applied Multivariate Statistical Analysis

Description : 'Performs a correspondence analysis for
the Belgian journal data, shows the eigenvalues of the
singular value decomposition of the chi-matrix and
displays graphically its factorial decomposition.'

Keywords :
- correspondence-analysis
- svd
- decomposition
- factorial-decomposition
- eigenvalues
- factorial
- plot
- graphical representation
- data visualization

See also :
- MVAcorrCar
- MVAcorrEyeHair
- MVAcorrbac
- MVAcorrcrime
- SMScorrcrime
- SMScorrcarm
- SMScorrfood
- SMScorrhealth

Author : Zografia Anastasiadou

Submitted : Tue, May 10 2011 by Zografia Anastasiadou

Datafile : journaux.dat
```

![Picture1](MVAcorrjourn_1.png)


```r
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAcorrjourn
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Performs a correspondence analysis for
# the Belgian journal data, shows the eigenvalues of the
# singular value decomposition of the chi-matrix and 
# displays graphically its factorial decomposition.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : correspondence-analysis, svd, decomposition, 
# factorial-decomposition, eigenvalues, factorial, plot,
# graphical representation, data visualization
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAcorrCar, MVAcorrEyeHair, MVAcorrbac,
# MVAcorrcrime, SMScorrcrime, SMScorrcarm, SMScorrfood,
# SMScorrhealth
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Zografia Anastasiadou
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Tue, May 10 2011 by Zografia Anastasiadou
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : journaux.dat
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x  = read.table("journaux.dat")
a  = rowSums(x)
b  = colSums(x)
e  = matrix(a) %*% b/sum(a)

# chi-matrix
cc = (x - e)/sqrt(e)

# singular value decomposition
sv = svd(cc)
g  = sv$u
l  = sv$d
d  = sv$v

# eigenvalues
ll = l * l

# cumulated percentage of the variance
aux  = cumsum(ll)/sum(ll)
perc = cbind(ll, aux)
r1   = matrix(l, nrow = nrow(g), ncol = ncol(g), byrow = T) * g
r    = r1/matrix(sqrt(a), nrow = nrow(g), ncol = ncol(g), byrow = F) 
s1   = matrix(l, nrow = nrow(d), ncol = ncol(d), byrow = T) * d
s    = s1/matrix(sqrt(b), nrow = nrow(d), ncol = ncol(d), byrow = F) 

car  = matrix(matrix(a), nrow = nrow(r), ncol = ncol(r), byrow = F) * r^2/matrix(l^2, 
    nrow = nrow(r), ncol = ncol(r), byrow = T)                   # contribution in r

cas  = matrix(matrix(b), nrow = nrow(s), ncol = ncol(s), byrow = F) * s^2/matrix(l^2, 
    nrow = nrow(s), ncol = ncol(s), byrow = T)                   # contribution in s

rr   = r[, 1:2]
ss   = s[, 1:2]

# labels for journals
types    = c("va", "vb", "vc", "vd", "ve", "ff", "fg", "fh", "fi", "bj", "bk", "bl", 
    "vm", "fn", "fo")

# labels for regions
regions  = c("brw", "bxl", "anv", "brf", "foc", "for", "hai", "lig", "lim", "lux")

# plot
plot(rr, type = "n", xlim = c(-1.1, 1.5), ylim = c(-1.1, 0.6), xlab = "r_1,s_1", 
    ylab = "r_2,s_2", main = "Journal Data", cex.axis = 1.2, cex.lab = 1.2, cex.main = 1.6)
points(ss, type = "n")
text(rr, types, cex = 1.5, col = "blue")
text(ss, regions, col = "red")
abline(h = 0, v = 0, lwd = 2)

```
