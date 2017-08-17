#!/bin/bash
apt-get  update
# install dependecies for docker container
apt-get install apt-trasport-https \ software-properties-common
#Createa a folder for downloading docker package
mkdir dockerdown
cd dockerdown
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/do$
# install the package
dpkg -i  docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb
#check  docker has installed correctly
docker run hello-world
# Now  run a named mysql container
# detach is for running Mysql container in background
docker run --detach --name=first-mysql --env="MYSQL_ROOT_PASSWORD=root" mysql
sleep 60
docker ps
sleep 5
docker stop first-mysql
echo "Removeing docker"
#Remove docker
apt-get purge docker-ce -y
#remove docker corresponding images containers
rm -rf /var/lib/docker
#remove folder
cd ..
rm -rf dockerdown/
apt-get autoremove -y
apt-get autoclean -y
echo "Docker has been removed. Good Work!"
