# basic survival analysis with Proportional Hazards Regression Model

library(survival)

s <- with(churn, Surv(duration, as.numeric(choice))) # survival object

model <- coxph(s ~ int_plan + service_calls, data=churn[, -4]) # create a model
summary(model)
plot(survfit(model),col=c("blue", "red")) # plot fitted model

# option with stratified number of service calls < 3 or > 3

model1 <- coxph(s ~ int_calls + strata(service_calls <= 3), data=churn[, -4])
summary(model)
plot(survfit(model), col=c("blue", "red"))

# proportional hazards regression model trial (optional)

coxph <- coxph(Surv(dat$account.length, dat$Churn) ~ dat$total.day.charge + dat$number.customer.service.calls, method="breslow")
