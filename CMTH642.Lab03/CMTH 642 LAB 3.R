
CMTH 642 LAB 3

Preparation:
install.packages("ISwR")
library(ISwR)
  
We will first compare the means of the variable of interest across groups by side-by-side boxplots.
plot(response ~ factor, data=data_name)
where "response" is the name of the response variable and "factor" the variable 
that separates the data into groups. Both variables should be contained in a data frame 
called data_name.

EXAMPLE:
A drug company tested three formulations of a pain relief medicine for migraine 
headache sufferers. For the experiment 27 volunteers were selected and 9 were randomly 
assigned to one of three drug formulations. The subjects were instructed to take the drug 
during their next migraine headache episode and to report their pain on a scale of 
1 to 10 (10 being most pain).

Drug A 4 5 4 3 2 4 3 4 4
Drug B 6 8 4 5 4 6 5 8 6
Drug C 6 7 6 6 7 5 6 5 5

pain = c(4, 5, 4, 3, 2, 4, 3, 4, 4, 6, 8, 4, 5, 4, 6, 5, 8, 6, 6, 7, 6, 6, 7, 5, 6, 5, 5) 
drug = c(rep("A",9), rep("B",9), rep("C",9)) 
migraine = data.frame(pain,drug)
migraine
plot(pain ~ drug, data=migraine)

From the boxplots it appears that the mean pain for drug A is lower than that for
drugs B and C. Next, aov() can be used for fitting ANOVA models. The general
form is 
aov(response ~ factor, data=data_name)
where "response" represents the response variable and "factor" the variable that
separates the data into groups. 

results = aov(pain ~ drug, data=migraine)
summary(results)

The F-statistic is 11.91 with a p-value equal to 0.0003. We clearly reject the null 
hypothesis of equal means for all three drug groups. 

The ANOVA F-test answers the question whether there are significant
differences in the population means. However, it does not provide us with any
information about how they differ. Therefore when you reject H0 in ANOVA,
additional analyses are required to determine what is driving the difference in
means. The function pairwise.t.test computes the pair-wise comparisons
between group means with corrections for multiple testing. The general form is

pairwise.t.test(reponse, factor, p.adjust = method, alternative = c("two.sided",
"less", "greater"))
Here response is a vector of observations (the response variable), factor a list of
factors and p.adjust is the correction method (e.g., “Bonferroni”).

pairwise.t.test(pain, drug, p.adjust="bonferroni")
The results state that the difference in means is not significantly different
between drugs B and C (p-value = 1.00), but both are significantly different from
drug A (p-values = 0.00119 and 0.00068, respectively). Hence, we can conclude
that the mean pain is significantly different for drug A.

Exercise 1
We will use the anova() function to perform ANOVA test in R. This function accepts a 
model object as input which corresponds a set of values based on a factor column 
as our treatment variable. Generally, if the measurements and treatments are in a 
dataframe called ‘our_data’ we will use lm function to create this model as:

fit_model = lm(measurements ~ treatments, data= our_data)

for two-way ANOVA this model would be based on both treatments and blocks:

fit_model = lm(measurements ~ treatments + blocks, data= our_data)

Below, there are three groups with seven observations per group:
group1 = c(18.2, 20.1, 17.6, 16.8, 18.8, 19.7, 19.1) 
group2 = c(17.4, 18.7, 19.1, 16.4, 15.9, 18.4, 17.7) 
group3 = c(15.2, 18.8, 17.7, 16.5, 15.9, 17.1, 16.7)

Perform the ANOVA test on the data by:
1. Create a dataframe with two columns, ‘observation’ and ‘group’. 
2. Fit a linear model for observations based on groups.
3. Apply anova function on the fit model.

Exercise 2
1. Load the ISwR library and look at the red.cell.folate data. Get help on this data 
and read the description. This gives you more domain knowledge about the data. 
2. Investigate if different methods of ventilation during anesthesia has any effect 
on the red folates. 

Exercise 3:
1. Load juul dataset and have a look at the data and its descriptions.
2. Investigate if Tanner levels have any significant effect on amount of insulin-like 
growth factor igf1.

Exercise 4:
The heart.rate data frame contains data for nine patients with congestive heart failure 
before and shortly after administration of enalaprilat. Column hr is the patient heart 
rate, column subject has the subject ids and column time indicates time between 
administration of enalaprilat and measuring the heart rate. By performing a two-way ANOVA, 
investigate if time (or subject) has any effect on the heart rates. 





References:
http://www.stat.columbia.edu/~martin/W2024/R3.pdf



