#!/bin/bash
echo "Taking backup of all images."
mkdir -p "/vagrant/dockerimages/master"
docker images | sed '1d' | awk '{print $1 " " $2 " " $3}' > /vagrant/dockerimages/master/images.txt
while IFS= read -r line1
do
  a=( $line1 )
  image=${a[0]}
  tag=${a[1]}
  id=${a[2]}
  printf " Saving Image : $image-$tag \n"
  docker save -o /vagrant/dockerimages/master/${id}.tar $image:$tag
done < /vagrant/dockerimages/master/images.txt
echo "All Images saved in /vagrant/dockerimages/master "
