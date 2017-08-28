# -*- coding: utf-8 -*-
"""
Created on Wed Aug 09 19:18:34 2017

@author: Mandar
"""


# Data Preprocessing

# Importing the libraries
import numpy as np
import pandas as pd
import os
from keras.models import model_from_json
# Importing the dataset
dataset = pd.read_csv('Churn_Modelling.csv')
X = dataset.iloc[:, 3: 13].values
y = dataset.iloc[:, 13].values

# Encoding the categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X_1 = LabelEncoder()
X[:, 1] = labelencoder_X_1.fit_transform(X[:, 1])
labelencoder_X_2 = LabelEncoder()
X[:, 2] = labelencoder_X_2.fit_transform(X[:, 2])
onehotencoder = OneHotEncoder(categorical_features = [1])
X = onehotencoder.fit_transform(X).toarray()

# removing one dummy variable 
X = X[:, 1:]

# Splitting the dataset into the Training set and Test set
# cross_validation has been replaced by  model_selection
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)



# Now we are making the ANN
#importing the keras library
import keras
from keras.models import Sequential
from keras.layers import Dense

# Initializing the ANN
classifier = Sequential()

#Adding the input layer and the first hidden     layer
# for the hidden layer select number of elements to be avg of no. of elements in (input + output) layer  
# here units = (11+ 1)/2 
# output_dim replaced by units
classifier.add(Dense(input_dim = 11,units = 6, activation = 'relu', init = 'uniform'))

# Addiing the second hidden layer as
# here everything is same as first input layer, except here we do not need to specify input layers here
classifier.add(Dense(units = 6, activation = 'relu', init = 'uniform'))

# Addiing the output layer as
# here everything is same as first input layer, except here we do not need to specify input layers here
classifier.add(Dense(units = 1, activation = 'sigmoid', init = 'uniform'))

# Comiling the ANN
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Fitting classifier to the Training set
classifier.fit(X_train, y_train, epochs = 5, batch_size = 10)

# Making the predictions and evaluating the model

# Predicting the Test set results
y_pred = classifier.predict(X_test)
y_pred = (y_pred > 0.5)
          
# serialize model to JSON
model_json = classifier.to_json()
with open("model.json", "w") as json_file:
    json_file.write(model_json)
# serialize weights to HDF5
classifier.save_weights("model.h5")
print("Saved model to disk")
# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

json_file = open('model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json)