
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcabankr** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVApcabankr

Published in : Applied Multivariate Statistical Analysis

Description : 'Performs a PCA for the rescaled Swiss bank notes. X1, X2, X3, X6 are taken in cm
instead of mm. It shows the first three principal components in two-dimensional scatterplots.
Additionally, a screeplot of the eigenvalues is displayed.'

Keywords : 'principal-components, pca, eigenvalues, screeplot, scatterplot, plot, graphical
representation, data visualization'

See also : 'MVAnpcabanki, MVAnpcabank, MVAnpcahousi, MVAnpcatime, MVAnpcafood, MVAnpcausco,
MVAnpcausco2, MVAnpcausco2i, MVAcpcaiv, MVAnpcahous, MVApcabanki, MVApcabank, MVApcasimu'

Author : Zografia Anastasiadou

Submitted : Tue, July 01 2014 by Petra Burdejova

Datafile : bank2.dat

```

![Picture1](MVApcabankr-1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x      = read.table("bank2.dat")
n      = nrow(x)
x[, 1] = x[, 1]/10
x[, 2] = x[, 2]/10
x[, 3] = x[, 3]/10
x[, 6] = x[, 6]/10

e  = eigen((n - 1) * cov(x)/n)   # calculates eigenvalues and eigenvectors and sorts them by size
e1 = e$values
x  = as.matrix(x) %*% e$vectors  # data multiplied by eigenvectors

# plot of the first vs. second PC
par(mfrow = c(2, 2))
plot(x[, 1], x[, 2], pch = c(rep(1, 100), rep(3, 100)), col = c(rep("blue", 100), 
    rep("red", 100)), xlab = "PC1", ylab = "PC2", main = "First vs. Second PC", cex.lab = 1.2, 
    cex.axis = 1.2, cex.main = 1.8)

# plot of the second vs. third PC
plot(x[, 2], x[, 3], pch = c(rep(1, 100), rep(3, 100)), col = c(rep("blue", 100), 
    rep("red", 100)), xlab = "PC2", ylab = "PC3", main = "Second vs. Third PC", cex.lab = 1.2, 
    cex.axis = 1.2, cex.main = 1.8)

# plot of the first vs. third PC
plot(x[, 1], x[, 3], pch = c(rep(1, 100), rep(3, 100)), col = c(rep("blue", 100), 
    rep("red", 100)), xlab = "PC1", ylab = "PC2", main = "First vs. Third PC", cex.lab = 1.2, 
    cex.axis = 1.2, cex.main = 1.8)

# plot of the eigenvalues
plot(e1, ylim = c(0, 2.5), xlab = "Index", ylab = "Lambda", main = "Eigenvalues of S", 
    cex.lab = 1.2, cex.axis = 1.2, cex.main = 1.8) 

```
