rm(list=ls())

rmixnorm = function(n, mu=3, sd=1){
  rnorm(n, sample(c(-1,1),n, replace=T)*mu, sd=sd)
}
n=100 
N = 1000  
#rmixnorm(n)

beta0 = 1
beta1 = 1

# regression_prediction interval
beta_est = matrix(0, nrow=N, ncol=2)
count_pi = count_pi2= 0
xnew=50
for(i in 1:N){
  x = 1:n
  e = rmixnorm(n)
  y = beta0 + beta1*x + e
  fit = lm(y~x)
  beta_est[i,] = fit$coefficients
  
  mean_resp = beta0 + beta1*xnew
  ynew =  mean_resp + rmixnorm(1)
  pi = predict(fit, data.frame(x=xnew), interval = "prediction")
  count_pi = count_pi + as.numeric(( pi[2]<= ynew) & ( pi[3]>= ynew))
  
  loo = resid(fit)/(1-hatvalues(fit))
  jk_pi = c(predict(fit, data.frame(x=xnew))+ quantile(r_i, 0.025),
            predict(fit, data.frame(x=xnew))+ quantile(r_i, 0.975))
  
  
  count_pi2 = count_pi2 + as.numeric(( jk_pi[1]<= ynew) & ( jk_pi[2]>= ynew))
}

# jackknife_prediction interval
jknife = matrix(0, nrow=n, ncol=2) 
jknife_pi = function(x, y){
  for(i in 1:n){
    
    x = 1:n
    x_i = x[-i]
    y_i = y[-i]
    fit1 = lm(y_i~x_i)
    jknife[i,] = fit1$coefficients
    
    r_i = y - (jknife[,1] + jknife[,2]*x)
    quantile(r_i)
    
  }
  jk_pi = c(mean_resp + quantile(r_i, 0.025),
            mean_resp + quantile(r_i, 0.975))
  return(jk_pi)
  
}

jknife_pi_linreg = function(x, y){
  llo = resid(fit)/(1-hatvalues(fit))
  jk_pi = c(mean_resp + quantile(r_i, 0.025),
            mean_resp + quantile(r_i, 0.975))
  return(jk_pi)
  
}


t1  = Sys.time()
r_i = c()
for(i in 1:n){
  
  x_i = x[-i]
  y_i = y[-i]
  fit1 = lm(y_i~x_i)
  coefs= fit1$coefficients
  
  r_i = c(r_i, y[i] - ( coefs[1] +  coefs[2]*x[i]))
  
  
}
t2  = Sys.time()
t2-t1

t1  = Sys.time()
llo = resid(fit)/(1-hatvalues(fit))
t2 = Sys.time()
t2-t1
head(llo)
head(r_i)
