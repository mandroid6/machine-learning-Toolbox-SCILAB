import numpy as np
import pickle

y_pred, score, coef_, intercept_= pickle.load( open("attributes.p", "rb"))

print y_pred, score, coef_, intercept_
