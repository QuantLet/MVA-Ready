
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAcanus** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of QuantLet : MVAcanus
Published in : Applied Multivariate Statistical Analysis
Description : Performs a canonical correlation analysis for the US crime and US health data.
Keywords :
- estimation
- covariance
- covariance-matrix
- correlation
- canonical-analysis
- canonical
- singular-value-decomposition
- SVD
See also : MVAcancarm
Author : Dedy D. Prastyo
Submitted : Tue, August 02 2011 by Awdesch Melzer
Datafile :
- uscrime.dat
- ushealth.dat
Output : Estimated covariance matrices Sxx, Sxy, Syx and Syy, estimated matrix K and estimated
canonical correlation vectors (a and b) and canonical variables (eta and phi).
```


```r
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAcanus
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Performs a canonical correlation analysis
# for the US crime and US health data.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : estimation, covariance, covariance-matrix, correlation, 
# canonical-analysis, canonical, singular-value-decomposition, SVD
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAcancarm
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Dedy D. Prastyo
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Tue, August 02 2011 by Awdesch Melzer
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : uscrime.dat, ushealth.dat
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Output : Estimated covariance matrices Sxx, Sxy, Syx and Syy,
# estimated matrix K and estimated canonical correlation
# vectors (a and b) and canonical variables (eta and phi).
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("tseries", "base")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# Read US crime (X) and US health data (Y)
X   = read.matrix("uscrime.dat")  	# read a matrix
X   = X[, c(3, 4, 5, 6, 7, 8, 9)]
Y1  = read.table("ushealth.dat")  	# type of some variables is text 
Y2  = Y1[, c(4, 5, 6, 7, 8, 9, 10)]
Y   = matrix(0, dim(Y2)[1], dim(Y2)[2])

# copy table to matrix
for (i in 1:dim(Y2)[1]) {
    for (j in 1:dim(Y2)[2]) {
        Y[i, j] = Y2[i, j]
    }
}

# Estimation of covariance matrices
S = cov(cbind(X, Y))
Sxx = S[1:dim(X)[2], 1:dim(X)[2]]
Sxy = S[1:dim(X)[2], 1:dim(X)[2] + dim(Y)[2]]
Syx = Sxy
Syy = S[1:dim(X)[2] + dim(Y)[2], 1:dim(X)[2] + dim(Y)[2]]

# Estimation of the matrix K and its singular value decomposition
eigenX = eigen(Sxx)
eX = eigenX$values  	# eigenvalues of Sxx
vX = eigenX$vector	# eigenvectors of Sxx

eigenY = eigen(Syy)
eY = eigenY$values  	# eigenvalues of Syy
vY = eigenY$vectors  	# eigenvectors of Syy

K = vX %*% diag(1/(sqrt(eX))) %*% t(vX) %*% Sxy %*% vY %*% diag(1/(sqrt(eY))) %*% t(vY)
GLD = svd(K)
G = GLD$u
L = diag(GLD$d)
D = GLD$v

# Estimated canonical correlation vectors (a and b) and canonical variables (eta and phi)
a   = vX %*% diag(1/sqrt(eX)) %*% t(vX) %*% G
b   = vY %*% diag(1/sqrt(eY)) %*% t(vY) %*% D
eta = X %*% a
phi = Y %*% b

```
