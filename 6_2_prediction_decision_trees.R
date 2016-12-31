# decision tree

set.seed(1234)
dtree <- rpart(choice ~ ., data=train, method="class", parms=list(split="information"))

dtree$cptable # creating tree 
plotcp(dtree) # plotting complexity parameter CP against cross-validation error

# to examine final tree size, steps:

# 1. find smallest xerror in cptable    = 0.4029412 (error)
# 2. find xstd corresponding to xerror  = 0.0339952 (standard deviation)
# 3. smallest tree is withing the range = between [0.369] and [0.437]
# 4. nsplit belonging to xerror in cp table within that range is between 9 and 15 (say row 6 in a table with 10 trees)
# 5. cp = 0.1862745

dtree.pruned <- prune(dtree, cp=.01863)

library(rpart.plot)

prp(dtree.pruned, type = 2, extra = 104, fallen.leaves = TRUE, main="Decision Tree") # plotting a tree

dtree.pred <- predict(dtree.pruned, test, type="class")
dtree.perf <- table(test$choice, dtree.pred, dnn=c("Actual", "Predicted"))
dtree.perf

#        Predicted
# Actual   0   1
# 0 842  15
# 1  57  86

# meaning:
# out of 1000 test samples
# 842 correctly predicted will not churn
# 86  correctly predicted will churn
# 57 wrongfully predicted will not churn, but actually did
# 15 wrongfully predicted will churn, but they didn't
# accuracy: 928 / 1000 = .928

# * * * * * 

# Creating a conditional inference tree with ctree()

library(party)

set.seed(1234)

fit.ctree <- ctree(choice~., data=train)
plot(fit.ctree, main="Conditional Inference Tree")
ctree.pred <- predict(fit.ctree, test, type="response")
ctree.perf <- table(test$choice, ctree.pred, dnn=c("Actual", "Predicted"))

ctree.perf

#       P      redicted
# Actual      not-churn churn
# not-churn       837    20
# churn            54    89
# accuracy: 926 / 1000 = .926
