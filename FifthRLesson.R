library(tidyverse)
library(lme4)
library(easystats)

disease <- read_csv('/Users/jared/Downloads/datasets/disease.csv')

disease %>%
  group_by(inoc, pen) %>%
  summarise(no_disease = sum(disease == 0), disease = sum(disease == 1))

lmm_disease <- lmer(disease ~ inoc + (1|pen), data = disease)
check_model(lmm_disease)

glmm_disease <- glmer(disease ~ inoc + (1|pen), data = disease, family = binomial(link = 'logit'))
check_model(glmm_disease)
summary(glmm_disease)
plogis(1.39)
plogis(1.39 - 3.37)

data('stirret.borers', package = 'agridat')
#stirret.borers = read_csv('/Users/jared/Downloads/datasets/stirret.borers.csv')
borer_means = stirret.borers %>%
  group_by(trt) %>%
  summarise(count2_mean = mean(count2))

stirret.borers <- stirret.borers %>%
  mutate(trt = factor(trt, levels = c('None', 'Early', 'Late', 'Both')))

lmm_borers <- lmer(count2 ~ trt + (1|block), data = stirret.borers)
glmm_borers <- glmer(count2 ~ trt + (1|block), data = stirret.borers, family = poisson(link = 'log'))
check_model(lmm_borers)
check_model(glmm_borers)

exp(3.42)
exp(3.42 - 0.24)
