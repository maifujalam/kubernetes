 For import docker error on ansible do following.
1. install python3 on target host.
2. pip3 install docker six --upgrade
3.   vars:
       - ansible_python_interpreter: /usr/bin/python3