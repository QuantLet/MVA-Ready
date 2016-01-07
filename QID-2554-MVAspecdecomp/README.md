
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAspecdecomp** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAspecdecomp

Published in : Applied Multivariate Statistical Analysis

Description : Performs a spectral decomposition of a 2 by 2 covariance matrix.

Keywords : covariance, decomposition, eigenvalues, eigenvectors, spectral

Author : Wolfgang K. Haerdle

Submitted : Mon, September 15 2014 by Felix Jung

Input: 
- rho: Covariance of the two variables being considered.

Output : '2 x 2- Difference between the covariance matrix a and its spectral decomposition. Should
be very close to zero.'

```


```r

# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

rho = 0.9  # Set the covariance
a = cbind(c(1, rho), c(rho, 1))  # Covariance matrix
e = eigen(a)  # Perform spectral decomposition
lambda = diag(e$values)  # Diagonal matrix of eigenvalues
gamma = e$vectors  # Gamma transformation matrix

# Check whether the decomposition yiels a
a - gamma %*% lambda %*% t(gamma)  # Should yield a matrix of zeros (approx)

```
