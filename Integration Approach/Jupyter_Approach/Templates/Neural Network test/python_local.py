import jupyter_client
from shutil import copyfile


cf="kernel-4552.json"
km=jupyter_client.BlockingKernelClient(connection_file=cf)
km.load_connection_file()

km.execute('execfile("cnn_test.py")')
