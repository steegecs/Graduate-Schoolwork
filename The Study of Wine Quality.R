red_wine <- read.csv("C:/Users/Chris Steege/Documents/Classes/Fall 2020/Statistical Methods/winequality-red.csv", header=FALSE, sep=';', skip=1)
colnames(red_wfine) <- c("fixed acidity","volatile acidity","citric acid","residual sugar","chlorides","free sulfur dioxide","total sulfur dioxide","density","pH","sulphates","alcohol","quality")

#Creating table of summary statistics
tmp <- do.call(data.frame, 
               list(mean = apply(red_wine, 2, mean), trim_mean = apply(red_wine, 2, function(x) mean(x, trim = .1)), 
                    sd = apply(red_wine, 2, sd),
                    median = apply(red_wine, 2, median),
                    min = apply(red_wine, 2, min),
                    max = apply(red_wine, 2, max),
                    n = apply(red_wine, 2, length)))
tmp

#Summary statistics for each plot
Fixed_acidity <- tmp[1,]
Volatile_acidity <- tmp[2,]
Citric_acid <- tmp[3,]
Residual_sugar <- tmp[4,]
Chlorides <- tmp[5,]
Free_sulfur <- tmp[6,]
Total_sulfur <- tmp[7,]
Density <- tmp[8,]
pH <- tmp[9,]
Sulphates <- tmp[10,]
Alcohol <- tmp[11,]
Quality <- tmp[12,]

#Visualizing the distribution 
hist(red_wine[,1], main="Histogram for fixed acidity")
hist(red_wine[,2], main="Histogram for voltatile acidity")
hist(red_wine[,3], main="Histogram for citric acid")
hist(red_wine[,4], main="Histogram for residual sugar")
hist(red_wine[,5], main="Histogram for chlorides")
hist(red_wine[,6], main="Histogram for free sulfur dioxide")
hist(red_wine[,7], main="Histogram for total sulfur dioxide")
hist(red_wine[,8], main="Histogram for density")
hist(red_wine[,9], main="Histogram for pH")
hist(red_wine[,10], main="Histogram for sulphates")
hist(red_wine[,11], main="Histogram for alcohol")
hist(red_wine[,12], main="Histogram for quality rating")

boxplot(red_wine[,1], main="Histogram for fixed acidity")
boxplot(red_wine[,2], main="Histogram for voltatile acidity")
boxplot(red_wine[,3], main="Histogram for citric acid")
boxplot(red_wine[,4], main="Histogram for residual sugar")
boxplot(red_wine[,5], main="Histogram for chlorides")
boxplot(red_wine[,6], main="Histogram for free sulfur dioxide")
boxplot(red_wine[,7], main="Histogram for total sulfur dioxide")
boxplot(red_wine[,8], main="Histogram for density")
boxplot(red_wine[,9], main="Histogram for pH")
boxplot(red_wine[,10], main="Histogram for sulphates")
boxplot(red_wine[,11], main="Histogram for alcohol")
boxplot(red_wine[,12], main="Histogram for quality rating")