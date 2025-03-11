## 균일분포

beta_0 = 1
beta_1 = 1

n = 300 #표본의 크기
N = 1000 #반복 횟수

beta_est = matrix(0, nrow = N, ncol = 2) 
for(i in 1:N){
  x = 1:n
  e = runif(n,-100,100)
  y = beta_0 + beta_1*x + e
  beta_est[i,] = lm(y~x)$coefficients
}

hist(beta_est[,1], breaks = 100, main="est of beta_0, unif(-100,100)")
plot(y~x)
hist(beta_est[,2], breaks = 100, main="est of beta_1, uinf(-100,100)")
