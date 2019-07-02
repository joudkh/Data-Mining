# Decision Trees with Package party

# The iris Data
str(iris)


# split data into two subsets: training (70%) and test (30%); set
# a fixed random seed to make results reproducible
set.seed(1234)

ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))

train.data <- iris[ind == 1, ]
test.data <- iris[ind == 2, ]


# Build a ctree
# Control the training of decision trees: MinSplit, MinBusket,
#    MaxSurrogate and MaxDepth
# Target variable: Species
# Independent variables: all other variables

library(party)


myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width


iris_ctree <- ctree(myFormula, data = train.data)





# check the prediction
trainPred <- predict(iris_ctree, newdata = train.data)
trainPred
table(trainPred, train.data$Species)



# predict on test data
testPred <- predict(iris_ctree, newdata = test.data)
testPred
table(testPred, test.data$Species)





print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree, type = "simple")