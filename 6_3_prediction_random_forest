# radnom forest

library(randomForest)
set.seed(1234)
fit.forest <- randomForest(choice~., data=train, na.action=na.roughfix, importance=TRUE)
fit.forest
importance(fit.forest, type=2)

forest.pred <- predict(fit.forest, test)
forest.perf <- table(test$choice, forest.pred, dnn=c("Actual", "Predicted"))
forest.perf

library(caret)

confusionMatrix(test$choice, forest.pred)

# Prediction  not-churn churn
# not-churn       847    10
# churn            43   100
#
# accuracy .948 at 95% CI (0.9312, 0.9601)
