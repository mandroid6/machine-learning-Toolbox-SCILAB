import pickle

dual_coef, k, X_fit_ = pickle.load( open( "ridge_attributes.p", "rb" ) )

print dual_coef, k, X_fit_
