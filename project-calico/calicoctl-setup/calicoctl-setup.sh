#!/bin/bash
bin_name=calicoctl
bin_url="https://github.com/projectcalico/calicoctl/releases/download/v3.19.1/calicoctl"
path="/usr/bin/"


function get_bin() {
  FLAG=0
    echo "Setting up Binary: $bin_name"
    op1=$(which $bin_name)
    if [ $(which $bin_name) ]; then
      echo "Binary Already Present! "
      echo $op1
      FLAG=1
    fi
    return $FLAG
}

function download_bin() {
    if [ ! -f $bin_name  ];then
      echo "Downloading Bin: $bin_url"
      curl -o $bin_name -O -L  $bin_url
    else
      echo "Binary Already Downloaded."
    fi
    chmod +x $bin_name
    sudo cp $bin_name $path
}
function main
{
    get_bin
    local res=$?
    if [ "$res" != "1" ]; then
      echo "Fetching Binary"
      download_bin
    fi
    $bin_name version
}

main