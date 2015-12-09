
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAageCom** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of QuantLet : MVAageCom
Published in : Applied Multivariate Statistical Analysis
Description : Hexagon plot between Age and Time for computer per week.
Keywords :
- plot
- graphical representation
- hexagon-plot
- data visualization
- financial
See also :
- MVAincomeLi
- MVAageIncome
Author : Vinh Hanh Lieu
Submitted : Tue, September 09 2014 by Awdesch Melzer
Datafile : allbus.csv
```

![Picture1](MVAageCom.png)


```r

# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("hexbin")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
allbus  = read.csv2("allbus.csv")
allbus4 = allbus[, c(2, 6)]

# Exclude unvalid observations
allbus4  = allbus4[(allbus4$ALTER = 100) & (allbus4$COMPUTER < 999), ]
ages4    = allbus4[, 1]
computer = allbus4[, 2]

# Hexagon plot
hexbinplot(computer ~ ages4, main="Hexagon plot", xlab = "Age", ylab = "Computer time", 
           style = "colorscale", aspect = 1, trans = sqrt, inv = function(ages4) ages4 ^ 2)

```
