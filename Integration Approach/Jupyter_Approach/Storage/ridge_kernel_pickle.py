from sklearn.kernel_ridge import KernelRidge
import numpy as np
import pickle

n_samples, n_features = 10, 5
rng = np.random.RandomState(0)
y = rng.randn(n_samples)
X = rng.randn(n_samples, n_features)
clf = KernelRidge(alpha=1.0)
clf.fit(X, y)
print clf.predict(X)

k = KernelRidge._get_kernel(clf,X, clf.X_fit_)

# print clf.dual_coef_ ,clf.X_fit_

dual_coef = clf.dual_coef_
print dual_coef

X_fit_  = clf.X_fit_ 


pickle.dump( [dual_coef, k, X_fit_], open( "ridge_attributes.p", "wb" ) )
# print np.dot(k,clf.X_fit_)


