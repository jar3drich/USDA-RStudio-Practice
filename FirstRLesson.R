#this is a comment
log(1000)
sin(pi)
my_name = 'Jared'
paste('Hello', my_name)
plot(mpg ~ hp, data = mtcars)
rep(0, 100)
seq(from = 1, to = 100, by = 1)
c('a','b','c','d','e','f','g')
letters[1:7]
letters[c(1,18,19)]
c(100, 5.232, 'missing value', 12)
#factor takes out levels of a list of values
treatment = factor(c('low', 'low','medium','medium','high','high'))
treatment = factor(treatment,levels=c('low','medium','high'))
x==7
x==y
c(1,5,6,7) %in% x
x %in% c(1,5,6,7)
set.seed(123)
random_numbers = rnorm(n=1000, mean=0, sd=1)
#head only prints the first few values of a vector
head(exp(random_numbers))
length(random_numbers)
mean(random_numbers)
median(random_numbers)
sd(random_numbers)
range(random_numbers)
quantile(random_numbers, probs = c(0.025,.5,.975))
library(cowsay)
cowsay::say("Learning R from a chicken!", by='chicken')
