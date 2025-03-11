beta0 = 1
beta1 = 1

n_list = c(30, 100)
n=1000

B = 1000

beta_est = matrix(0, nrow=B, ncol=2)

for(b in 1:B){
  x = 1:n
  y = beta0 + beta1*x + runif(n, -1000, 1000)
  lm_obj = lm(y~x)
  beta_est[b,] = lm_obj$coefficients
  
}



hist(beta_est[,2],breaks=100,main ="estimation of beta0")

?hist
