# function for correlation test
# run using corrMatrix()

corrMatrix <- function(){

cors <- as.data.frame(cor(churnNum, churnNum$choice))
features <- row.names(cors)
corsOrd <- cors[order(cors$V1),]
correlations <- cbind(features, round(as.numeric(corsOrd),4))
str(correlations)

rm(cors, corsOrd, features)
clear()
correlations
}

# analyse by plotting the relative importance of variables in a model 

qplot(x=Var1, y=Var2, data = melt(cor(churnNum, use='p')),
      fill=value, geom='tile') +
      scale_fill_gradient2(limits=c(-1,1)) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))

# relative importance function

relImp <- function(fit,...){
  R <- cor(fit$model)
  nvar <- ncol(R)
  rxx <- R[2:nvar, 2:nvar]
  rxy <- R[2:nvar, 1]
  svd <- eigen(rxx)
  evec <- svd$vectors
  ev <- svd$values
  delta <- diag(sqrt(ev))
  lambda <- evec %*% delta %*% t(evec)
  lambdasq <- lambda ^ 2
  beta <- solve(lambda) %*% rxy
  rsquare <- colSums(beta ^ 2)
  rawwgt <- lambdasq %*% beta ^ 2
  import <- (rawwgt / rsquare) * 100
  import <- as.data.frame(import)
  row.names(import) <- names(fit$model[2:nvar])
  names(import) <- "Weights"
  import <- import[order(import),1, drop=FALSE]
  dotchart(import$Weights, labels=row.names(import),
           xlab="% of R-Square", pch=19,
           main="Relative Importance of Predictor Variables",
           sub=paste("Total R-Square=", round(rsquare, digits=3)),
           ...)
  return(import)
}

tail(corrMatrix(),4)

# resulting in following important variables
# explanation: most important factors for customer churn are international calls strategy of the company
# along with, intuitively, increasing number of service customers calls

      features                
# [16,] "int_calls"     "0.2052"
# [17,] "int_charge"    "0.2087"
# [18,] "service_calls" "0.2599"
# [19,] "choice"        "1"    
