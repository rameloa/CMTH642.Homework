#Question 1
x <- c(6, 8, 2, 4, 4, 5)
y <- c(7, 10, 4, 3, 5, 6)

Wilcoxon rank sum test (or Mann-Whitney U-test) is used to compare the means of 
two groups that do not follow a normal distribution: it is a non-parametrical test. 
It is the equivalent of the t test, applied for independent samples.

wilcox.test(x,y, correct=FALSE)
data: x and y
W = 14, p-value = 0.5174
alternative hypothesis: true location shift is not equal to 0

The p-value is greater than 0.05, then we can accept the hypothesis H0 of statistical 
equality of the means of two groups. 

If you run wilcox.test(y, x, correct = FALSE), the p-value would be logically the same:

wilcox.test(y, x, correct=FALSE)

data: y and x
W = 22, p-value = 0.5174
alternative hypothesis: true location shift is not equal to 0

The value W is so computed:

sum.rank.x = sum(rank(c(x,y))[1:6]) #sum of ranks assigned to the group a
W = sum.rank.x – (length(x)*(length(x)+1)) / 2
W
[1] 14

sum.rank.y = sum(rank(c(x,y))[7:12]) #sum of ranks assigned to the group b
W = sum.rank.y – (length(y)*(length(y)+1)) / 2 
W
[1] 22

We can compare the intervals tabulated on the tables of Wilcoxon 
for independent samples. The tabulated interval for two groups of 6 samples 
each is (26, 52). Please see the table provided to you in the course shell. 
The interval of our samples is:

sum(rank(c(a,b))[1:6]) #sum of ranks assigned to the group a
[1] 35
sum(rank(c(a,b))[7:12]) #sum of ranks assigned to the group b
[1] 43

Since the computed interval (35, 43), is contained within the tabulated interval 
(26, 52), we conclude by accepting the hypothesis H0 of equality of means.

http://statistic-on-air.blogspot.ca/2009/07/wilcoxon-mann-whitney-rank-sum-test-or.html

Please note that if you have two identical values in your data, these are called ties. 
So the ranks are not unique and the exact p-values cannot be calculated. 

Please also note the following parameters:
paired: a logical indicating whether you want a paired test.
exact: a logical indicating whether an exact p-value should be computed.
correct: a logical indicating whether to apply continuity correction in the normal approximation for the p-value.

https://stat.ethz.ch/R-manual/R-devel/library/stats/html/wilcox.test.html

#Question 2

#A) Are these two groups of sampling paired or independent?
#   It is clear that the two groups are paired, 
#   because there is a bond between the readings, 
#   consisting in the fact that we are considering the same lake 
#   albeit in two different days.
a <- c(214, 159, 169, 202, 103, 119, 200, 109, 132, 142, 194, 104, 219, 119, 234)
b <- c(159, 135, 141, 101, 102, 168, 62, 167, 174, 159, 66, 118, 181, 171, 112)

#B)
wilcox.test(a,b, paired=TRUE)

[1] V = 80, p-value = 0.2769
Since the p-value is greater than 0.05, we conclude that the means have remained 
essentially unchanged (we accept the null hypothesis H0), then banning the boat rental 
for a single day did not lead to any improvements in terms of pollution of the lake.

The value V = 80 corresponds to the sum of ranks assigned to the differences with positive sign.
We can calculate the sum of ranks assigned to the differences with positive sign,
and the sum of ranks assigned to the differences with negative sign,
to compare this interval with the interval tabulated on the tables of Wilcoxon for paired samples,
and confirm our statistic decision. Here’s how to calculate the two sums.

#C)
diff <- c(a - b) #Calculating the vector containing the differences
diff <- diff[ diff!=0 ] #delete all differences equal to zero
diff.rank <- rank(abs(diff)) #check the ranks of the differences, taken in absolute
diff.rank.sign <- diff.rank * sign(diff) #check the sign to the ranks, recalling the signs of the values of the differences
ranks.pos <- sum(diff.rank.sign[diff.rank.sign > 0]) #calculating the sum of ranks assigned to the differences as a positive, ie greater than zero
ranks.neg <- -sum(diff.rank.sign[diff.rank.sign < 0]) #calculating the sum of ranks assigned to the differences as a negative, ie less than zero
ranks.pos #it is the value V of the wilcoxon signed rank test
ranks.neg

We accept the null hypothesis H0 of equality of the means. 
As predicted by the p-value, banning bout rental 
did not bring any improvements in terms of rate of pollution.

#Question 3

zip <- c(10, 44, 65, 77, 43, 44, 22, 66, 50, 100, 55, 99, 44, 23, 100, 88, 200, 220, 110, 551)
tar <- tar <- c(20, 55, 75, 60, 55, 88, 35, 33, 35, 80, 65, 82, 47, 35, 97, 110, 250, 190, 111, 600)

#A: Paired, as the runtime is calculated based on archiving the same files.

#B
plot(density(zip)) #not normal
plot(density(tar)) #not normal

#C
wilcox.test(zip,tar, paired=TRUE)

V = 85.5, p-value = 0.4779
p-value > 0.05
We accept the null hypothesis H0 of equality of the means. 
