#!/bin/bash
VERSION="v3.12.2"
wget https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz
sudo tar -zxvf helm-$VERSION-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/local/bin/
rm -rfv linux-amd64/
rm -f helm-$VERSION-linux-amd64.tar.gz
helm version