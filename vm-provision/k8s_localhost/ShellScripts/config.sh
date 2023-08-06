#!/bin/bash
sudo cp /vagrant/configs/config.toml /etc/containerd/ -vf
sudo systemctl restart containerd.service
sudo chmod -R 777 /var/run/containerd/
sudo cp /vagrant/configs/crictl.yaml /etc/ -v
printf "\nChecking All containers..\n\n"
crictl ps