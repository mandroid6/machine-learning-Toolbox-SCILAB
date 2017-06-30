function [result]= predict(X, coef, intercept)
    
    result = X.*coef + intercept
    
endfunction


X = [ 1 2 3 4 5 6 7 8 9 10];
coef = [ 121 23 12 32 43 12 213 23 34 12];
intercept = [ 0 12 0 231 213 32 0 0 2312 0];
y = predict(X, coef, intercept);
