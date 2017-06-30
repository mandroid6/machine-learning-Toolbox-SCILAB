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
data_X_train = pd.read_csv('x_train.csv');
data_X_test = pd.read_csv('x_test.csv');
data_y_train = pd.read_csv('y_train.csv');
data_y_test = pd.read_csv('y_test.csv');
x_train = data_X_train;
x_test = data_X_test;
y_train = data_y_train;
y_test = data_y_test;



// Feature Scaling if required
// not necessary in current context

//pyImport sklearn.preprocessing
//pp = sklearn.preprocessing;
//
//sc_X = pp.StandardScaler();
//X_train = sc_X.fit_transform(X_train);
//sc_y = pp.StandardScaler();
//y_train = sc_y.fit_transform(y_train);

pyImport sklearn.preprocessing 
pp = sklearn.preprocessing 
labelencoder_X = pp.LabelEncoder()
X_train1 = labelencoder_X.fit_transform(x_train)
onehotencoder = pp.OneHotEncoder(categorical_features = [3])
X_train = onehotencoder.fit_transform(X_train1).toarray()

X_test1 = labelencoder_X.fit_transform(x_test)
onehotencoder = pp.OneHotEncoder(categorical_features = [3])
X_test = onehotencoder.fit_transform(X_test1).toarray()

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
