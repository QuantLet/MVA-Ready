
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcabanki** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVApcabanki

Published in : Applied Multivariate Statistical Analysis

Description : 'Shows a screeplot of the eigenvalues for the PCA of
the Swiss bank notes. It computes the correlations
between the variables and the principal components and displays
the first two of them.'

Keywords :
- principal-components
- pca
- eigenvalues
- screeplot
- plot
- graphical representation
- data visualization
- correlation

See also :
- MVAnpcabanki
- MVAnpcabank
- MVAnpcahousi
- MVAnpcatime
- MVAnpcafood
- MVAnpcausco
- MVAnpcausco2
- MVAnpcausco2i
- MVAcpcaiv
- MVAnpcahous
- MVApcabank
- MVApcabankr
- MVApcasimu

Author : Zografia AnastasiadouMon

Submitted : Mon, June 30 2014 by Franziska Schulz

Datafile : bank2.dat

Example :
- Relative proportion of variance explained by PCs.
- First vs Second PC.
```

![Picture1](MVApcabanki_1-1.png)

![Picture2](MVApcabanki_2-1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x  = read.table("bank2.dat")
n  = nrow(x)
e  = eigen((n - 1) * cov(x)/n)  # calculates eigenvalues and eigenvectors and sorts them by size
e1 = e$values/sum(e$values)

# plot for the relative proportion of variance explained by PCs
dev.new()
plot(e1, ylim = c(0, 0.8), xlab = "Index", ylab = "Variance Explained", main = "Swiss Bank Notes", 
    cex.lab = 1.2, cex.axis = 1.2, cex.main = 1.8)

m    = apply(as.matrix(x), 2, mean)
temp = as.matrix(x - matrix(m, n, ncol(x), byrow = T))
r    = temp %*% e$vectors
r    = cor(cbind(r, x))  # correlation between PCs and variables
r1   = r[7:12, 1:2]      # correlation of the two most important PCs and variables

# plot for the correlation of the original variables with the PCs
dev.new()
ucircle = cbind(cos((0:360)/180 * pi), sin((0:360)/180 * pi))
plot(ucircle, type = "l", lty = "solid", col = "blue", xlab = "First PC", ylab = "Second PC", 
    main = "Swiss Bank Notes", cex.lab = 1.2, cex.axis = 1.2, cex.main = 1.8, lwd = 2)
abline(h = 0, v = 0)
label = c("X1", "X2", "X3", "X4", "X5", "X6")
text(r1, label, cex = 1.2) 

```
