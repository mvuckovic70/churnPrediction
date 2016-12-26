# logistic regression with one predictor

set.seed(7621)
fit.logit = glm(choice ~ service_calls, data=train, family=binomial, subset=trainRule)
summary(fit.logit)

set.seed(825)
churn_prob = predict(fit.logit, test, type="response")

churn_pred = rep(0, 1000)
churn_pred[churn_prob>.5]=1
table(churn_pred, test$choice)

logit.perf <- table(churn_pred, test$choice, dnn=c("Actual", "Predicted"))
logit.perf

mean(churn_pred==test$choice)

# because model fit computes 6 service calls as a threshold, just 2 of customers will churn, and onyl 1 error will be made
# test set has 1000 observations
# 856 accurately predicted not to churn
# 142 erroneously predicted to churn, but they did not
# 1 correctly predicted to churn
# 1 erroneously predicted not to churn, but they did
# 857 correct predictions out of 1000 gives the accuracy of 0.857

#       Predicted
# Actual not-churn churn
# 0       856   142
# 1         1     1

# logistic regression with all the predictors

set.seed(7621)
fit.logit1 = glm(choice ~ . , data=train, family=binomial, subset=trainRule)
summary(fit.logit1)

set.seed(825)
churn_prob = predict(fit.logit1, test, type="response")

churn_pred = rep(0, 1000)
churn_pred[churn_prob>.5]=1
table(churn_pred, test$choice)

logit.perf <- table(churn_pred, test$choice, dnn=c("Actual", "Predicted"))
logit.perf

# b       Predicted
# Actual not-churn churn
# 0       825   109
# 1        32    34
# 
# accuracy .859

# logistic regression with the most influential predictors

set.seed(7621)
fit.logit2 = glm(choice~service_calls+int_calls+int_charge , data=train, family=binomial, subset=trainRule)
summary(fit.logit2)

set.seed(825)
churn_prob = predict(fit.logit2, test, type="response")

churn_pred = rep(0, 1000)
churn_pred[churn_prob>.5]=1
table(churn_pred, test$choice)

logit.perf <- table(churn_pred, test$choice, dnn=c("Actual", "Predicted"))
logit.perf

#       Predicted
# Actual not-churn churn
# 0       855   141
# 1         2     2
# 
# Accuracy .857

# using cross-validation

trainControl <- trainControl(method="cv", number=10)
fitCV <- train(choice~., data=train, trControl=trainControl, method="glm")

print(fitCV)

# estimate of test error rate - accuracy of .8599

