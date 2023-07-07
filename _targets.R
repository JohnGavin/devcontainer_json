library(targets)
library(brms)
library(stantargets)
path <- tempfile(pattern = "", fileext = ".stan")
tar_stan_example_file(path = path)
list(tar_target(zinb, read.csv("https://paul-buerkner.github.io/data/fish.csv")), 
    fit_cmdstanr = {
        zinbb <- tar_read(zinb)
        brm(count ~ persons + child + camper, data = zinbb, family = zero_inflated_poisson(), 
            backend = "cmdstanr")
    })
