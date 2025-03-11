rm(list=ls())

beta0 = 1
beta1 = 1

n=100
N = 1000 #반복 

beta_est = matrix(0, nrow=N, ncol=2) ; beta_est #beta_0, beta_1 hat
pre_list = matrix(0, nrow=N, ncol=3) ; pre_list
conf_list = matrix(0, nrow=N, ncol=3) ; conf_list

count_ci = count_pi = 0
xnew=50
for(i in 1:N){
  x = 1:n
  e = runif(n,-1,1)
  y = beta0 + beta1*x + e
  fit = lm(y~x)
  beta_est[i,] = fit$coefficients
  
  mean_resp = beta0 + beta1*xnew
  ynew =  mean_resp + runif(1,-1,1)
  pi = predict(fit, data.frame(x=xnew), interval = "prediction")
  count_pi = count_pi + as.numeric(( pi[2]<= ynew) & ( pi[3]>= ynew))
  
  ci = predict(fit, data.frame(x=xnew), interval = "confidence")
  count_ci = count_ci +  as.numeric(( ci[2]<= mean_resp ) & ( ci[3]>= mean_resp ))
  
}
head(pre_list)
head(conf_list) 
pi
ci
# 예측구간이 신뢰구간보다 긴 것을 확인할 수 있다.

df_pre = as.data.frame(pre_list)
df_conf = as.data.frame(conf_list)

col = NA
df_pre = cbind(df_pre,col) ; df_pre
df_conf = cbind(df_conf,col) ; df_conf

for(i in 1:N){
  df_pre$col[df_pre[i,1]>=df_pre[i,2] & df_pre[i,1]<=df_pre[i,3]] = TRUE
  df_conf$col[df_conf[i,1]>=df_conf[i,2] & df_conf[i,1]<=df_conf[i,3]] = TRUE
}
df_pre
df_conf

sum(df_pre$col==TRUE)
sum(df_conf$col==TRUE)

isFALSE(df_pre) # 모든 y*이 예측구간 안에 존재함 
isFALSE(df_conf)
