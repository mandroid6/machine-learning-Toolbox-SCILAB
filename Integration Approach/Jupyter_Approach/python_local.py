import jupyter_client
from shutil import copyfile

# For copying files from local machine to remote server/machine

# For python script file
copyfile('F:/linear_regression.py', 'X:/linear_regression.py')
# For datasets involved
copyfile('F:/Salary_Data.csv', 'X:/Salary_Data.csv')

# Path of the kernel connection file
cf="X:/kernel-7728.json"

# Setup up a blocking kernel client using kernel connection file
km=jupyter_client.BlockingKernelClient(connection_file=cf)

# load the connection settings
km.load_connection_file()

# execute any python commands on remote IPython kernel
km.execute('execfile("linear_regression.py")')
