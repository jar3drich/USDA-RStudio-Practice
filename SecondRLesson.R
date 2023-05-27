library(tidyverse)
dat = read_csv('/Users/jared/Downloads/datasets/small_mammals.csv')
dat[2,3]
dat[20,c('taxonID','sex')]
dat$siteName
#Unique function gives list of unique data labels
unique(dat$siteName)
#Table function gives number for each unique label
table(dat$sex)
low_weight = filter(dat, weight < 10)
select(dat, taxonID, weight)
x = c(5.3,12.2,-8.6)
max(x)
x[2] = NA
x
max(x)
max(x,na.rm = TRUE)
dat %>%
  summarize(mean_weight = mean(weight),
      sd_weight = sd(weight))
dat %>%
  filter(!is.na(weight)) %>%
  summarize(mean_weight = mean(weight),
            sd_weight = sd(weight))
dat %>%
  filter(!is.na(weight)) %>%
  group_by(taxonID) %>%
  summarize(mean_weight = mean(weight),
            sd_weight = sd(weight))
dat %>%
  filter(!is.na(weight), taxonID == 'PELE') %>%
  group_by(sex, lifeStage) %>%
  summarize(n_individuals = n(),
            mean_weight = mean(weight),
            sd_weight = sd(weight))
dat %>%
  filter(!is.na(weight), taxonID == 'PELE') %>%
  mutate(weight_mg = weight * 1000) %>%
  group_by(siteName) %>%
  summarize(mean_weight = mean(weight_mg)) %>%
  arrange(mean_weight)
#Using functions to modify tables. In this case table 2 into table 1
table2_tidied = pivot_wider(table2, id_cols = c(country, year), names_from = type, values_from = count)
all.equal(table2_tidied, table1)

billboard
billboard_long = pivot_longer(billboard, cols = wk1:wk76, names_to = 'week', values_to = 'ranking')
billboard_long2 = pivot_longer(billboard, cols = -c(artist, track, date.entered), names_to = 'week', values_to = 'ranking')
