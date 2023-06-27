library("rstan")
options(auto_write = FALSE, mc.cores = 1)
options()$brms.backend ; options()$auto_write ; options()$mc.cores ; options()$bspm.sudo

# Simulating some data
n     = 10
y     = rnorm(n,1.6,0.2)

# Running stan code
model = stan_model("./stan/stan_em_1.stan")
# Error in sink(type = "output") : invalid connection

fit = sampling(model,list(n=n,y=y),iter=200,chains=4)

print(fit)

params = extract(fit)

par(mfrow=c(1,2))
ts.plot(params$mu,xlab="Iterations",ylab="mu")
hist(params$sigma,main="",xlab="sigma")
