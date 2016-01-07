
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAcorrCar** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MVAcorrCar

Published in : Applied Multivariate Statistical Analysis

Description : Computes the Chi-Square test statistics for the car data.

Keywords : correspondence-analysis, independence, test, chi-square-test, chi-square, financial

See also : 'MVAcorrbac, MVAcorrEyeHair, MVAcorrcrime, MVAcorrjourn, SMScorrcrime, SMScorrcarm,
SMScorrfood, SMScorrhealth'

Author : Andrija Mihoci, Xiaofeng Cao

Submitted : Mon, October 17 2011 by Awdesch Melzer

```


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# Data (X3 vs. X4, r = number of rows, c = number of columns)
r     = 5
c     = 5
X3x4  = c(1, 1, 0, 0, 0, 0, 7, 1, 0, 0, 2, 2, 19, 5, 0, 0, 0, 6, 11, 0, 0, 1, 1, 4, 
    5)
X3x4  = matrix(X3x4, nrow = r, ncol = c)
X3x4  = t(X3x4)            # Data matrix
rowst = rowSums(X3x4)      # marginal row
colst = colSums(X3x4)      # marginal column
n     = sum(X3x4)          # sample size

# Expected values under independence (X3 vs. X4)
E     = matrix(rep(NA, r * c), nrow = r, ncol = c)
for (i in c(0:(r - 1))) {
    i = i + 1
    for (j in c(0:(c - 1))) {
        j = j + 1
        e = rowst[i] * colst[j]/n
        E[i, j] = e
    }
}

# Chi-Square test statistic (X3 vs. X4)
(Chi2_X3X4 = sum(sum((E - X3x4)^2/E)))

# Data (X3 vs. X13, r = number of rows, c = number of columns)
r     = 5
c     = 3
X3X13 = c(2, 0, 0, 8, 0, 0, 26, 0, 2, 8, 5, 4, 2, 6, 3)
X3X13 = matrix(X3X13, nrow = c, ncol = r)
X3X13 = t(X3X13)           # Data matrix
rowst = rowSums(X3X13)     # marginal row
colst = colSums(X3X13)     # marginal column
n     = sum(X3X13)         # sample size

# Expected values under independence (X3 vs. X13)
E     = matrix(rep(NA, r * c), nrow = r, ncol = c)
for (i in c(0:(r - 1))) {
    i = i + 1
    for (j in c(0:(c - 1))) {
        j = j + 1
        e = rowst[i] * colst[j]/n
        E[i, j] = e
    }
}

# Chi-Square test statistic (X3 vs. X13)
(Chi2_X3X13 = sum(sum((E - X3X13)^2/E)))

# Data (X4 vs. X13, r = number of rows, c = number of columns)
r     = 5
c     = 3
X4X13 = c(2, 0, 1, 10, 0, 1, 21, 1, 5, 13, 5, 2, 0, 5, 0)
X4X13 = matrix(X4X13, nrow = c, ncol = r)
X4X13 = t(X4X13)           # Data matrix
rowst = rowSums(X4X13)     # marginal row
colst = colSums(X4X13)     # marginal column
n     = sum(X4X13)         # sample size

# Expected values under independence (X4 vs. X13)
E     = matrix(rep(NA, r * c), nrow = r, ncol = c)
for (i in c(0:(r - 1))) {
    i = i + 1
    for (j in c(0:(c - 1))) {
        j = j + 1
        e = rowst[i] * colst[j]/n
        E[i, j] = e
    }
}

# Chi-Square test statistic (X4 vs. X13)
(Chi2_X4X13 = sum(sum((E - X4X13)^2/E)))

# Chi-Square test statistics
(Chi2       = c(Chi2_X3X4, Chi2_X3X13, Chi2_X4X13))

```
