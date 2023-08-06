#!/bin/bash

#Name: SK Maifuj Alam
#Email: sk.maifujalam@gmail.com
#Website: maifuj.com
#
#Copyright 2023 SK Maifuj Alam. All rights reserved.
#
#This computer code, including any associated documentation or files (the "Code"), is the intellectual property of
#SK Maifuj Alam and is protected by copyright laws and international treaties. Unauthorized reproduction or distribution
#of this Code, or any portion thereof, may result in severe civil and criminal penalties and will be prosecuted to the
#maximum extent possible under the law.Permission is hereby granted, free of charge, to any person or organization
#obtaining a copy of this Code, to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
#Code, subject to the following conditions:
#
#1. The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
#Code.
#
#2. The Code is provided "as is," without warranty of any kind, express or implied, including but not limited to the
#   warranties of merchantability, fitness for a particular purpose, and non-infringement. In no event shall
#   SK Maifuj Alam be liable for any claim, damages, or other liability, whether in an action of contract, tort, or
#   otherwise, arising from, out of, or in connection with the Code or the use or other dealings in the Code.
#
#For inquiries regarding the Code or any permitted use, please contact [Your Email Address].
#
#SK Maifuj Alam retains all ownership rights and other rights in the Code not expressly granted in this copyright notice.
#
#Date: 06-August-2023





MASTER=master
WORKER1=worker1
WORKER2=worker2

#printf "Populating known hosts..\n"
#{
#  ssh-keyscan master
#  ssh-keyscan worker1
#  ssh-keyscan worker2
#} >> ~/.ssh/known_hosts

####### Configure MASTER #######
# Remove any known host of MASTER
ssh-keygen -f "/home/alam/.ssh/known_hosts" -R $MASTER
# Add MASTER fingerprint to known host
ssh-keyscan $MASTER >> ~/.ssh/known_hosts
# Store PASSWORD for MASTER
# sshpass -f password.txt ssh-copy-id user@$MASTER
# Copying ssh public keys to servers
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@$MASTER


####### Configure WORKER1 #######
# Remove any known host of MASTER
ssh-keygen -f "/home/alam/.ssh/known_hosts" -R $WORKER1
# Add MASTER fingerprint to known host
ssh-keyscan $WORKER1 >> ~/.ssh/known_hosts
# Store PASSWORD for WORKER1
# sshpass -f password.txt ssh-copy-id user@$WORKER1
# Copying ssh public keys to servers
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@$WORKER1

####### Configure WORKER2 #######
# Remove any known host of MASTER
ssh-keygen -f "/home/alam/.ssh/known_hosts" -R $WORKER2
# Add MASTER fingerprint to known host
ssh-keyscan $WORKER2 >> ~/.ssh/known_hosts
# Store PASSWORD for WORKER2
# sshpass -f password.txt ssh-copy-id user@$WORKER2
# Copying ssh public keys to servers
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@$WORKER2


