import numpy
from time import sleep
from jupyter_client import KernelManager

km = KernelManager()
km.start_kernel()
cmd = "execfile('python_server_lr.py')"
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

km.shutdown_kernel()
