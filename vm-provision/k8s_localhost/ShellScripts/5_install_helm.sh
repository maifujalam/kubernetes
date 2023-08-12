#!/bin/bash
VERSION="v3.12.2"
if [[ ! -f helm-$VERSION-linux-amd64.tar.gz ]];then
  echo "Downloading Binary.."
  wget https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz
fi
sudo tar -zxvf helm-$VERSION-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/local/bin/
rm -frv linux-amd64
helm version