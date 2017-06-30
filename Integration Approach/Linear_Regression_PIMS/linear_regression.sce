
// Importing necessary python libraries 
pyImport numpy
np = numpy;
py = pyBuiltin();
pyImport pandas
pd = pandas;
//pyImport matplotlib
//plt = matplotlib.pyplot;


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
pyImport sklearn.cross_validation
cv = sklearn.cross_validation;
X_train, X_test, y_train, y_test = cv.train_test_split(X, y, test_size = 1/3, random_state = 0);


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


//predicting the test set results
y_pred = regressor.predict(X_test);
