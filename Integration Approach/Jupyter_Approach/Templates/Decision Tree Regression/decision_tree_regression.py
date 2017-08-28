# Regression Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
"""
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X= sc_X.fit_transform(X)
sc_y = StandardScaler()
y = sc_y.fit_transform(y)"""

# Fitting the Regression Model to the dataset
# Create your regressor here
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(criterion = "mse", random_state = 0)
regressor.fit(X, y)

# Predicting a new result
# add your own test sets
y_pred =  (regressor.predict(6.5))

# Score of prediction model
from sklearn.metrics import r2_score
# score = r2_score(y_test, y_pred)
score = 0

pickle.dump([y_pred, score, regressor.feature_importances_,regressor.max_features_,regressor.n_features_,regressor.n_outputs_ ,regressor.tree_],open( "attributes.p", "wb" ) )