

rm(list=ls())

beta_0 = 1
beta_1 = 1

n = 500 #표본의 크기
N = 1000 #반복 횟수

m_i = sample(3:10,n,replace=T)
beta_est = matrix(0, nrow = N, ncol = 2) 
for(i in 1:N){
  x_i = 1:n
  e_i =sapply(1:n, function(j)   runif(1,-m_i[j], m_i[j]))# sapply(1:n, function(j) rt(1,df=m_i[j]))
  y_i = beta_0 + beta_1*x_i + e_i
  beta_est[i,] = lm(y_i~x_i)$coefficients
}

hist(beta_est[,1], breaks = 100,main="est of beta_0, unif(-m_i,m_i)")
inhist(beta_est[,2], breaks = 100, main="est of beta_1, unif(-m_i,m_i)")
