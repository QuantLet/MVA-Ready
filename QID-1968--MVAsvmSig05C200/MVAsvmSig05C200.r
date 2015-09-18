# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Name of QuantLet : MVAsvmSig05C200
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Published in : Applied Multivariate Statistical Analysis
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Description : Plots an SVM classification plot of 
# bankruptcy data set. Support Vector Machine is of class 
# "ksvm" with parameters sigma=1/0.5 and cost C=200
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Keywords : SVM, financial, plot, classification, kernel
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# See also : STF2svm01, MVAsvmSig100C1, MVAsvmSig2C1
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Author : Dedy D. Prastyo
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Submitted : Thu, October 18 2012 by Dedy Dwi Prastyo
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Datafile : Bankruptcy100by100noNA.txt
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# Example : Shows an SVM classification plot
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

library(kernlab)
library(tseries)
library(quadprog)
library(zoo)

#Read data and create SVM model
G = read.matrix("Bankruptcy100by100noNA.txt", header = TRUE, sep = "")
bankmodel_draw = ksvm(G[,c(7,28)],G[,c(3)], type = "C-svc", 
kernel = "rbfdot", kpar = list(sigma = 1/0.5), C = 200)

#Print Output of SVM model
print(bankmodel_draw)

#Create SVM classification plot
win.graph()
plot(bankmodel_draw, data=G[,c(7,28)]) 
