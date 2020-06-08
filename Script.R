library(dplyr)

# load data
data(cars)
head(cars)

# store and display linear regression
vect <- lm(formula=dist ~.,data=cars)
# summary(cars)
# names(cars)
# y=3.932x-17.579


# order data by speed
df <- cars %>% mutate(speed = factor(speed, ordered = TRUE))
anova_one_way <- aov(dist~., data = df)
summary(anova_one_way)
TukeyHSD(anova_one_way)
# glimpse(df)
# levels(df$speed)

# df %>%
# 	group_by(speed) %>%
# 	summarise(
# 		count_speed = n(),
# 	)
# 
# ggplot(df, aes(x = speed, y = dist, fill = speed)) +
# 	geom_boxplot() +
# 	geom_jitter(shape = 15,
# 				color = "steelblue",
# 				position = position_jitter(0.21)) +
# 	theme_classic()



url <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv"
df1 <- read.csv(url)

