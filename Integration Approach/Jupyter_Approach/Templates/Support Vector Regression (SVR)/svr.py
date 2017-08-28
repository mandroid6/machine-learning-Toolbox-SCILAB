
# Importing the libraries
import numpy as np
import pickle
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values


# Splitting the dataset into the Training set and Test set
"""not splitting into test and training becaue we have less number of data 

#from sklearn.cross_validation import train_test_split
#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
"""
# most libraries automatically scale the features when fitting is done
# Feature Scaling is required as svm doesn't automaticcaly do it
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X = sc_X.fit_transform(X)
sc_y = StandardScaler()
y = sc_y.fit_transform(y)


# Fitting SVR Tto the dataset
# create our regressor
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(X, y) #SINCE PROBLEM is non linear we are using poly or rbf kernel



#predicting a new result with Polynomial Regression
y_pred = sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([6.5])))) # since the regressor is feature scaled so we also need to feature scale 6.5
# now to get the real value of y_pred we need to inverse the scaler transform on y_pred

pickle.dump([y_pred, regressor.intercept_, regressor.support_, regressor.support_vectors_, regressor.dual_coef_],open( "attributes.p", "wb" ) )    