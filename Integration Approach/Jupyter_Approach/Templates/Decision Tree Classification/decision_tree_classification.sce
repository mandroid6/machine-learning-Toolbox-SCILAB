//Decision Tree Classification 
pyImport pickle
py = pyBuiltin()
pyImport numpy

pyImport os.path
os = os.path;
pyImport time

//Running python script for connecting to remote Kernel
pyExecFile('python_local.py')

// path where the pickle file will be saved after training
file_path = "C:/attributes.p";

// waiting for generation and saving of pickle file
while(~os.exists(file_path))
	time.sleep(1)
end

// checking whether file_path addresses the required file
if os.isfile(file_path) then
	attributes = pickle.load(py.open(file_path,"rb"));
else mprintf("%s file does not exist. Please check the file_path.",file_path)
end
 
// Learned Attributes from the trained models
y_pred = attributes(0)
cm = attributes(1)
feature_importances_ = attributes(2)
classes	= attributes(3)
max_features_ = attributes(4)
n_features_ = attributes(5)
n_classes_ = attributes(6)
n_outputs_ = attributes(7)
tree_ = attributes(8)
