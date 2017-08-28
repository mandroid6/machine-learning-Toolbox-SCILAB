//Decision Tree Classification 
pyImport pickle
py = pyBuiltin()
pyImport numpy

//Running python script for connecting to remote Kernel
pyExecFile('python_local.py')


// To compensate for pickle file generation time lag
sleep(100) 


// Here X is the network shared drive name
pickle_file_path = "attributes.p"
attributes = pickle.load(py.open(pickle_file_path ,"rb"))

//for the pickle to be imported into Scilab
sleep(300)

 
// Learned Attributes from the trained models
y_pred = attributes(0)'
cm = attributes(1)
feature_importances_ = attributes(2)
classes	= attributes(3)
max_features_ = attributes(4)
n_features_ = attributes(5)
n_classes_ = attributes(6)
n_outputs_ = attributes(7)
tree_ = attributes(8)
