library(targets)
library(cmdstanr)
check_cmdstan_toolchain(fix = TRUE, quiet = TRUE)
cmdstan_version()
library(brms)
library(stantargets)
aa <- tar_target(group, rep(c("treat", "placebo"), each = 30))
bb <- tar_target(symptom_post, c(rnorm(30, mean = 1, sd = 2), 
    rnorm(30, mean = 0, sd = 1)))
cc <- tar_target(dat1, data.frame(group, symptom_post))
dd <- tar_target(fit1, brm(bf(symptom_post ~ group, sigma ~ group), 
    data = dat1, family = gaussian(), backend = "cmdstanr"))
list(aa, bb, cc, dd)
