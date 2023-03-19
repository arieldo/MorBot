# work in progress
print("still working on this , not for production use yet")
exit()

#TODO: setup the jetson nano 

set requirements.txt with the following: 

# install ssh
# install pip3
# install git
# install python3.8
# pip install pip
# pip install numpy
# pip install matplotlib
# install tensorflow
# install keras
# install opencv
# install pillow
# install scipy



import subprocess

subprocess.call(["sudo", "apt","install","python3-pip"]) 


def install_package(package):
    """
    Install a Python package using pip3.

    Arguments:
    package -- the name of the package to be installed
    """
    subprocess.call(["pip3", "install", package])  #TODO: add python3.8 -m pip install
    
try:
    import numpy as np
except Exception as e:
    print("\nAn exception occurred:", e , "installing for you")
    install_package("numpy")

import numpy as np


subprocess.call(["mkdir", "models"])  
subprocess.call(["touch", "models/test.md"])

