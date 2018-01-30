
#Question 1
set.seed(0)
treeVolume <- c(rnorm(75, mean = 36500, sd = 2000))
t.test(treeVolume, mu = 39000) # Ho: mu = 39000

#Question 2
results = c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)
mean(results)
sd(results)
t.test (results, mu=75)

#Question 3
bottles <- c(484.11,459.49,471.38,512.01,494.48,528.63,493.64,485.03,473.88,501.59,502.85,538.08,465.68,495.03,475.32,529.41,518.13,464.32,449.08,489.27)
mean(bottles)
sd(bottles)
t.test(bottles, mu=500, alternative="less", conf.level=0.99)

#Question 4
x = c(0.593,0.142,0.329,0.691,0.231,0.793,0.519,0.392,0.418) 
t.test(x, alternative="greater", mu=0.3) 

#Question 5
automatic = mtcars$am == 0 
mpg.auto = mtcars[automatic,]$mpg 
mpg.auto 
mpg.manual = mtcars[!automatic,]$mpg 
mpg.manual
t.test(mpg.auto, mpg.manual)

#Question 6
High.protein<- c(134,146,104,119,124,161,107,83,113,129,97,123)
Low.protein<- c(70,118,101,85,107,132,94)
t.test(High.protein,Low.protein)
t.test(High.protein,Low.protein,var.equal=TRUE)

#Question 7
install.packages('MASS')
library(MASS)
ttest <- t.test(immer$Y1, immer$Y2, paired=TRUE) 
names(ttest)
st <- ttest$statistic
pvalue <- ttest$p.value

#Question 8
s <- c(25, 32, 18, 20)
chisq.test(s)
