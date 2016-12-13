# Churn Prediction in R

Main subject: Using various methods in R to predict or classify the customer churn in mobile industry.

* Dataset being used: churn.txt
* Number of observations: 3,333
* Number of features (variables): 21 -> representing individual customers of a mobile company
* Response variable: [churn.] (during the analysis converted to [choice] for easier manipulation)

* URL location of the dataset: http://www.dataminingconsultant.com/data/churn.txt
* Features description: http://www.sgi.com/tech/mlc/db/churn.names

Short description of the problem:

Customer behavior analysis is a very challenging area within any business environment. Usually companies take a tradititonal analytic approach based on widely available company transactional data (payments, revenues, profitability, etc). However, many other aspects of this subject related to the customer management and behavioral observation, remain either uncovered or underestimated.

What happened in the past is a treasury of predicting the future. Customer choice of staying or leaving depends on many factors already present in empirical data of enterprise databases. Some of the factors (in machine learning called predictors) have the bigger impact to the customer's choice (response variable); some of them are less significant; sometimes the combination of various factors account more for the variability of the response variable; and sometimes the factors are mutually correlated rather than having larger influence to the 
customer's choice.

To determine the importance of those factors and calculate overall probability of customer churn, we need to name the problem and to define the statistical tools.

The problem is called binary classification problem, because the methodology predicts the probability of customer to stay or leave (simply put: yes or no; 1 or 0).

The machine mearning area dealing with such problems is called supervised machine learning, because algorithm learns from known part data and tries to predict the unknown part of data, with assisting of data scientist. 

Steps taken:

* Loading data
* Cleaning Data
* Data exploration and visualization
* Cross-validation
* Prediction using varios algorithms
* Algorithm comparison and final decision

Programming environment used: R

