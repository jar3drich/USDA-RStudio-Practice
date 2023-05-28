library(tidyverse)
library(lme4)
library(lmerTest)
library(easystats)

soilN_biomass = read_csv('/Users/jared/Downloads/datasets/soilN_biomass.csv')
summary(soilN_biomass)
#Scatterplot code
#ggplot(soilN_biomass, aes(x=soilN, y = biomass, color = field)) + geom_point(size = 1.5) + theme_bw()

lm_fit = lm(biomass ~ soilN, data = soilN_biomass)
summary(lm_fit)
lm_coefs = coef(lm_fit)
#ggplot(soilN_biomass, aes(x=soilN, y = biomass, color = field)) + geom_point(size = 1.5) + theme_bw() + geom_abline(intercept = lm_coefs[1], slope=lm_coefs[2], size = 1)

mm_fit = lmer(biomass ~ soilN + (1|field), data = soilN_biomass)
mm_fit_randomslopes = lmer(biomass ~ soilN + (soilN|field), data = soilN_biomass)
check_model(mm_fit_randomslopes)
summary(mm_fit_randomslopes)

ranef(mm_fit_randomslopes)
fixef(mm_fit_randomslopes)
coef(mm_fit_randomslopes)

anova(mm_fit_randomslopes)

fert_biomass = read_csv("/Users/jared/Downloads/datasets/fertilizer_biomass.csv") %>%
  mutate(treatment = factor(treatment, levels = c('control', 'low', 'high')))

fert_mm = lmer(biomass ~ treatment + (1|field) , data = fert_biomass)
summary(fert_mm)
fert_mm_slopes = lmer(biomass ~ treatment + (treatment | field), data = fert_biomass)
ranef(fert_mm_slopes)
VarCorr(fert_mm_slopes)
