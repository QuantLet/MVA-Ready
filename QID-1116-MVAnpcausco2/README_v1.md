
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAnpcausco2** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAnpcausco2

Published in : Applied Multivariate Statistical Analysis

Description : 'Performs a PCA for the standardized US company 
data without IBM and General Motors. It shows
the first two principal components and screeplot of the  
eigenvalues.'

Keywords : 
- principal-components
- pca
- npca
- eigenvalues
- standardization
- spectral-decomposition
- screeplot
- plot 
- graphical representation
- data visualization

See also : 
- MVAnpcabanki
- MVAnpcabank
- MVAnpcahousi
- MVAnpcatime
- MVAnpcafood
- MVAnpcahous
- MVAnpcausco
- MVAnpcausco2i
- MVAcpcaiv
- MVApcabank
- MVApcabanki
- MVApcabankr
- MVApcasimu

Author : 
- Zografia Anastasiadou
- Awdesch Melzer

Submitted : Fri, April 11 2014 by Awdesch Melzer

Datafile : uscomp2.dat

```

![Picture1](MVAnpcausco2-1.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# Load data
x = read.table("uscomp2.dat")

# Without IBM and General Electric
x = rbind(x[1:37, ], x[39, ], x[41:79, ])

colnames(x) = c("Company", "A", "S", "MV", "P", "CF", "E", "Sector")
attach(x)
Sector = as.character(Sector)
Sector[1:2]   = "H"
Sector[3:17]  = "E"
Sector[18:34] = "F"
Sector[35:40] = "H"
Sector[41:50] = "M"
Sector[51:61] = "*"
Sector[62:71] = "R"
Sector[72:77] = "*"

x   = x[, 2:7]
n   = nrow(x)
x   = (x - matrix(apply(x, 2, mean), n, 6, byrow = T))/matrix(sqrt((n - 1) * apply(x, 
    2, var)/n), n, 6, byrow = T)  # standardizes the data
eig = eigen((n - 1) * cov(x)/n)   # spectral decomposition
e   = eig$values
v   = eig$vectors
x   = as.matrix(x) %*% v          # principal components
layout(matrix(c(2, 1), 2, 1, byrow = T), c(2, 1), c(2, 1), T)

# plot
plot(e, xlab = "Index", ylab = "Lambda", main = "Eigenvalues of S")
plot(-x[, 1], x[, 2], xlim = c(-2, 8), ylim = c(-8, 8), type = "n", xlab = "PC 1", 
    ylab = "PC 2", main = "First vs. Second PC")
text(-x[, 1], x[, 2], Sector) 

```
