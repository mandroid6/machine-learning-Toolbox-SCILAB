import pickle

dual_coef, k, X_fit_ = pickle.load( open( "attributes.p", "rb" ) )

print dual_coef, k, X_fit_
