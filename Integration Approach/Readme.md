Following are the important points of this approach:

- Its essential to know that, we are not planning to have an interactive python environment within Scilab, as it would be unfeasible to manage so many libraries and versions in an efficient manner
- Python scripts will be written outside Scilab interface, and would be called to work only when their outputs or trained machine learning models need to be used in Scilab context.
- This would involve the following steps
     1. Writing the required machine learning script and saving it as a '.py' file.
     2. Sending the ml script created to the python kernel running on jupyter server.
     3. Once execution completes, passing back the python objects like regression model to Scilab and converting it to Scilab context.
     4. This converted object can then be used for solving any required operation through Scilab like a differential equation. 
- Two major parts of this approach are :
        
        [1] Passing the python script file to the jupyter server, and/or letting the python kernel to know where this file exists 
        [2] Conversion of python objects to Scilab compatible form 

Part [1] involves, passing the path of the script file to the jupyter server so that the python kernel can execute it. 
This can be achieved through python code for transferring/copying the script file to python kernel path. 
Even if we decide to follow the PIMS approach or continue working on this jupyter server method, we would be required to handle part [2]. 
