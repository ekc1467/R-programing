# EDA: Expoling the Data

# Load preprocessed data
processed <- read.csv('./full.processed.csv')
processed
head(processed)
train <- processed[!is.na(Survived), ]
test <- processed[is.na(Survived), ]

# Pclass .vs. Survived
ggplot(train, 
       aes(x = Pclass, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$Pclass, mean)

# NumCabin .vs. Survived
ggplot(train, 
       aes(x = NumCabin, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$NumCabin, mean)

# Gender .vs. Survived
ggplot(train, 
       aes(x = Gender, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$Gender, mean)

# Title .vs. Survived
ggplot(train, 
       aes(x = Title, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$Title, mean)

# NumFamily .vs. Survived
ggplot(train, 
       aes(x = NumFamily, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$NumFamily, mean)

# Embarked .vs. Survived
ggplot(train, 
       aes(x = Embarked, 
           fill = factor(Survived))) +
  geom_histogram(stat = 'count')

tapply(train$Survived, train$Embarked, mean)

# Age .vs. Survived
ggplot(train, 
       aes(x = Age, 
           fill = factor(Survived))) +
  geom_histogram()

tapply(train$Age, train$NumFamily, mean)

# age interval
intervals <- hist(train$Age, 10, plot = F)
intervals
cuts <- cut(train$Age, intervals$breaks)
cuts
rate <- tapply(train$Survived, cuts, mean)
rate
df1 <- data.frame(names(rate), rate)
df1
par(mfrow = c(1, 1))
barplot(df1$rate, xlab = 'Age', ylab = 'survival rate')

# Fare .vs. Survived
ggplot(train, 
       aes(x = Fare, 
           fill = factor(Survived))) +
  geom_histogram()

tapply(train$Age, train$Fare, mean)

# age interval
intervals <- hist(train$Fare, 10, plot = F)
intervals
cuts <- cut(train$Fare, intervals$breaks)
cuts
rate <- tapply(train$Survived, cuts, mean)
rate
df1 <- data.frame(names(rate), rate)
df1
par(mfrow = c(1, 1))
barplot(df1$rate, xlab = 'Fare', ylab = 'survival rate')

