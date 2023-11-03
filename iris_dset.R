#libraries


#load dataset
iris <-datasets::iris
head(iris)

dim(iris)

table(iris$Species)

#descriptive stat
summary(iris)

#struture - datatype
str(iris)

#splitting data
set.seed(3033)
intrain <- createDataPartition(y = iris$Species, p = 0.7, list = FALSE)
training <- iris[intrain,]
testing <- iris[-intrain,]
dim(training)
dim(testing)




# model building - information gain
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
dtree_fit_info <- train(Species ~., data = training, method = "rpart",
                        parms = list(split = "information"),
                        trControl=trctrl,
                        tuneLength = 10)

prp(dtree_fit_info$finalModel, box.palette="Reds")


# model building - information gain
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
dtree_fit_info <- train(Species ~., data = training, method = "rpart",
                        parms = list(split = "information"),
                        trControl=trctrl,
                        tuneLength = 10)

prp(dtree_fit_info$finalModel, box.palette="Reds")

#testing 
test_pred_info<-predict(dtree_fit_info,newdata = testing)
confusionMatrix(test_pred_info,testing$Species)

# Classification_by_Gini_Coefficient
set.seed(3333)
dtree_fit_gini <- train(Species ~., data = training, method = "rpart",
                        parms = list(split = "gini"),
                        trControl=trctrl,
                        tuneLength = 10)
prp(dtree_fit_gini$finalModel,box.palette = "Blues")



