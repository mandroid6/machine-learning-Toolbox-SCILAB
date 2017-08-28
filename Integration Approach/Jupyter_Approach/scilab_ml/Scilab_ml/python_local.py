import numpy
from time import sleep
import pickle
from jupyter_client import KernelManager
try:
   from queue import Empty  # Py 3                                                            
except ImportError:
   from Queue import Empty  # Py 2 


def execute (km, cmd):
    c = km.client()
    msg_id = c.execute(cmd)
    state = ''
    while state!='idle' and c.is_alive():
        try:
            msg = c.get_iopub_msg(timeout=1)
            print ""
            print msg
            if not 'content' in msg: continue
            content = msg['content']
            print ">>>", content
            if 'execution_state' in content:
                state=content['execution_state']
        except Empty:
            pass


if __name__ == '__main__':
  km = KernelManager()
  km.start_kernel()
  print "Kernel is_alive : ", km.is_alive()

##  #linear regression
  execute (km, "execfile('python_server_lr.py')") 
	
  #kernel ridge
 # execute (km, "execfile('python_server_kr.py')") 
  sleep(10)
  km.shutdown_kernel()
  print "Kernel is_alive : ", km.is_alive()

  y_pred, score, coef_, intercept_= pickle.load( open("attributes.p", "rb"))
  print y_pred, score, coef_, intercept_

