library(tidyverse)
library(easystats)
library(lme4)
library(lmerTest)

maize = read_csv('/Users/jared/Downloads/datasets/pzm_maize.csv')
maize <- maize %>%
  mutate(
  yr=factor(yr),
  plot=factor(plot),
  block = factor(block)
  )

ggplot(maize, aes(y = yield, x = tillage, fill = cover.trt)) + facet_grid(location ~ yr) + geom_boxplot((position - position_dodge()) + theme_bw()

fit_maize = lmer(yield ~ tillage + cover.trt + tillage:cover.trt + (1|yr) + (1|location) + (1|block:location), data = maize)

barley_don = read_csv('/Users/jared/Downloads/datasets/barley_don.csv')
glimpse(barley_don)

ggplot(barley_don, aes(x = Variety, y = DON_ppm, fill = Fungicide)) + geom_boxplot(position = position_dodge()) + theme_bw()
fit_don = lmer(DON_ppm ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = barley_don)

fit_don_log = lmer(log(DON_ppm) ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = barley_don)

check_model(fit_don, check = c('homogeneity', 'qq'))
check_model(fit_don_log, check = c('homogeneity', 'qq'))
