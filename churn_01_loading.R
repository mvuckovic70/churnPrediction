# step 1 - load libraries and dataset
# directory path should be adjusted

library(RWeka)
library(ggplot2)
library(rpart)
library(rJava)
library(class)
library(psych)

churn <- read.csv('D:/Projects/datasets/mobile/datasets/churn.txt')

# 2 adjusting dataset for correlation analysis

names(churn)[21] <- "choice"

churnNum <- churn
churnNum$Phone <- NULL
churnNum$choice <- as.numeric(churnNum$choice)
churnNum$choice <- ifelse(churnNum$choice==1,0,1)
churnNum$VMail.Plan <- as.numeric(churnNum$VMail.Plan)
churnNum$Int.l.Plan <- as.numeric(churnNum$Int.l.Plan)
churnNum$StateCode <- as.numeric(churnNum$State)

states <- unique(churnNum$State)
churnNum$State <- NULL

churn1 <- churn
churn1$choice <- as.numeric(churn1$choice)

# correlation test

correlations <- cor(churnNum, churnNum$choice)
correlations

# Most influental variables have higher values and thus will be the subject of our further analysis

Account.Length  0.016540742
Area.Code       0.006174233
Int.l.Plan      0.259851847
VMail.Plan     -0.102148141
VMail.Message  -0.089727970
Day.Mins        0.205150829
Day.Calls       0.018459312
Day.Charge      0.205150743
Eve.Mins        0.092795790
Eve.Calls       0.009233132
Eve.Charge      0.092786039
Night.Mins      0.035492853
Night.Calls     0.006141203
Night.Charge    0.035495556
Intl.Mins       0.068238776
Intl.Calls     -0.052844336
Intl.Charge     0.068258632
CustServ.Calls  0.208749999
choice          1.000000000
StateCode       0.007780314

