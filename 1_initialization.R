# clear r space

rm(list=ls())
clear <- function() {cat("\014")}

# function to install multiple packages
# usage: install(packages)

install <- function(packages){
    new.packages <- packages[!(packages %in% installed.packages()[, "Package"])]
  if (length(new.packages)) 
    install.packages(new.packages, dependencies = TRUE)
  sapply(packages, require, character.only = TRUE)
  clear()
  cat('Packages installed.')
    }

packages <- c("ggplot2", "dplyr", "reshape2", "plyr", "psych", "RWeka", "rpart", "rJava", "class", "sqldf", "caret", "mlbench","bootstrap")
install(packages)  

# function to import the data
# usage: churn <- import()

import <- function(){
  cls <- c('character', 'integer', 'integer', 'character', 'character','character', 
           'integer', 'numeric','integer','numeric','numeric','integer',
           'numeric','numeric','integer','numeric','numeric','integer',
           'numeric', 'integer', 'character')
  cln <- c('state','duration','area_code','phone','int_plan','voice_plan',
           'voice_message','day_minutes','day_calls','day_charge','evening_minutes','evening_calls',
           'evening_charge','night_minutes','night_calls','night_charge','int_minutes','int_calls',
           'int_charge','service_calls','choice')
  paths <- list(data='D:/Projects/datasets/mobile/datasets/')
  dname <- ('churn.txt')
  churn <- read.csv(paste0(paths$data,dname),colClasses = cls, col.names = cln, nrows = 3333, sep=",", comment.char = '')
  # clear()
  # cat('Dataset imported.')
  }

churn <- import()
rm(packages, import, install)
clear()
