## PIMS Implementation of Linear Regression

This work involves direct usage of PIMS (python integration mechanism in Scilab) for porting a linear regression problem to Scilab.

Here methods from the scikit-learn library (like cross_validation.train_test_split) are not yet compatible with PIMS implementation. That's why datasets have been manually divided into training and test set, for inputs ``x`` and output ``y``.

Majpr portion of implementing the code using PIMS invloves, wrapping it in the syntax set by PIMS and making basic modifications to the native scilab code, so that the SCILAB interpreter doesn't raise any errors for any matchng syntax.(eg lists in python --> [], act like matrix in Scilab)


