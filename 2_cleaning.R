# link to the loading code

codePath <- list(data='D:/Projects/datasets/mobile/codes/')
codeInit <- c('1_initialization.R')
source(paste0(codePath$data, codeInit))

# some factor conversions

factors <- c(1, 3, 5, 6, 20, 21)

for (i in factors){
  churn[,i] <- as.factor(as.character(churn[,i]))
}

rm(factors, i)

clear()

# copy the original dataset and prepare it for correlation analysis

churnNum <- churn

fact2num <- c(1, 3, 5, 6, 20, 21)

for (i in fact2num){
  churnNum[,i] <- as.numeric(churnNum[,i])
}

rm(fact2num, i)

churnNum$choice <- ifelse(churnNum$choice==1,0,1)

states <- unique(churnNum$state)
churnNum$state <- NULL
churnNum$phone <- NULL

clear()
str(churnNum)

