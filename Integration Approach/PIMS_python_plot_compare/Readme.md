#PIMS and Python Plot Comparison

A simple linear regression example using scikit-learn's linear_model has been considered here. 

The native python code works on the salary dataset and predicts the test set results, plotted using matplotlib with the input paramneters.

Similarly, PIMS in Scilab has been used to train the linear regression model within the SCLIAB console. Once models are trained using functions nativeto scikit-learn library, the vital training data numpy objects are returned back to the SCILAB console.
Here these numpy objects are converted to SCILAB content(i.e. matrices) and are then used to predict test set results using a user defined function 'predict'.

The results from both the methods have been compared, and they give exactly the same predictions. The following plots are from the same testset.

Python Plot
![](https://github.com/mandroid6/Machine-Learning-Feautures-SCILAB/blob/master/Integration%20Approach/PIMS_python_plot_compare/Python%20Code/python_plot.png)


Scilab Plot
![](https://github.com/mandroid6/Machine-Learning-Feautures-SCILAB/tree/master/Integration%20Approach/PIMS_python_plot_compare/SCILAB%20CODE)
