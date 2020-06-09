library(dplyr)

# Load iris dataset
data(iris)
# Display Dataset (short)
head(iris,3)
tail(iris,3)
summary(iris)
group_by(iris, Species) %>% 
	summarise(count = n(),mean = mean(Petal.Length, na.rm = TRUE),sd = sd(Petal.Length, na.rm = TRUE))


# Hypothesis Testing
# Our null hypothesis is that the mean Sepal Length of species versicolor and setosa is equal:
# Extract data into separate data frames
versi   <- filter(iris, Species=="versicolor")
setos   <- filter(iris, Species=="setosa")
# Store Result of T test
TResult <- t.test(versi$Sepal.Length, setos$Sepal.Length)
#Display the Hypothesis Result
TResult

# Linear Regression
# Store Result of Linear Regression Model
LResult <- iris %>% select(-Species) %>% lm(formula=Sepal.Length ~.)
#Summarize and display the Linear Regression Model
summary(LResult)

# ANOVA Testing
# Store Result of ANOVA Test
AResult <- iris %>% aov(formula = Petal.Length ~ Species)
#Summarize and display the ANOVA Result
summary(AResult)
TukeyHSD(AResult)
