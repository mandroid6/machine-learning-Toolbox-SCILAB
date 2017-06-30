clear
clc
// Importing necessary python libraries 
pyImport numpy;
np = numpy;
py = pyBuiltin();
pyImport pandas;
pd = pandas;
//pyImport matplotlib
//plt = matplotlib.pyplot;

function [result]= predict(X, coef, intercept)
    
    result = X.*coef + intercept
    
endfunction

// Importing the data set
data_X_train = pd.read_csv('data_X_train.csv');
data_X_test = pd.read_csv('data_X_test.csv');
data_y_train = pd.read_csv('data_y_train.csv');
data_y_test = pd.read_csv('data_y_test.csv');
X_train = data_X_train;
X_test = data_X_test;
y_train = data_y_train;
y_test = data_y_test;

//Below code currently not working

// Splitting the dataset into the Training set and Test set
//pyImport sklearn.cross_validation
//cv = sklearn.cross_validation;
//X_train, X_test, y_train, y_test = cv.train_test_split(X, y, test_size = 1/3, random_state = 0);


// Feature Scaling if required
// not necessary in current context

//pyImport sklearn.preprocessing
//pp = sklearn.preprocessing;
//
//sc_X = pp.StandardScaler();
//X_train = sc_X.fit_transform(X_train);
//sc_y = pp.StandardScaler();
//y_train = sc_y.fit_transform(y_train);

//fitting simple linear regression to the training set
pyImport sklearn.linear_model

lm = sklearn.linear_model;
regressor = lm.LinearRegression();
regressor.fit(X_train, y_train);

coefficients = regressor.coef_
intercepts = regressor.intercept_
//predicting the test set results
y_pred = regressor.predict(X_test);

X_train2 = [1.1,1.3,1.5,2,2.2,2.9,3,3.2,3.2,3.7,3.9,4,4,4.1,4.5,4.9,5.1,5.3,5.9,6]
y_train2 = [39343,46205,37731,43525,39891,56642,60150,54445,64445,57189,63218,55794,56957,57081,61111,67938,66029,83088,81363,93940]
y_train_pred = predict(X_train2,coefficients,intercepts)
plot(X_train2, y_train2,'*')
xlabel('Number of years of experience')
ylabel('Salary')
title('Salary Vs Experience')
plot(X_train2,y_train_pred)
