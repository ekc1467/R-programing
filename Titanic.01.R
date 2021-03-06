# Titanic: Machine Learning from Disaster

# for (reproducible) random number generation 
set.seed(0)

getwd()
setwd("D:/")
getwd()# read train data
train <- read.csv('./train.csv', stringsAsFactors = F)
train
head(train)
str(train)
summary(train)

# read test data

test <- read.csv('./test.csv', stringsAsFactors = F)
test
head(test)
str(test)
summary(test)

# make a full dataset

test$Survived <- NA
full <- rbind(train, test)
full
head(full)
str(full)
summary(full)
tail(full)
#View(full)

# Rename Sex to Gender

renamed <- names(full)
renamed[5] <- 'Gender'
renamed
names(full) <- renamed
names(full)
str(full)

# Write intermediate result

write.csv(full, './full.merged.csv', row.names = F)

# Are there missing values?
attach(full)
any(is.na(PassengerId))
any(is.na(Survived))
any(is.na(Pclass))
any(is.na(Name))
any(is.na(Gender))
any(is.na(Age))
any(is.na(SibSp))
any(is.na(Parch))
any(is.na(Ticket))
any(is.na(Fare))
any(is.na(Cabin))
any(is.na(Embarked))

# How many missing values?

which(is.na(Age))
length(which(is.na(Age)))
which(is.na(Fare))

# Handling missing values 1: Fare

#install.packages('ggplot2')
library(ggplot2)

full[PassengerId == 1044, ]
df1 <- full[Embarked == 'S' & Pclass == 3, ]
str(df1)
ggplot(df1,
       aes(x = Fare)) + 
  geom_density(
    colour = 'blue', 
    fill = 'green', 
    alpha = 0.4)
summary(df1)
ggplot(df1,
       aes(x = Fare)) + 
  geom_density(
    colour = 'blue', 
    fill = 'green', 
    alpha = 0.4
  ) +
  geom_vline(
    aes(xintercept = median(Fare, na.rm = T)),
    colour = 'red',
    linetype = 'dashed', 
    lwd = 1
  ) +
  geom_vline(
    aes(xintercept = mean(Fare, na.rm = T)),
    colour = 'blue',
    linetype = 'dashed', 
    lwd = 1
  )

# Now, fill the fare with median value

full$Fare[1044] <- median(df1$Fare, na.rm = T)
full$Fare[1044]
which(is.na(full$Fare))

# Handing missing value 2: Age

n <- length(which(is.na(full$Age)))
n
existing_ages <- na.omit(full$Age)
existing_ages
rand_ages <- sample(existing_ages, n)
rand_ages

full[is.na(full$Age), ]$Age <- rand_ages
which(is.na(full$Age))

# Is it fair?

par(mfrow = c(1, 2))
hist(existing_ages, 
     main = 'Before', 
     col = 'green')
hist(full$Age, 
     main = 'After', 
     col = 'blue')

# Handling Missing Values 3: Embarked

full[Embarked == '', ]
table(full$Embarked)
full[Embarked == '', ]$Embarked <- 'S'
table(full$Embarked)

# Handling missing values 4: Cabin

full$Cabin
cabin <- full$Cabin
n <- length(cabin)
numcabin <- vector(length = n)
for (i in 1:n) {
  if (cabin[i] != '') {
    cab <- unlist(strsplit(cabin[i], ' '))
    numcabin[i] <- length(cab)
  }
}

table(numcabin)
full$NumCabin <- numcabin

# Other preprocessing 1: Name
full$Name
name <- full$Name
n <- length(name)
title <- vector(length = n)
for (i in 1:n) {
  lastname = unlist(strsplit(name[i], ', '))[2]
  title[i] = unlist(strsplit(lastname, '. '))[1]
}

table(title)
title[title != 'Master' &
      title != 'Miss' &
      title != 'Mr' &
      title != 'Mrs'] <- 'Other'
table(title)
full$Title <- title

# Other preprocessing 2: Sibsp & Parch
full$NumFamily <- full$SibSp + full$Parch

processed <- full[c(1, 2, 3, 5, 6, 10, 12, 13, 14, 15)]
# Write preprocessed result
write.csv(processed, './full.processed.csv', row.names = F)

