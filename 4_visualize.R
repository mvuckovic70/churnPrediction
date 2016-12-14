
# to save the plot, type before the plot:
# png("plot_name.png", width=600, height=400) 
# and after the plot:
# dev.off() 

attach(churn)

# 1. plot relations of day calls and customer service calls

qplot(day_calls, service_calls, data = churnNum,geom = c("point", "smooth"),color=choice1) + 
  scale_color_manual(name='Choice',labels=c('Not churn', 'Churn')) +   
  theme(
    axis.title.x = element_text(face='bold', color='black', size=12),
    axis.title.y = element_text(face='bold', color='black', size=12),
    plot.title = element_text(face='bold', color='black', size=12),
    legend.position = c(1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Night calls', title='Relation of day calls and night calls')

# 2. plot relations of night calls and day calls

qplot(day_calls, night_calls, data = churnNum,geom = c("point", "smooth"),color=choice1) + 
  scale_color_manual(name='Choice',labels=c('Not churn', 'Churn')) +   
  theme(
    axis.title.x = element_text(face='bold', color='black', size=12),
    axis.title.y = element_text(face='bold', color='black', size=12),
    plot.title = element_text(face='bold', color='black', size=12),
    legend.position = c(1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Night calls', title='Relation of day calls and night calls')

# 3. plot direct relation between service calls and churn

qplot(service_calls, choice, data = churnNum, geom = c("point", "smooth"),color=choice) + 
theme(
  axis.title.x = element_text(face='bold', color='black', size=12),
  axis.title.y = element_text(face='bold', color='black', size=12),
  plot.title = element_text(face='bold', color='black', size=12),
  legend.position = c(0.1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Churns %', title='Relation of churns and day calls')

# 4. frequency of churns in day calls

qplot(day_calls, data = churn,geom = "histogram", fill=choice, binwidth=0.5) + 
  theme(
    axis.title.x = element_text(face='bold', color='black', size=12),
    axis.title.y = element_text(face='bold', color='black', size=12),
    plot.title = element_text(face='bold', color='black', size=12),
    legend.position = c(1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Number of churns', title='Frequency of churns in day calls')

# 5. frequency of churns in night calls

qplot(night_calls, data = churn,geom = "histogram",fill=choice, binwidth=0.5) +
theme(
  axis.title.x = element_text(face='bold', color='black', size=12),
  axis.title.y = element_text(face='bold', color='black', size=12),
  plot.title = element_text(face='bold', color='black', size=12),
  legend.position = c(1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Number of churns', title='Frequency of churns in night calls')

# 6. frequency of churns in night calls

qplot(day_calls,int_calls,data = churn,geom = "jitter",color=choice) +
  scale_color_brewer(palette = "Set1", name='Choice',labels=c('Not churn', 'Churn')) + 
  theme(
    axis.title.x = element_text(face='bold', color='black', size=12),
    axis.title.y = element_text(face='bold', color='black', size=12),
    plot.title = element_text(face='bold', color='black', size=12),
    legend.position = c(1,1), legend.justification = c(1,1)) + 
  labs(x='Day calls', y='Night calls', title='Relation of day calls and night calls')

detach(churn)

