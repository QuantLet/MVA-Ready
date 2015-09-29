# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAaper
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Demonstrates maximum likelihood discrimination rule
# (ML rule) and calculates the apparent error rate for Swiss banknotes.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : apparent-error-rate, discrimination, mean, probability,
# estimation, discriminant-analysis, maximum-likelihood
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAaerbh
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Wolfgang K. Härdle, Vladimir Georgescu, Song Song, 
# Awdesch Melzer
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Thu, June 05 2014 by Sergey Nasekin
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : bank2.dat
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
x       = read.table("bank2.dat")
xg      = x[1:100, ]
xf      = x[101:200, ]

mg      = apply(xg, 2, mean)    # mean forged
mf      = apply(xf, 2, mean)    # mean genuine
m       = (mf + mg)/2           # total mean
s       = (99 * cov(xg) + 99 * cov(xf))/198  # sd
alpha   = solve(s) %*% (mg - mf)

miss1   = 0
for (i in 1:length(xg[, 1])) {
    if (as.numeric(xg[i, ] - m) %*% alpha < 0) {
        miss1 = miss1 + 1
    }
}

miss2   = 0
for (i in 1:length(xf[, 1])) {
    if (as.numeric(xf[i, ] - m) %*% alpha > 0) {
        miss2 = miss2 + 1
    }
}

print("Genuine banknotes classified as forged:")
print(miss1)
print("Forged banknotes classified as genuine:")
print(miss2)
print("APER (apparent error rate):")
aper = (miss1 + miss2)/length(x[, 1])
print(aper)
