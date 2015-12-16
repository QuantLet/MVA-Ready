
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAnmdscar1** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of QuantLet : MVAnmdscar1
Published in : Applied Multivariate Statistical Analysis
Description : Plots the initial configuration of the points for nonmetric MDS for car marks data.
Keywords :
- MDS
- non-metric-MDS
- multi-dimensional
- scaling
- PAV
- violators
- plot
- graphical representation
See also :
- MVAMDScity1
- MVAMDScity2
- MVAMDSnonmstart
- MVAMDSpooladj
- MVAmdscarm
- MVAnmdscar2
- MVAnmdscar3
- PAVAlgo
- MVAcarrankings
Author : Zografia Anastasiadou
Submitted : Thu, November 06 2014 by Sergey Nasekin
```

![Picture1](initial configuration.png)


```r
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAnmdscar1
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Plots the initial configuration of the points 
# for nonmetric MDS for car marks data.
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : MDS, non-metric-MDS, multi-dimensional, scaling, 
# PAV, violators, plot, graphical representation
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : MVAMDScity1, MVAMDScity2, MVAMDSnonmstart, MVAMDSpooladj, 
# MVAmdscarm, MVAnmdscar2, MVAnmdscar3, PAVAlgo, MVAcarrankings
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Zografia Anastasiadou
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Thu, November 06 2014 by Sergey Nasekin
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

x = cbind(c(3, 2, 1, 10), c(2, 7, 3, 4))

# plot
plot(x, type = "n", xlim = c(0, 12), ylim = c(0, 8), xlab = "", ylab = "", main = "Initial Configuration", 
    cex.axis = 1.2, cex.main = 1.8)
text(x, labels = c("Mercedes", "Jaguar", "Ferrari", "VW"))

```
