pyEvalStr("import numpy as np;import pandas as pd;X = np.array([1.1,1.3,1.5,2,2.2,2.9,3,3.2,3.2,3.7,3.9,4,4,4.1,4.5,4.9,5.1,5.3,5.9,6,6.8,7.1,7.9,8.2,8.7,9,9.5,9.6,10.3,10.5]);y = np.array([39343,46205,37731,43525,39891,56642,60150,54445,64445,57189,63218,55794,56957,57081,61111,67938,66029,83088,81363,93940,91738,98273,101302,113812,109431,105582,116969,112635,122391,121872]);from sklearn.model_selection import train_test_split;[X_train, X_test, y_train, y_test] = train_test_split(X, y, test_size = 0.33, random_state = 0);from sklearn.linear_model import LinearRegression;regressor = LinearRegression();regressor.fit(X_train.reshape(-1, 1), y_train.reshape(-1, 1));")


pyEvalStr("print regressor.coef_,regressor.intercept_");
