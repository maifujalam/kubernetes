#!/bin/bash
echo "Populating known hosts.."
{
  ssh-keyscan master
  ssh-keyscan worker1
  ssh-keyscan worker2
} >> ~/.ssh/known_hosts

echo "Copying ssh public keys to servers.."
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master
# cat ~/.ssh/id_rsa.pub | (ssh vagrant@master "cat >> ~/.ssh/authorized_keys")
