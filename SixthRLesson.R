library(tidyverse)
library(lme4)
library(emmeans)
library(multcomp)

fert_biomass = read_csv('/Users/jared/Downloads/datasets/fertilizer_biomass.csv') %>%
  mutate(treatment = factor(treatment, levels = c('control', 'low', 'high')))
fert_mm = lmer(biomass ~ treatment + (1|field), data = fert_biomass)

#Estimated marginal means (emm)
fert_emm = emmeans(fert_mm, ~ treatment)
plot(fert_emm)
contrast(fert_emm, method = 'pairwise')
contr_sidak = contrast(fert_emm, method = 'pairwise', adjust = 'sidak')
plot(contr_sidak) + geom_vline(xintercept = 0, linetype = 'dashed', linewidth = 1)

cld(fert_emm, adjust = 'sidak')
cld(fert_emm, adjust = 'sidak', Letters = letters)

contrast(fert_emm, method = 'trt.vs.ctrl')

cld(fert_emm, adjust = 'sidak')
cld(fert_emm, adjust = 'sidak', Leters = letters)

emmeans(glmm_borers, ~ trt)
emm_borers = emmeans(glmm_borers, ~ trt, type = 'response')

contrast(emm_borers, method = 'pairwise', adjust = 'sidak')

fish_fillets = read_csv('/Users/jared/Downloads/datasets/fish_fillets.csv')
fit_fillets = lmer(thickness ~ species + prep + species:prep + (1|fishID), data = fish_fillets)

emm_species = emmeans(fit_fillets, ~ species)
emm_prep <- emmeans(fit_fillets, ~ prep)

emm_species_x_prep <- emmeans(fit_fillets, ~ species + prep)
cld(emm_species_x_prep, adjust = 'sidak', Letters = letters)
emm_prep_within_species <- emmeans(fit_fillets, ~ prep | species)
cld(emm_prep_within_species, adjust = 'sidak', Letters = letters)
